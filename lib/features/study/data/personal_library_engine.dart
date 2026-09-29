import '../../../app/state/app_state.dart';
import '../../explore/data/knowledge_graph.dart';
import '../../today/data/demo_topics.dart';
import '../../today/domain/knowledge_topic.dart';

enum DailyTaskType { discovery, review, connection, quick }

class DailyTask {
  const DailyTask({
    required this.type,
    required this.topic,
    required this.reason,
    required this.minutes,
  });

  final DailyTaskType type;
  final KnowledgeTopic topic;
  final String reason;
  final int minutes;
}

class PersonalLibraryEngine {
  const PersonalLibraryEngine();

  List<DailyTask> dailyPlan(
    AppState state, {
    int budgetMinutes = 10,
  }) {
    final tasks = <DailyTask>[];
    final used = <String>{};
    var remaining = budgetMinutes;

    final due = state.dueReviewTopicIds();
    if (due.isNotEmpty && remaining >= 2) {
      final topic = topicById(due.first);
      if (topic != null) {
        tasks.add(
          DailyTask(
            type: DailyTaskType.review,
            topic: topic,
            reason: 'porque já está na hora de revisar',
            minutes: 2,
          ),
        );
        used.add(topic.id);
        remaining -= 2;
      }
    }

    final recent = _recentTopic(state);
    if (recent != null && remaining >= 3) {
      final neighbor = _bestNeighbor(state, recent, used);
      if (neighbor != null) {
        final minutes = neighbor.estimatedReadingMinutes().clamp(3, remaining).toInt();
        tasks.add(
          DailyTask(
            type: DailyTaskType.connection,
            topic: neighbor,
            reason: 'porque conecta com ${recent.tags.first}',
            minutes: minutes,
          ),
        );
        used.add(neighbor.id);
        remaining -= minutes;
      }
    }

    if (remaining >= 3) {
      final discovery = _discovery(state, used);
      if (discovery != null) {
        final minutes = discovery.estimatedReadingMinutes().clamp(3, remaining).toInt();
        tasks.add(
          DailyTask(
            type: DailyTaskType.discovery,
            topic: discovery,
            reason: reasonFor(state, discovery),
            minutes: minutes,
          ),
        );
        used.add(discovery.id);
        remaining -= minutes;
      }
    }

    if (remaining > 0) {
      final quick = allDemoTopics.where((topic) {
        return topic.estimatedReadingMinutes() <= 5 &&
            !used.contains(topic.id) &&
            state.masteryLevel(topic.id) != MasteryLevel.consolidated;
      }).toList();

      if (quick.isNotEmpty) {
        quick.sort(
          (a, b) =>
              state.masteryScore(a.id).compareTo(state.masteryScore(b.id)),
        );
        final topic = quick.first;
        tasks.add(
          DailyTask(
            type: DailyTaskType.quick,
            topic: topic,
            reason: 'porque cabe no tempo que restou',
            minutes: topic.estimatedReadingMinutes().clamp(1, remaining).toInt(),
          ),
        );
      }
    }

    if (tasks.isEmpty) {
      final fallback = _discovery(state, used) ?? allDemoTopics.first;
      tasks.add(
        DailyTask(
          type: DailyTaskType.discovery,
          topic: fallback,
          reason: reasonFor(state, fallback),
          minutes: fallback.estimatedReadingMinutes(),
        ),
      );
    }

    return tasks;
  }

  List<KnowledgeTopic> smartQueue(
    AppState state, {
    int budgetMinutes = 15,
  }) {
    final result = <KnowledgeTopic>[];
    final used = <String>{};
    var remaining = budgetMinutes;

    for (final id in state.dueReviewTopicIds()) {
      if (remaining < 2) break;
      final topic = topicById(id);
      if (topic == null || !used.add(topic.id)) continue;
      result.add(topic);
      remaining -= 2;
    }

    final started = state.progressByTopic.entries
        .where((entry) => entry.value > .04 && entry.value < .92)
        .map((entry) => topicById(entry.key))
        .whereType<KnowledgeTopic>()
        .toList()
      ..sort(
        (a, b) => state
            .progressFor(b.id)
            .compareTo(state.progressFor(a.id)),
      );

    for (final topic in started) {
      if (remaining <= 0) break;
      if (!used.add(topic.id)) continue;
      final estimate =
          ((1 - state.progressFor(topic.id)) * topic.estimatedReadingMinutes()).ceil().clamp(1, 30);
      if (estimate <= remaining || result.isEmpty) {
        result.add(topic);
        remaining -= estimate;
      }
    }

    for (final id in state.readLaterQueue) {
      if (remaining <= 0) break;
      final topic = topicById(id);
      if (topic == null || !used.add(topic.id)) continue;
      if (topic.estimatedReadingMinutes() <= remaining || result.isEmpty) {
        result.add(topic);
        remaining -= topic.estimatedReadingMinutes();
      }
    }

    while (remaining >= 3) {
      final topic = _discovery(state, used);
      if (topic == null) break;
      result.add(topic);
      used.add(topic.id);
      remaining -= topic.estimatedReadingMinutes().clamp(3, remaining).toInt();
    }

    return result;
  }

  String reasonFor(AppState state, KnowledgeTopic topic) {
    if (state.dueReviewTopicIds().contains(topic.id)) {
      return 'porque está na hora de revisar';
    }

    final recent = _recentTopic(state);
    if (recent != null &&
        neighborsFor(recent.id).contains(topic.id)) {
      return 'porque você explorou ${recent.tags.first}';
    }

    final tagCounts = _tagCounts(state);
    final score = topic.tags.fold<int>(
      0,
      (sum, tag) => sum + (tagCounts[tag] ?? 0),
    );

    if (state.historyTopicIds.isEmpty) {
      return 'para abrir uma nova área do seu repertório';
    }
    if (score == 0) {
      return 'porque essa área ainda está vazia no seu mapa';
    }
    if (state.progressFor(topic.id) > 0 &&
        state.progressFor(topic.id) < .92) {
      return 'porque você já começou e ainda não terminou';
    }
    if (state.masteryLevel(topic.id) == MasteryLevel.familiar) {
      return 'para transformar familiaridade em entendimento';
    }
    return 'para equilibrar as áreas que você vem explorando';
  }

  KnowledgeTopic? _recentTopic(AppState state) {
    for (final id in state.historyTopicIds) {
      final topic = topicById(id);
      if (topic != null) return topic;
    }
    return null;
  }

  KnowledgeTopic? _bestNeighbor(
    AppState state,
    KnowledgeTopic recent,
    Set<String> used,
  ) {
    final topics = neighborsFor(recent.id)
        .map(topicById)
        .whereType<KnowledgeTopic>()
        .where((topic) => !used.contains(topic.id))
        .toList();

    if (topics.isEmpty) return null;
    topics.sort(
      (a, b) =>
          state.masteryScore(a.id).compareTo(state.masteryScore(b.id)),
    );
    return topics.first;
  }

  KnowledgeTopic? _discovery(
    AppState state,
    Set<String> used,
  ) {
    final counts = _tagCounts(state);
    final candidates = allDemoTopics
        .where((topic) => !used.contains(topic.id))
        .where(
          (topic) =>
              state.masteryLevel(topic.id) != MasteryLevel.consolidated,
        )
        .toList();

    if (candidates.isEmpty) return null;

    candidates.sort((a, b) {
      final aTagScore = a.tags.fold<int>(
        0,
        (sum, tag) => sum + (counts[tag] ?? 0),
      );
      final bTagScore = b.tags.fold<int>(
        0,
        (sum, tag) => sum + (counts[tag] ?? 0),
      );

      final tagCompare = aTagScore.compareTo(bTagScore);
      if (tagCompare != 0) return tagCompare;

      return state
          .masteryScore(a.id)
          .compareTo(state.masteryScore(b.id));
    });

    return candidates.first;
  }

  Map<String, int> _tagCounts(AppState state) {
    final counts = <String, int>{};
    for (final id in state.historyTopicIds) {
      final topic = topicById(id);
      if (topic == null) continue;
      for (final tag in topic.tags) {
        counts.update(tag, (value) => value + 1, ifAbsent: () => 1);
      }
    }
    return counts;
  }
}

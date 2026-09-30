import '../../today/domain/knowledge_topic.dart';

/// Flashcards derived exclusively from passages a reader highlighted or starred.
/// No inference or provider requests. Never mutates the saved highlights.
class HighlightRecall {
  const HighlightRecall({required this.passageId, required this.prompt, required this.answer});

  final String passageId;
  final String prompt;
  final String answer;
}

List<HighlightRecall> highlightedRecallFor(
  KnowledgeTopic topic,
  Iterable<String> selectedPassages, {
  int maxCards = 2,
}) {
  if (maxCards <= 0) return const [];
  final selected = selectedPassages.toSet();
  if (selected.isEmpty) return const [];

  final passages = <(String, String, String)>[
    ('quick', 'o resumo em 30 segundos', topic.quickTake),
    for (final part in topic.body.indexed)
      ('body:${part.$1}', 'o trecho ${part.$1 + 1} do artigo', part.$2),
    ('why', 'por que isso importa', topic.whyItMatters),
    ('curiosity', 'a curiosidade do artigo', topic.curiosity),
  ];
  final cards = <HighlightRecall>[];
  for (final (id, section, text) in passages) {
    if (!selected.contains(id) || text.trim().isEmpty) continue;
    cards.add(HighlightRecall(
      passageId: id,
      prompt: 'O que você marcou sobre ${topic.title.toLowerCase()} em “$section”?',
      answer: text,
    ));
    if (cards.length == maxCards) break;
  }
  return cards;
}

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ReaderThemeMode { paper, sepia, dark }

enum ReaderFontFamily { editorial, sans, readable }

enum ReaderFlow { continuous, paged }

enum ReaderTextAlignment { left, justify }

enum ContentDepth { quick, standard, deep, immersion }

enum AppAppearance { light, dark }

enum MasteryLevel { newTopic, familiar, understood, consolidated }

class PersonalConnection {
  const PersonalConnection({
    required this.fromTopicId,
    required this.toTopicId,
    required this.note,
    required this.createdAt,
  });

  final String fromTopicId;
  final String toTopicId;
  final String note;
  final DateTime createdAt;

  Map<String, dynamic> toJson() => {
        'from': fromTopicId,
        'to': toTopicId,
        'note': note,
        'createdAt': createdAt.toIso8601String(),
      };

  static PersonalConnection? fromJson(dynamic raw) {
    if (raw is! Map<String, dynamic>) {
      return null;
    }
    final createdAt = DateTime.tryParse(raw['createdAt']?.toString() ?? '');
    final from = raw['from']?.toString() ?? '';
    final to = raw['to']?.toString() ?? '';
    if (from.isEmpty || to.isEmpty || createdAt == null) {
      return null;
    }
    return PersonalConnection(
      fromTopicId: from,
      toTopicId: to,
      note: raw['note']?.toString() ?? '',
      createdAt: createdAt,
    );
  }
}

class AppState extends ChangeNotifier {
  AppState._(this._prefs) {
    _load();
  }

  static const _onboardingKey = 'onboarding_complete_v1';
  static const _savedKey = 'saved_topic_ids_v1';
  static const _completedKey = 'completed_topic_ids_v1';
  static const _historyKey = 'history_topic_ids_v1';
  static const _progressKey = 'reading_progress_v1';
  static const _reviewLevelKey = 'review_level_v1';
  static const _reviewDueKey = 'review_due_v1';
  static const _fontSizeKey = 'reader_font_size_v1';
  static const _lineHeightKey = 'reader_line_height_v1';
  static const _readerThemeKey = 'reader_theme_v1';
  static const _readerFontKey = 'reader_font_v1';
  static const _readerFlowKey = 'reader_flow_v1';
  static const _studyRemindersKey = 'study_reminders_enabled_v1';
  static const _reminderHourKey = 'study_reminder_hour_v1';
  static const _reminderMinuteKey = 'study_reminder_minute_v1';
  static const _reviewRemindersKey = 'review_reminders_enabled_v1';
  static const _dailyEditionRemindersKey = 'daily_edition_reminders_enabled_v1';
  static const _lastStudyAtKey = 'last_study_at_v1';
  static const _lastReminderAtKey = 'last_study_reminder_at_v1';
  static const _notesKey = 'topic_notes_v1';
  static const _studyDaysKey = 'study_days_v1';
  static const _weeklyGoalKey = 'weekly_goal_v1';

  static const _queueKey = 'read_later_queue_v1';
  static const _highlightsKey = 'passage_highlights_v1';
  static const _starredPassagesKey = 'starred_passages_v1';
  static const _quizKey = 'quiz_scores_v1';
  static const _explanationsKey = 'topic_explanations_v1';
  static const _lastOpenedKey = 'topic_last_opened_v1';
  static const _offlineTopicsKey = 'offline_topics_v1';
  static const _readerColumnWidthKey = 'reader_column_width_v1';
  static const _readerMarginKey = 'reader_margin_v1';
  static const _readerAlignmentKey = 'reader_alignment_v1';
  static const _readerDepthKey = 'reader_depth_v1';
  static const _readerFocusKey = 'reader_focus_v1';
  static const _voiceRateKey = 'reader_voice_rate_v1';
  static const _highContrastKey = 'access_high_contrast_v1';
  static const _reduceMotionKey = 'access_reduce_motion_v1';
  static const _largeTapTargetsKey = 'access_large_targets_v1';
  static const _appAppearanceKey = 'app_appearance_v1';
  static const _collectionsKey = 'personal_collections_v1';
  static const _personalConnectionsKey = 'personal_connections_v1';

  final SharedPreferences _prefs;

  bool onboardingComplete = false;
  final Set<String> savedTopicIds = {};
  final Set<String> completedTopicIds = {};
  final List<String> historyTopicIds = [];
  final Map<String, double> progressByTopic = {};
  final Map<String, int> reviewLevelByTopic = {};
  final Map<String, DateTime> reviewDueByTopic = {};

  double readerFontSize = 17;
  double readerLineHeight = 1.62;
  ReaderThemeMode readerTheme = ReaderThemeMode.paper;
  ReaderFontFamily readerFont = ReaderFontFamily.editorial;
  ReaderFlow readerFlow = ReaderFlow.continuous;
  ReaderTextAlignment readerAlignment = ReaderTextAlignment.left;
  ContentDepth readerDepth = ContentDepth.standard;
  double readerColumnWidth = 720;
  double readerMargin = 20;
  double voiceRate = 1.0;
  bool readerFocusMode = false;

  bool highContrast = false;
  bool reduceMotion = false;
  bool largeTapTargets = false;
  AppAppearance appAppearance = AppAppearance.light;

  bool studyRemindersEnabled = false;
  bool reviewRemindersEnabled = true;
  bool dailyEditionRemindersEnabled = true;
  int reminderHour = 19;
  int reminderMinute = 0;
  DateTime? lastStudyAt;
  DateTime? lastReminderAt;

  final Map<String, String> notesByTopic = {};
  final Set<String> studyDays = {};
  int weeklyGoal = 3;

  final List<String> readLaterQueue = [];
  final Map<String, Set<String>> highlightedPassages = {};
  final Map<String, Set<String>> starredPassages = {};
  final Map<String, int> quizScoreByTopic = {};
  final Map<String, int> quizTotalByTopic = {};
  final Map<String, String> explanationsByTopic = {};
  final Map<String, DateTime> lastOpenedByTopic = {};
  final Set<String> offlineTopicIds = {};
  final Map<String, List<String>> collectionsByName = {};
  final List<PersonalConnection> personalConnections = [];

  static Future<AppState> load() async {
    final prefs = await SharedPreferences.getInstance();
    return AppState._(prefs);
  }

  void _load() {
    onboardingComplete = _prefs.getBool(_onboardingKey) ?? false;
    savedTopicIds.addAll(_prefs.getStringList(_savedKey) ?? const []);
    completedTopicIds.addAll(_prefs.getStringList(_completedKey) ?? const []);
    historyTopicIds.addAll(_prefs.getStringList(_historyKey) ?? const []);

    _loadDoubleMap(_progressKey, progressByTopic);
    _loadIntMap(_reviewLevelKey, reviewLevelByTopic);
    _loadDateMap(_reviewDueKey, reviewDueByTopic);

    readerFontSize = _prefs.getDouble(_fontSizeKey) ?? 17;
    readerLineHeight = _prefs.getDouble(_lineHeightKey) ?? 1.62;
    readerTheme = _enumByName(
      ReaderThemeMode.values,
      _prefs.getString(_readerThemeKey),
      ReaderThemeMode.paper,
    );
    readerFont = _enumByName(
      ReaderFontFamily.values,
      _prefs.getString(_readerFontKey),
      ReaderFontFamily.editorial,
    );
    readerFlow = _enumByName(
      ReaderFlow.values,
      _prefs.getString(_readerFlowKey),
      ReaderFlow.continuous,
    );
    readerAlignment = _enumByName(
      ReaderTextAlignment.values,
      _prefs.getString(_readerAlignmentKey),
      ReaderTextAlignment.left,
    );
    readerDepth = _enumByName(
      ContentDepth.values,
      _prefs.getString(_readerDepthKey),
      ContentDepth.standard,
    );
    readerColumnWidth = _prefs.getDouble(_readerColumnWidthKey) ?? 720;
    readerMargin = _prefs.getDouble(_readerMarginKey) ?? 20;
    voiceRate = _prefs.getDouble(_voiceRateKey) ?? 1;
    readerFocusMode = _prefs.getBool(_readerFocusKey) ?? false;

    highContrast = _prefs.getBool(_highContrastKey) ?? false;
    reduceMotion = _prefs.getBool(_reduceMotionKey) ?? false;
    largeTapTargets = _prefs.getBool(_largeTapTargetsKey) ?? false;
    appAppearance = _enumByName(
      AppAppearance.values,
      _prefs.getString(_appAppearanceKey),
      AppAppearance.light,
    );

    studyRemindersEnabled = _prefs.getBool(_studyRemindersKey) ?? false;
    reviewRemindersEnabled = _prefs.getBool(_reviewRemindersKey) ?? true;
    dailyEditionRemindersEnabled =
        _prefs.getBool(_dailyEditionRemindersKey) ?? true;
    reminderHour = _prefs.getInt(_reminderHourKey) ?? 19;
    reminderMinute = _prefs.getInt(_reminderMinuteKey) ?? 0;
    lastStudyAt = _readDate(_lastStudyAtKey);
    lastReminderAt = _readDate(_lastReminderAtKey);

    _loadStringMap(_notesKey, notesByTopic);
    studyDays.addAll(_prefs.getStringList(_studyDaysKey) ?? const []);
    weeklyGoal = _prefs.getInt(_weeklyGoalKey) ?? 3;

    readLaterQueue.addAll(_prefs.getStringList(_queueKey) ?? const []);
    _loadStringSetMap(_highlightsKey, highlightedPassages);
    _loadStringSetMap(_starredPassagesKey, starredPassages);
    _loadIntMap(_quizKey, quizScoreByTopic, field: 'score');
    _loadIntMap(_quizKey, quizTotalByTopic, field: 'total');
    _loadStringMap(_explanationsKey, explanationsByTopic);
    _loadDateMap(_lastOpenedKey, lastOpenedByTopic);
    offlineTopicIds.addAll(
      _prefs.getStringList(_offlineTopicsKey) ?? const [],
    );

    final rawCollections = _prefs.getString(_collectionsKey);
    if (rawCollections != null) {
      final decoded = jsonDecode(rawCollections) as Map<String, dynamic>;
      for (final entry in decoded.entries) {
        collectionsByName[entry.key] = (entry.value as List<dynamic>)
            .map((value) => value.toString())
            .toList();
      }
    }

    final rawConnections = _prefs.getString(_personalConnectionsKey);
    if (rawConnections != null) {
      final decoded = jsonDecode(rawConnections) as List<dynamic>;
      for (final item in decoded) {
        final connection = PersonalConnection.fromJson(item);
        if (connection != null) {
          personalConnections.add(connection);
        }
      }
    }
  }

  void _loadDoubleMap(String key, Map<String, double> target) {
    final raw = _prefs.getString(key);
    if (raw == null) {
      return;
    }
    final decoded = jsonDecode(raw) as Map<String, dynamic>;
    for (final entry in decoded.entries) {
      target[entry.key] = (entry.value as num).toDouble();
    }
  }

  void _loadIntMap(
    String key,
    Map<String, int> target, {
    String? field,
  }) {
    final raw = _prefs.getString(key);
    if (raw == null) {
      return;
    }
    final decoded = jsonDecode(raw) as Map<String, dynamic>;
    for (final entry in decoded.entries) {
      final value = field == null
          ? entry.value
          : (entry.value as Map<String, dynamic>)[field];
      if (value is num) {
        target[entry.key] = value.toInt();
      }
    }
  }

  void _loadStringMap(String key, Map<String, String> target) {
    final raw = _prefs.getString(key);
    if (raw == null) {
      return;
    }
    final decoded = jsonDecode(raw) as Map<String, dynamic>;
    for (final entry in decoded.entries) {
      final value = entry.value?.toString().trim() ?? '';
      if (value.isNotEmpty) {
        target[entry.key] = value;
      }
    }
  }

  void _loadDateMap(String key, Map<String, DateTime> target) {
    final raw = _prefs.getString(key);
    if (raw == null) {
      return;
    }
    final decoded = jsonDecode(raw) as Map<String, dynamic>;
    for (final entry in decoded.entries) {
      final parsed = DateTime.tryParse(entry.value.toString());
      if (parsed != null) {
        target[entry.key] = parsed;
      }
    }
  }

  void _loadStringSetMap(
    String key,
    Map<String, Set<String>> target,
  ) {
    final raw = _prefs.getString(key);
    if (raw == null) {
      return;
    }
    final decoded = jsonDecode(raw) as Map<String, dynamic>;
    for (final entry in decoded.entries) {
      target[entry.key] = (entry.value as List<dynamic>)
          .map((value) => value.toString())
          .toSet();
    }
  }

  DateTime? _readDate(String key) {
    final raw = _prefs.getString(key);
    return raw == null ? null : DateTime.tryParse(raw);
  }

  T _enumByName<T extends Enum>(List<T> values, String? name, T fallback) {
    if (name == null) {
      return fallback;
    }
    for (final value in values) {
      if (value.name == name) {
        return value;
      }
    }
    return fallback;
  }

  Future<void> completeOnboarding() async {
    onboardingComplete = true;
    await _prefs.setBool(_onboardingKey, true);
    notifyListeners();
  }

  Future<void> resetOnboarding() async {
    onboardingComplete = false;
    await _prefs.setBool(_onboardingKey, false);
    notifyListeners();
  }

  bool isSaved(String topicId) => savedTopicIds.contains(topicId);

  Future<void> toggleSaved(String topicId) async {
    if (!savedTopicIds.add(topicId)) {
      savedTopicIds.remove(topicId);
    }
    await _prefs.setStringList(_savedKey, savedTopicIds.toList());
    notifyListeners();
  }

  bool isQueued(String topicId) => readLaterQueue.contains(topicId);

  Future<void> toggleReadLater(String topicId) async {
    if (readLaterQueue.contains(topicId)) {
      readLaterQueue.remove(topicId);
    } else {
      readLaterQueue.add(topicId);
    }
    await _prefs.setStringList(_queueKey, readLaterQueue);
    notifyListeners();
  }

  Future<void> reorderReadLater(int oldIndex, int newIndex) async {
    final item = readLaterQueue.removeAt(oldIndex);
    readLaterQueue.insert(newIndex, item);
    await _prefs.setStringList(_queueKey, readLaterQueue);
    notifyListeners();
  }

  double progressFor(String topicId) => progressByTopic[topicId] ?? 0;

  Future<void> openTopic(String topicId) async {
    historyTopicIds.remove(topicId);
    historyTopicIds.insert(0, topicId);
    if (historyTopicIds.length > 80) {
      historyTopicIds.removeRange(80, historyTopicIds.length);
    }

    lastOpenedByTopic[topicId] = DateTime.now();

    await _prefs.setStringList(_historyKey, historyTopicIds);
    await _persistDateMap(_lastOpenedKey, lastOpenedByTopic);
    notifyListeners();
  }

  Future<void> updateProgress(String topicId, double progress) async {
    final normalized = progress.clamp(0.0, 1.0).toDouble();
    final previous = progressByTopic[topicId] ?? 0;
    if ((normalized - previous).abs() < .025 && normalized < .96) {
      return;
    }

    progressByTopic[topicId] = normalized;

    if (normalized >= .08) {
      lastStudyAt = DateTime.now();
      await _prefs.setString(
        _lastStudyAtKey,
        lastStudyAt!.toIso8601String(),
      );
      await _recordStudyDay(lastStudyAt!);
    }

    if (normalized >= .92) {
      completedTopicIds.add(topicId);
      reviewDueByTopic.putIfAbsent(
        topicId,
        () => DateTime.now().add(const Duration(days: 1)),
      );
      await _prefs.setStringList(
        _completedKey,
        completedTopicIds.toList(),
      );
      await _persistReviewDue();
    }

    await _prefs.setString(_progressKey, jsonEncode(progressByTopic));
    notifyListeners();
  }

  List<String> dueReviewTopicIds([DateTime? now]) {
    final reference = now ?? DateTime.now();
    final ids = completedTopicIds.where((id) {
      final due = reviewDueByTopic[id];
      return due == null || !due.isAfter(reference);
    }).toList();

    ids.sort((a, b) {
      final ad = reviewDueByTopic[a] ?? DateTime.fromMillisecondsSinceEpoch(0);
      final bd = reviewDueByTopic[b] ?? DateTime.fromMillisecondsSinceEpoch(0);
      return ad.compareTo(bd);
    });
    return ids;
  }

  Future<void> recordReview(String topicId, {required int quality}) async {
    const intervals = [1, 3, 7, 14, 30, 60];
    final current = reviewLevelByTopic[topicId] ?? 0;
    final nextLevel = quality >= 2
        ? (current + 1).clamp(0, intervals.length - 1).toInt()
        : quality == 1
            ? current.clamp(0, intervals.length - 1).toInt()
            : 0;

    reviewLevelByTopic[topicId] = nextLevel;
    reviewDueByTopic[topicId] = DateTime.now().add(
      Duration(days: intervals[nextLevel]),
    );

    await _prefs.setString(
      _reviewLevelKey,
      jsonEncode(reviewLevelByTopic),
    );
    await _persistReviewDue();
    notifyListeners();
  }

  Future<void> _persistReviewDue() async {
    await _persistDateMap(_reviewDueKey, reviewDueByTopic);
  }

  bool studiedToday([DateTime? now]) {
    final reference = now ?? DateTime.now();
    final studied = lastStudyAt;
    if (studied == null) {
      return false;
    }
    return studied.year == reference.year &&
        studied.month == reference.month &&
        studied.day == reference.day;
  }

  bool reminderAlreadyShownToday([DateTime? now]) {
    final reference = now ?? DateTime.now();
    final shown = lastReminderAt;
    if (shown == null) {
      return false;
    }
    return shown.year == reference.year &&
        shown.month == reference.month &&
        shown.day == reference.day;
  }

  bool shouldSendStudyReminder([DateTime? now]) {
    if (!studyRemindersEnabled) {
      return false;
    }

    final reference = now ?? DateTime.now();
    final afterReminderTime = reference.hour > reminderHour ||
        (reference.hour == reminderHour &&
            reference.minute >= reminderMinute);

    return afterReminderTime &&
        !studiedToday(reference) &&
        !reminderAlreadyShownToday(reference);
  }

  Future<void> markStudyReminderShown() async {
    lastReminderAt = DateTime.now();
    await _prefs.setString(
      _lastReminderAtKey,
      lastReminderAt!.toIso8601String(),
    );
    notifyListeners();
  }

  Future<void> updateReminderSettings({
    bool? enabled,
    bool? reviewEnabled,
    bool? dailyEditionEnabled,
    int? hour,
    int? minute,
  }) async {
    if (enabled != null) {
      studyRemindersEnabled = enabled;
      await _prefs.setBool(_studyRemindersKey, enabled);
    }
    if (reviewEnabled != null) {
      reviewRemindersEnabled = reviewEnabled;
      await _prefs.setBool(_reviewRemindersKey, reviewEnabled);
    }
    if (dailyEditionEnabled != null) {
      dailyEditionRemindersEnabled = dailyEditionEnabled;
      await _prefs.setBool(
        _dailyEditionRemindersKey,
        dailyEditionEnabled,
      );
    }
    if (hour != null) {
      reminderHour = hour.clamp(0, 23).toInt();
      await _prefs.setInt(_reminderHourKey, reminderHour);
    }
    if (minute != null) {
      reminderMinute = minute.clamp(0, 59).toInt();
      await _prefs.setInt(_reminderMinuteKey, reminderMinute);
    }
    notifyListeners();
  }

  String noteFor(String topicId) => notesByTopic[topicId] ?? '';

  Future<void> saveNote(String topicId, String note) async {
    final cleaned = note.trim();
    if (cleaned.isEmpty) {
      notesByTopic.remove(topicId);
    } else {
      notesByTopic[topicId] = cleaned;
    }
    await _prefs.setString(_notesKey, jsonEncode(notesByTopic));
    notifyListeners();
  }

  String explanationFor(String topicId) =>
      explanationsByTopic[topicId] ?? '';

  Future<void> saveExplanation(String topicId, String explanation) async {
    final cleaned = explanation.trim();
    if (cleaned.isEmpty) {
      explanationsByTopic.remove(topicId);
    } else {
      explanationsByTopic[topicId] = cleaned;
    }
    await _prefs.setString(
      _explanationsKey,
      jsonEncode(explanationsByTopic),
    );
    notifyListeners();
  }

  bool isHighlighted(String topicId, String passageId) =>
      highlightedPassages[topicId]?.contains(passageId) ?? false;

  bool isPassageStarred(String topicId, String passageId) =>
      starredPassages[topicId]?.contains(passageId) ?? false;

  Future<void> toggleHighlight(String topicId, String passageId) async {
    final set = highlightedPassages.putIfAbsent(topicId, () => <String>{});
    if (!set.add(passageId)) {
      set.remove(passageId);
    }
    if (set.isEmpty) {
      highlightedPassages.remove(topicId);
    }
    await _persistStringSetMap(_highlightsKey, highlightedPassages);
    notifyListeners();
  }

  Future<void> togglePassageStar(String topicId, String passageId) async {
    final set = starredPassages.putIfAbsent(topicId, () => <String>{});
    if (!set.add(passageId)) {
      set.remove(passageId);
    }
    if (set.isEmpty) {
      starredPassages.remove(topicId);
    }
    await _persistStringSetMap(_starredPassagesKey, starredPassages);
    notifyListeners();
  }

  Future<void> recordQuiz(
    String topicId, {
    required int score,
    required int total,
  }) async {
    quizScoreByTopic[topicId] = score;
    quizTotalByTopic[topicId] = total;
    await _persistQuiz();
    notifyListeners();
  }

  Future<void> toggleOfflineTopic(String topicId) async {
    if (!offlineTopicIds.add(topicId)) {
      offlineTopicIds.remove(topicId);
    }
    await _prefs.setStringList(
      _offlineTopicsKey,
      offlineTopicIds.toList(),
    );
    await _persistCollections();
    await _persistPersonalConnections();
    notifyListeners();
  }

  bool isOfflineTopic(String topicId) => offlineTopicIds.contains(topicId);

  double masteryScore(String topicId) {
    final progress = progressFor(topicId).clamp(0.0, 1.0);
    final quiz = quizPercentFor(topicId) ?? 0;
    final reviewLevel = (reviewLevelByTopic[topicId] ?? 0).clamp(0, 5) / 5;
    final explained = explanationFor(topicId).trim().isNotEmpty ? 1.0 : 0.0;

    final score = progress * .35 +
        quiz * .30 +
        reviewLevel * .25 +
        explained * .10;
    return score.clamp(0.0, 1.0).toDouble();
  }

  MasteryLevel masteryLevel(String topicId) {
    final score = masteryScore(topicId);
    if (score >= .78) {
      return MasteryLevel.consolidated;
    }
    if (score >= .52) {
      return MasteryLevel.understood;
    }
    if (score >= .16) {
      return MasteryLevel.familiar;
    }
    return MasteryLevel.newTopic;
  }

  String masteryLabel(String topicId) {
    return switch (masteryLevel(topicId)) {
      MasteryLevel.newTopic => 'novo',
      MasteryLevel.familiar => 'familiar',
      MasteryLevel.understood => 'entendido',
      MasteryLevel.consolidated => 'consolidado',
    };
  }

  Future<void> createCollection(String name) async {
    final cleaned = name.trim();
    if (cleaned.isEmpty || collectionsByName.containsKey(cleaned)) {
      return;
    }
    collectionsByName[cleaned] = [];
    await _persistCollections();
    notifyListeners();
  }

  Future<void> deleteCollection(String name) async {
    collectionsByName.remove(name);
    await _persistCollections();
    notifyListeners();
  }

  bool topicInCollection(String name, String topicId) =>
      collectionsByName[name]?.contains(topicId) ?? false;

  Future<void> toggleTopicInCollection(
    String name,
    String topicId,
  ) async {
    final topics = collectionsByName[name];
    if (topics == null) {
      return;
    }
    if (topics.contains(topicId)) {
      topics.remove(topicId);
    } else {
      topics.add(topicId);
    }
    await _persistCollections();
    notifyListeners();
  }

  Future<void> addPersonalConnection({
    required String fromTopicId,
    required String toTopicId,
    required String note,
  }) async {
    if (fromTopicId == toTopicId) {
      return;
    }
    personalConnections.insert(
      0,
      PersonalConnection(
        fromTopicId: fromTopicId,
        toTopicId: toTopicId,
        note: note.trim(),
        createdAt: DateTime.now(),
      ),
    );
    await _persistPersonalConnections();
    notifyListeners();
  }

  Future<void> deletePersonalConnection(int index) async {
    if (index < 0 || index >= personalConnections.length) {
      return;
    }
    personalConnections.removeAt(index);
    await _persistPersonalConnections();
    notifyListeners();
  }

  Future<void> updateAppearance(AppAppearance appearance) async {
    appAppearance = appearance;
    await _prefs.setString(_appAppearanceKey, appearance.name);
    notifyListeners();
  }

  Future<void> _recordStudyDay(DateTime value) async {
    final key = _dateKey(value);
    if (studyDays.add(key)) {
      await _prefs.setStringList(_studyDaysKey, studyDays.toList()..sort());
      notifyListeners();
    }
  }

  String _dateKey(DateTime value) =>
      '${value.year.toString().padLeft(4, '0')}-'
      '${value.month.toString().padLeft(2, '0')}-'
      '${value.day.toString().padLeft(2, '0')}';

  int studiedDaysThisWeek([DateTime? now]) {
    final reference = now ?? DateTime.now();
    final monday = DateTime(
      reference.year,
      reference.month,
      reference.day,
    ).subtract(Duration(days: reference.weekday - 1));

    var count = 0;
    for (var offset = 0; offset < 7; offset++) {
      if (studyDays.contains(_dateKey(monday.add(Duration(days: offset))))) {
        count++;
      }
    }
    return count;
  }

  List<bool> studyWeek([DateTime? now]) {
    final reference = now ?? DateTime.now();
    final monday = DateTime(
      reference.year,
      reference.month,
      reference.day,
    ).subtract(Duration(days: reference.weekday - 1));

    return List.generate(
      7,
      (offset) =>
          studyDays.contains(_dateKey(monday.add(Duration(days: offset)))),
    );
  }

  Future<void> updateWeeklyGoal(int goal) async {
    weeklyGoal = goal.clamp(1, 7).toInt();
    await _prefs.setInt(_weeklyGoalKey, weeklyGoal);
    notifyListeners();
  }

  int get totalQuizAttempts => quizScoreByTopic.length;

  double? quizPercentFor(String topicId) {
    final score = quizScoreByTopic[topicId];
    final total = quizTotalByTopic[topicId];
    if (score == null || total == null || total == 0) {
      return null;
    }
    return score / total;
  }

  int studiedMinutesEstimate() {
    var minutes = 0.0;
    for (final entry in progressByTopic.entries) {
      final progress = entry.value.clamp(0.0, 1.0);
      minutes += progress * 6;
    }
    return minutes.round();
  }

  String exportBackup() {
    return const JsonEncoder.withIndent('  ').convert({
      'format': 'repertorio-backup',
      'version': 3,
      'exportedAt': DateTime.now().toIso8601String(),
      'savedTopicIds': savedTopicIds.toList(),
      'completedTopicIds': completedTopicIds.toList(),
      'historyTopicIds': historyTopicIds,
      'progressByTopic': progressByTopic,
      'reviewLevelByTopic': reviewLevelByTopic,
      'reviewDueByTopic': _dateMapJson(reviewDueByTopic),
      'notesByTopic': notesByTopic,
      'studyDays': studyDays.toList(),
      'weeklyGoal': weeklyGoal,
      'readLaterQueue': readLaterQueue,
      'highlights': _stringSetMapJson(highlightedPassages),
      'starredPassages': _stringSetMapJson(starredPassages),
      'quiz': _quizJson(),
      'explanations': explanationsByTopic,
      'lastOpened': _dateMapJson(lastOpenedByTopic),
      'offlineTopicIds': offlineTopicIds.toList(),
      'collections': collectionsByName,
      'personalConnections':
          personalConnections.map((item) => item.toJson()).toList(),
      'reader': {
        'fontSize': readerFontSize,
        'lineHeight': readerLineHeight,
        'theme': readerTheme.name,
        'font': readerFont.name,
        'flow': readerFlow.name,
        'alignment': readerAlignment.name,
        'depth': readerDepth.name,
        'columnWidth': readerColumnWidth,
        'margin': readerMargin,
        'focusMode': readerFocusMode,
        'voiceRate': voiceRate,
      },
      'accessibility': {
        'highContrast': highContrast,
        'reduceMotion': reduceMotion,
        'largeTapTargets': largeTapTargets,
        'appearance': appAppearance.name,
      },
      'reminders': {
        'enabled': studyRemindersEnabled,
        'reviewEnabled': reviewRemindersEnabled,
        'dailyEditionEnabled': dailyEditionRemindersEnabled,
        'hour': reminderHour,
        'minute': reminderMinute,
      },
    });
  }

  Future<bool> importBackup(String raw) async {
    try {
      final decoded = jsonDecode(raw) as Map<String, dynamic>;
      if (decoded['format'] != 'repertorio-backup') {
        return false;
      }

      savedTopicIds
        ..clear()
        ..addAll(_stringList(decoded['savedTopicIds']));
      completedTopicIds
        ..clear()
        ..addAll(_stringList(decoded['completedTopicIds']));
      historyTopicIds
        ..clear()
        ..addAll(_stringList(decoded['historyTopicIds']));

      progressByTopic
        ..clear()
        ..addAll(_doubleMap(decoded['progressByTopic']));
      reviewLevelByTopic
        ..clear()
        ..addAll(_intMap(decoded['reviewLevelByTopic']));
      reviewDueByTopic
        ..clear()
        ..addAll(_dateMap(decoded['reviewDueByTopic']));

      notesByTopic
        ..clear()
        ..addAll(_stringMap(decoded['notesByTopic']));

      studyDays
        ..clear()
        ..addAll(_stringList(decoded['studyDays']));
      weeklyGoal =
          ((decoded['weeklyGoal'] as num?)?.toInt() ?? 3).clamp(1, 7).toInt();

      readLaterQueue
        ..clear()
        ..addAll(_stringList(decoded['readLaterQueue']));

      highlightedPassages
        ..clear()
        ..addAll(_stringSetMap(decoded['highlights']));
      starredPassages
        ..clear()
        ..addAll(_stringSetMap(decoded['starredPassages']));

      final quiz = decoded['quiz'] as Map<String, dynamic>? ?? const {};
      quizScoreByTopic.clear();
      quizTotalByTopic.clear();
      for (final entry in quiz.entries) {
        final item = entry.value as Map<String, dynamic>;
        quizScoreByTopic[entry.key] = (item['score'] as num).toInt();
        quizTotalByTopic[entry.key] = (item['total'] as num).toInt();
      }

      explanationsByTopic
        ..clear()
        ..addAll(_stringMap(decoded['explanations']));
      lastOpenedByTopic
        ..clear()
        ..addAll(_dateMap(decoded['lastOpened']));

      offlineTopicIds
        ..clear()
        ..addAll(_stringList(decoded['offlineTopicIds']));

      collectionsByName.clear();
      final collections =
          decoded['collections'] as Map<String, dynamic>? ?? const {};
      for (final entry in collections.entries) {
        collectionsByName[entry.key] = (entry.value as List<dynamic>)
            .map((value) => value.toString())
            .toList();
      }

      personalConnections.clear();
      final connections =
          decoded['personalConnections'] as List<dynamic>? ?? const [];
      for (final item in connections) {
        final connection = PersonalConnection.fromJson(item);
        if (connection != null) {
          personalConnections.add(connection);
        }
      }

      final reader = decoded['reader'] as Map<String, dynamic>? ?? const {};
      readerFontSize =
          (reader['fontSize'] as num?)?.toDouble().clamp(14, 24).toDouble() ??
              17;
      readerLineHeight = (reader['lineHeight'] as num?)
              ?.toDouble()
              .clamp(1.3, 2.0)
              .toDouble() ??
          1.62;
      readerTheme = _enumByName(
        ReaderThemeMode.values,
        reader['theme']?.toString(),
        ReaderThemeMode.paper,
      );
      readerFont = _enumByName(
        ReaderFontFamily.values,
        reader['font']?.toString(),
        ReaderFontFamily.editorial,
      );
      readerFlow = _enumByName(
        ReaderFlow.values,
        reader['flow']?.toString(),
        ReaderFlow.continuous,
      );
      readerAlignment = _enumByName(
        ReaderTextAlignment.values,
        reader['alignment']?.toString(),
        ReaderTextAlignment.left,
      );
      readerDepth = _enumByName(
        ContentDepth.values,
        reader['depth']?.toString(),
        ContentDepth.standard,
      );
      readerColumnWidth =
          (reader['columnWidth'] as num?)?.toDouble().clamp(520, 860).toDouble() ??
              720;
      readerMargin =
          (reader['margin'] as num?)?.toDouble().clamp(12, 40).toDouble() ?? 20;
      readerFocusMode = reader['focusMode'] as bool? ?? false;
      voiceRate =
          (reader['voiceRate'] as num?)?.toDouble().clamp(.7, 1.5).toDouble() ??
              1;

      final accessibility =
          decoded['accessibility'] as Map<String, dynamic>? ?? const {};
      highContrast = accessibility['highContrast'] as bool? ?? false;
      reduceMotion = accessibility['reduceMotion'] as bool? ?? false;
      largeTapTargets = accessibility['largeTapTargets'] as bool? ?? false;
      appAppearance = _enumByName(
        AppAppearance.values,
        accessibility['appearance']?.toString(),
        AppAppearance.light,
      );

      final reminders =
          decoded['reminders'] as Map<String, dynamic>? ?? const {};
      studyRemindersEnabled = reminders['enabled'] as bool? ?? false;
      reviewRemindersEnabled = reminders['reviewEnabled'] as bool? ?? true;
      dailyEditionRemindersEnabled =
          reminders['dailyEditionEnabled'] as bool? ?? true;
      reminderHour =
          ((reminders['hour'] as num?)?.toInt() ?? 19).clamp(0, 23).toInt();
      reminderMinute =
          ((reminders['minute'] as num?)?.toInt() ?? 0).clamp(0, 59).toInt();

      await _persistAllUserState();
      onboardingComplete = true;
      await _prefs.setBool(_onboardingKey, true);
      notifyListeners();
      return true;
    } catch (_) {
      return false;
    }
  }

  List<String> _stringList(dynamic raw) =>
      (raw as List<dynamic>? ?? const []).map((e) => e.toString()).toList();

  Map<String, String> _stringMap(dynamic raw) {
    final source = raw as Map<String, dynamic>? ?? const {};
    return source.map((key, value) => MapEntry(key, value.toString()));
  }

  Map<String, double> _doubleMap(dynamic raw) {
    final source = raw as Map<String, dynamic>? ?? const {};
    return source.map(
      (key, value) => MapEntry(key, (value as num).toDouble()),
    );
  }

  Map<String, int> _intMap(dynamic raw) {
    final source = raw as Map<String, dynamic>? ?? const {};
    return source.map(
      (key, value) => MapEntry(key, (value as num).toInt()),
    );
  }

  Map<String, DateTime> _dateMap(dynamic raw) {
    final source = raw as Map<String, dynamic>? ?? const {};
    final result = <String, DateTime>{};
    for (final entry in source.entries) {
      final parsed = DateTime.tryParse(entry.value.toString());
      if (parsed != null) {
        result[entry.key] = parsed;
      }
    }
    return result;
  }

  Map<String, Set<String>> _stringSetMap(dynamic raw) {
    final source = raw as Map<String, dynamic>? ?? const {};
    return source.map(
      (key, value) => MapEntry(
        key,
        (value as List<dynamic>).map((e) => e.toString()).toSet(),
      ),
    );
  }

  static Map<String, dynamic> _dateMapJson(Map<String, DateTime> source) =>
      source.map(
        (key, value) => MapEntry(key, value.toIso8601String()),
      );

  static Map<String, dynamic> _stringSetMapJson(
    Map<String, Set<String>> source,
  ) =>
      source.map((key, value) => MapEntry(key, value.toList()));

  Map<String, dynamic> _quizJson() {
    final result = <String, dynamic>{};
    for (final id in {...quizScoreByTopic.keys, ...quizTotalByTopic.keys}) {
      result[id] = {
        'score': quizScoreByTopic[id] ?? 0,
        'total': quizTotalByTopic[id] ?? 0,
      };
    }
    return result;
  }

  Future<void> _persistDateMap(
    String key,
    Map<String, DateTime> source,
  ) async {
    await _prefs.setString(key, jsonEncode(_dateMapJson(source)));
  }

  Future<void> _persistStringSetMap(
    String key,
    Map<String, Set<String>> source,
  ) async {
    await _prefs.setString(key, jsonEncode(_stringSetMapJson(source)));
  }

  Future<void> _persistQuiz() async {
    await _prefs.setString(_quizKey, jsonEncode(_quizJson()));
  }

  Future<void> _persistCollections() async {
    await _prefs.setString(
      _collectionsKey,
      jsonEncode(collectionsByName),
    );
  }

  Future<void> _persistPersonalConnections() async {
    await _prefs.setString(
      _personalConnectionsKey,
      jsonEncode(
        personalConnections.map((item) => item.toJson()).toList(),
      ),
    );
  }

  Future<void> _persistAllUserState() async {
    await _prefs.setStringList(_savedKey, savedTopicIds.toList());
    await _prefs.setStringList(_completedKey, completedTopicIds.toList());
    await _prefs.setStringList(_historyKey, historyTopicIds);
    await _prefs.setString(_progressKey, jsonEncode(progressByTopic));
    await _prefs.setString(
      _reviewLevelKey,
      jsonEncode(reviewLevelByTopic),
    );
    await _persistReviewDue();
    await _prefs.setString(_notesKey, jsonEncode(notesByTopic));
    await _prefs.setStringList(_studyDaysKey, studyDays.toList());
    await _prefs.setInt(_weeklyGoalKey, weeklyGoal);

    await _prefs.setStringList(_queueKey, readLaterQueue);
    await _persistStringSetMap(_highlightsKey, highlightedPassages);
    await _persistStringSetMap(_starredPassagesKey, starredPassages);
    await _persistQuiz();
    await _prefs.setString(
      _explanationsKey,
      jsonEncode(explanationsByTopic),
    );
    await _persistDateMap(_lastOpenedKey, lastOpenedByTopic);
    await _prefs.setStringList(
      _offlineTopicsKey,
      offlineTopicIds.toList(),
    );

    await _prefs.setDouble(_fontSizeKey, readerFontSize);
    await _prefs.setDouble(_lineHeightKey, readerLineHeight);
    await _prefs.setString(_readerThemeKey, readerTheme.name);
    await _prefs.setString(_readerFontKey, readerFont.name);
    await _prefs.setString(_readerFlowKey, readerFlow.name);
    await _prefs.setString(_readerAlignmentKey, readerAlignment.name);
    await _prefs.setString(_readerDepthKey, readerDepth.name);
    await _prefs.setDouble(_readerColumnWidthKey, readerColumnWidth);
    await _prefs.setDouble(_readerMarginKey, readerMargin);
    await _prefs.setBool(_readerFocusKey, readerFocusMode);
    await _prefs.setDouble(_voiceRateKey, voiceRate);

    await _prefs.setBool(_highContrastKey, highContrast);
    await _prefs.setBool(_reduceMotionKey, reduceMotion);
    await _prefs.setBool(_largeTapTargetsKey, largeTapTargets);
    await _prefs.setString(_appAppearanceKey, appAppearance.name);

    await _prefs.setBool(_studyRemindersKey, studyRemindersEnabled);
    await _prefs.setBool(_reviewRemindersKey, reviewRemindersEnabled);
    await _prefs.setBool(
      _dailyEditionRemindersKey,
      dailyEditionRemindersEnabled,
    );
    await _prefs.setInt(_reminderHourKey, reminderHour);
    await _prefs.setInt(_reminderMinuteKey, reminderMinute);
  }

  Future<void> updateReaderSettings({
    double? fontSize,
    double? lineHeight,
    ReaderThemeMode? theme,
    ReaderFontFamily? font,
    ReaderFlow? flow,
    ReaderTextAlignment? alignment,
    ContentDepth? depth,
    double? columnWidth,
    double? margin,
    bool? focusMode,
    double? newVoiceRate,
  }) async {
    if (fontSize != null) {
      readerFontSize = fontSize.clamp(14, 24).toDouble();
      await _prefs.setDouble(_fontSizeKey, readerFontSize);
    }
    if (lineHeight != null) {
      readerLineHeight = lineHeight.clamp(1.3, 2.0).toDouble();
      await _prefs.setDouble(_lineHeightKey, readerLineHeight);
    }
    if (theme != null) {
      readerTheme = theme;
      await _prefs.setString(_readerThemeKey, theme.name);
    }
    if (font != null) {
      readerFont = font;
      await _prefs.setString(_readerFontKey, font.name);
    }
    if (flow != null) {
      readerFlow = flow;
      await _prefs.setString(_readerFlowKey, flow.name);
    }
    if (alignment != null) {
      readerAlignment = alignment;
      await _prefs.setString(_readerAlignmentKey, alignment.name);
    }
    if (depth != null) {
      readerDepth = depth;
      await _prefs.setString(_readerDepthKey, depth.name);
    }
    if (columnWidth != null) {
      readerColumnWidth = columnWidth.clamp(520, 860).toDouble();
      await _prefs.setDouble(_readerColumnWidthKey, readerColumnWidth);
    }
    if (margin != null) {
      readerMargin = margin.clamp(12, 40).toDouble();
      await _prefs.setDouble(_readerMarginKey, readerMargin);
    }
    if (focusMode != null) {
      readerFocusMode = focusMode;
      await _prefs.setBool(_readerFocusKey, focusMode);
    }
    if (newVoiceRate != null) {
      voiceRate = newVoiceRate.clamp(.7, 1.5).toDouble();
      await _prefs.setDouble(_voiceRateKey, voiceRate);
    }
    notifyListeners();
  }

  Future<void> updateAccessibility({
    bool? contrast,
    bool? motion,
    bool? targets,
  }) async {
    if (contrast != null) {
      highContrast = contrast;
      await _prefs.setBool(_highContrastKey, contrast);
    }
    if (motion != null) {
      reduceMotion = motion;
      await _prefs.setBool(_reduceMotionKey, motion);
    }
    if (targets != null) {
      largeTapTargets = targets;
      await _prefs.setBool(_largeTapTargetsKey, targets);
    }
    notifyListeners();
  }
}

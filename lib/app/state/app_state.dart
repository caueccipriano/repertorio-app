import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ReaderThemeMode { paper, sepia, dark }

enum ReaderFontFamily { editorial, sans }

enum ReaderFlow { continuous, paged }

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

  bool studyRemindersEnabled = false;
  bool reviewRemindersEnabled = true;
  bool dailyEditionRemindersEnabled = true;
  int reminderHour = 19;
  int reminderMinute = 0;
  DateTime? lastStudyAt;
  DateTime? lastReminderAt;

  static Future<AppState> load() async {
    final prefs = await SharedPreferences.getInstance();
    return AppState._(prefs);
  }

  void _load() {
    onboardingComplete = _prefs.getBool(_onboardingKey) ?? false;
    savedTopicIds.addAll(_prefs.getStringList(_savedKey) ?? const []);
    completedTopicIds.addAll(_prefs.getStringList(_completedKey) ?? const []);
    historyTopicIds.addAll(_prefs.getStringList(_historyKey) ?? const []);

    final rawProgress = _prefs.getString(_progressKey);
    if (rawProgress != null) {
      final decoded = jsonDecode(rawProgress) as Map<String, dynamic>;
      for (final entry in decoded.entries) {
        progressByTopic[entry.key] = (entry.value as num).toDouble();
      }
    }

    final rawLevels = _prefs.getString(_reviewLevelKey);
    if (rawLevels != null) {
      final decoded = jsonDecode(rawLevels) as Map<String, dynamic>;
      for (final entry in decoded.entries) {
        reviewLevelByTopic[entry.key] = (entry.value as num).toInt();
      }
    }

    final rawDue = _prefs.getString(_reviewDueKey);
    if (rawDue != null) {
      final decoded = jsonDecode(rawDue) as Map<String, dynamic>;
      for (final entry in decoded.entries) {
        final parsed = DateTime.tryParse(entry.value.toString());
        if (parsed != null) {
          reviewDueByTopic[entry.key] = parsed;
        }
      }
    }

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

    studyRemindersEnabled = _prefs.getBool(_studyRemindersKey) ?? false;
    reviewRemindersEnabled = _prefs.getBool(_reviewRemindersKey) ?? true;
    dailyEditionRemindersEnabled =
        _prefs.getBool(_dailyEditionRemindersKey) ?? true;
    reminderHour = _prefs.getInt(_reminderHourKey) ?? 19;
    reminderMinute = _prefs.getInt(_reminderMinuteKey) ?? 0;
    lastStudyAt = _readDate(_lastStudyAtKey);
    lastReminderAt = _readDate(_lastReminderAtKey);
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

  double progressFor(String topicId) => progressByTopic[topicId] ?? 0;

  Future<void> openTopic(String topicId) async {
    historyTopicIds.remove(topicId);
    historyTopicIds.insert(0, topicId);
    if (historyTopicIds.length > 40) {
      historyTopicIds.removeRange(40, historyTopicIds.length);
    }
    await _prefs.setStringList(_historyKey, historyTopicIds);
    notifyListeners();
  }

  Future<void> updateProgress(String topicId, double progress) async {
    final normalized = progress.clamp(0.0, 1.0);
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

    await _prefs.setString(
      _progressKey,
      jsonEncode(progressByTopic),
    );
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
        ? (current + 1).clamp(0, intervals.length - 1)
        : quality == 1
            ? current.clamp(0, intervals.length - 1)
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
    await _prefs.setString(
      _reviewDueKey,
      jsonEncode(
        reviewDueByTopic.map(
          (key, value) => MapEntry(key, value.toIso8601String()),
        ),
      ),
    );
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
      reminderHour = hour.clamp(0, 23);
      await _prefs.setInt(_reminderHourKey, reminderHour);
    }
    if (minute != null) {
      reminderMinute = minute.clamp(0, 59);
      await _prefs.setInt(_reminderMinuteKey, reminderMinute);
    }
    notifyListeners();
  }

  Future<void> updateReaderSettings({
    double? fontSize,
    double? lineHeight,
    ReaderThemeMode? theme,
    ReaderFontFamily? font,
    ReaderFlow? flow,
  }) async {
    if (fontSize != null) {
      readerFontSize = fontSize.clamp(14, 24);
      await _prefs.setDouble(_fontSizeKey, readerFontSize);
    }
    if (lineHeight != null) {
      readerLineHeight = lineHeight.clamp(1.3, 2.0);
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
    notifyListeners();
  }
}

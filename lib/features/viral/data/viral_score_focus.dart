import '../../today/data/demo_topics.dart';
import '../../today/domain/knowledge_topic.dart';

List<String> scoreTagsForCategory(String category) {
  return switch (category) {
    'PSICOLOGIA' => ['psicologia', 'comportamento', 'mente'],
    'HISTÓRIA' => ['historia', 'imperio', 'guerra'],
    'CIÊNCIA' => ['ciencia', 'astronomia', 'biologia', 'universo'],
    'ECONOMIA' => ['economia', 'dinheiro', 'financas', 'inflacao'],
    'ARTE & DESIGN' => ['arte', 'design', 'arquitetura', 'tipografia'],
    'TECNOLOGIA' => ['tecnologia', 'internet', 'ia', 'digital'],
    'MUNDO' => ['mundo', 'geografia', 'politica', 'cidade'],
    'CULTURA' => ['cultura', 'literatura', 'cinema', 'musica'],
    _ => [normalizeScoreText(category)],
  };
}

List<KnowledgeTopic> topicsForScoreCategory(
  String category, {
  Set<String> excludedIds = const {},
}) {
  final tags = scoreTagsForCategory(category);
  return allDemoTopics.where((topic) {
    if (excludedIds.contains(topic.id)) return false;
    final haystack = <String>{
      ...topic.tags.map(normalizeScoreText),
      normalizeScoreText(topic.eyebrow),
      normalizeScoreText(topic.title),
    }.join(' ');
    return tags.any(haystack.contains);
  }).toList(growable: false);
}

KnowledgeTopic? topicForScoreFocus({
  required List<String> weakCategories,
  Set<String> excludedIds = const {},
}) {
  for (final category in weakCategories) {
    final tags = scoreTagsForCategory(category);
    for (final topic in allDemoTopics) {
      if (excludedIds.contains(topic.id)) continue;
      final haystack = <String>{
        ...topic.tags.map(normalizeScoreText),
        normalizeScoreText(topic.eyebrow),
        normalizeScoreText(topic.title),
      }.join(' ');
      if (tags.any(haystack.contains)) return topic;
    }
  }
  return null;
}

String scoreFocusReason(String category) {
  final readable = switch (category) {
    'ARTE & DESIGN' => 'arte & design',
    'CIÊNCIA' => 'ciência',
    'HISTÓRIA' => 'história',
    'PSICOLOGIA' => 'psicologia',
    'ECONOMIA' => 'economia',
    'TECNOLOGIA' => 'tecnologia',
    'MUNDO' => 'mundo',
    'CULTURA' => 'cultura',
    _ => category.toLowerCase(),
  };
  return 'porque seu Score pediu mais $readable';
}

String normalizeScoreText(String value) {
  return value
      .toLowerCase()
      .replaceAll(RegExp(r'[áàâã]'), 'a')
      .replaceAll(RegExp(r'[éèê]'), 'e')
      .replaceAll(RegExp(r'[íìî]'), 'i')
      .replaceAll(RegExp(r'[óòôõ]'), 'o')
      .replaceAll(RegExp(r'[úùû]'), 'u')
      .replaceAll('ç', 'c');
}

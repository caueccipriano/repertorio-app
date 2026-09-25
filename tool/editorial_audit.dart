import 'dart:io';

import 'package:repertorio_app/features/study/data/study_content.dart';
import 'package:repertorio_app/features/today/data/demo_topics.dart';

/// Checks every expanded topic without maintaining a manual ID allow-list.
void main(List<String> args) {
  final issues = <String>[];
  final ids = <String>{};
  var expanded = 0;
  var referenced = 0;
  var tested = 0;
  var shortEssentials = 0;

  for (final topic in allDemoTopics) {
    if (!ids.add(topic.id)) issues.add('ID duplicado: ${topic.id}');
    if (topic.title.trim().isEmpty || topic.quickTake.trim().isEmpty) {
      issues.add('Título ou resumo vazio: ${topic.id}');
    }
    if (topic.simpleExplanation != null &&
        topic.example?.trim() == topic.simpleExplanation?.trim()) {
      issues.add('Exemplo duplicado: ${topic.id}');
    }

    final sources = sourcesFor(topic.id);
    final quizzes = quizFor(topic.id);
    if (sources.isNotEmpty) referenced++;
    if (quizzes.length >= 3) tested++;
    for (final source in sources) {
      if (!source.url.startsWith('https://') || source.label.trim().isEmpty) {
        issues.add('Fonte inválida: ${topic.id}');
      }
    }

    if (topic.chapters.isEmpty) {
      final wordCount =
          topic.body.join(' ').trim().split(RegExp(r'\s+')).length;
      if (wordCount < 100) shortEssentials++;
      continue;
    }

    expanded++;
    if (topic.chapters.length < 2) {
      issues.add('Menos de dois capítulos: ${topic.id}');
    }
    final chapterTitles = <String>{};
    for (final chapter in topic.chapters) {
      if (chapter.title.trim().isEmpty ||
          !chapterTitles.add(chapter.title.toLowerCase().trim())) {
        issues.add('Título editorial inválido: ${topic.id}');
      }
      if (chapter.paragraphs.length < 2 ||
          chapter.paragraphs.any((paragraph) => paragraph.trim().length < 80)) {
        issues.add('Capítulo curto: ${topic.id}');
      }
    }
    if (sources.isEmpty) issues.add('Sem fontes: ${topic.id}');
    if (quizzes.length < 3) {
      issues.add('Menos de três questões: ${topic.id}');
    }
    final prompts = <String>{};
    for (final quiz in quizzes) {
      if (!prompts.add(quiz.prompt.toLowerCase().trim()) ||
          quiz.options.length != 4 ||
          quiz.options.toSet().length != quiz.options.length ||
          quiz.correctIndex < 0 ||
          quiz.correctIndex >= quiz.options.length ||
          quiz.explanation.trim().isEmpty) {
        issues.add('Questão inválida ou repetida: ${topic.id}');
      }
    }
  }

  stdout.writeln('Repertório — auditoria editorial');
  stdout.writeln('Assuntos: ${allDemoTopics.length} | aprofundados: '
      '$expanded | essenciais: ${allDemoTopics.length - expanded}');
  stdout.writeln('Com fontes: $referenced | três ou mais questões: '
      '$tested | essenciais curtos: $shortEssentials');
  if (issues.isNotEmpty) {
    for (final issue in issues) {
      stderr.writeln('ERRO: $issue');
    }
    if (args.contains('--strict')) exitCode = 1;
  } else {
    stdout.writeln('Nenhuma inconsistência estrutural detectada.');
  }
}

import 'dart:math';

class ViralScoreQuestion {
  const ViralScoreQuestion({
    required this.category,
    required this.question,
    required this.answers,
    required this.correctIndex,
  });

  final String category;
  final String question;
  final List<String> answers;
  final int correctIndex;
}

class ViralProfile {
  const ViralProfile({
    required this.archetype,
    required this.description,
  });

  final String archetype;
  final String description;
}

const viralQuestionBank = <ViralScoreQuestion>[
  ViralScoreQuestion(
    category: 'PSICOLOGIA',
    question: 'O efeito placebo acontece quando…',
    answers: [
      'uma expectativa pode influenciar a percepção de sintomas',
      'o cérebro para de produzir dopamina',
      'um remédio funciona apenas durante o sono',
      'a memória apaga uma sensação desagradável',
    ],
    correctIndex: 0,
  ),
  ViralScoreQuestion(
    category: 'PSICOLOGIA',
    question: 'Viés de confirmação é a tendência de…',
    answers: [
      'esquecer tudo que contradiz uma memória antiga',
      'buscar e valorizar mais o que confirma o que já acreditamos',
      'mudar de opinião sempre que surge um dado novo',
      'confiar apenas em informações numéricas',
    ],
    correctIndex: 1,
  ),
  ViralScoreQuestion(
    category: 'PSICOLOGIA',
    question: 'A memória de trabalho é usada principalmente para…',
    answers: [
      'guardar lembranças da infância por décadas',
      'manter e manipular informação por pouco tempo',
      'controlar apenas movimentos automáticos',
      'apagar lembranças repetitivas',
    ],
    correctIndex: 1,
  ),
  ViralScoreQuestion(
    category: 'HISTÓRIA',
    question: 'O Renascimento europeu começou primeiro com maior força em…',
    answers: ['Escandinávia', 'cidades italianas', 'Rússia', 'Península Ibérica'],
    correctIndex: 1,
  ),
  ViralScoreQuestion(
    category: 'HISTÓRIA',
    question: 'Na Europa, a prensa de tipos móveis é associada principalmente a…',
    answers: ['Galileu Galilei', 'Johannes Gutenberg', 'Isaac Newton', 'Marco Polo'],
    correctIndex: 1,
  ),
  ViralScoreQuestion(
    category: 'HISTÓRIA',
    question: 'A tomada da Bastilha, símbolo da Revolução Francesa, aconteceu em…',
    answers: ['1492', '1648', '1789', '1914'],
    correctIndex: 2,
  ),
  ViralScoreQuestion(
    category: 'CIÊNCIA',
    question: 'Por que vemos o céu azul durante boa parte do dia?',
    answers: [
      'por causa do reflexo dos oceanos',
      'pela dispersão da luz solar na atmosfera',
      'porque o oxigênio é naturalmente azul',
      'por causa do campo magnético da Terra',
    ],
    correctIndex: 1,
  ),
  ViralScoreQuestion(
    category: 'CIÊNCIA',
    question: 'No DNA, a adenina normalmente se liga a…',
    answers: ['citosina', 'guanina', 'timina', 'uracila'],
    correctIndex: 2,
  ),
  ViralScoreQuestion(
    category: 'CIÊNCIA',
    question: 'Na fotossíntese, plantas usam luz para transformar principalmente…',
    answers: [
      'água e dióxido de carbono em compostos energéticos',
      'oxigênio em nitrogênio',
      'minerais em luz',
      'proteínas em gás carbônico',
    ],
    correctIndex: 0,
  ),
  ViralScoreQuestion(
    category: 'ECONOMIA',
    question: 'Inflação significa, de forma geral…',
    answers: [
      'queda contínua dos salários',
      'aumento generalizado do nível de preços',
      'alta automática do dólar',
      'crescimento da bolsa de valores',
    ],
    correctIndex: 1,
  ),
  ViralScoreQuestion(
    category: 'ECONOMIA',
    question: 'Custo de oportunidade é…',
    answers: [
      'o imposto pago ao comprar algo',
      'o valor da melhor alternativa que você abriu mão',
      'o custo de produzir em grande escala',
      'qualquer despesa inesperada',
    ],
    correctIndex: 1,
  ),
  ViralScoreQuestion(
    category: 'ECONOMIA',
    question: 'Diversificar investimentos tende a ajudar principalmente a…',
    answers: [
      'eliminar qualquer possibilidade de perda',
      'reduzir o risco concentrado em um único ativo',
      'garantir retorno acima da inflação',
      'impedir variações de mercado',
    ],
    correctIndex: 1,
  ),
  ViralScoreQuestion(
    category: 'ARTE & DESIGN',
    question: 'A Bauhaus ficou conhecida principalmente por aproximar…',
    answers: [
      'arte, design e função',
      'religião e pintura medieval',
      'ópera e cinema',
      'fotografia e jornalismo esportivo',
    ],
    correctIndex: 0,
  ),
  ViralScoreQuestion(
    category: 'ARTE & DESIGN',
    question: 'O Impressionismo ficou conhecido, entre outras coisas, por explorar…',
    answers: [
      'luz e momentos cotidianos com pinceladas visíveis',
      'apenas temas religiosos em fundos dourados',
      'formas exclusivamente geométricas e industriais',
      'esculturas monumentais em mármore romano',
    ],
    correctIndex: 0,
  ),
  ViralScoreQuestion(
    category: 'ARTE & DESIGN',
    question: 'Na composição visual, “espaço negativo” é…',
    answers: [
      'uma área obrigatoriamente preta',
      'o espaço vazio ao redor ou entre elementos',
      'um erro de alinhamento',
      'uma imagem invertida',
    ],
    correctIndex: 1,
  ),
  ViralScoreQuestion(
    category: 'TECNOLOGIA',
    question: 'Quando um site usa HTTPS, o principal ganho é…',
    answers: [
      'carregar sem internet',
      'criptografar a comunicação com o site',
      'eliminar todos os rastreadores',
      'dispensar senhas',
    ],
    correctIndex: 1,
  ),
  ViralScoreQuestion(
    category: 'TECNOLOGIA',
    question: 'Em computação, uma API serve principalmente para…',
    answers: [
      'aumentar fisicamente a memória do computador',
      'permitir que sistemas se comuniquem por interfaces definidas',
      'substituir qualquer banco de dados',
      'bloquear todo acesso externo',
    ],
    correctIndex: 1,
  ),
  ViralScoreQuestion(
    category: 'TECNOLOGIA',
    question: 'Autenticação em dois fatores adiciona segurança porque exige…',
    answers: [
      'duas senhas iguais',
      'um segundo fator além da senha',
      'trocar de navegador',
      'usar duas contas de e-mail',
    ],
    correctIndex: 1,
  ),
  ViralScoreQuestion(
    category: 'MUNDO',
    question: 'Qual destes países não faz parte da União Europeia?',
    answers: ['Portugal', 'Croácia', 'Noruega', 'Espanha'],
    correctIndex: 2,
  ),
  ViralScoreQuestion(
    category: 'MUNDO',
    question: 'O rio Nilo está associado principalmente a qual continente?',
    answers: ['África', 'Europa', 'Oceania', 'América do Sul'],
    correctIndex: 0,
  ),
  ViralScoreQuestion(
    category: 'MUNDO',
    question: 'Qual cidade é atravessada pelo rio Tâmisa?',
    answers: ['Madri', 'Londres', 'Roma', 'Berlim'],
    correctIndex: 1,
  ),
  ViralScoreQuestion(
    category: 'CULTURA',
    question: 'Em narrativa, um narrador não confiável é aquele que…',
    answers: [
      'sempre fala em terceira pessoa',
      'pode distorcer ou limitar o que o leitor entende',
      'aparece apenas no final da história',
      'não possui nome',
    ],
    correctIndex: 1,
  ),
  ViralScoreQuestion(
    category: 'CULTURA',
    question: '“Distopia” costuma descrever uma sociedade…',
    answers: [
      'ideal e sem conflitos',
      'imaginada de forma opressiva ou indesejável',
      'necessariamente medieval',
      'sem tecnologia',
    ],
    correctIndex: 1,
  ),
  ViralScoreQuestion(
    category: 'CULTURA',
    question: 'Um “plot twist” é…',
    answers: [
      'uma mudança inesperada importante na trama',
      'a lista de personagens de uma obra',
      'a primeira cena de um filme',
      'um tipo de narrador em primeira pessoa',
    ],
    correctIndex: 0,
  ),
];

List<ViralScoreQuestion> buildViralRound({required int seed, int count = 10}) {
  final random = Random(seed);
  final byCategory = <String, List<ViralScoreQuestion>>{};

  for (final question in viralQuestionBank) {
    byCategory.putIfAbsent(question.category, () => []).add(question);
  }

  final round = <ViralScoreQuestion>[];
  final categories = byCategory.keys.toList()..shuffle(random);

  for (final category in categories) {
    final choices = [...byCategory[category]!]..shuffle(random);
    round.add(choices.first);
  }

  final remaining = viralQuestionBank.where((q) => !round.contains(q)).toList()
    ..shuffle(random);

  round.addAll(remaining.take(max(0, count - round.length)));
  round.shuffle(random);
  return round.take(count).toList();
}

ViralProfile resolveViralProfile({
  required int score,
  required int breadth,
}) {
  if (score >= 785 && breadth >= 6) {
    return const ViralProfile(
      archetype: 'ARQUIVO VIVO',
      description:
          'Você cruza áreas diferentes com facilidade e costuma ter uma referência pronta quando a conversa muda de rumo.',
    );
  }
  if (score >= 700) {
    return const ViralProfile(
      archetype: 'CONECTOR CULTURAL',
      description:
          'Seu forte é juntar pontos: você reconhece padrões e leva uma ideia de um assunto para outro.',
    );
  }
  if (score >= 610) {
    return const ViralProfile(
      archetype: 'CABEÇA DE WIKIPEDIA',
      description:
          'Seu repertório já é amplo e sua curiosidade costuma abrir mais abas do que você fecha.',
    );
  }
  if (score >= 520) {
    return const ViralProfile(
      archetype: 'CURIOSO CAÓTICO',
      description:
          'Você acumula fatos, referências e interesses aparentemente aleatórios — e é justamente isso que dá personalidade ao seu repertório.',
    );
  }
  return const ViralProfile(
    archetype: 'RADAR CULTURAL',
    description:
        'Você já tem curiosidade ativa. Falta transformar o que chama sua atenção em repertório que fica.',
  );
}

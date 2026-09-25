class QuizQuestion {
  const QuizQuestion({
    required this.prompt,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });

  final String prompt;
  final List<String> options;
  final int correctIndex;
  final String explanation;
}

class GlossaryEntry {
  const GlossaryEntry({
    required this.term,
    required this.definition,
  });

  final String term;
  final String definition;
}

class SourceEntry {
  const SourceEntry({
    required this.label,
    required this.url,
    this.note,
  });

  final String label;
  final String url;
  final String? note;
}

class TimelineEvent {
  const TimelineEvent({
    required this.year,
    required this.title,
    required this.description,
    this.topicId,
  });

  final String year;
  final String title;
  final String description;
  final String? topicId;
}

class ComparisonEntry {
  const ComparisonEntry({
    required this.title,
    required this.leftLabel,
    required this.rightLabel,
    required this.rows,
  });

  final String title;
  final String leftLabel;
  final String rightLabel;
  final List<ComparisonRow> rows;
}

class ComparisonRow {
  const ComparisonRow({
    required this.aspect,
    required this.left,
    required this.right,
  });

  final String aspect;
  final String left;
  final String right;
}

enum KnowledgeEntityType { person, place, work, concept }

class KnowledgeEntity {
  const KnowledgeEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.subtitle,
    required this.summary,
    required this.topicIds,
  });

  final String id;
  final String name;
  final KnowledgeEntityType type;
  final String subtitle;
  final String summary;
  final List<String> topicIds;
}

const quizByTopic = <String, List<QuizQuestion>>{
  'bauhaus': [
    QuizQuestion(
      prompt: 'Qual ideia resume melhor a proposta da Bauhaus?',
      options: [
        'Separar arte de produção industrial',
        'Unir arte, função e produção moderna',
        'Retomar ornamentos históricos',
        'Eliminar totalmente o artesanato',
      ],
      correctIndex: 1,
      explanation:
          'A Bauhaus aproximou arte, artesanato, arquitetura e produção industrial.',
    ),
    QuizQuestion(
      prompt: 'Em que ano a Bauhaus foi fundada?',
      options: ['1890', '1919', '1933', '1957'],
      correctIndex: 1,
      explanation: 'Walter Gropius fundou a escola em 1919, em Weimar.',
    ),
    QuizQuestion(
      prompt: 'A influência da Bauhaus aparece hoje principalmente em…',
      options: [
        'Apenas pintura',
        'Apenas arquitetura alemã',
        'Arquitetura, móveis, tipografia e interfaces',
        'Somente museus',
      ],
      correctIndex: 2,
      explanation:
          'Sua influência atravessa diferentes áreas de projeto e comunicação.',
    ),
  ],
  'modernismo': [
    QuizQuestion(
      prompt: 'O modernismo buscava principalmente…',
      options: [
        'Imitar estilos medievais',
        'Criar uma linguagem adequada ao presente',
        'Eliminar materiais industriais',
        'Voltar ao barroco',
      ],
      correctIndex: 1,
      explanation:
          'A ideia central era responder à vida moderna com novas formas, materiais e funções.',
    ),
    QuizQuestion(
      prompt: 'Qual trio de materiais marcou muito a arquitetura moderna?',
      options: [
        'Palha, barro e madeira',
        'Concreto, aço e vidro',
        'Mármore, ouro e bronze',
        'Tijolo, cerâmica e cobre',
      ],
      correctIndex: 1,
      explanation:
          'Concreto, aço e vidro permitiram novas estruturas e novas linguagens.',
    ),
  ],
  'fermi': [
    QuizQuestion(
      prompt: 'O paradoxo de Fermi é uma prova de que estamos sozinhos?',
      options: [
        'Sim',
        'Não',
        'Somente na Via Láctea',
        'Somente até 1950',
      ],
      correctIndex: 1,
      explanation:
          'Ele é uma pergunta sobre expectativa versus observação, não uma prova.',
    ),
    QuizQuestion(
      prompt: 'A pergunta central do paradoxo é, em essência…',
      options: [
        'Por que as estrelas brilham?',
        'Por que não vemos evidências claras de outras civilizações?',
        'Por que Marte é vermelho?',
        'Por que o universo está expandindo?',
      ],
      correctIndex: 1,
      explanation:
          'O paradoxo parte da aparente abundância de oportunidades para vida e da falta de evidência confirmada.',
    ),
  ],
  'roma': [
    QuizQuestion(
      prompt: 'Qual afirmação é mais correta sobre a queda de Roma?',
      options: [
        'Teve uma única causa',
        'Aconteceu em um único dia',
        'Foi um processo com vários fatores',
        'O Império inteiro acabou em 476',
      ],
      correctIndex: 2,
      explanation:
          'Crises políticas, fiscais, militares e mudanças externas se acumularam por muito tempo.',
    ),
    QuizQuestion(
      prompt: 'O que representa o ano de 476?',
      options: [
        'Uma data simbólica para o fim do Ocidente romano',
        'O fim de toda cultura romana',
        'A fundação de Roma',
        'O início da República',
      ],
      correctIndex: 0,
      explanation:
          '476 é uma convenção histórica útil, não um interruptor que apagou Roma.',
    ),
  ],
  'brutalismo': [
    QuizQuestion(
      prompt: 'De onde vem o termo associado ao brutalismo?',
      options: [
        'Brutal force',
        'Béton brut',
        'Bella struttura',
        'Bau Kunst',
      ],
      correctIndex: 1,
      explanation: 'Béton brut significa concreto cru em francês.',
    ),
  ],
  'helvetica': [
    QuizQuestion(
      prompt: 'Qual era o nome original da Helvetica?',
      options: [
        'Neue Haas Grotesk',
        'Univers Serif',
        'Akzidenz Roman',
        'Swiss Modern',
      ],
      correctIndex: 0,
      explanation:
          'A fonte nasceu como Neue Haas Grotesk e depois foi rebatizada.',
    ),
  ],
  'inflacao': [
    QuizQuestion(
      prompt: 'Inflação significa…',
      options: [
        'Qualquer produto mais caro',
        'Queda generalizada de preços',
        'Aumento generalizado e persistente do nível de preços',
        'Aumento de salário',
      ],
      correctIndex: 2,
      explanation:
          'Uma alta isolada não basta; inflação envolve movimento amplo e persistente de preços.',
    ),
  ],
  'vinho': [
    QuizQuestion(
      prompt: 'Todo vinho melhora com o tempo?',
      options: ['Sim', 'Não', 'Apenas tintos', 'Apenas caros'],
      correctIndex: 1,
      explanation:
          'A maioria dos vinhos foi feita para consumo jovem e nem todo vinho ganha qualidade ao envelhecer.',
    ),
  ],
};

const glossaryByTopic = <String, List<GlossaryEntry>>{
  'bauhaus': [
    GlossaryEntry(
      term: 'Bauhaus',
      definition:
          'Escola alemã de arte, arquitetura e design fundada em 1919.',
    ),
    GlossaryEntry(
      term: 'Funcionalismo',
      definition:
          'Ideia de que a forma de um objeto ou espaço deve responder à sua função.',
    ),
    GlossaryEntry(
      term: 'Weimar',
      definition:
          'Cidade alemã onde a Bauhaus foi fundada antes de mudar para Dessau e Berlim.',
    ),
  ],
  'modernismo': [
    GlossaryEntry(
      term: 'Modernismo',
      definition:
          'Conjunto de movimentos que buscaram novas linguagens para a vida moderna.',
    ),
    GlossaryEntry(
      term: 'Ornamento',
      definition:
          'Elemento decorativo que não é necessariamente estrutural ou funcional.',
    ),
  ],
  'fermi': [
    GlossaryEntry(
      term: 'SETI',
      definition:
          'Conjunto de iniciativas que procuram sinais de inteligência extraterrestre.',
    ),
    GlossaryEntry(
      term: 'Exoplaneta',
      definition: 'Planeta que orbita uma estrela fora do Sistema Solar.',
    ),
  ],
  'roma': [
    GlossaryEntry(
      term: 'Império Romano do Ocidente',
      definition:
          'Porção ocidental do Império Romano que se fragmentou no século V.',
    ),
    GlossaryEntry(
      term: 'Bizâncio',
      definition:
          'Nome usado posteriormente para o Império Romano do Oriente.',
    ),
  ],
  'brutalismo': [
    GlossaryEntry(
      term: 'Béton brut',
      definition: 'Expressão francesa para concreto cru ou aparente.',
    ),
    GlossaryEntry(
      term: 'Estrutura aparente',
      definition:
          'Quando elementos estruturais ficam visíveis em vez de escondidos por revestimentos.',
    ),
  ],
  'helvetica': [
    GlossaryEntry(
      term: 'Sans-serif',
      definition:
          'Família tipográfica sem pequenos prolongamentos nas extremidades das letras.',
    ),
    GlossaryEntry(
      term: 'Swiss Style',
      definition:
          'Abordagem gráfica suíça do pós-guerra marcada por grids, clareza e tipografia sans-serif.',
    ),
  ],
  'inflacao': [
    GlossaryEntry(
      term: 'Poder de compra',
      definition:
          'Quantidade de bens e serviços que uma determinada quantia de dinheiro consegue comprar.',
    ),
    GlossaryEntry(
      term: 'Política monetária',
      definition:
          'Ações do banco central para influenciar juros, crédito, demanda e inflação.',
    ),
  ],
  'vinho': [
    GlossaryEntry(
      term: 'Taninos',
      definition:
          'Compostos naturais que contribuem para adstringência, estrutura e potencial de evolução de alguns vinhos.',
    ),
    GlossaryEntry(
      term: 'Acidez',
      definition:
          'Componente que dá frescor ao vinho e ajuda na estabilidade ao longo do tempo.',
    ),
  ],
};

const sourcesByTopic = <String, List<SourceEntry>>{
  'bauhaus': [
    SourceEntry(
      label: 'UNESCO — Patrimônio Bauhaus',
      url: 'https://whc.unesco.org/en/list/729',
      note: 'História, arquitetura e alcance do movimento.',
    ),
    SourceEntry(
      label: 'MoMA — Walter Gropius',
      url: 'https://www.moma.org/artists/2359-walter-gropius',
      note: 'A escola e suas relações com a arquitetura moderna.',
    ),
  ],
  'modernismo': [
    SourceEntry(
      label: 'MoMA — Walter Gropius e o movimento moderno',
      url: 'https://www.moma.org/artists/2359-walter-gropius',
    ),
    SourceEntry(
      label: 'Encyclopaedia Britannica — Modernism',
      url: 'https://www.britannica.com/art/Modernism-art',
    ),
  ],
  'fermi': [
    SourceEntry(
      label: 'NASA — Are We Alone?',
      url: 'https://science.nasa.gov/exoplanets/search-for-life/',
      note: 'As observações, a Equação de Drake e o paradoxo.',
    ),
    SourceEntry(
      label: 'NASA — Life in the Universe',
      url: 'https://science.nasa.gov/universe/exoplanets/life-in-the-universe-what-are-the-odds/',
      note: 'Sinais tecnológicos e limites das buscas atuais.',
    ),
  ],
  'roma': [
    SourceEntry(
      label: 'World History Encyclopedia — Queda de Roma',
      url: 'https://www.worldhistory.org/article/835/fall-of-the-western-roman-empire/',
      note: 'Uma introdução às explicações históricas em debate.',
    ),
    SourceEntry(
      label: 'World History Encyclopedia — Império Ocidental',
      url: 'https://www.worldhistory.org/trans/pt/1-696/imperio-romano-ocidental/',
      note: 'Leitura em português sobre eventos e continuidade.',
    ),
  ],
  'brutalismo': [
    SourceEntry(
      label: 'RIBA — Brutalism in architecture',
      url: 'https://www.riba.org/explore/riba-collections/architectural-styles/brutalism-movement/',
      note: 'Materialidade, origem do termo e obras.',
    ),
  ],
  'helvetica': [
    SourceEntry(
      label: 'MoMA — Design Collection',
      url: 'https://www.moma.org/collection/',
    ),
  ],
  'inflacao': [
    SourceEntry(
      label: 'Banco Central do Brasil — Inflação',
      url: 'https://www.bcb.gov.br/controleinflacao',
    ),
  ],
  'vinho': [
    SourceEntry(
      label: 'UC Davis — Viticulture and Enology',
      url: 'https://wineserver.ucdavis.edu/',
    ),
  ],
  'contabilidade': [
    SourceEntry(
      label: 'OpenStax — Partidas dobradas',
      url: 'https://openstax.org/books/principles-financial-accounting/pages/3-1-describe-principles-assumptions-and-concepts-of-accounting-and-their-relationship-to-financial-statements',
      note: 'Equação contábil, débitos, créditos e saldos normais.',
    ),
  ],
};

const timelineEvents = <TimelineEvent>[
  TimelineEvent(
    year: '753 a.C.',
    title: 'Fundação tradicional de Roma',
    description:
        'Data tradicional associada ao início da cidade que se tornaria centro de um vasto império.',
    topicId: 'roma',
  ),
  TimelineEvent(
    year: '476',
    title: 'Fim simbólico do Império Romano do Ocidente',
    description:
        'Deposição de Rômulo Augústulo, usada como marco convencional.',
    topicId: 'roma',
  ),
  TimelineEvent(
    year: '1919',
    title: 'Fundação da Bauhaus',
    description:
        'Walter Gropius funda a escola em Weimar, na Alemanha.',
    topicId: 'bauhaus',
  ),
  TimelineEvent(
    year: '1925',
    title: 'Bauhaus muda para Dessau',
    description:
        'A escola ganha um edifício que se torna símbolo do movimento.',
    topicId: 'bauhaus',
  ),
  TimelineEvent(
    year: '1933',
    title: 'Fechamento da Bauhaus',
    description:
        'A escola encerra suas atividades sob intensa pressão política.',
    topicId: 'bauhaus',
  ),
  TimelineEvent(
    year: '1950',
    title: 'A pergunta de Fermi',
    description:
        'Uma conversa informal ligada a Enrico Fermi inspira o paradoxo que leva seu nome.',
    topicId: 'fermi',
  ),
  TimelineEvent(
    year: '1957',
    title: 'Nasce a Helvetica',
    description:
        'A Neue Haas Grotesk é lançada na Suíça e depois passa a se chamar Helvetica.',
    topicId: 'helvetica',
  ),
  TimelineEvent(
    year: '1960',
    title: 'Brasília é inaugurada',
    description:
        'O modernismo brasileiro ganha uma de suas expressões urbanas mais conhecidas.',
    topicId: 'modernismo',
  ),
];

const comparisons = <ComparisonEntry>[
  ComparisonEntry(
    title: 'Bauhaus × Art Déco',
    leftLabel: 'Bauhaus',
    rightLabel: 'Art Déco',
    rows: [
      ComparisonRow(
        aspect: 'Ideia central',
        left: 'Função, clareza e integração com produção moderna.',
        right: 'Luxo, ornamentação geométrica e sofisticação.',
      ),
      ComparisonRow(
        aspect: 'Visual',
        left: 'Formas simples, grids e redução.',
        right: 'Simetria, padrões, materiais ricos e decoração.',
      ),
      ComparisonRow(
        aspect: 'Relação com indústria',
        left: 'Produção em série como oportunidade.',
        right: 'Combina indústria com efeito visual luxuoso.',
      ),
    ],
  ),
  ComparisonEntry(
    title: 'Modernismo × Brutalismo',
    leftLabel: 'Modernismo',
    rightLabel: 'Brutalismo',
    rows: [
      ComparisonRow(
        aspect: 'Escopo',
        left: 'Movimento amplo com várias correntes.',
        right: 'Linguagem específica do pós-guerra.',
      ),
      ComparisonRow(
        aspect: 'Materiais',
        left: 'Concreto, aço, vidro e outros.',
        right: 'Concreto aparente frequentemente ganha protagonismo.',
      ),
      ComparisonRow(
        aspect: 'Sensação',
        left: 'Racional, leve ou abstrata dependendo da vertente.',
        right: 'Monumental, estrutural e materialmente explícita.',
      ),
    ],
  ),
  ComparisonEntry(
    title: 'Inflação × aumento de preço',
    leftLabel: 'Inflação',
    rightLabel: 'Preço isolado',
    rows: [
      ComparisonRow(
        aspect: 'Alcance',
        left: 'Generalizado',
        right: 'Um produto ou grupo específico',
      ),
      ComparisonRow(
        aspect: 'Persistência',
        left: 'Movimento amplo e persistente',
        right: 'Pode ser temporário',
      ),
      ComparisonRow(
        aspect: 'Efeito',
        left: 'Reduz poder de compra de forma ampla',
        right: 'Afeta diretamente quem consome aquele item',
      ),
    ],
  ),
];

const knowledgeEntities = <KnowledgeEntity>[
  KnowledgeEntity(
    id: 'gropius',
    name: 'Walter Gropius',
    type: KnowledgeEntityType.person,
    subtitle: 'arquiteto · fundador da Bauhaus',
    summary:
        'Arquiteto alemão que fundou a Bauhaus e ajudou a consolidar ideias centrais do modernismo.',
    topicIds: ['bauhaus', 'modernismo'],
  ),
  KnowledgeEntity(
    id: 'fermi-person',
    name: 'Enrico Fermi',
    type: KnowledgeEntityType.person,
    subtitle: 'físico',
    summary:
        'Físico ítalo-americano cujo nome ficou ligado ao famoso paradoxo sobre vida extraterrestre.',
    topicIds: ['fermi'],
  ),
  KnowledgeEntity(
    id: 'dessau',
    name: 'Dessau',
    type: KnowledgeEntityType.place,
    subtitle: 'Alemanha',
    summary:
        'Cidade onde a Bauhaus teve sua sede mais emblemática e construiu um edifício que se tornou ícone do movimento.',
    topicIds: ['bauhaus'],
  ),
  KnowledgeEntity(
    id: 'brasilia',
    name: 'Brasília',
    type: KnowledgeEntityType.place,
    subtitle: 'Brasil',
    summary:
        'Capital planejada que tornou o modernismo brasileiro visível em escala urbana.',
    topicIds: ['modernismo', 'brutalismo'],
  ),
  KnowledgeEntity(
    id: 'bauhaus-school',
    name: 'Bauhaus',
    type: KnowledgeEntityType.concept,
    subtitle: 'escola · movimento',
    summary:
        'Escola e conjunto de ideias que aproximaram arte, design, arquitetura e produção moderna.',
    topicIds: ['bauhaus', 'modernismo', 'helvetica'],
  ),
];

List<QuizQuestion> quizFor(String topicId) =>
    quizByTopic[topicId] ?? const [];

List<GlossaryEntry> glossaryFor(String topicId) =>
    glossaryByTopic[topicId] ?? const [];

List<SourceEntry> sourcesFor(String topicId) =>
    sourcesByTopic[topicId] ?? const [];

List<KnowledgeEntity> entitiesForTopic(String topicId) =>
    knowledgeEntities
        .where((entity) => entity.topicIds.contains(topicId))
        .toList();

KnowledgeEntity? entityById(String id) {
  for (final entity in knowledgeEntities) {
    if (entity.id == id) {
      return entity;
    }
  }
  return null;
}

import '../domain/knowledge_topic.dart';

const bauhausTopic = KnowledgeTopic(
  id: 'bauhaus',
  eyebrow: 'UMA COISA QUE VALE SABER HOJE',
  title: 'POR QUE A BAUHAUS MUDOU TUDO?',
  summary:
      'Uma escola alemã criada em 1919 ajudou a redefinir a forma como o mundo pensa objetos, prédios, tipografia e design.',
  minutes: 6,
  tags: ['design', 'história'],
  quickTake:
      'A Bauhaus aproximou arte, artesanato e indústria. Sua ideia central era criar coisas bonitas, funcionais e adequadas à vida moderna.',
  body: [
    'Fundada por Walter Gropius em Weimar, na Alemanha, a Bauhaus nasceu num período de enorme transformação social e tecnológica.',
    'A escola rejeitava a separação rígida entre belas-artes e produção cotidiana. Arquitetos, pintores, designers e artesãos trabalhavam lado a lado.',
    'Formas geométricas, tipografia direta, estruturas aparentes e a ideia de que a função deveria orientar o projeto se tornaram marcas associadas ao movimento.',
    'A escola existiu por apenas 14 anos, mas seus professores e alunos espalharam essas ideias internacionalmente após seu fechamento em 1933.',
  ],
  remember: [
    '1919: a escola foi fundada na Alemanha.',
    'Arte, função e produção industrial deveriam conversar.',
    'Sua influência aparece até hoje em arquitetura, móveis, tipografia e interfaces.',
  ],
  whyItMatters:
      'Muita coisa que hoje parece “minimalista” ou simplesmente moderna descende de debates que a Bauhaus ajudou a popularizar.',
  curiosity:
      'A Bauhaus teve sedes em Weimar, Dessau e Berlim — e mudou de cidade conforme pressões políticas aumentavam.',
  connections: ['Modernismo', 'Brasília', 'Tipografia', 'Le Corbusier'],
  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.image,
      url:
          'https://commons.wikimedia.org/wiki/Special:FilePath/Bauhaus-Dessau%20main%20building.jpg?width=1200',
      title: 'Bauhaus Dessau',
      caption:
          'O edifício principal da Bauhaus em Dessau, referência central do movimento.',
      sourceLabel: 'Wikimedia Commons',
      sourceUrl:
          'https://commons.wikimedia.org/wiki/File:Bauhaus-Dessau_main_building.jpg',
    ),
  ],
);

const modernismTopic = KnowledgeTopic(
  id: 'modernismo',
  eyebrow: 'ARQUITETURA / IDEIAS',
  title: 'MODERNISMO: QUANDO O MUNDO QUIS PARECER NOVO',
  summary:
      'No século XX, arquitetos e designers passaram a rejeitar ornamentos históricos e buscar uma linguagem adequada à vida industrial.',
  minutes: 8,
  tags: ['arquitetura', 'história'],
  quickTake:
      'O modernismo defendia que forma, materiais e função deveriam conversar com o presente, em vez de imitar estilos do passado.',
  body: [
    'O modernismo não foi um movimento único, mas uma família de ideias que ganhou força no início do século XX.',
    'Concreto, aço e vidro permitiram novas estruturas. Ao mesmo tempo, cidades cresciam e novas formas de morar, trabalhar e circular exigiam respostas diferentes.',
    'Arquitetos como Le Corbusier, Mies van der Rohe e Walter Gropius ajudaram a popularizar uma arquitetura mais racional e menos ornamental.',
    'Essas ideias viajaram pelo mundo e ganharam versões próprias em lugares como o Brasil, onde clima, paisagem e cultura modificaram o repertório modernista.',
  ],
  remember: [
    'Modernismo é mais amplo que Bauhaus.',
    'Materiais industriais viraram parte da linguagem estética.',
    'O Brasil desenvolveu uma vertente modernista muito própria.',
  ],
  whyItMatters:
      'Prédios, móveis, identidades visuais e até interfaces digitais ainda usam princípios de clareza, função e redução formal herdados desse período.',
  curiosity:
      '“Menos é mais”, frase associada a Mies van der Rohe, virou um dos resumos mais famosos da sensibilidade modernista.',
  connections: ['Bauhaus', 'Brasília', 'Brutalismo', 'Le Corbusier'],
);

const fermiTopic = KnowledgeTopic(
  id: 'fermi',
  eyebrow: 'CIÊNCIA / UNIVERSO',
  title: 'O PARADOXO DE FERMI',
  summary:
      'Se o universo é tão antigo e tão grande, por que ainda não encontramos sinais claros de outras civilizações?',
  minutes: 5,
  tags: ['ciência', 'astronomia'],
  quickTake:
      'O paradoxo de Fermi é a tensão entre a aparente possibilidade de vida inteligente ser comum e a ausência de evidências observadas até agora.',
  body: [
    'A Via Láctea tem centenas de bilhões de estrelas e muitas delas possuem planetas.',
    'Se civilizações tecnológicas surgirem com alguma frequência, parece razoável imaginar que algumas tenham tido tempo para produzir sinais detectáveis.',
    'Mesmo assim, até hoje não existe evidência confirmada de contato com uma civilização extraterrestre.',
    'As explicações propostas vão de vida inteligente ser extremamente rara até sinais existirem de formas que ainda não sabemos detectar.',
  ],
  remember: [
    'Não é uma prova de que estamos sozinhos.',
    'É uma pergunta sobre expectativa versus observação.',
    'As respostas possíveis dizem muito sobre astronomia, biologia e tecnologia.',
  ],
  whyItMatters:
      'O paradoxo ajuda a organizar perguntas sobre vida extraterrestre sem transformar especulação em evidência.',
  curiosity:
      'A famosa formulação “onde está todo mundo?” é associada a uma conversa informal envolvendo o físico Enrico Fermi em 1950.',
  connections: ['Equação de Drake', 'Exoplanetas', 'SETI', 'Astrobiologia'],
  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.image,
      url:
          'https://commons.wikimedia.org/wiki/Special:FilePath/Fermi-enrico.jpg?width=900',
      title: 'Enrico Fermi',
      caption:
          'Retrato de Enrico Fermi, físico cujo nome ficou associado ao paradoxo.',
      sourceLabel: 'Wikimedia Commons / Los Alamos',
      sourceUrl:
          'https://commons.wikimedia.org/wiki/File:Fermi-enrico.jpg',
    ),
  ],
);

const romeTopic = KnowledgeTopic(
  id: 'roma',
  eyebrow: 'HISTÓRIA / IMPÉRIOS',
  title: 'POR QUE ROMA CAIU?',
  summary:
      'A queda do Império Romano do Ocidente não teve uma única causa: foi um processo longo de pressões políticas, econômicas e militares.',
  minutes: 7,
  tags: ['história', 'política'],
  quickTake:
      'Roma não “caiu de um dia para o outro”. O Ocidente romano foi se fragmentando enquanto enfrentava crises internas e pressões externas.',
  body: [
    'O Império Romano do Ocidente enfrentou sucessivas disputas pelo poder, problemas fiscais e dificuldades para manter grandes fronteiras.',
    'Migrações e invasões de diferentes povos germânicos aumentaram a pressão sobre estruturas já fragilizadas.',
    'Ao mesmo tempo, o centro político e econômico do mundo romano se deslocava cada vez mais para o Oriente.',
    'Em 476, a deposição de Rômulo Augústulo virou uma data simbólica, mas muitas instituições romanas continuaram influentes por séculos.',
  ],
  remember: [
    'Não existe uma causa única.',
    '476 é uma convenção útil, não um interruptor histórico.',
    'O Império Romano do Oriente continuou por quase mil anos.',
  ],
  whyItMatters:
      'A história de Roma mostra como sociedades complexas mudam por acúmulo de fatores, e não apenas por um grande evento.',
  curiosity:
      'Os habitantes do Império Romano do Oriente continuavam se chamando de romanos muito depois da queda do Ocidente.',
  connections: ['Bizâncio', 'Cristianismo', 'Povos germânicos', 'Feudalismo'],
);

const brutalismTopic = KnowledgeTopic(
  id: 'brutalismo',
  eyebrow: 'ARQUITETURA / CIDADE',
  title: 'O QUE É BRUTALISMO?',
  summary:
      'Concreto aparente, estruturas legíveis e formas monumentais criaram uma das linguagens arquitetônicas mais divisivas do século XX.',
  minutes: 4,
  tags: ['arquitetura', 'design'],
  quickTake:
      'Brutalismo não vem de “brutal” no sentido de violência, mas da expressão francesa béton brut: concreto cru.',
  body: [
    'A linguagem brutalista ganhou força no pós-guerra e valorizava materiais aparentes, estrutura visível e volumes marcantes.',
    'Muitos edifícios foram pensados para instituições públicas, universidades, habitação e equipamentos coletivos.',
    'No Brasil, a chamada Escola Paulista produziu obras de concreto com soluções estruturais muito expressivas.',
    'O estilo voltou a ganhar atenção na cultura visual contemporânea, inclusive em design gráfico e interfaces.',
  ],
  remember: [
    'Béton brut significa concreto cru.',
    'Estrutura e material costumam ficar visíveis.',
    'Brutalismo pode ser monumental sem ser ornamental.',
  ],
  whyItMatters:
      'Ele ajuda a entender por que alguns prédios parecem pesados, honestos nos materiais e quase esculturais.',
  curiosity:
      'O termo brutalismo foi popularizado em inglês pelo crítico Reyner Banham na década de 1950.',
  connections: ['Modernismo', 'Concreto', 'Lina Bo Bardi', 'Escola Paulista'],
);

const helveticaTopic = KnowledgeTopic(
  id: 'helvetica',
  eyebrow: 'DESIGN / TIPOGRAFIA',
  title: 'POR QUE HELVETICA ESTÁ EM TODO LUGAR?',
  summary:
      'Criada na Suíça em 1957, a Helvetica se tornou sinônimo de comunicação limpa, neutra e internacional.',
  minutes: 4,
  tags: ['design', 'tipografia'],
  quickTake:
      'A Helvetica foi desenhada para ser clara e versátil. Sua aparência pouco “expressiva” acabou virando justamente sua maior força.',
  body: [
    'A fonte nasceu como Neue Haas Grotesk e foi redesenhada comercialmente com um nome mais internacional: Helvetica.',
    'Seu desenho regular funcionava bem em sinalização, identidades corporativas e sistemas de informação.',
    'A ascensão do chamado Estilo Tipográfico Internacional ajudou a espalhá-la por aeroportos, metrôs, embalagens e marcas.',
    'Por ser tão usada, também virou alvo de críticas de designers que a consideram previsível ou excessivamente neutra.',
  ],
  remember: [
    'Nasceu na Suíça em 1957.',
    'Seu nome original era Neue Haas Grotesk.',
    'Virou símbolo do design gráfico internacional do pós-guerra.',
  ],
  whyItMatters:
      'Entender Helvetica é uma porta de entrada para perceber como tipografia muda a personalidade de uma mensagem.',
  curiosity:
      'O nome Helvetica vem de Helvetia, termo latino associado à Suíça.',
  connections: ['Swiss Style', 'Grid', 'Bauhaus', 'Sinalização'],
);

const inflationTopic = KnowledgeTopic(
  id: 'inflacao',
  eyebrow: 'ECONOMIA / COTIDIANO',
  title: 'O QUE É INFLAÇÃO, DE VERDADE?',
  summary:
      'Inflação é o aumento generalizado e persistente do nível de preços, não apenas um produto específico ficando mais caro.',
  minutes: 6,
  tags: ['economia', 'sociedade'],
  quickTake:
      'Quando a inflação sobe, a mesma quantidade de dinheiro compra menos coisas. O efeito é uma perda de poder de compra.',
  body: [
    'Preços individuais mudam o tempo todo. Inflação aparece quando muitos preços sobem de forma suficientemente ampla e persistente.',
    'Ela pode estar ligada a demanda forte, choques de oferta, custos, expectativas e política monetária, entre outros fatores.',
    'Índices de preços tentam acompanhar uma cesta representativa de consumo, mas cada pessoa sente a inflação de forma diferente.',
    'Bancos centrais costumam usar juros para influenciar demanda, crédito e expectativas quando tentam levar a inflação para uma meta.',
  ],
  remember: [
    'Inflação não é qualquer aumento de preço.',
    'Ela reduz poder de compra.',
    'A inflação percebida por uma pessoa pode diferir do índice oficial.',
  ],
  whyItMatters:
      'Ela influencia salário real, juros, investimentos, orçamento doméstico e praticamente toda decisão financeira de longo prazo.',
  curiosity:
      'Mesmo com inflação baixa, preços podem continuar subindo; o que muda é a velocidade desse aumento.',
  connections: ['Juros', 'Banco Central', 'Salário real', 'Moeda'],
);

const wineTopic = KnowledgeTopic(
  id: 'vinho',
  eyebrow: 'GASTRONOMIA / CIÊNCIA',
  title: 'POR QUE ALGUNS VINHOS ENVELHECEM BEM?',
  summary:
      'Acidez, taninos, açúcar, álcool e compostos aromáticos interagem ao longo do tempo — mas nem todo vinho melhora com idade.',
  minutes: 5,
  tags: ['gastronomia', 'ciência'],
  quickTake:
      'Envelhecer bem depende de equilíbrio e estrutura. A maioria dos vinhos disponíveis no mercado foi feita para ser consumida jovem.',
  body: [
    'Dentro da garrafa, reações químicas continuam ocorrendo lentamente mesmo sem contato direto com muito oxigênio.',
    'Taninos podem parecer mais macios com o tempo, enquanto aromas de fruta fresca dão lugar a notas mais complexas.',
    'Acidez ajuda a preservar frescor; açúcar e álcool também podem contribuir para a longevidade em certos estilos.',
    'Armazenamento importa: calor, luz e variações de temperatura podem acelerar a deterioração.',
  ],
  remember: [
    'Vinho velho não é automaticamente melhor.',
    'Estrutura e equilíbrio ajudam na capacidade de envelhecimento.',
    'Armazenamento muda completamente o resultado.',
  ],
  whyItMatters:
      'Saber disso evita a ideia de que guardar qualquer garrafa por anos necessariamente aumenta seu valor ou qualidade.',
  curiosity:
      'Alguns vinhos de sobremesa e fortificados podem evoluir por décadas graças à combinação de açúcar, acidez e álcool.',
  connections: ['Fermentação', 'Taninos', 'Terroir', 'Química dos aromas'],
);

const allDemoTopics = <KnowledgeTopic>[
  bauhausTopic,
  modernismTopic,
  fermiTopic,
  romeTopic,
  brutalismTopic,
  helveticaTopic,
  inflationTopic,
  wineTopic,
];

KnowledgeTopic? topicById(String id) {
  for (final topic in allDemoTopics) {
    if (topic.id == id) {
      return topic;
    }
  }
  return null;
}

KnowledgeTopic nextDemoTopic(KnowledgeTopic topic) {
  final index = allDemoTopics.indexWhere((item) => item.id == topic.id);
  if (index < 0 || index == allDemoTopics.length - 1) {
    return allDemoTopics.first;
  }
  return allDemoTopics[index + 1];
}

const quickTopics = [
  'Por que damos nomes aos furacões?',
  'O que é brutalismo?',
  'Por que vinho envelhece?',
  'De onde veio o símbolo @?',
];

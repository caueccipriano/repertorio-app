import '../domain/knowledge_topic.dart';

const bauhausTopic = KnowledgeTopic(
  id: 'bauhaus',
  eyebrow: 'UMA COISA QUE VALE SABER HOJE',
  title: 'POR QUE A BAUHAUS MUDOU TUDO?',
  summary:
      'Uma escola alemã criada em 1919 ajudou a redefinir a forma como o mundo pensa objetos, prédios, tipografia e design.',
  minutes: 7,
  tags: ['design', 'história'],
  quickTake:
      'A Bauhaus aproximou arte, artesanato e indústria. Sua ideia central era criar coisas bonitas, funcionais e adequadas à vida moderna.',
  simpleExplanation:
      'Pense na Bauhaus como uma escola que perguntou: “por que uma cadeira, um prédio ou um cartaz precisam parecer antigos se a vida já mudou?”. Em vez de decorar objetos com muitos detalhes, ela valorizava clareza, função e materiais modernos. O objetivo não era deixar tudo sem graça, e sim projetar cada coisa de acordo com o uso real.',
  example:
      'Uma cadeira, por exemplo, não precisava imitar um móvel aristocrático cheio de ornamentos. Ela podia usar tubos de aço, ter poucas peças e ainda ser confortável, bonita e possível de produzir em série.',
  body: [
    'A Bauhaus foi fundada em 1919 por Walter Gropius, em Weimar, numa Alemanha que saía da Primeira Guerra Mundial e vivia mudanças políticas, sociais e tecnológicas profundas.',
    'A escola tentava derrubar a fronteira entre “arte elevada” e objetos do cotidiano. Pintores, arquitetos, marceneiros, tecelões, tipógrafos e outros profissionais eram incentivados a pensar juntos.',
    'Isso ajudou a consolidar uma maneira de projetar baseada em função, proporção, geometria, materiais e produção. A aparência de um objeto deveria nascer do problema que ele precisava resolver, e não apenas de um estilo decorativo herdado do passado.',
    'A Bauhaus também experimentou novas formas de ensinar. Antes de escolher uma oficina específica, estudantes passavam por exercícios de cor, forma, materiais e percepção visual.',
    'A escola mudou de Weimar para Dessau e depois para Berlim. Em Dessau, o próprio edifício da escola virou um manifesto arquitetônico: vidro, volumes claros e espaços pensados de acordo com suas funções.',
    'Ela fechou em 1933 sob pressão do regime nazista. Muitos professores e ex-alunos migraram para outros países e ajudaram a espalhar essas ideias internacionalmente.',
  ],
  remember: [
    '1919: a escola foi fundada na Alemanha.',
    'Arte, função e produção industrial deveriam conversar.',
    'Sua influência aparece até hoje em arquitetura, móveis, tipografia e interfaces.',
  ],
  whyItMatters:
      'Quando você reconhece a lógica da Bauhaus, começa a perceber por que tantos objetos modernos usam formas simples, grids, tipografia direta e poucos elementos visuais. Ela não inventou sozinha o minimalismo moderno, mas ajudou a tornar essa linguagem extremamente influente.',
  curiosity:
      'A Bauhaus teve sedes em Weimar, Dessau e Berlim — e mudou de cidade conforme pressões políticas aumentavam.',
  connections: ['Modernismo', 'Brasília', 'Tipografia', 'Le Corbusier'],
  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.image,
      url:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Bauhaus-Dessau_main_building.jpg/960px-Bauhaus-Dessau_main_building.jpg',
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
  minutes: 9,
  tags: ['arquitetura', 'história'],
  quickTake:
      'O modernismo defendia que forma, materiais e função deveriam conversar com o presente, em vez de imitar estilos do passado.',
  simpleExplanation:
      'O modernismo começou quando muitos criadores perceberam que o mundo estava mudando mais rápido do que a aparência das cidades e dos objetos. Havia carros, elevadores, eletricidade, fábricas e novos materiais, mas muitos prédios ainda copiavam palácios e estilos de séculos anteriores. A proposta era criar uma linguagem realmente contemporânea.',
  example:
      'Em vez de esconder uma estrutura de concreto atrás de colunas falsas que imitavam a Antiguidade, um arquiteto modernista podia deixar a própria estrutura participar da aparência do edifício.',
  body: [
    'Modernismo não é um único estilo. É um conjunto de movimentos e ideias que ganhou força entre o final do século XIX e a primeira metade do século XX em arte, literatura, design e arquitetura.',
    'Na arquitetura, concreto armado, aço e vidro permitiram vãos maiores, fachadas diferentes e plantas mais livres. Ao mesmo tempo, crescimento urbano e industrialização criaram novas necessidades de moradia, trabalho e circulação.',
    'Muitos modernistas rejeitaram a ideia de que um edifício precisava parecer gótico, clássico ou barroco para ser bonito. Em vez disso, buscavam uma estética coerente com os materiais e funções do presente.',
    'Le Corbusier, Mies van der Rohe, Walter Gropius e outros nomes se tornaram referências internacionais, mas não pensavam exatamente igual. O modernismo teve várias correntes, debates e contradições.',
    'No Brasil, arquitetos reinterpretaram essas ideias considerando clima, luz, paisagem e vida social. Brasília é um dos exemplos mais conhecidos, mas o modernismo brasileiro vai muito além da capital.',
    'Com o tempo, algumas soluções modernistas foram criticadas por produzir espaços impessoais ou por tratar problemas sociais complexos como se pudessem ser resolvidos apenas por desenho e planejamento.',
  ],
  remember: [
    'Modernismo é mais amplo que Bauhaus.',
    'Materiais industriais viraram parte da linguagem estética.',
    'O Brasil desenvolveu uma vertente modernista muito própria.',
  ],
  whyItMatters:
      'Prédios, móveis, identidades visuais e interfaces digitais ainda carregam princípios de clareza, função, padronização e redução formal desenvolvidos nesse período. Entender o modernismo ajuda a enxergar de onde veio boa parte da aparência do mundo contemporâneo.',
  curiosity:
      '“Menos é mais”, frase associada a Mies van der Rohe, virou um dos resumos mais famosos da sensibilidade modernista — mesmo que o movimento fosse muito mais diverso do que essa frase sugere.',
  connections: ['Bauhaus', 'Brasília', 'Brutalismo', 'Le Corbusier'],
);

const fermiTopic = KnowledgeTopic(
  id: 'fermi',
  eyebrow: 'CIÊNCIA / UNIVERSO',
  title: 'O PARADOXO DE FERMI',
  summary:
      'Se o universo é tão antigo e tão grande, por que ainda não encontramos sinais claros de outras civilizações?',
  minutes: 7,
  tags: ['ciência', 'astronomia'],
  quickTake:
      'O paradoxo de Fermi é a tensão entre a aparente possibilidade de vida inteligente ser comum e a ausência de evidências observadas até agora.',
  simpleExplanation:
      'A ideia é mais simples do que o nome parece. Existem muitíssimas estrelas, o universo é muito antigo e hoje sabemos que planetas são comuns. Então surge uma pergunta: se civilizações tecnológicas também fossem relativamente comuns, não deveríamos ter encontrado pelo menos algum sinal delas? Até agora, não encontramos uma evidência confirmada. Essa diferença entre “parece que deveria haver alguém” e “não vimos ninguém” é o paradoxo.',
  example:
      'Imagine chegar a uma cidade gigantesca, com milhões de apartamentos, e perceber que nenhum deles mostra luz, som ou qualquer sinal de moradores. Isso não prova que todos estão vazios, mas faz você perguntar por que não consegue detectar ninguém.',
  body: [
    'A Via Láctea contém centenas de bilhões de estrelas. Observações das últimas décadas mostraram que planetas são comuns e que muitos sistemas planetários são bem diferentes do nosso.',
    'Se vida simples surgir em parte desses mundos e, em uma fração ainda menor, evoluir para inteligência tecnológica, algumas civilizações poderiam ser muito mais antigas do que a humanidade.',
    'Uma civilização tecnologicamente ativa poderia, em princípio, deixar sinais: transmissões, sondas, alterações artificiais no ambiente ou outros vestígios. O problema é que não temos nenhuma detecção confirmada desse tipo.',
    'Isso não significa que “ninguém existe”. Talvez vida inteligente seja extremamente rara. Talvez civilizações durem pouco. Talvez usem tecnologias que não sabemos detectar. Talvez estejam longe demais ou simplesmente não emitam sinais óbvios.',
    'Outra possibilidade é que nossas buscas ainda sejam minúsculas diante do tamanho do problema. Procurar sinais em uma pequena faixa de frequências durante algumas décadas é pouco quando comparado à idade e à escala da galáxia.',
    'Por isso, o paradoxo funciona melhor como uma pergunta organizadora do que como uma conclusão. Ele força astrônomos, biólogos e filósofos a explicitar o que estamos supondo sobre vida, inteligência e tecnologia.',
  ],
  remember: [
    'Não é uma prova de que estamos sozinhos.',
    'É uma pergunta sobre expectativa versus observação.',
    'A ausência de uma detecção até hoje não é o mesmo que ausência de vida.',
  ],
  whyItMatters:
      'O paradoxo ajuda a separar uma pergunta científica legítima de afirmações sem evidência. Ele também mostra como uma conclusão depende das suposições que fazemos sobre a frequência da vida, o tempo de duração de civilizações e nossa capacidade de detectar sinais.',
  curiosity:
      'A famosa formulação “onde está todo mundo?” é associada a uma conversa informal envolvendo o físico Enrico Fermi em 1950.',
  connections: ['Equação de Drake', 'Exoplanetas', 'SETI', 'Astrobiologia'],
  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.image,
      url:
          'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/46/Fermi-enrico.jpg/960px-Fermi-enrico.jpg',
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
  minutes: 9,
  tags: ['história', 'política'],
  quickTake:
      'Roma não “caiu de um dia para o outro”. O Ocidente romano foi se fragmentando enquanto enfrentava crises internas e pressões externas.',
  simpleExplanation:
      'Quando dizemos que “Roma caiu”, parece que existiu um único desastre. Na prática, foi mais parecido com uma empresa enorme que passa décadas acumulando problemas: liderança instável, custos altos, dificuldades de defesa, perda de arrecadação e mudanças ao redor. Em algum momento, a estrutura política do Ocidente deixou de funcionar como antes.',
  example:
      'O ano 476 costuma aparecer nos livros porque um imperador do Ocidente foi deposto. Mas uma pessoa vivendo naquele momento não acordou no dia seguinte pensando que “o mundo romano acabou”. Leis, cidades, religião, língua e costumes romanos continuaram existindo.',
  body: [
    'O Império Romano era enorme e administrar territórios tão extensos exigia dinheiro, exércitos, estradas, burocracia e estabilidade política.',
    'Nos séculos finais do Império do Ocidente, disputas pelo trono se tornaram frequentes. Imperadores podiam permanecer pouco tempo no poder, e conflitos internos consumiam recursos que também eram necessários nas fronteiras.',
    'A economia e a arrecadação fiscal passaram por dificuldades em várias regiões. Quando o Estado arrecada menos e precisa gastar mais com defesa, manter a mesma estrutura se torna cada vez mais complicado.',
    'Grupos chamados genericamente de “povos germânicos” não formavam um único bloco. Alguns entraram no território romano como aliados, soldados ou migrantes; outros entraram em conflito com o Império e estabeleceram seus próprios reinos.',
    'Ao mesmo tempo, o Oriente romano era economicamente mais forte e tinha Constantinopla como centro político. O Império Romano do Oriente continuou existindo por muitos séculos depois do desaparecimento da autoridade imperial no Ocidente.',
    'A deposição de Rômulo Augústulo em 476 virou um marco simbólico porque oferece uma data simples para um processo que, na realidade, levou muito tempo.',
  ],
  remember: [
    'Não existe uma causa única.',
    '476 é uma convenção útil, não um interruptor histórico.',
    'O Império Romano do Oriente continuou por quase mil anos.',
  ],
  whyItMatters:
      'Roma é um bom exemplo de como sistemas complexos raramente mudam por um único motivo. Crises políticas, economia, instituições, migrações e guerras se influenciam mutuamente. Isso ajuda a evitar explicações históricas simplistas.',
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
  minutes: 6,
  tags: ['arquitetura', 'design'],
  quickTake:
      'Brutalismo não vem de “brutal” no sentido de violência, mas da expressão francesa béton brut: concreto cru.',
  simpleExplanation:
      'Brutalismo é uma arquitetura que costuma mostrar do que o prédio é feito. Em vez de esconder concreto, vigas, pilares e instalações atrás de decoração, muitos projetos deixam esses elementos visíveis e fazem deles parte da estética.',
  example:
      'É como comparar um aparelho que esconde todos os parafusos com outro que transforma a própria estrutura em linguagem visual. No brutalismo, o “esqueleto” do edifício muitas vezes participa da aparência.',
  body: [
    'O brutalismo ganhou força principalmente nas décadas posteriores à Segunda Guerra Mundial, quando muitos países precisavam construir rapidamente universidades, prédios públicos, conjuntos habitacionais e equipamentos coletivos.',
    'Concreto aparente se tornou uma marca frequente porque permitia grandes estruturas e podia ser deixado sem revestimento. Mas brutalismo não significa simplesmente “qualquer prédio de concreto”.',
    'A linguagem costuma valorizar volumes fortes, estrutura evidente, circulação visível e sensação de peso ou monumentalidade.',
    'Le Corbusier foi uma referência importante, especialmente por obras em concreto aparente. Depois, arquitetos britânicos e de vários outros países desenvolveram caminhos próprios.',
    'No Brasil, arquitetos associados à chamada Escola Paulista exploraram concreto, grandes vãos e soluções estruturais expressivas, embora nem toda arquitetura de concreto brasileira deva ser resumida ao rótulo brutalista.',
    'Hoje o brutalismo voltou ao imaginário popular em fotografia, design gráfico e interfaces, em parte porque sua aparência é muito reconhecível e contrasta com estilos mais polidos.',
  ],
  remember: [
    'Béton brut significa concreto cru.',
    'Estrutura e material costumam ficar visíveis.',
    'Brutalismo pode ser monumental sem ser ornamental.',
  ],
  whyItMatters:
      'Entender brutalismo ajuda a observar edifícios além da ideia de “bonito ou feio”. Você começa a notar material, estrutura, circulação e intenção arquitetônica.',
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
  minutes: 6,
  tags: ['design', 'tipografia'],
  quickTake:
      'A Helvetica foi desenhada para ser clara e versátil. Sua aparência pouco “expressiva” acabou virando justamente sua maior força.',
  simpleExplanation:
      'Toda fonte tem personalidade, mesmo quando parece neutra. A Helvetica foi desenhada para não chamar mais atenção do que a própria mensagem. Isso fez dela uma escolha muito útil para sistemas de informação, marcas e sinalização.',
  example:
      'Num aeroporto, você quer reconhecer uma placa rapidamente, e não admirar uma letra cheia de detalhes. Uma tipografia limpa e previsível facilita esse tipo de leitura.',
  body: [
    'A Helvetica nasceu em 1957 na fundição suíça Haas, desenhada por Max Miedinger com direção de Eduard Hoffmann. Seu nome inicial era Neue Haas Grotesk.',
    'Poucos anos depois, ela foi rebatizada como Helvetica, um nome ligado à Suíça, para facilitar sua comercialização internacional.',
    'Seu desenho possui formas relativamente regulares, grande legibilidade em vários tamanhos e uma aparência que pode funcionar sem dominar a mensagem.',
    'Ao mesmo tempo, o chamado Estilo Tipográfico Internacional valorizava grids, fotografia, hierarquia clara e tipografias sans-serif. A Helvetica se encaixou perfeitamente nesse ambiente.',
    'Empresas e sistemas de transporte adotaram a fonte porque ela funcionava bem em aplicações muito diferentes. Isso ajudou a transformá-la em um símbolo visual da modernidade corporativa.',
    'Sua enorme popularidade também provocou reação. Alguns designers a consideram genérica justamente porque ela foi usada em tantos lugares.',
  ],
  remember: [
    'Nasceu na Suíça em 1957.',
    'Seu nome original era Neue Haas Grotesk.',
    'Virou símbolo do design gráfico internacional do pós-guerra.',
  ],
  whyItMatters:
      'Perceber a Helvetica é um bom treino para entender que tipografia não é apenas “escolher uma letra bonita”. A fonte influencia clareza, tom, hierarquia e a sensação transmitida por uma mensagem.',
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
  minutes: 8,
  tags: ['economia', 'sociedade'],
  quickTake:
      'Quando a inflação sobe, a mesma quantidade de dinheiro compra menos coisas. O efeito é uma perda de poder de compra.',
  simpleExplanation:
      'Se apenas o tomate fica caro porque uma safra foi ruim, isso é uma alta específica de preço. Falamos em inflação quando aumentos se espalham por muitos bens e serviços e persistem ao longo do tempo. Por isso, inflação é sobre o nível geral de preços, não sobre um item isolado.',
  example:
      'Se R\$ 100 compravam dez itens da sua cesta e, depois de algum tempo, compram apenas nove, houve perda de poder de compra. O dinheiro continua valendo R\$ 100 no papel, mas compra menos coisas.',
  body: [
    'Preços mudam o tempo todo por motivos diferentes: clima, oferta, demanda, câmbio, salários, energia, impostos, logística e outros fatores.',
    'Um índice de inflação tenta resumir milhares de variações de preço em uma medida única. Para isso, acompanha uma cesta de bens e serviços com pesos diferentes.',
    'Isso explica por que a sua “inflação pessoal” pode não parecer igual ao índice oficial. Quem gasta muito com aluguel ou alimentação pode sentir mudanças diferentes de quem concentra gastos em outras categorias.',
    'A inflação pode ser influenciada por demanda muito forte, falta de produtos, aumento de custos, choques externos, expectativas e política econômica. Na prática, vários fatores podem acontecer ao mesmo tempo.',
    'Bancos centrais costumam usar a taxa de juros como uma ferramenta para influenciar crédito, consumo, investimento e expectativas. Juros mais altos tendem a reduzir parte da demanda, mas também podem desacelerar a atividade econômica.',
    'Quando a inflação desacelera, isso não significa necessariamente que os preços voltaram ao nível antigo. Muitas vezes significa apenas que continuam subindo mais devagar.',
  ],
  remember: [
    'Inflação não é qualquer aumento de preço.',
    'Ela reduz poder de compra.',
    'A inflação percebida por uma pessoa pode diferir do índice oficial.',
  ],
  whyItMatters:
      'Inflação afeta salário real, orçamento, contratos, juros, investimentos e decisões de longo prazo. Entendê-la ajuda a interpretar notícias econômicas sem confundir “preços altos” com “inflação alta”.',
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
  minutes: 7,
  tags: ['gastronomia', 'ciência'],
  quickTake:
      'Envelhecer bem depende de equilíbrio e estrutura. A maioria dos vinhos disponíveis no mercado foi feita para ser consumida jovem.',
  simpleExplanation:
      'Vinho não fica simplesmente “mais velho”; ele continua mudando quimicamente dentro da garrafa. Em alguns vinhos essas mudanças deixam aromas e textura mais interessantes. Em outros, a fruta desaparece antes que algo melhor apareça — e o vinho apenas perde qualidade.',
  example:
      'É parecido com guardar uma fruta: algumas transformações podem criar novos aromas, mas tempo sozinho não melhora qualquer produto. A composição inicial e a forma de armazenamento fazem toda a diferença.',
  body: [
    'Mesmo dentro de uma garrafa fechada, pequenas reações químicas continuam acontecendo. Pigmentos, taninos, ácidos e compostos aromáticos interagem lentamente ao longo dos anos.',
    'Em certos vinhos tintos, taninos muito firmes quando jovens podem parecer mais macios com o tempo. A cor também pode mudar e aromas de fruta fresca podem dar lugar a notas terrosas, de especiarias ou outros aromas chamados de terciários.',
    'Acidez é importante porque ajuda a manter sensação de frescor. Açúcar, álcool e concentração também podem contribuir para a capacidade de evolução de determinados estilos.',
    'Mas equilíbrio é mais importante do que simplesmente ter “muito” de cada componente. Um vinho desequilibrado não vira automaticamente um grande vinho depois de anos guardado.',
    'A maioria dos vinhos vendidos no mercado é produzida para ser bebida relativamente jovem. Guardar uma garrafa comum por dez anos pode fazer com que ela perca fruta e vitalidade.',
    'Armazenamento também é decisivo. Calor, luz intensa, vibração e grandes oscilações de temperatura podem acelerar deterioração e arruinar um vinho com potencial de guarda.',
  ],
  remember: [
    'Vinho velho não é automaticamente melhor.',
    'Estrutura e equilíbrio ajudam na capacidade de envelhecimento.',
    'Armazenamento muda completamente o resultado.',
  ],
  whyItMatters:
      'Saber disso evita a ideia de que idade é sinônimo de qualidade. Também ajuda a decidir quando guardar uma garrafa e quando simplesmente aproveitar o vinho enquanto ele está no melhor momento.',
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

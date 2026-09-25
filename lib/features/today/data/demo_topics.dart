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
  chapters: [
    KnowledgeChapter(
      title: 'Uma escola nascida de uma crise',
      paragraphs: [
        'A Bauhaus nasceu em Weimar, em 1919, quando a Alemanha tentava se reorganizar depois da Primeira Guerra Mundial. Walter Gropius reuniu uma escola de belas-artes e outra de artes aplicadas porque via um problema no ensino tradicional: artistas criavam em um lugar, artesãos produziam em outro e a indústria transformava os objetos do cotidiano sem que esses mundos conversassem o suficiente.',
        'A proposta era ambiciosa: formar pessoas capazes de pensar o projeto inteiro, da ideia inicial até o material e a fabricação. Isso não significava que todos deveriam produzir cadeiras idênticas ou abandonar a expressão artística. Pintura, teatro, fotografia, tecelagem, mobiliário e arquitetura coexistiam em experiências bastante diferentes.',
      ],
    ),
    KnowledgeChapter(
      title: 'O método era tão importante quanto a aparência',
      paragraphs: [
        'Imagine uma aula em que, antes de projetar qualquer produto, você precisa investigar como papel, metal, tecido e vidro se comportam. O curso preliminar da Bauhaus explorava cor, forma, textura e percepção. Depois, as oficinas colocavam os estudantes diante de problemas concretos: uma luminária ilumina bem? Uma cadeira pode ser fabricada e utilizada com conforto? Um cartaz comunica sua mensagem rapidamente?',
        'Essa combinação ajudou a popularizar a ideia de que design não é só enfeitar um produto pronto. Ao mesmo tempo, vale observar uma contradição histórica: embora a escola defendesse novas formas de trabalho, mulheres ainda encontraram barreiras de acesso a determinadas oficinas. Artistas como Anni Albers mostram que as contribuições femininas foram centrais, mesmo quando nem sempre receberam o mesmo reconhecimento.',
      ],
    ),
    KnowledgeChapter(
      title: 'Como reconhecer a influência sem enxergá-la em tudo',
      paragraphs: [
        'Abra um aplicativo, observe o mapa do metrô ou olhe uma cadeira de tubos metálicos. Pergunte quais escolhas facilitam o uso: a hierarquia visual, o material, a proporção ou a eliminação de detalhes que atrapalhariam a função. Esse jeito de investigar um objeto é uma boa conexão com os debates da Bauhaus, embora não prove que aquele objeto tenha sido desenhado diretamente a partir da escola.',
        'Há uma pegadinha frequente: Bauhaus não é sinônimo de minimalismo, nem inventou sozinha o design moderno. A escola teve fases, professores e posições distintas. Sua contribuição duradoura está também no ensino interdisciplinar, na experimentação e na pergunta sobre como arte, técnica e necessidades sociais podem se encontrar.',
      ],
    ),
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
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/2CbfpKhrAIWYkN3zvywt53',
      title: '52 | Bauhaus',
      caption: '14 min 59 s · Arquitetura Objetiva',
      sourceLabel: 'Spotify · Arquitetura Objetiva',
      sourceUrl: 'https://open.spotify.com/episode/2CbfpKhrAIWYkN3zvywt53',
    ),
    KnowledgeMedia(
      type: KnowledgeMediaType.image,
      url:
          'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/aa/Bauhaus_Dessau.jpg/960px-Bauhaus_Dessau.jpg',
      title: 'Bauhaus Dessau',
      caption:
          'Fotografia do edifício da Bauhaus em Dessau, uma das imagens mais reconhecíveis da arquitetura modernista.',
      sourceLabel: 'Foto: Hjochheim · CC BY-SA 3.0',
      sourceUrl:
          'https://commons.wikimedia.org/wiki/File:Bauhaus_Dessau.jpg',
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
  chapters: [
    KnowledgeChapter(
      title: 'O mundo industrial precisava de outras respostas',
      paragraphs: [
        'Entre o fim do século XIX e o século XX, cidades cresceram, novas máquinas mudaram o trabalho e tecnologias como eletricidade e elevadores alteraram a experiência urbana. Muitos artistas e arquitetos passaram a perguntar se bastava copiar fachadas de palácios antigos para atender a escolas, fábricas, apartamentos e transportes de uma sociedade em transformação.',
        'Foi nesse cenário que diferentes correntes modernistas experimentaram geometrias, estruturas e linguagens menos dependentes do repertório histórico. Não existiu um manifesto único seguido por todos. Na arquitetura, por exemplo, a produção de Le Corbusier e a de arquitetos brasileiros compartilham algumas questões, mas oferecem soluções diferentes para clima, cultura e cidade.',
      ],
    ),
    KnowledgeChapter(
      title: 'Uma promessa social, não apenas visual',
      paragraphs: [
        'Concreto armado, aço e vidro ajudaram a abrir plantas, vencer vãos e modificar fachadas. Mas a discussão também era sobre como construir moradias, escolas e equipamentos coletivos para mais pessoas. Padronizar componentes podia reduzir certas dificuldades de produção; aproveitar luz e ventilação podia melhorar a experiência dos espaços. O desenho passou a ser pensado como parte da organização da vida cotidiana.',
        'Essas promessas não garantiam bons resultados. Alguns projetos modernistas foram criticados quando priorizaram o planejamento abstrato e deixaram em segundo plano as relações já existentes nos bairros, a escala humana ou a diversidade de usos das ruas. Entender o movimento exige olhar tanto suas inovações quanto seus limites.',
      ],
    ),
    KnowledgeChapter(
      title: 'Um exercício para observar sua cidade',
      paragraphs: [
        'Compare dois edifícios de épocas distintas. Em vez de escolher imediatamente o mais bonito, investigue como entram luz e ar, onde ficam os elementos estruturais, como as pessoas circulam e que materiais estão aparentes. Um prédio ornamentado também pode funcionar muito bem; uma fachada de vidro moderna pode criar problemas térmicos se for inadequada ao clima.',
        'Outra distinção útil: modernismo é um conjunto amplo de movimentos; Bauhaus foi uma escola específica que participou dessa transformação. Brutalismo é uma linguagem posterior associada a parte da arquitetura moderna, mas nem todo edifício modernista é brutalista.',
      ],
    ),
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
  connections: ['Bauhaus', 'Brasília', 'Brutalismo', 'Le Corbusier'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/4pbke9lDgQSP6kWvr4atyU',
      title: 'Arquitetura, Modernismo e Memória',
      caption: '39 min 53 s · Arte IN FORMA',
      sourceLabel: 'Spotify · Arte IN FORMA',
      sourceUrl: 'https://open.spotify.com/episode/4pbke9lDgQSP6kWvr4atyU',
    ),
  ],
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
  chapters: [
    KnowledgeChapter(
      title: 'De onde vem a aparente contradição',
      paragraphs: [
        'Olhar para um céu cheio de estrelas pode sugerir que exista vida em outros lugares, mas transformar essa sensação em uma previsão exige várias suposições. Quantos planetas têm condições adequadas? Com que frequência a vida começa? Ela costuma evoluir para inteligência? Uma civilização desenvolve tecnologia detectável e continua usando-a por quanto tempo? Conhecemos cada vez mais planetas, mas quase todas essas outras respostas continuam incertas.',
        'O paradoxo de Fermi organiza essa distância entre expectativa e observação. Ele não diz que o universo deveria estar obrigatoriamente repleto de civilizações. Diz que, sob certas hipóteses, seria razoável esperar sinais; como não encontramos evidências confirmadas, precisamos examinar melhor as hipóteses e os métodos de busca.',
      ],
    ),
    KnowledgeChapter(
      title: 'O problema não é simplesmente olhar mais longe',
      paragraphs: [
        'Uma mensagem de rádio viaja à velocidade da luz. Se uma civilização estivesse a mil anos-luz e transmitisse hoje, uma resposta imediata nossa ainda levaria mil anos para chegar até ela. Além da distância, existe a questão do tempo: duas sociedades podem desenvolver tecnologia em épocas completamente diferentes e nunca coincidir em uma janela detectável.',
        'As buscas também dependem de instrumentos, frequências e padrões de sinal. É como tentar descobrir se alguém conversa em uma cidade enorme ouvindo apenas uma estação de rádio por alguns segundos. Essa comparação ajuda a entender por que a ausência de um sinal encontrado não equivale a uma busca exaustiva.',
      ],
    ),
    KnowledgeChapter(
      title: 'Hipóteses interessantes não são descobertas',
      paragraphs: [
        'Você talvez encontre explicações populares como o Grande Filtro, a hipótese do zoológico ou a ideia de civilizações silenciosas. São cenários usados para pensar o problema, não evidências de que qualquer um deles aconteceu. A Equação de Drake também organiza perguntas importantes, mas seus parâmetros mais decisivos ainda carregam grandes incertezas.',
        'O que fazer com essa informação? Ao ler uma manchete sobre vida extraterrestre, diferencie três coisas: um planeta potencialmente habitável, um possível indício de atividade biológica e uma evidência confirmada de tecnologia. Cada uma exigiria testes e interpretações muito diferentes.',
      ],
    ),
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
          'Fotografia de identificação de Enrico Fermi em Los Alamos, na década de 1940.',
      sourceLabel: 'Los Alamos National Laboratory',
      sourceUrl:
          'https://commons.wikimedia.org/wiki/File:Fermi-enrico.jpg',
    ),
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url:
          'https://d3ctxlq1ktw2nl.cloudfront.net/staging/2026-6-18/37924afc-726b-f551-a3b4-3b866ff480ce.mp3',
      title: 'O paradoxo de Fermi — Onde está todo mundo?',
      caption: '13 min · Astronomia e Astronáutica',
      sourceLabel: 'Astronomia e Astronáutica',
      sourceUrl:
          'https://podcastaddict.com/astronomia-e-astronautica/episode/229514378',
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
  chapters: [
    KnowledgeChapter(
      title: 'Uma crise que se alimentava de outras crises',
      paragraphs: [
        'O Império Romano não dependia apenas de legiões. Sua administração precisava cobrar tributos, manter alianças, movimentar alimentos, pagar soldados e negociar com elites regionais. Quando disputas internas consumiam recursos e certos territórios deixavam de contribuir com a mesma intensidade, financiar a defesa se tornava mais difícil. A dificuldade militar, por sua vez, podia reduzir ainda mais a arrecadação.',
        'Esses processos não aconteceram da mesma maneira em todas as províncias. Alguns centros econômicos resistiram melhor que outros. Por isso, explicar o fim do Ocidente romano por uma única causa, como impostos, religião ou invasões, apaga interações e diferenças regionais importantes.',
      ],
    ),
    KnowledgeChapter(
      title: 'Os anos que os livros costumam destacar',
      paragraphs: [
        'Em 378, tropas romanas foram derrotadas em Adrianópolis, episódio que expôs desafios de comando, recrutamento e relações com grupos godos. Em 410, Roma foi saqueada por forças lideradas por Alarico: um choque simbólico para uma cidade que representava séculos de poder, ainda que já não fosse o centro exclusivo do governo imperial.',
        'Em 476, Odoacro depôs Rômulo Augústulo. Essa data funciona como um marco didático para o desaparecimento do cargo de imperador no Ocidente, não como o instante em que todas as instituições e todas as populações deixaram de ser romanas. O Império do Oriente, com centro em Constantinopla, continuou existindo por muitos séculos.',
      ],
    ),
    KnowledgeChapter(
      title: 'O que caiu, afinal?',
      paragraphs: [
        'Imagine um mapa em que a mesma língua administrativa, rotas comerciais, leis e hábitos atravessam regiões governadas por autoridades diferentes. Uma estrutura política pode desaparecer sem que toda a cultura de seus habitantes seja apagada imediatamente. No antigo Ocidente, reinos sucessores preservaram, adaptaram ou transformaram elementos romanos em ritmos distintos.',
        'Essa distinção é útil fora da história antiga: quando uma instituição muda, devemos separar ruptura política, continuidade cultural e reorganização econômica. Ela também evita outra confusão comum: chamar todo o período seguinte de uma longa fase sem conhecimento ou atividade urbana não representa adequadamente a diversidade da chamada Antiguidade Tardia.',
      ],
    ),
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
  connections: ['Bizâncio', 'Cristianismo', 'Povos germânicos', 'Feudalismo'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/1xHuxX6No3KH527N2tDP93',
      title: 'Apogeu e queda do Império Romano',
      caption: '1 h 53 min · Caravelas Podcast',
      sourceLabel: 'Spotify · Caravelas Podcast',
      sourceUrl: 'https://open.spotify.com/episode/1xHuxX6No3KH527N2tDP93',
    ),
  ],
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
      'O brutalismo valoriza materiais e estruturas expostos. O concreto cru se tornou uma de suas marcas, mas não define sozinho o movimento.',
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
  chapters: [
    KnowledgeChapter(
      title: 'O material vira parte da linguagem',
      paragraphs: [
        'Em um prédio tradicional, revestimentos muitas vezes escondem como a construção se sustenta. Na arquitetura brutalista, a estrutura pode se tornar protagonista: vigas, pilares, escadas e superfícies de concreto são deixados evidentes. A discussão não é apenas sobre aparência pesada, mas sobre tornar legíveis materiais, espaços e a forma como um edifício funciona.',
        'O brutalismo ganhou destaque em diferentes países após a Segunda Guerra Mundial, num momento de reconstrução, ampliação de universidades e investimento em edifícios públicos. Mesmo assim, reduzir o movimento a concreto barato é um erro: houve soluções caras, projetos expressivos e debates sobre valores sociais muito distintos.',
      ],
    ),
    KnowledgeChapter(
      title: 'Concreto não é um diagnóstico',
      paragraphs: [
        'Imagine duas construções de concreto. A primeira tem estrutura escondida e segue uma composição clássica; a segunda organiza circulação e grandes vãos deixando a construção explícita. Só o material não resolve a classificação. O contexto, a intenção e a linguagem importam tanto quanto a superfície.',
        'A expressão francesa béton brut, associada ao concreto aparente, ajuda a entender parte da história do termo. Também vale separar arquitetura brutalista de interfaces digitais chamadas de brutalistas: no design de telas, a palavra costuma ser usada de maneira mais livre para descrever composições deliberadamente cruas ou pouco polidas.',
      ],
    ),
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
  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url:
          'https://d3ctxlq1ktw2nl.cloudfront.net/staging/2026-3-21/7c27c5bd-230f-2d7a-1b58-6adc2f607435.mp3',
      title: 'Escola Paulista (Brutalista)',
      caption: '11 min 34 s · Arquitetura Objetiva',
      sourceLabel: 'Arquitetura Objetiva',
      sourceUrl:
          'https://podcastaddict.com/arquitetura-objetiva/episode/222941639',
    ),
  ],
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
  chapters: [
    KnowledgeChapter(
      title: 'A neutralidade também é uma escolha de design',
      paragraphs: [
        'A Helvetica não surgiu num vácuo. Na Suíça do pós-guerra, designers buscavam uma linguagem gráfica capaz de atravessar fronteiras e organizar informação por meio de alinhamento, contraste e hierarquia. A fonte criada na fundição Haas em 1957 se encaixava nesse repertório, mas não foi a única responsável por ele. Uma boa página de jornal depende tanto da grade e dos espaços quanto do desenho de cada letra.',
        'Seu aspecto aparentemente discreto não é ausência de estilo: letras com baixo contraste entre traços, proporções regulares e terminações características produzem uma voz visual própria. Um teste interessante é escrever a mesma manchete com uma fonte serifada histórica, outra geométrica e a Helvetica. O texto permanece igual, mas o ritmo e o tom percebidos mudam porque tipografia é parte da mensagem.',
      ],
    ),
    KnowledgeChapter(
      title: 'Como uma fonte atravessou várias tecnologias',
      paragraphs: [
        'Max Miedinger desenvolveu a fonte com participação decisiva de Eduard Hoffmann, diretor da fundição. Primeiro chamada Neue Haas Grotesk, ela ganhou o nome Helvetica em 1960 durante a expansão comercial. Sua circulação coincidiu com a popularização de sistemas de composição fotográfica e, mais tarde, com a publicação digital, o que facilitou sua presença em marcas, impressos e interfaces.',
        'A família também precisou de revisões para novos meios. A Neue Helvetica, publicada em 1983, reorganizou os estilos para funcionar de forma mais consistente. Isso mostra um detalhe pouco visível do design gráfico: uma tipografia não é somente um desenho famoso. Ela é um sistema técnico de letras, pesos, espaçamentos e versões, adaptado a máquinas e necessidades que evoluem.',
      ],
    ),
    KnowledgeChapter(
      title: 'Clareza não é garantia de acessibilidade',
      paragraphs: [
        'A escolha da fonte deve considerar tamanho, espaçamento, contraste, idioma, suporte digital e contexto. Um letreiro visto de longe e um parágrafo longo num celular têm necessidades diferentes. A identidade visual mais reconhecível nem sempre é a leitura mais confortável para todas as pessoas, e não há uma fonte universalmente perfeita.',
        'A fama da Helvetica oferece uma lição útil: repetir uma solução conhecida não substitui testar o problema concreto. Antes de escolhê-la para uma interface, observe números parecidos, blocos densos de texto e tamanhos pequenos. A boa decisão vem de combinar a letra com uma hierarquia informativa, e não de confiar apenas na reputação de neutralidade.',
      ],
    ),
  ],

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
  chapters: [
  KnowledgeChapter(title: 'Preço mais alto não é sempre inflação', paragraphs: [
    'Imagine que o tomate encareceu porque uma safra foi prejudicada. Esse é um aumento de preço importante para quem compra tomate, mas não basta, sozinho, para caracterizar a inflação da economia. Para estudar a variação geral dos preços, pesquisadores acompanham cestas de bens e serviços e calculam índices que representam determinados grupos de consumidores.',
    'No Brasil, o IBGE produz índices como o IPCA e o INPC. As famílias não consomem exatamente os mesmos produtos nem gastam a mesma proporção com alimentação, aluguel ou transporte. Por isso, a inflação calculada para uma cesta de referência não precisa ser igual à variação efetivamente sentida por cada pessoa.',
  ]),
  KnowledgeChapter(title: 'De onde vem a pressão e como ela se espalha', paragraphs: [
    'Preços podem subir por pressões de demanda, dificuldades de oferta, custos mais altos, expectativas e mecanismos de reajuste. Quando muitos compradores competem por bens que não aumentam na mesma velocidade, uma pressão pode surgir. Um choque de custos, por sua vez, pode afetar transportes, energia e produtos que utilizam esses insumos.',
    'Esses mecanismos podem ocorrer ao mesmo tempo e atingir setores de maneira desigual. Políticas monetárias e decisões de empresas interagem com oferta, crédito e expectativas. Uma explicação que atribui toda a inflação a um único preço ou agente provavelmente está deixando variáveis relevantes de fora.',
  ]),
  KnowledgeChapter(title: 'A diferença entre desaceleração e queda de preços', paragraphs: [
    'Se a inflação anual passa de dez por cento para cinco por cento, os preços em geral continuam subindo, apenas a um ritmo menor. É a desinflação. Já uma variação geral negativa recebe o nome de deflação. Distinguir os termos evita interpretar uma queda da taxa de inflação como retorno automático aos preços anteriores.',
    'Para a vida cotidiana, vale acompanhar tanto a variação média divulgada quanto o comportamento dos itens que mais pesam no seu próprio orçamento. O índice é uma ferramenta estatística; a experiência financeira de uma família depende também de renda, dívidas, consumo e capacidade de adaptação.',
  ]),
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
  connections: ['Juros', 'Banco Central', 'Salário real', 'Moeda'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/2Kyi1bIQOXXpxsaRnz6mt3',
      title: 'A melhora da inflação vai durar?',
      caption: '13 min 52 s · Macro Review',
      sourceLabel: 'Spotify · Macro Review',
      sourceUrl: 'https://open.spotify.com/episode/2Kyi1bIQOXXpxsaRnz6mt3',
    ),
  ],
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


const stoicismTopic = KnowledgeTopic(
  id: 'estoicismo', eyebrow: 'FILOSOFIA / VIDA', title: 'ESTOICISMO NÃO É “NÃO SENTIR NADA”',
  summary: 'Uma filosofia antiga sobre distinguir o que depende de nós do que não depende.', minutes: 7,
  tags: ['filosofia', 'psicologia'], quickTake: 'Estoicismo busca agir bem diante do que acontece, não eliminar emoções.',
  simpleExplanation: 'Os estoicos propunham concentrar energia em julgamentos, escolhas e ações próprias, aceitando que muitos acontecimentos externos escapam ao nosso controle.',
  example: 'Você não controla o atraso de um voo, mas controla como reorganiza seus planos e trata as pessoas ao redor.',
  body: ['O estoicismo surgiu no mundo helenístico e foi desenvolvido por pensadores como Zenão, Sêneca, Epicteto e Marco Aurélio.','Para os estoicos, uma vida boa depende sobretudo de virtude e razão, não de riqueza, fama ou conforto.','A famosa distinção entre o que depende e o que não depende de nós funciona como ferramenta prática para direcionar atenção e responsabilidade.','Aceitação estoica não significa passividade: agir é importante quando a ação está ao nosso alcance.','A filosofia voltou a ganhar popularidade porque oferece linguagem simples para lidar com incerteza, frustração e escolhas.'],
  remember: ['Controle não é o mesmo que influência.','Aceitar não significa desistir.','Virtude e ação importam mais que conforto.'],
  whyItMatters: 'Ajuda a separar problemas que pedem ação daqueles que pedem adaptação.', curiosity: 'Marco Aurélio escreveu suas Meditações como notas pessoais, não como um livro pensado para publicação.',
  connections: ['Epicteto', 'Marco Aurélio', 'Ética', 'Resiliência'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/3zkEpGjfFCsCV2NDb42yK6',
      title: 'Estoicismo',
      caption: '32 min 4 s · História em Meia Hora',
      sourceLabel: 'Spotify · História em Meia Hora',
      sourceUrl: 'https://open.spotify.com/episode/3zkEpGjfFCsCV2NDb42yK6',
    ),
  ],
);

const renaissanceTopic = KnowledgeTopic(
  id: 'renascimento', eyebrow: 'ARTE / HISTÓRIA', title: 'POR QUE O RENASCIMENTO FOI TÃO IMPORTANTE?',
  summary: 'Arte, ciência, comércio e redescoberta de textos antigos transformaram a Europa entre os séculos XIV e XVI.', minutes: 8,
  tags: ['arte', 'história'], quickTake: 'O Renascimento não foi um simples “retorno” à Antiguidade, mas uma reinvenção feita num mundo em mudança.',
  simpleExplanation: 'Artistas e estudiosos passaram a observar com intensidade o corpo, a natureza, a perspectiva e textos clássicos, enquanto cidades ricas financiavam novas obras.',
  example: 'A perspectiva linear permitiu organizar uma pintura como se o espaço continuasse para dentro da parede.',
  body: ['O movimento ganhou força em cidades italianas como Florença, Veneza e Roma.','Humanistas estudaram autores gregos e romanos e colocaram grande atenção na experiência humana, sem que isso significasse abandonar a religião.','Artistas exploraram anatomia, luz, proporção e perspectiva com métodos cada vez mais sistemáticos.','Mecenas, cortes, Igreja e famílias de comerciantes financiaram obras que também funcionavam como símbolos de poder.','A imprensa ajudou ideias e textos a circular em escala muito maior.'],
  chapters: [
  KnowledgeChapter(title: 'Uma mudança construída entre cidades, oficinas e livros', paragraphs: [
    'O Renascimento teve ritmos e manifestações diferentes entre os séculos XIV e XVI. Em cidades e cortes italianas, comerciantes, instituições religiosas e governantes financiaram obras e estudos, enquanto artistas experimentavam modos de representar pessoas, edifícios e paisagens. A redescoberta e releitura de autores clássicos participou desse processo, mas os criadores também responderam aos problemas de seu próprio tempo.',
    'Chamar o período de renascimento não significa que a Idade Média tenha sido culturalmente vazia ou que todas as transformações tenham começado de repente. Técnicas medievais, redes comerciais e instituições anteriores continuaram importantes. A história é mais interessante quando identificamos continuidades junto com as novidades.',
  ]),
  KnowledgeChapter(title: 'O humanismo não era uma campanha contra a religião', paragraphs: [
    'O estudo de textos antigos em línguas originais estimulou perguntas sobre retórica, história, filosofia e condição humana. Humanistas tiveram posições religiosas diferentes; muitos trabalharam para instituições e patronos cristãos. O foco em textos e experiências humanas não implica que fossem necessariamente ateus ou que rejeitassem toda tradição.',
    'Na arte, o estudo da anatomia, da luz e do espaço ofereceu recursos para composições mais variadas. Artistas podiam combinar observação do mundo, temas religiosos e referências à Antiguidade em uma mesma obra. Por trás de uma pintura famosa havia também aprendizes, fornecedores, encomendas e oficinas organizadas.',
  ]),
  KnowledgeChapter(title: 'Aprenda a observar um retrato renascentista', paragraphs: [
    'Escolha uma pintura de retrato e note postura, vestuário, objetos, paisagem e direção do olhar. Essas escolhas podem comunicar status, identidade, virtudes ou ligações políticas. Retratos não são fotografias neutras: resultam de negociações entre o artista, o retratado e as expectativas do público.',
    'Compare depois com uma pintura religiosa do mesmo período. Observe se as figuras ocupam um espaço coerente, como a iluminação organiza a cena e que elementos direcionam a atenção. O exercício permite perceber que técnicas são recursos expressivos, não uma escala universal de progresso artístico.',
  ]),
 ],
 remember: ['Florença foi um centro decisivo.','Humanismo não significa ateísmo.','Arte, dinheiro, política e conhecimento estavam conectados.'],
  whyItMatters: 'Muitas ideias modernas sobre artista, perspectiva, educação e cultura visual foram moldadas nesse período.', curiosity: 'Leonardo da Vinci deixou milhares de páginas de cadernos com estudos de anatomia, máquinas, água e desenho.',
  connections: ['Humanismo', 'Leonardo da Vinci', 'Perspectiva', 'Imprensa'],
);

const frenchRevolutionTopic = KnowledgeTopic(
  id: 'revolucao-francesa', eyebrow: 'HISTÓRIA / SOCIEDADE', title: 'POR QUE A REVOLUÇÃO FRANCESA EXPLODIU?',
  summary: 'Crise fiscal, desigualdades políticas e novas ideias ajudaram a derrubar a ordem do Antigo Regime.', minutes: 9,
  tags: ['história', 'sociedade'], quickTake: '1789 não surgiu de uma causa única: finanças públicas, privilégios e disputa por representação se combinaram.',
  simpleExplanation: 'A monarquia precisava de dinheiro, mas o sistema de impostos era desigual e reformas encontravam resistência. Ao mesmo tempo, crescia a pressão por representação política.',
  example: 'É como tentar resolver uma dívida enorme quando quem tem mais privilégios também consegue bloquear mudanças na forma de arrecadar.',
  body: ['A França chegou ao fim da década de 1780 com grave crise financeira.','A sociedade era juridicamente dividida em ordens com direitos e obrigações diferentes.','A convocação dos Estados Gerais abriu uma disputa sobre quem representava a nação e como os votos deveriam contar.','A tomada da Bastilha tornou-se um símbolo, mas a Revolução atravessou várias fases e conflitos.','Declarações de direitos ampliaram novas ideias de cidadania enquanto violência política e guerra também marcaram o período.'],
  remember: ['1789 é o início convencional.','Crise fiscal e representação estavam ligadas.','A Revolução teve fases muito diferentes.'],
  whyItMatters: 'Cidadania, direitos, nacionalismo e política moderna foram profundamente transformados por seus efeitos.', curiosity: 'A Bastilha tinha apenas sete prisioneiros quando foi tomada em 14 de julho de 1789.',
  connections: ['Iluminismo', 'Napoleão', 'Direitos humanos', 'Antigo Regime'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/1GeBRtAeVTSRNOTBjxK4d3',
      title: 'Revolução Francesa (parte 1)',
      caption: '29 min 42 s · História em Meia Hora',
      sourceLabel: 'Spotify · História em Meia Hora',
      sourceUrl: 'https://open.spotify.com/episode/1GeBRtAeVTSRNOTBjxK4d3',
    ),
  ],
);

const blackDeathTopic = KnowledgeTopic(
  id: 'peste-negra', eyebrow: 'HISTÓRIA / SAÚDE', title: 'COMO A PESTE NEGRA MUDOU A EUROPA?',
  summary: 'A pandemia do século XIV matou uma parcela enorme da população e alterou trabalho, religião e relações sociais.', minutes: 8,
  tags: ['história', 'sociedade'], quickTake: 'A Peste Negra foi uma catástrofe demográfica com consequências econômicas e culturais duradouras.',
  simpleExplanation: 'Quando milhões de pessoas morreram em poucos anos, faltaram trabalhadores, famílias desapareceram e instituições precisaram se adaptar a uma sociedade muito menor.',
  example: 'Com menos trabalhadores disponíveis, em algumas regiões sobreviventes puderam negociar salários e condições melhores.',
  body: ['A grande onda chegou à Europa em 1347 e se espalhou rapidamente por rotas comerciais.','A doença é associada à bactéria Yersinia pestis e circulou por redes envolvendo humanos, pulgas e outros hospedeiros.','A mortalidade variou muito entre regiões, mas foi extraordinariamente alta.','A escassez de mão de obra alterou relações econômicas e pressionou estruturas sociais existentes.','Sem conhecimento microbiológico, explicações religiosas, médicas e supersticiosas coexistiram.'],
  remember: ['A peste circulou por redes de comércio.','O impacto variou por região.','A perda populacional mudou também a economia.'],
  whyItMatters: 'Mostra como epidemias podem reorganizar sociedades muito além da medicina.', curiosity: 'A Peste Negra foi parte de uma pandemia mais ampla conhecida como Segunda Pandemia de peste.',
  connections: ['Idade Média', 'Comércio', 'Epidemias', 'Trabalho'],
);

const evolutionTopic = KnowledgeTopic(
  id: 'evolucao', eyebrow: 'CIÊNCIA / VIDA', title: 'COMO A SELEÇÃO NATURAL FUNCIONA?',
  summary: 'Variações herdáveis que favorecem reprodução podem se tornar mais comuns ao longo das gerações.', minutes: 8,
  tags: ['ciência', 'biologia'], quickTake: 'Indivíduos não evoluem porque “precisam”; populações mudam ao longo de gerações.',
  simpleExplanation: 'Se indivíduos variam, parte dessa variação é herdável e algumas características ajudam a deixar mais descendentes, essas características tendem a aumentar na população.',
  example: 'Bactérias resistentes a um antibiótico podem sobreviver ao tratamento e deixar descendentes, aumentando a frequência da resistência.',
  body: ['Darwin e Wallace formularam independentemente a ideia de seleção natural no século XIX.','A seleção atua sobre diferenças existentes; ela não planeja resultados futuros.','Mutações e recombinação ajudam a gerar variação genética.','Seleção natural é um mecanismo da evolução, ao lado de processos como deriva genética e fluxo gênico.','Adaptação é sempre relativa a um ambiente e pode envolver custos.'],
  remember: ['Populações evoluem.','Seleção não tem objetivo.','Adaptação depende do ambiente.'],
  whyItMatters: 'É uma das ideias centrais para entender biodiversidade, doenças, agricultura e genética.', curiosity: 'Darwin publicou A Origem das Espécies em 1859.',
  connections: ['Darwin', 'Genética', 'DNA', 'Resistência bacteriana'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/4XzJEEC1rkAzxpE128Wtw7',
      title: 'A seleção natural não explica tudo na evolução das espécies?',
      caption: '37 min 38 s · Os três elementos',
      sourceLabel: 'Spotify · Os três elementos',
      sourceUrl: 'https://open.spotify.com/episode/4XzJEEC1rkAzxpE128Wtw7',
    ),
  ],
);

const quantumTopic = KnowledgeTopic(
  id: 'quantica', eyebrow: 'CIÊNCIA / FÍSICA', title: 'POR QUE A FÍSICA QUÂNTICA PARECE TÃO ESTRANHA?',
  summary: 'Na escala atômica, probabilidades e quantização descrevem fenômenos que não combinam com nossa intuição cotidiana.', minutes: 8,
  tags: ['ciência', 'física'], quickTake: 'Quântica não significa “qualquer coisa misteriosa”: é uma teoria matemática extremamente testada.',
  simpleExplanation: 'Objetos microscópicos não se comportam como bolinhas clássicas em miniatura. Certas grandezas aparecem em valores discretos e previsões são frequentemente probabilísticas.',
  example: 'Um elétron num átomo só pode ocupar determinados estados de energia, como degraus em vez de uma rampa contínua.',
  body: ['A teoria quântica nasceu de problemas que a física clássica não conseguia explicar no início do século XX.','Planck, Einstein, Bohr, Heisenberg, Schrödinger e outros construíram partes importantes da teoria.','Superposição descreve estados possíveis antes de uma medição, mas não deve ser confundida com ideias místicas.','O princípio da incerteza estabelece limites fundamentais para certos pares de grandezas.','Sem física quântica não entenderíamos semicondutores, lasers e grande parte da eletrônica moderna.'],
  remember: ['É probabilística, mas rigorosa.','Quantização significa valores discretos em certos contextos.','Tecnologia moderna depende dela.'],
  whyItMatters: 'Ela sustenta boa parte da física e da tecnologia contemporâneas.', curiosity: 'Einstein ajudou a fundar a teoria quântica ao explicar o efeito fotoelétrico, embora depois criticasse aspectos de sua interpretação.',
  connections: ['Átomo', 'Semicondutores', 'Laser', 'Relatividade'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/0T0JHwjFiwmFHimDgZnxBA',
      title: 'A Física Quântica explicada sem mistério',
      caption: '35 min 31 s · Os três elementos',
      sourceLabel: 'Spotify · Os três elementos',
      sourceUrl: 'https://open.spotify.com/episode/0T0JHwjFiwmFHimDgZnxBA',
    ),
  ],
);

const dnaTopic = KnowledgeTopic(
  id: 'dna', eyebrow: 'CIÊNCIA / BIOLOGIA', title: 'O QUE O DNA REALMENTE FAZ?',
  summary: 'DNA armazena informação hereditária, mas genes funcionam dentro de redes celulares e ambientais complexas.', minutes: 7,
  tags: ['ciência', 'biologia'], quickTake: 'DNA é informação biológica, não um roteiro rígido que determina sozinho tudo sobre um organismo.',
  simpleExplanation: 'Trechos de DNA podem orientar a produção de moléculas, especialmente proteínas e RNAs, enquanto células regulam quando e como essa informação é usada.',
  example: 'Quase todas as células do corpo têm o mesmo DNA, mas uma célula da pele e um neurônio ativam conjuntos diferentes de genes.',
  body: ['O DNA é formado por nucleotídeos organizados em uma dupla hélice.','A sequência das bases carrega informação que pode ser copiada e transmitida.','Genes representam apenas parte do genoma e sua expressão é regulada.','Ambiente e desenvolvimento interagem com a genética, por isso muitos traços não têm uma causa genética simples.','Mutações podem ser neutras, prejudiciais ou vantajosas dependendo do contexto.'],
  chapters: [
  KnowledgeChapter(title: 'Informação biológica escrita em moléculas', paragraphs: [
    'O DNA é formado por uma sequência de unidades químicas que inclui quatro bases, representadas pelas letras A, T, C e G. A sequência guarda informações biológicas, mas não funciona como uma frase comum que qualquer célula lê integralmente de uma vez. Diferentes regiões têm funções e condições de uso distintas.',
    'Nos organismos celulares, parte das informações pode ser transcrita para moléculas de RNA. Algumas dessas mensagens participam da produção de proteínas, cujas estruturas e atividades ajudam a construir e manter as células. Outras regiões do DNA influenciam como, quando ou em quais condições determinadas informações serão utilizadas.',
  ]),
  KnowledgeChapter(title: 'Ter um gene não determina uma vida inteira', paragraphs: [
    'É tentador imaginar o genoma como um manual pronto que decide sozinho aparência, saúde e comportamento. Na prática, muitos resultados dependem da interação entre variações genéticas, regulação, desenvolvimento, ambiente e acaso biológico. Nem toda característica segue uma relação simples entre um gene e um resultado.',
    'Uma maneira de visualizar isso é pensar em uma receita que contém instruções, mas precisa de ingredientes, condições de preparo e mecanismos que decidam quais etapas serão executadas. A analogia é útil até certo ponto: células não são cozinheiros conscientes, e a biologia trabalha com redes de interações muito complexas.',
  ]),
  KnowledgeChapter(title: 'Como examinar uma manchete genética', paragraphs: [
    'Se um estudo encontra uma associação entre determinada variante genética e uma característica, pergunte qual população foi analisada, como a característica foi medida e quão forte é a associação. Associação estatística não significa que um único gene cause inevitavelmente aquele resultado em todas as pessoas.',
    'Conhecer DNA também ajuda a distinguir genética de genômica. O estudo de genes individuais é importante, mas compreender o conjunto do genoma e suas interações abre perguntas muito mais amplas sobre evolução, desenvolvimento e funcionamento dos organismos.',
  ]),
 ],
 remember: ['Mesmo DNA, usos diferentes em células diferentes.','Gene não é destino.','Mutações geram variação.'],
  whyItMatters: 'Ajuda a interpretar notícias sobre hereditariedade, testes genéticos, medicina e biotecnologia.', curiosity: 'Se esticado, o DNA de uma única célula humana teria aproximadamente dois metros.',
  connections: ['Genética', 'Evolução', 'RNA', 'CRISPR'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/4Fm1wZdTGFYfc88UNiymwu',
      title: 'DNA',
      caption: '36 min 45 s · Biologia em Meia Hora',
      sourceLabel: 'Spotify · Biologia em Meia Hora',
      sourceUrl: 'https://open.spotify.com/episode/4Fm1wZdTGFYfc88UNiymwu',
    ),
  ],
);

const aiTopic = KnowledgeTopic(
  id: 'ia-generativa', eyebrow: 'TECNOLOGIA / IA', title: 'COMO UMA IA GENERATIVA PRODUZ TEXTO?',
  summary: 'Modelos de linguagem aprendem padrões estatísticos em grandes conjuntos de dados e geram sequências token por token.', minutes: 8,
  tags: ['tecnologia', 'ia'], quickTake: 'Um modelo de linguagem não consulta uma frase pronta: calcula continuamente quais tokens são plausíveis a seguir.',
  simpleExplanation: 'Durante o treinamento, o modelo aprende relações entre palavras, ideias e estruturas. Na geração, usa o contexto recebido para estimar o próximo token repetidamente.',
  example: 'Ao receber “o céu está”, o modelo distribui probabilidades entre continuações possíveis e escolhe uma delas conforme sua configuração.',
  body: ['Texto é dividido em unidades chamadas tokens.','Redes do tipo transformer usam mecanismos de atenção para relacionar partes do contexto.','Treinamento ajusta muitos parâmetros para reduzir erros de previsão.','A geração pode produzir respostas convincentes e ainda assim factualmente erradas, porque plausibilidade linguística não garante verdade.','Ferramentas externas, recuperação de documentos e verificações podem melhorar a fundamentação.'],
  chapters: [
  KnowledgeChapter(title: 'Texto entra em partes menores, não em frases prontas', paragraphs: [
    'Muitos sistemas de inteligência artificial generativa baseados em grandes modelos de linguagem processam texto como sequências de unidades chamadas tokens. Durante o pré-treinamento de modelos autorregressivos, os parâmetros são ajustados repetidamente para melhorar a previsão de unidades seguintes com base no contexto anterior.',
    'Essa tarefa aparentemente simples permite aprender representações e relações complexas presentes nos dados de treinamento. Na geração, o modelo recebe o contexto da conversa e produz novas unidades sucessivamente. Isso não equivale a procurar uma frase pronta num banco de respostas; também não garante que tudo que pareça convincente seja correto.',
  ]),
  KnowledgeChapter(title: 'Treinar, adaptar e responder são etapas diferentes', paragraphs: [
    'O pré-treinamento costuma envolver grande quantidade de dados e recursos computacionais. Etapas posteriores de ajuste e alinhamento podem alterar o comportamento de um sistema em tarefas ou formatos específicos. Já produzir uma resposta em uma conversa normalmente é uma etapa de inferência: usar os parâmetros disponíveis com o contexto fornecido naquele momento.',
    'Ferramentas adicionais podem mudar bastante a experiência. Um sistema que consulta documentos ou executa cálculos dispõe de informações e verificações que um modelo isolado não teria. Por isso, vale distinguir a capacidade do modelo, a qualidade do material consultado e os resultados realmente confirmados por ferramentas.',
  ]),
  KnowledgeChapter(title: 'Fluência não substitui evidência', paragraphs: [
    'Uma resposta clara e bem escrita pode conter um número inventado, uma interpretação frágil ou uma referência inexistente. O usuário atento procura sinais de sustentação: fontes confiáveis, cálculos reprodutíveis, dados do próprio documento e delimitação do que o sistema sabe ou está estimando.',
    'O melhor exercício é pedir uma explicação de um assunto que você já domina e verificar cada etapa. Depois, faça o mesmo com um tema desconhecido, consultando pelo menos uma fonte independente. Assim, você aprende a aproveitar a produtividade da tecnologia sem delegar a ela toda a responsabilidade pelas conclusões.',
  ]),
 ],
 remember: ['Geração acontece token por token.','Plausível não significa verdadeiro.','Contexto muda a resposta.'],
  whyItMatters: 'Entender o mecanismo ajuda a usar IA com expectativas melhores e verificar respostas quando precisão importa.', curiosity: 'Transformers foram apresentados em 2017 e rapidamente se tornaram uma arquitetura central para modelos de linguagem.',
  connections: ['Machine learning', 'Transformer', 'Tokens', 'Redes neurais'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/4NQcop9rrfKuqEeZoOmJBC',
      title: 'A evolução da IA generativa',
      caption: '32 min 38 s · MIT Technology Review Brasil',
      sourceLabel: 'Spotify · MIT Technology Review Brasil',
      sourceUrl: 'https://open.spotify.com/episode/4NQcop9rrfKuqEeZoOmJBC',
    ),
  ],
);

const internetTopic = KnowledgeTopic(
  id: 'internet', eyebrow: 'TECNOLOGIA / INFRAESTRUTURA', title: 'O QUE ACONTECE QUANDO VOCÊ ABRE UM SITE?',
  summary: 'DNS, redes, servidores, TLS e navegador trabalham em sequência para transformar um endereço em uma página.', minutes: 7,
  tags: ['tecnologia', 'internet'], quickTake: 'A web é uma aplicação sobre a internet: seu navegador encontra um servidor, estabelece uma conexão e pede recursos.',
  simpleExplanation: 'O endereço precisa ser traduzido para um destino de rede; depois navegador e servidor negociam uma conexão segura e trocam arquivos e dados.',
  example: 'DNS funciona um pouco como uma agenda: você sabe o nome do site e precisa descobrir o endereço usado pela rede.',
  body: ['DNS ajuda a resolver nomes de domínio em endereços de rede.','Pacotes atravessam diferentes equipamentos e redes até chegar ao destino.','HTTPS usa TLS para proteger a comunicação contra leitura e alteração no caminho.','O servidor responde com HTML e outros recursos; o navegador interpreta tudo e monta a interface.','Caches e CDNs aproximam conteúdo do usuário e reduzem tempo de carregamento.'],
  remember: ['Internet e web não são sinônimos.','DNS resolve nomes.','HTTPS protege a conexão.'],
  whyItMatters: 'Torna conceitos de privacidade, segurança, velocidade e hospedagem muito menos abstratos.', curiosity: 'A World Wide Web foi proposta por Tim Berners-Lee no CERN em 1989.',
  connections: ['DNS', 'HTTPS', 'Servidor', 'Navegador'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/69AKhXRdr6UshYKs0j5DQe',
      title: 'Internet, Domínios e ICANN',
      caption: '43 min 5 s · Hipsters Ponto Tech',
      sourceLabel: 'Spotify · Hipsters Ponto Tech',
      sourceUrl: 'https://open.spotify.com/episode/69AKhXRdr6UshYKs0j5DQe',
    ),
  ],
  chapters: [
    KnowledgeChapter(
      title: 'O endereço é só o começo da viagem',
      paragraphs: [
        'Quando você digita o endereço de um site, o navegador precisa descobrir para onde mandar a solicitação. Em geral, ele consulta informações que podem já estar guardadas em cache; se não houver uma resposta útil, a resolução de DNS ajuda a encontrar endereços de rede. Um mesmo serviço pode responder por vários servidores, e um único servidor pode atender muitos nomes diferentes.',
        'Encontrar um endereço não significa necessariamente falar com uma máquina distante. Redes de distribuição de conteúdo, conhecidas como CDNs, podem manter cópias de arquivos perto da sua região. Isso ajuda a explicar por que o mesmo site carrega rapidamente numa cidade e demora em outra: distância, qualidade da conexão, cache e capacidade do servidor influenciam o percurso.',
      ],
    ),
    KnowledgeChapter(
      title: 'HTTPS é um acordo antes da conversa',
      paragraphs: [
        'Para uma conexão HTTPS, navegador e servidor normalmente negociam parâmetros criptográficos usando TLS antes de trocar o conteúdo protegido. O navegador também verifica o certificado apresentado pelo servidor e se ele é adequado ao endereço acessado. Só depois disso faz sentido enviar informações sensíveis por aquele canal.',
        'O cadeado do navegador indica proteção do transporte e a validação da identidade associada ao certificado; não prova que o negócio por trás do site é honesto nem impede golpes dentro de uma página legítima. Esse é um equívoco importante: criptografia dificulta a interceptação da comunicação, mas não decide se o conteúdo recebido merece confiança.',
      ],
    ),
    KnowledgeChapter(
      title: 'Receber arquivos não é o mesmo que mostrar uma página',
      paragraphs: [
        'Após receber o HTML, o navegador interpreta sua estrutura e monta o documento na memória. CSS define regras de apresentação; scripts podem alterar elementos, disparar novas solicitações e responder aos seus toques. Imagens, fontes e outros recursos podem vir de endereços distintos e chegar em momentos diferentes. A tela que aparece é resultado de várias etapas, não um arquivo pronto enviado de uma vez.',
        'Imagine que o texto principal chega rápido, mas a fonte personalizada e as fotos demoram. O conteúdo pode aparecer com uma aparência provisória antes de tudo terminar. Ao analisar um site lento, pergunte se o atraso acontece no DNS, na rede, no servidor, no download ou na montagem visual. Cada causa exige uma solução diferente, inclusive quando tudo acontece dentro do mesmo aplicativo.',
      ],
    ),
  ],

);

const bitcoinTopic = KnowledgeTopic(
  id: 'bitcoin', eyebrow: 'ECONOMIA / TECNOLOGIA', title: 'O QUE O BITCOIN RESOLVE TECNICAMENTE?',
  summary: 'Uma rede distribuída mantém um histórico compartilhado de transferências sem uma autoridade central única.', minutes: 8,
  tags: ['economia', 'tecnologia'], quickTake: 'Bitcoin combina criptografia, incentivos e consenso para dificultar gasto duplo numa rede aberta.',
  simpleExplanation: 'Em vez de um banco manter sozinho o livro-caixa, muitos participantes verificam regras e compartilham uma versão do histórico.',
  example: 'Se alguém tenta gastar as mesmas unidades duas vezes, a rede usa suas regras de consenso para determinar qual histórico válido será aceito.',
  body: ['Bitcoin foi apresentado em 2008 sob o pseudônimo Satoshi Nakamoto.','Transações são agrupadas em blocos ligados criptograficamente.','Mineração usa prova de trabalho para participar do processo de consenso e emissão.','A oferta segue regras definidas pelo protocolo, mas o preço de mercado varia livremente.','Descentralização traz propriedades diferentes de sistemas tradicionais, mas também custos, volatilidade e desafios de uso.'],
  remember: ['Blockchain é parte do sistema, não sinônimo de Bitcoin.','Prova de trabalho protege o consenso.','Preço e funcionamento técnico são questões diferentes.'],
  whyItMatters: 'Ajuda a discutir criptoativos separando tecnologia, economia e especulação.', curiosity: 'O primeiro bloco da rede Bitcoin foi minerado em janeiro de 2009.',
  connections: ['Blockchain', 'Criptografia', 'Moeda', 'Prova de trabalho'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/4pcDM4cfBjoH1kEb84GlkX',
      title: 'O QUE É BITCOIN E COMO FUNCIONA',
      caption: '9 min 5 s · Pensador Desperto',
      sourceLabel: 'Spotify · Pensador Desperto',
      sourceUrl: 'https://open.spotify.com/episode/4pcDM4cfBjoH1kEb84GlkX',
    ),
  ],
);

const jazzTopic = KnowledgeTopic(
  id: 'jazz', eyebrow: 'MÚSICA / CULTURA', title: 'O QUE FAZ O JAZZ SOAR COMO JAZZ?',
  summary: 'Improvisação, swing, diálogo entre músicos e uma história afro-americana formam um universo musical diverso.', minutes: 7,
  tags: ['música', 'cultura'], quickTake: 'Jazz não é um único som: é uma tradição que valoriza interpretação, improvisação e interação.',
  simpleExplanation: 'Uma mesma música pode mudar a cada apresentação porque músicos respondem uns aos outros e criam novas frases sobre uma estrutura compartilhada.',
  example: 'Depois de tocar o tema principal, um saxofonista pode improvisar enquanto baixo, bateria e piano adaptam o acompanhamento em tempo real.',
  body: ['O jazz se desenvolveu no início do século XX com raízes especialmente fortes em comunidades negras de Nova Orleans.','Blues, ragtime, tradições africanas e música europeia contribuíram para sua formação.','Improvisação permite que músicos criem dentro de estruturas harmônicas e rítmicas.','Swing descreve tanto uma sensação rítmica quanto um período histórico específico do jazz.','Bebop, cool jazz, hard bop, free jazz e fusion mostram como o gênero se transformou continuamente.'],
  remember: ['Improvisação é central.','Jazz tem raízes afro-americanas.','Existem muitos estilos de jazz.'],
  whyItMatters: 'O jazz influenciou música popular, linguagem harmônica e a própria ideia moderna de improvisação.', curiosity: 'Louis Armstrong ajudou a transformar o solo improvisado em elemento central do jazz.',
  connections: ['Blues', 'Louis Armstrong', 'Bebop', 'Improvisação'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/3V55XT30rajKYpmDB1q1wI',
      title: 'O Jazz e música instrumental no Brasil',
      caption: '48 min 33 s · Marte Cultural',
      sourceLabel: 'Spotify · Marte Cultural',
      sourceUrl: 'https://open.spotify.com/episode/3V55XT30rajKYpmDB1q1wI',
    ),
  ],
);

const cinemaTopic = KnowledgeTopic(
  id: 'montagem-cinema', eyebrow: 'CINEMA / LINGUAGEM', title: 'POR QUE A MONTAGEM MUDA O SENTIDO DE UM FILME?',
  summary: 'A ordem e duração dos planos criam ritmo, relações e significados que não existem em cada imagem isolada.', minutes: 7,
  tags: ['cinema', 'arte'], quickTake: 'Editar não é apenas cortar excessos: é construir significado pela relação entre imagens e sons.',
  simpleExplanation: 'O cérebro conecta planos consecutivos. Mostrar um rosto neutro e depois um prato de comida pode fazer o mesmo rosto parecer faminto.',
  example: 'Uma perseguição parece simultânea quando o filme alterna rapidamente entre quem foge e quem persegue.',
  body: ['O cinema descobriu cedo que planos separados podiam formar uma continuidade compreensível.','Montagem controla tempo: pode condensar anos em segundos ou prolongar um instante.','O efeito Kuleshov ficou famoso por demonstrar como o contexto altera nossa leitura de uma expressão.','Eisenstein explorou colisões entre imagens para produzir ideias e emoção.','No cinema contemporâneo, montagem também organiza som, ritmo, ponto de vista e informação narrativa.'],
  remember: ['A ordem dos planos muda significado.','Montagem manipula tempo.','Ritmo também conta história.'],
  whyItMatters: 'Depois de perceber montagem, você passa a enxergar como filmes guiam atenção e emoção.', curiosity: 'Muitos princípios de montagem desenvolvidos no cinema hoje aparecem em vídeos curtos, publicidade e redes sociais.',
  connections: ['Kuleshov', 'Eisenstein', 'Narrativa', 'Fotografia'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/4wOEJkHuaIbuIRrqTf0kCy',
      title: 'Reinecken (Cinema, Montagem, Direção e muito mais)',
      caption: '1 h 48 min · Abrindo Cabeças Podcast',
      sourceLabel: 'Spotify · Abrindo Cabeças Podcast',
      sourceUrl: 'https://open.spotify.com/episode/4wOEJkHuaIbuIRrqTf0kCy',
    ),
  ],
);

const fashionTopic = KnowledgeTopic(
  id: 'alta-costura', eyebrow: 'MODA / CULTURA', title: 'O QUE “ALTA-COSTURA” SIGNIFICA DE VERDADE?',
  summary: 'Haute couture é uma denominação regulada na França, ligada a produção sob medida e critérios específicos.', minutes: 6,
  tags: ['moda', 'cultura'], quickTake: 'Nem todo vestido caro ou feito à mão é oficialmente haute couture.',
  simpleExplanation: 'O termo funciona como uma categoria institucional: casas precisam cumprir requisitos e integrar uma lista reconhecida no sistema francês.',
  example: 'Uma marca pode produzir peças luxuosas e exclusivas sem ter o direito de se apresentar oficialmente como uma maison de haute couture.',
  body: ['A alta-costura se consolidou em Paris a partir do século XIX.','Peças são feitas com grande trabalho artesanal e ajustadas para clientes específicos.','O sistema francês estabelece critérios e reconhecimento institucional para o uso oficial da denominação.','Desfiles de couture funcionam também como laboratório de técnica, imagem e prestígio para as maisons.','A influência da couture vai além de suas poucas clientes e chega à cultura visual, celebridades e moda industrial.'],
  remember: ['É uma denominação regulada.','Sob medida e artesanato são centrais.','Luxo sozinho não basta.'],
  whyItMatters: 'Ajuda a diferenciar marketing de uma categoria histórica e institucional específica da moda.', curiosity: 'Charles Frederick Worth é frequentemente associado ao nascimento da alta-costura moderna em Paris.',
  connections: ['Paris', 'Luxo', 'Prêt-à-porter', 'História da moda'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/20I8oagQIrl3yxROZxDoHE',
      title: 'Balenciaga e Patagonia vão salvar o consumo',
      caption: '32 min · MODA IMPORTA',
      sourceLabel: 'Spotify · MODA IMPORTA',
      sourceUrl: 'https://open.spotify.com/episode/20I8oagQIrl3yxROZxDoHE',
    ),
  ],
);

const coffeeTopic = KnowledgeTopic(
  id: 'cafe', eyebrow: 'GASTRONOMIA / CIÊNCIA', title: 'POR QUE CAFÉS PODEM TER SABORES TÃO DIFERENTES?',
  summary: 'Espécie, origem, processamento, torra, moagem e extração alteram profundamente o que chega à xícara.', minutes: 7,
  tags: ['gastronomia', 'ciência'], quickTake: '“Gosto de café” não vem de um único fator: é o resultado de uma cadeia inteira.',
  simpleExplanation: 'O grão já carrega características da planta e do cultivo; processamento e torra transformam compostos; preparo decide o que será extraído.',
  example: 'O mesmo café pode parecer ácido e leve num preparo filtrado ou mais concentrado e intenso num espresso.',
  body: ['Arabica e canephora são espécies comercialmente importantes com perfis diferentes.','Altitude, clima, solo e manejo influenciam o desenvolvimento do fruto.','Processamentos natural, lavado e outros mudam fermentação e secagem.','Torra cria centenas de compostos aromáticos e pode enfatizar ou mascarar características do grão.','Na extração, proporção, água, temperatura, moagem e tempo alteram equilíbrio entre acidez, doçura e amargor.'],
  remember: ['Origem é só uma parte.','Torra transforma o grão.','Extração muda a percepção final.'],
  whyItMatters: 'Dá vocabulário para escolher e preparar café pelo perfil que você realmente gosta.', curiosity: 'O que chamamos de “grão” de café é a semente de um fruto.',
  connections: ['Fermentação', 'Torra', 'Espresso', 'Química dos aromas'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/03zgDkU5xwZIyOAXybeWud',
      title: 'Qualidade e Inovação no Café',
      caption: '30 min 23 s · Bourbon Cast',
      sourceLabel: 'Spotify · Bourbon Cast',
      sourceUrl: 'https://open.spotify.com/episode/03zgDkU5xwZIyOAXybeWud',
    ),
  ],
);

const mapsTopic = KnowledgeTopic(
  id: 'mapas', eyebrow: 'GEOGRAFIA / MUNDO', title: 'POR QUE TODO MAPA DISTORCE O MUNDO?',
  summary: 'Transformar a superfície curva da Terra em um plano exige compromissos entre área, forma, distância e direção.', minutes: 7,
  tags: ['geografia', 'mundo'], quickTake: 'Não existe projeção plana perfeita: cada mapa escolhe o que preservar e o que distorcer.',
  simpleExplanation: 'Tente abrir a casca de uma laranja e deixá-la perfeitamente plana sem rasgar ou esticar. O mesmo problema aparece ao representar a Terra.',
  example: 'Na projeção de Mercator, regiões próximas aos polos parecem muito maiores em relação às áreas equatoriais.',
  body: ['Projeções cartográficas são métodos matemáticos para representar uma superfície curva em um plano.','Mercator preserva ângulos locais, característica útil historicamente para navegação.','Projeções equivalentes priorizam proporções de área, mas alteram formas.','Escala e objetivo determinam qual projeção é mais adequada.','Mapas também envolvem escolhas sobre centro, orientação, fronteiras, nomes e dados.'],
  chapters: [
  KnowledgeChapter(title: 'Uma superfície curva não cabe numa folha sem perdas', paragraphs: [
    'Um globo preserva a geometria de uma esfera de maneira aproximada; já um mapa plano precisa transformar coordenadas de uma superfície curva em posições no papel ou na tela. Essa transformação é uma projeção cartográfica. Não existe maneira de preservar simultaneamente todas as distâncias, áreas, ângulos e formas em um mapa-múndi plano.',
    'Cada método escolhe quais propriedades priorizar. Projeções conformes procuram preservar ângulos locais, enquanto projeções equivalentes preservam áreas relativas. Escolhas assim não são truques escondidos: são compromissos matemáticos, adequados a tarefas diferentes.',
  ]),
  KnowledgeChapter(title: 'O famoso mapa não é a única forma possível', paragraphs: [
    'A projeção de Mercator é útil para determinadas aplicações ligadas a direções e navegação, mas exagera visualmente regiões de latitudes altas em um mapa-múndi. Por isso, a Groenlândia pode parecer muito maior em relação a territórios próximos do Equador do que realmente é.',
    'Uma projeção que representa áreas com maior fidelidade pode, em compensação, distorcer formatos. Antes de discutir qual mapa parece mais correto, pergunte qual propriedade importa para o objetivo: comparar territórios, navegar, ensinar geografia ou visualizar uma distribuição.',
  ]),
  KnowledgeChapter(title: 'Todo mapa também é uma seleção editorial', paragraphs: [
    'Além da projeção, o cartógrafo escolhe escala, orientação, cores, símbolos, limites e quais informações omitir. Um mapa de metrô pode distorcer distâncias para tornar conexões mais fáceis de seguir. Isso pode melhorar muito sua utilidade sem pretender reproduzir com exatidão cada curva dos trilhos.',
    'Quando encontrar um mapa em uma reportagem, leia a legenda e procure sua fonte de dados. Cores intensas e limites bem desenhados podem passar uma sensação de precisão que a base cartográfica, a amostragem ou a escala não justificam.',
  ]),
 ],
 remember: ['Todo mapa plano distorce algo.','Mercator não foi criada para comparar áreas.','Escolher uma projeção é escolher prioridades.'],
  whyItMatters: 'Ajuda a ler mapas criticamente e perceber como representação influencia nossa imagem mental do mundo.', curiosity: 'A Groenlândia parece gigantesca em muitos mapas Mercator, embora a África seja cerca de 14 vezes maior em área.',
  connections: ['Mercator', 'Cartografia', 'Geopolítica', 'Escala'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/3xZ0Yvx8FcTdWceVitaVQV',
      title: 'Mapas y proyecciones cartográficas',
      caption: '25 min · Aparici en Órbita',
      sourceLabel: 'Spotify · Aparici en Órbita',
      sourceUrl: 'https://open.spotify.com/episode/3xZ0Yvx8FcTdWceVitaVQV',
    ),
  ],
);

const placeboTopic = KnowledgeTopic(
  id: 'placebo', eyebrow: 'PSICOLOGIA / SAÚDE', title: 'O QUE É O EFEITO PLACEBO?',
  summary: 'Expectativas e contexto de tratamento podem alterar sintomas e experiências, sem transformar placebo em cura universal.', minutes: 7,
  tags: ['psicologia', 'ciência'], quickTake: 'Placebo mostra que contexto e expectativa podem afetar alguns desfechos, mas não significa que doenças sejam “coisa da cabeça”.',
  simpleExplanation: 'Receber um tratamento envolve ritual, expectativa e aprendizagem. Esses fatores podem modificar percepção de dor e outros sintomas em determinadas condições.',
  example: 'Num estudo, grupos podem receber tratamento real ou uma intervenção controle parecida para separar o efeito específico do medicamento de outros efeitos do contexto.',
  body: ['O efeito placebo é estudado em ensaios clínicos e em pesquisas sobre expectativa e aprendizagem.','Sintomas subjetivos, como dor, podem responder ao contexto de forma mensurável.','Isso não significa que placebo elimine infecções, tumores ou qualquer doença de forma geral.','Ensaios controlados ajudam a estimar quanto benefício vem do tratamento específico.','Existe também o efeito nocebo, em que expectativas negativas podem aumentar sintomas ou efeitos percebidos.'],
  remember: ['Placebo não é cura universal.','Contexto pode alterar sintomas.','Controles ajudam a testar tratamentos.'],
  whyItMatters: 'Ajuda a entender por que bons estudos clínicos precisam comparar intervenções cuidadosamente.', curiosity: 'Placebos podem produzir respostas mesmo quando alguns participantes sabem que estão recebendo um placebo, em contextos específicos de pesquisa.',
  connections: ['Ensaios clínicos', 'Nocebo', 'Dor', 'Expectativa'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/1lVMiTfljH48pN222Kb4Wm',
      title: 'How the Placebo Effect Works',
      caption: '39 min 16 s · Stuff You Should Know',
      sourceLabel: 'Spotify · Stuff You Should Know',
      sourceUrl: 'https://open.spotify.com/episode/1lVMiTfljH48pN222Kb4Wm',
    ),
  ],
);

const languageTopic = KnowledgeTopic(
  id: 'linguagem', eyebrow: 'LINGUAGEM / SOCIEDADE', title: 'POR QUE AS LÍNGUAS MUDAM O TEMPO TODO?',
  summary: 'Pronúncia, vocabulário e gramática mudam conforme comunidades usam a língua em novos contextos.', minutes: 7,
  tags: ['linguagem', 'sociedade'], quickTake: 'Mudança linguística não é necessariamente “erro”: é uma característica normal de línguas vivas.',
  simpleExplanation: 'Cada geração aprende padrões existentes, mas também cria, simplifica, empresta e reorganiza formas de falar.',
  example: 'Palavras estrangeiras podem entrar no vocabulário, ganhar pronúncia local e depois parecer completamente normais.',
  body: ['Línguas mudam em sons, significados, gramática e vocabulário.','Contato entre comunidades acelera empréstimos e mistura de padrões.','Mudanças podem começar em grupos sociais específicos e depois se espalhar.','A escrita costuma mudar mais lentamente que a fala, criando diferenças entre norma e uso cotidiano.','Nenhuma língua viva permanece congelada por séculos.'],
  remember: ['Mudança é normal.','Fala e escrita mudam em ritmos diferentes.','Contato entre línguas deixa marcas.'],
  whyItMatters: 'Ajuda a entender sotaques, gírias, norma-padrão e diversidade linguística sem confundir diferença com incapacidade.', curiosity: 'O português, o espanhol, o francês e o italiano descendem de variedades do latim falado.',
  connections: ['Latim', 'Sotaque', 'Etimologia', 'Sociolinguística'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/0Ysv78HC9HMqFgwtk3jj8V',
      title: 'Variação linguística, uma conversa com Raquel Freitag',
      caption: '29 min · Linguística ON',
      sourceLabel: 'Spotify · Linguística ON',
      sourceUrl: 'https://open.spotify.com/episode/0Ysv78HC9HMqFgwtk3jj8V',
    ),
  ],
);

const illuminismoTopic = KnowledgeTopic(
  id: 'illuminismo', eyebrow: 'FILOSOFIA / HISTÓRIA', title: 'O QUE FOI O ILUMINISMO?',
  summary: 'Razão, crítica e debate sobre poder transformaram a política e a cultura europeias no século XVIII.', minutes: 7, tags: ['filosofia', 'história'],
  quickTake: 'O Iluminismo reuniu autores diferentes, não uma única doutrina.', simpleExplanation: 'Pense nele como uma grande conversa intelectual sobre como conhecimento, leis e governos poderiam ser examinados pela razão.', example: 'Questionar se um rei governa por direito divino ou se o poder precisa de justificativa pública é uma pergunta tipicamente iluminista.',
  body: ['Autores como Voltaire, Montesquieu, Rousseau e Diderot discordavam em muitos pontos.', 'Enciclopédias e uma esfera pública de livros, cafés e periódicos ajudaram ideias a circular.', 'Críticas ao absolutismo e aos privilégios influenciaram debates políticos dos séculos seguintes.', 'Ciência e empirismo reforçaram a confiança na investigação racional, embora o período também carregasse contradições sociais.'], remember: ['Não foi uma doutrina única.', 'Razão e crítica ganharam centralidade.', 'Suas ideias influenciaram revoluções e constituições.'],
  whyItMatters: 'Ajuda a entender a origem de muitos debates modernos sobre direitos, Estado e conhecimento.', curiosity: 'A Encyclopédie francesa reuniu milhares de verbetes e se tornou símbolo do projeto de organizar o conhecimento.', connections: ['Revolução Francesa', 'Direitos', 'Enciclopédia', 'Montesquieu'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/3STQjc7NAIbDHz4t5vNir9',
      title: 'Iluminismo: o que você precisa saber para entender',
      caption: '2 h 32 min · História FM',
      sourceLabel: 'Spotify · História FM',
      sourceUrl: 'https://open.spotify.com/episode/3STQjc7NAIbDHz4t5vNir9',
    ),
  ],
);

const imperioOtomanoTopic = KnowledgeTopic(
  id: 'imperio-otomano', eyebrow: 'HISTÓRIA / IMPÉRIOS', title: 'COMO O IMPÉRIO OTOMANO DUROU TANTO?',
  summary: 'Instituições flexíveis, posição estratégica e capacidade militar sustentaram um império por mais de seis séculos.', minutes: 7, tags: ['história', 'geopolítica'],
  quickTake: 'O Império Otomano não foi estático: sobreviveu justamente porque mudou muitas vezes.', simpleExplanation: 'Imagine administrar territórios em três continentes, com religiões, línguas e economias diferentes, adaptando regras e alianças conforme a época.', example: 'Constantinopla, conquistada em 1453 e depois conhecida como Istambul, tornou-se um centro político e comercial decisivo.',
  body: ['O Estado otomano surgiu na Anatólia no fim do século XIII e expandiu-se pelos Bálcãs e Oriente Médio.', 'Sua administração combinou autoridade central com diferentes arranjos locais.', 'Rotas comerciais, tributação e grandes cidades sustentaram sua economia em períodos distintos.', 'Reformas militares e administrativas ocorreram repetidamente diante de mudanças tecnológicas e rivais externos.', 'O império foi dissolvido após a Primeira Guerra Mundial e a República da Turquia foi fundada em 1923.'], remember: ['Durou mais de seis séculos.', 'Controlou territórios em três continentes.', 'Mudança institucional foi parte de sua longevidade.'],
  whyItMatters: 'Ajuda a entender fronteiras, cidades e conflitos históricos do Mediterrâneo, dos Bálcãs e do Oriente Médio.', curiosity: 'O sultão Mehmed II tinha apenas 21 anos quando Constantinopla foi conquistada em 1453.', connections: ['Constantinopla', 'Turquia', 'Bálcãs', 'Primeira Guerra'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/4ikwwZKny6DzoFYb5CnHCb',
      title: 'Império Otomano: ascensão e queda de um império',
      caption: '1 h 30 min · História FM',
      sourceLabel: 'Spotify · História FM',
      sourceUrl: 'https://open.spotify.com/episode/4ikwwZKny6DzoFYb5CnHCb',
    ),
  ],
);

const guerraFriaTopic = KnowledgeTopic(
  id: 'guerra-fria', eyebrow: 'HISTÓRIA / GEOPOLÍTICA', title: 'POR QUE A GUERRA FRIA ERA “FRIA”?',
  summary: 'Estados Unidos e União Soviética evitaram guerra direta ampla, mas disputaram poder global por décadas.', minutes: 7, tags: ['história', 'geopolítica'],
  quickTake: 'Foi uma rivalidade global com armas, alianças, propaganda, espionagem e guerras por procuração.', simpleExplanation: 'Duas superpotências possuíam capacidade nuclear devastadora; confrontá-las diretamente tinha riscos enormes, então a disputa apareceu em muitos outros terrenos.', example: 'A corrida espacial transformou foguetes, satélites e a chegada à Lua em demonstrações públicas de capacidade tecnológica.',
  body: ['Após 1945, EUA e URSS emergiram como superpotências com sistemas políticos e econômicos rivais.', 'A dissuasão nuclear tornou uma guerra direta potencialmente catastrófica.', 'OTAN e Pacto de Varsóvia formalizaram blocos militares na Europa.', 'Coreia, Vietnã, Afeganistão e outras regiões foram profundamente afetadas por conflitos ligados à rivalidade.', 'A Guerra Fria terminou no contexto das reformas soviéticas e da dissolução da URSS em 1991.'], remember: ['Não foi ausência de guerras.', 'Armas nucleares alteraram a estratégia.', 'A disputa foi política, econômica, tecnológica e cultural.'],
  whyItMatters: 'Muitos alinhamentos e instituições internacionais atuais têm raízes nesse período.', curiosity: 'O telefone vermelho entre Washington e Moscou não era literalmente um telefone vermelho; foi criado como linha direta de comunicação após a crise dos mísseis.', connections: ['URSS', 'OTAN', 'Corrida espacial', 'Berlim'],
);

const relatividadeTopic = KnowledgeTopic(
  id: 'relatividade', eyebrow: 'CIÊNCIA / FÍSICA', title: 'O TEMPO PASSA IGUAL PARA TODO MUNDO?',
  summary: 'A relatividade mostra que medidas de tempo e espaço dependem do movimento e da gravidade.', minutes: 7, tags: ['ciência', 'física'],
  quickTake: 'Tempo não é um relógio universal separado do universo físico.', simpleExplanation: 'Dois relógios extremamente precisos podem acumular tempos diferentes se viajarem em velocidades diferentes ou permanecerem sob gravidades diferentes.', example: 'Satélites de GPS precisam considerar efeitos relativísticos para que o posicionamento continue preciso.',
  body: ['Einstein apresentou a relatividade especial em 1905 e a relatividade geral em 1915.', 'Na relatividade especial, velocidade da luz e estrutura do espaço-tempo levam à dilatação temporal.', 'Na relatividade geral, gravidade é descrita pela geometria do espaço-tempo.', 'Esses efeitos parecem pequenos no cotidiano, mas tornam-se importantes em velocidades altas, campos gravitacionais intensos ou medições muito precisas.', 'Observações de lentes gravitacionais, órbitas e ondas gravitacionais testam previsões da teoria.'], remember: ['Tempo depende do referencial.', 'Gravidade afeta a passagem do tempo.', 'GPS usa correções relativísticas.'],
  whyItMatters: 'Transforma nossa ideia de espaço, tempo e gravidade e sustenta tecnologias reais.', curiosity: 'Einstein não recebeu o Nobel pela relatividade, mas por sua explicação do efeito fotoelétrico.', connections: ['Einstein', 'Espaço-tempo', 'GPS', 'Quântica'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/2Zs5w2yrP9FGzY3Uq81CdY',
      title: 'Relatividade Geral (SciCast #321)',
      caption: '2 h 3 min · SciCast',
      sourceLabel: 'Spotify · SciCast',
      sourceUrl: 'https://open.spotify.com/episode/2Zs5w2yrP9FGzY3Uq81CdY',
    ),
  ],
);

const buracosNegrosTopic = KnowledgeTopic(
  id: 'buracos-negros', eyebrow: 'CIÊNCIA / UNIVERSO', title: 'O QUE EXISTE DENTRO DE UM BURACO NEGRO?',
  summary: 'Sabemos muito sobre seus efeitos externos; o interior leva nossas teorias aos seus limites.', minutes: 7, tags: ['ciência', 'astronomia'],
  quickTake: 'Um buraco negro é uma região da qual, após o horizonte de eventos, nem a luz consegue escapar para longe.', simpleExplanation: 'Imagine um limite que pode ser atravessado para dentro, mas do qual nenhuma mensagem consegue voltar para um observador distante.', example: 'Em 2019, o Event Horizon Telescope publicou a primeira imagem da sombra de um buraco negro, no centro da galáxia M87.',
  body: ['Buracos negros podem se formar pelo colapso de estrelas massivas e também existem em escalas supermassivas no centro de galáxias.', 'O horizonte de eventos não é uma superfície sólida; é um limite causal.', 'A relatividade geral prevê uma singularidade em soluções simples, sinal de que nossa descrição física fica incompleta em condições extremas.', 'Matéria aquecida ao redor pode emitir enorme quantidade de radiação antes de cruzar o horizonte.', 'Ondas gravitacionais permitem observar fusões de buracos negros.'], remember: ['Horizonte não é superfície sólida.', 'Não vemos o buraco negro diretamente, mas seus efeitos.', 'O interior expõe limites da física atual.'],
  whyItMatters: 'Eles são laboratórios naturais para gravidade extrema e evolução de galáxias.', curiosity: 'O buraco negro fotografado em M87 está a dezenas de milhões de anos-luz da Terra.', connections: ['Relatividade', 'Galáxias', 'Ondas gravitacionais', 'Event Horizon Telescope'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/3yP1xcoqxHjx7p1Wh2M6ha',
      title: 'O mistério dos buracos negros',
      caption: '1 h 13 min · Podcast Aylton do Amaral',
      sourceLabel: 'Spotify · Podcast Aylton do Amaral',
      sourceUrl: 'https://open.spotify.com/episode/3yP1xcoqxHjx7p1Wh2M6ha',
    ),
  ],
);

const vacinasTopic = KnowledgeTopic(
  id: 'vacinas', eyebrow: 'CIÊNCIA / SAÚDE', title: 'COMO UMA VACINA TREINA O SISTEMA IMUNE?',
  summary: 'Vacinas apresentam ao organismo informações ou componentes que ajudam a preparar uma resposta futura.', minutes: 7, tags: ['ciência', 'saúde'],
  quickTake: 'Vacinação cria memória imunológica sem exigir que a pessoa enfrente todos os riscos da doença natural.', simpleExplanation: 'É como mostrar ao sistema imune um retrato ou uma versão segura de um invasor para que ele reconheça o alvo mais rapidamente depois.', example: 'Após vacinação, células de memória podem acelerar a produção de respostas específicas numa exposição posterior.',
  body: ['Vacinas podem usar tecnologias diferentes: vírus atenuados, inativados, proteínas, vetores ou material genético, entre outras.', 'O sistema imune reconhece antígenos e ativa respostas celulares e de anticorpos.', 'Memória imunológica permite reação mais rápida em exposições futuras.', 'Nenhuma intervenção médica é absolutamente livre de risco, por isso segurança e eficácia são avaliadas em estudos e vigilância.', 'Quando muitas pessoas estão protegidas, a circulação de determinados agentes pode cair e beneficiar também a comunidade.'], remember: ['Existem várias tecnologias de vacina.', 'Memória imunológica é central.', 'Benefícios e riscos são avaliados continuamente.'],
  whyItMatters: 'Vacinação está entre as ferramentas de saúde pública que mais reduziram doença e mortalidade infecciosa.', curiosity: 'A varíola foi declarada erradicada mundialmente em 1980 após uma campanha global de vacinação.', connections: ['Imunidade', 'Vírus', 'Ensaios clínicos', 'Saúde pública'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/7fol54EJXNcHutpdor17PR',
      title: 'Conexão Vacinas - Episódio 1',
      caption: '5 min 49 s · Conexão Ciência C²',
      sourceLabel: 'Spotify · Conexão Ciência C²',
      sourceUrl: 'https://open.spotify.com/episode/7fol54EJXNcHutpdor17PR',
    ),
  ],
);

const sonoTopic = KnowledgeTopic(
  id: 'sono', eyebrow: 'CIÊNCIA / COTIDIANO', title: 'POR QUE PRECISAMOS DORMIR?',
  summary: 'Sono participa de memória, regulação metabólica, imunidade e funcionamento cerebral.', minutes: 7, tags: ['ciência', 'psicologia'],
  quickTake: 'Dormir não é simplesmente desligar: o cérebro alterna estados ativos com funções diferentes.', simpleExplanation: 'Durante a noite, passamos repetidamente por estágios de sono NREM e REM em ciclos.', example: 'Uma noite de sono pode ajudar a consolidar parte do que foi aprendido durante o dia.',
  body: ['O sono é regulado por processos circadianos e pela pressão de sono que aumenta enquanto ficamos acordados.', 'Estágios NREM incluem fases de sono mais profundo, enquanto REM costuma concentrar sonhos vívidos.', 'Memória e aprendizagem são influenciadas pelo sono, embora não exista uma única função que explique por que dormimos.', 'Privação de sono prejudica atenção, tempo de reação e tomada de decisão.', 'Luz, horários, cafeína e rotina podem alterar o momento e a qualidade do sono.'], remember: ['Sono tem vários estágios.', 'Ritmo circadiano regula o horário.', 'Privação afeta cognição e corpo.'],
  whyItMatters: 'Entender sono ajuda a interpretar produtividade, memória e hábitos sem tratá-lo como tempo perdido.', curiosity: 'O cérebro permanece metabolicamente ativo durante o sono e muda de padrão várias vezes ao longo da noite.', connections: ['Memória', 'Ritmo circadiano', 'Sonhos', 'Cafeína'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/5wNPPxo2IyyS3kpfI7qq4a',
      title: 'A ciência do sono com Altay de Souza',
      caption: '2 h 48 min · Os três elementos',
      sourceLabel: 'Spotify · Os três elementos',
      sourceUrl: 'https://open.spotify.com/episode/5wNPPxo2IyyS3kpfI7qq4a',
    ),
  ],
);

const viesesTopic = KnowledgeTopic(
  id: 'vieses', eyebrow: 'PSICOLOGIA / MENTE', title: 'O QUE É UM VIÉS COGNITIVO?',
  summary: 'Atalhos mentais podem tornar decisões rápidas, mas também produzir erros previsíveis.', minutes: 7, tags: ['psicologia', 'comportamento'],
  quickTake: 'Viés cognitivo é uma tendência sistemática de julgamento, não simplesmente falta de inteligência.', simpleExplanation: 'Se você procura apenas exemplos que confirmam uma ideia que já tinha, pode estar sofrendo influência do viés de confirmação.', example: 'Depois de comprar um produto, você pode prestar mais atenção a avaliações que justificam sua escolha.',
  body: ['O cérebro precisa decidir sob tempo e informação limitados, por isso usa heurísticas.', 'Heurísticas podem ser úteis e ainda gerar padrões de erro em certos contextos.', 'Viés de confirmação favorece informação compatível com crenças existentes.', 'Efeito de ancoragem mostra como um número inicial pode influenciar estimativas posteriores.', 'Conhecer vieses não nos torna imunes a eles; bons processos e dados ajudam a reduzir sua influência.'], remember: ['Atalhos não são sempre ruins.', 'Vieses são padrões, não falhas morais.', 'Processos podem reduzir erros.'],
  whyItMatters: 'Ajuda a pensar melhor sobre decisões, notícias, dinheiro e discussões.', curiosity: 'Até especialistas podem demonstrar vieses; conhecimento do tema sozinho não garante decisões imparciais.', connections: ['Heurísticas', 'Decisão', 'Placebo', 'Pensamento crítico'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/6BrwFwmI3lfmIudeyexwiz',
      title: 'Como Usar o Design Para Aumentar as Vendas com Efeito Âncora',
      caption: '15 min · Design From Human',
      sourceLabel: 'Spotify · Design From Human',
      sourceUrl: 'https://open.spotify.com/episode/6BrwFwmI3lfmIudeyexwiz',
    ),
  ],
);

const jurosCompostosTopic = KnowledgeTopic(
  id: 'juros-compostos', eyebrow: 'ECONOMIA / DINHEIRO', title: 'POR QUE JUROS COMPOSTOS CRESCEM TANTO?',
  summary: 'Quando rendimentos se incorporam ao saldo, períodos seguintes rendem também sobre ganhos anteriores.', minutes: 7, tags: ['economia', 'finanças'],
  quickTake: 'Juros compostos são crescimento sobre uma base que muda ao longo do tempo.', simpleExplanation: 'Se R\$ 100 rendem 10%, viram R\$ 110; no período seguinte, os 10% incidem sobre R\$ 110, não apenas sobre os R\$ 100 iniciais.', example: 'O mesmo mecanismo que acelera investimentos de longo prazo também pode ampliar dívidas quando juros são altos.',
  body: ['Em juros simples, a base de cálculo permanece constante; em compostos, o saldo acumulado vira a nova base.', 'Tempo é uma variável poderosa porque cada período adiciona novas camadas de crescimento.', 'Taxa e frequência de capitalização alteram bastante o resultado final.', 'Inflação precisa ser considerada para avaliar crescimento real do poder de compra.', 'Em dívidas, juros compostos podem trabalhar contra o devedor da mesma forma matemática.'], remember: ['Rendimento passa a render.', 'Tempo amplifica diferenças.', 'Retorno nominal não é retorno real.'],
  whyItMatters: 'É fundamental para entender investimentos, financiamentos, cartões e planejamento de longo prazo.', curiosity: 'A regra dos 72 é uma aproximação popular para estimar em quantos anos um valor dobra a determinada taxa percentual anual.', connections: ['Inflação', 'Investimentos', 'Crédito', 'Valor do dinheiro'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/4JWqfzykw0OnQlO9DdMgNC',
      title: 'Como investir com juros compostos?',
      caption: '19 min · MoneyBar',
      sourceLabel: 'Spotify · MoneyBar',
      sourceUrl: 'https://open.spotify.com/episode/4JWqfzykw0OnQlO9DdMgNC',
    ),
  ],
);

const bolhasTopic = KnowledgeTopic(
  id: 'bolhas', eyebrow: 'ECONOMIA / HISTÓRIA', title: 'COMO NASCE UMA BOLHA FINANCEIRA?',
  summary: 'Expectativas, crédito e comportamento coletivo podem afastar preços de fundamentos por algum tempo.', minutes: 7, tags: ['economia', 'história'],
  quickTake: 'Uma alta forte de preço não prova sozinha que existe bolha; o conceito envolve dinâmica especulativa e expectativas.', simpleExplanation: 'Imagine comprar algo principalmente porque espera revendê-lo mais caro para outra pessoa, enquanto cada vez mais compradores fazem o mesmo.', example: 'A bolha das empresas ponto-com no fim dos anos 1990 combinou entusiasmo tecnológico real com avaliações extremamente elevadas em muitas empresas.',
  body: ['Bolhas são difíceis de identificar com certeza enquanto acontecem.', 'Crédito abundante pode aumentar capacidade de compra e alimentar altas de ativos.', 'Narrativas convincentes atraem participantes e podem justificar preços crescentes por algum tempo.', 'Quando expectativas mudam, vendas e desalavancagem podem acelerar quedas.', 'Nem toda inovação cercada por especulação é inútil; tecnologias reais podem sobreviver ao colapso de preços.'], remember: ['Alta de preço não basta para provar bolha.', 'Crédito pode amplificar ciclos.', 'Tecnologia real e especulação podem coexistir.'],
  whyItMatters: 'Ajuda a analisar euforia financeira sem depender apenas de histórias sobre enriquecimento rápido.', curiosity: 'A mania das tulipas holandesa é famosa, mas historiadores discutem o quanto versões populares exageram sua escala econômica.', connections: ['Bitcoin', 'Crédito', 'Ponto-com', 'Comportamento'],
);

const fotografiaTopic = KnowledgeTopic(
  id: 'fotografia', eyebrow: 'ARTE / TECNOLOGIA', title: 'COMO UMA CÂMERA CONGELA A LUZ?',
  summary: 'Lente, abertura, obturador e sensor ou filme controlam a formação e o registro de uma imagem.', minutes: 7, tags: ['arte', 'tecnologia'],
  quickTake: 'Fotografia é literalmente administrar luz no espaço e no tempo.', simpleExplanation: 'A lente forma a imagem; a abertura controla quanto entra; o obturador controla por quanto tempo; o sensor registra o resultado.', example: 'Uma exposição longa pode transformar faróis de carros em rastros luminosos.',
  body: ['Câmeras derivam do princípio da câmara escura, conhecido muito antes da fotografia moderna.', 'Aberturas maiores deixam entrar mais luz e também influenciam profundidade de campo.', 'Velocidade do obturador altera como movimento é registrado.', 'Sensibilidade do sensor, expressa como ISO, envolve compromissos de qualidade e ruído.', 'Composição e edição continuam sendo escolhas humanas mesmo quando a câmera automatiza exposição.'], remember: ['Abertura controla luz e profundidade.', 'Obturador controla tempo.', 'Em câmeras digitais, ISO ajusta o ganho e pode tornar o ruído mais visível.'],
  whyItMatters: 'Entender o triângulo de exposição melhora fotos mesmo em câmeras de celular.', curiosity: 'A primeira fotografia permanente conhecida exigiu uma exposição extremamente longa no século XIX.', connections: ['Cinema', 'Óptica', 'Luz', 'Composição'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/5uWIuQMlrVbKvDucC8IRvz',
      title: 'A fotografia foi inventada no Brasil',
      caption: '37 min · Nós na História',
      sourceLabel: 'Spotify · Nós na História',
      sourceUrl: 'https://open.spotify.com/episode/5uWIuQMlrVbKvDucC8IRvz',
    ),
  ],
  chapters: [
    KnowledgeChapter(
      title: 'Uma imagem é uma negociação com a luz',
      paragraphs: [
        'Imagine fotografar alguém correndo ao entardecer. Uma abertura maior permite a entrada de mais luz e pode desfocar o fundo; um obturador rápido ajuda a congelar o movimento, mas deixa menos tempo para registrar a cena. Uma exposição longa faz o contrário: coleta luz por mais tempo e pode transformar pessoas em borrões ou faróis em trilhas. A decisão não é descobrir uma configuração perfeita, mas escolher quais informações visuais importam.',
        'A abertura costuma aparecer como um número f. Um valor menor, como f/2,8, indica uma abertura relativamente ampla; f/11, uma abertura menor, considerando a mesma distância focal. A profundidade de campo depende também de distância, lente e tamanho do formato. É por isso que aumentar a abertura não produz sempre o mesmo desfoque em câmeras diferentes.',
      ],
    ),
    KnowledgeChapter(
      title: 'ISO ilumina a imagem, não a cena',
      paragraphs: [
        'Em uma câmera digital, aumentar o ISO normalmente altera o ganho do sinal e o modo como a câmera entrega a imagem. Isso não faz mais fótons atravessarem a lente: quem controla a luz capturada são principalmente a abertura, o tempo de exposição e a iluminação disponível. Em pouca luz, elevar o ISO pode ajudar a obter uma imagem clara sem reduzir a velocidade do obturador, mas também pode revelar ruído e limitar detalhes.',
        'Faça um experimento mental: duas fotos com mesma abertura e mesmo tempo recebem essencialmente a mesma quantidade de luz da cena. Se uma aparece mais clara ao elevar o ISO, isso não significa que a lente capturou mais luz. Entender essa diferença permite escolher entre movimento congelado, granulação aceitável e uma imagem escura que possa ser ajustada depois.',
      ],
    ),
    KnowledgeChapter(
      title: 'Fotografar também é editar a realidade',
      paragraphs: [
        'O enquadramento decide o que fica dentro e fora da imagem; a altura da câmera muda relações entre pessoas e objetos; a distância focal altera o campo de visão e, junto com a posição do fotógrafo, influencia a perspectiva. Mesmo sem filtros, toda fotografia envolve escolhas. Um retrato feito na altura dos olhos comunica algo diferente de outro registrado do alto ou muito de perto.',
        'O processamento digital acrescenta outras decisões: balanço de branco, contraste, redução de ruído e compressão. Celulares frequentemente combinam várias exposições antes de entregar um único arquivo. Isso não torna a fotografia menos legítima, mas ajuda a questionar a crença de que uma imagem fotográfica seria um registro completamente neutro ou idêntico ao que os olhos enxergam.',
      ],
    ),
  ],

);

const perspectivaTopic = KnowledgeTopic(
  id: 'perspectiva', eyebrow: 'ARTE / PERCEPÇÃO', title: 'COMO UM DESENHO CRIA PROFUNDIDADE NUM PAPEL PLANO?',
  summary: 'Perspectiva usa relações geométricas e pistas visuais para representar espaço tridimensional.', minutes: 7, tags: ['arte', 'design'],
  quickTake: 'Linhas convergentes, escala e sobreposição fazem o cérebro interpretar profundidade.', simpleExplanation: 'Trilhos paralelos parecem se aproximar à distância; a perspectiva linear organiza esse efeito usando pontos de fuga.', example: 'Pintores renascentistas sistematizaram métodos geométricos para criar interiores e cidades convincentes.',
  body: ['A perspectiva linear foi sistematizada na Itália do século XV, embora culturas anteriores já usassem várias formas de representar profundidade.', 'Um ponto de fuga organiza linhas paralelas numa determinada direção.', 'Objetos mais distantes costumam ser representados menores.', 'Perspectiva atmosférica usa contraste e cor para sugerir grandes distâncias.', 'Fotografia herdou muitas convenções espaciais que hoje parecem naturais aos nossos olhos.'], chapters: [
  KnowledgeChapter(title: 'Por que linhas paralelas parecem se encontrar', paragraphs: [
    'Quando olhamos para trilhos retos que se afastam, eles podem parecer aproximar-se em direção ao horizonte, apesar de sua distância real permanecer constante. A perspectiva linear organiza esse efeito numa superfície plana, usando uma linha do horizonte e pontos de fuga para construir uma representação coerente a partir de determinado ponto de vista.',
    'O procedimento não copia automaticamente a visão humana inteira. Ele pressupõe escolhas geométricas e funciona melhor quando entendemos a posição do observador. Há obras que rejeitam deliberadamente esse recurso para expressar ideias, organizar narrativas ou mostrar vários pontos de vista.',
  ]),
  KnowledgeChapter(title: 'Uma invenção visual com história', paragraphs: [
    'Experimentos associados a Filippo Brunelleschi, no início do século XV, ajudaram a demonstrar maneiras de representar espaço por regras geométricas. Leon Battista Alberti posteriormente sistematizou princípios importantes para pintores. Esses desenvolvimentos ocorreram em diálogo com outros conhecimentos e tradições de representação espacial.',
    'Desenhar uma sala com perspectiva de um ponto pode ser um teste simples: trace uma linha de horizonte, marque um ponto de fuga e conduza até ele as linhas de profundidade do piso e do teto. Manter verticais e horizontais coerentes facilita ver como a ilusão se forma.',
  ]),
  KnowledgeChapter(title: 'Profundidade não depende só da perspectiva linear', paragraphs: [
    'Um objeto pode parecer mais distante porque está parcialmente encoberto por outro, ocupa menos espaço na imagem ou apresenta contraste reduzido. Artistas combinam várias pistas visuais; perspectiva atmosférica, escala e sobreposição não são a mesma técnica, mas podem trabalhar juntas.',
    'A fotografia também registra efeitos de perspectiva conforme posição da câmera e distância aos objetos. Trocar o ponto de observação pode mudar bastante a percepção das proporções. Isso explica por que imagens com aparência objetiva ainda são resultados de escolhas de enquadramento.',
  ]),
 ],
 remember: ['Ponto de fuga organiza direção.', 'Tamanho relativo sugere distância.', 'Existem várias perspectivas possíveis.'],
  whyItMatters: 'Mostra que imagens aparentemente realistas dependem de convenções e matemática.', curiosity: 'Brunelleschi é associado a experimentos decisivos para a perspectiva linear no início do Renascimento.', connections: ['Renascimento', 'Fotografia', 'Geometria', 'Percepção'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/4Hy5iORnadMnJ9PrtB1OXN',
      title: 'Criar é DOM? O processo criativo do artista',
      caption: '55 min · Os Impossíveis',
      sourceLabel: 'Spotify · Os Impossíveis',
      sourceUrl: 'https://open.spotify.com/episode/4Hy5iORnadMnJ9PrtB1OXN',
    ),
  ],
);

const sushiTopic = KnowledgeTopic(
  id: 'sushi', eyebrow: 'GASTRONOMIA / HISTÓRIA', title: 'SUSHI SEMPRE FOI PEIXE CRU?',
  summary: 'O sushi nasceu de técnicas de conservação e evoluiu até formas muito diferentes das atuais.', minutes: 7, tags: ['gastronomia', 'história'],
  quickTake: 'Sushi é definido principalmente pelo arroz temperado, não pela presença obrigatória de peixe cru.', simpleExplanation: 'Um nigiri com peixe é sushi; sashimi sem arroz não é sushi.', example: 'O estilo nigiri tornou-se popular em Edo, atual Tóquio, como comida rápida urbana.',
  body: ['Formas antigas de conservar peixe com arroz fermentado existiram em partes da Ásia antes do sushi moderno.', 'No Japão, técnicas evoluíram até o arroz avinagrado substituir longos períodos de fermentação.', 'No período Edo, nigiri aproximou-se do formato reconhecido hoje.', 'Refrigeração e transporte moderno ampliaram ingredientes e segurança de distribuição.', 'Sushi contemporâneo varia enormemente dentro e fora do Japão.'], remember: ['Sushi não significa peixe cru.', 'Arroz temperado é central.', 'Nigiri se popularizou em Edo.'],
  whyItMatters: 'Ajuda a distinguir tradições culinárias de versões simplificadas que circulam globalmente.', curiosity: 'Sashimi é uma categoria diferente porque não exige arroz de sushi.', connections: ['Japão', 'Fermentação', 'Arroz', 'Cultura alimentar'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/2iXO9GaHP3mOU8hvWhjkvf',
      title: 'Roberto Veiga defende mais que salmão',
      caption: '38 min · Sushi Businessss',
      sourceLabel: 'Spotify · Sushi Businessss',
      sourceUrl: 'https://open.spotify.com/episode/2iXO9GaHP3mOU8hvWhjkvf',
    ),
  ],
);

const perfumeTopic = KnowledgeTopic(
  id: 'perfume', eyebrow: 'CULTURA / QUÍMICA', title: 'POR QUE UM PERFUME MUDA NA PELE?',
  summary: 'Volatilidade, concentração, temperatura e interação com a pele alteram a percepção ao longo do tempo.', minutes: 7, tags: ['cultura', 'ciência'],
  quickTake: 'Perfume é uma mistura de moléculas que evaporam em ritmos diferentes.', simpleExplanation: 'Moléculas mais voláteis aparecem rapidamente; outras permanecem por horas, fazendo a fragrância parecer evoluir.', example: 'Notas cítricas costumam aparecer cedo, enquanto madeiras e resinas podem durar muito mais.',
  body: ['Perfumes combinam materiais aromáticos naturais e sintéticos dissolvidos em um veículo.', 'A pirâmide de notas é uma linguagem útil de descrição, não compartimentos físicos separados no frasco.', 'Temperatura e área de aplicação afetam evaporação e projeção.', 'Pele, produtos usados e percepção individual podem mudar como uma fragrância é sentida.', 'Concentrações como eau de toilette e eau de parfum indicam famílias de formulação, mas não garantem sozinhas duração.'], remember: ['Notas evaporam em ritmos diferentes.', 'Pirâmide é modelo descritivo.', 'Concentração não determina tudo.'],
  whyItMatters: 'Dá vocabulário para escolher fragrâncias pelo comportamento real, não apenas pela primeira borrifada.', curiosity: 'Muitas moléculas sintéticas permitiram criar cheiros difíceis ou inviáveis de extrair diretamente da natureza.', connections: ['Química', 'Moda', 'Olfato', 'Design'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/6q3kQwFp1fcWoqEuRfD6qq',
      title: 'Luiz Paulo e Tânia Braga',
      caption: '43 min · Papo de perfumaria',
      sourceLabel: 'Spotify · Papo de perfumaria',
      sourceUrl: 'https://open.spotify.com/episode/6q3kQwFp1fcWoqEuRfD6qq',
    ),
  ],
);

const coresTopic = KnowledgeTopic(
  id: 'cores', eyebrow: 'DESIGN / PERCEPÇÃO', title: 'COR EXISTE FORA DO NOSSO CÉREBRO?',
  summary: 'Luz tem comprimentos de onda; cor é a experiência perceptiva criada pelo sistema visual.', minutes: 7, tags: ['design', 'ciência'],
  quickTake: 'Objetos não carregam uma etiqueta física chamada “azul”: eles refletem luz que nosso cérebro interpreta como cor.', simpleExplanation: 'Sob iluminações diferentes, a mesma superfície pode enviar combinações diferentes de luz aos olhos e ainda parecer relativamente estável.', example: 'Uma tela cria cores misturando luz RGB, enquanto impressão normalmente trabalha com pigmentos CMYK.',
  body: ['Cones na retina respondem a diferentes faixas do espectro visível.', 'O cérebro compara sinais e constrói experiências de cor.', 'Contexto visual altera percepção: a mesma cor pode parecer diferente ao lado de outras.', 'Mistura aditiva de luz e mistura subtrativa de pigmentos seguem princípios diferentes.', 'Sistemas de cor são ferramentas para reproduzir experiências de forma consistente em diferentes meios.'], remember: ['Cor é percepção.', 'RGB e CMYK funcionam de modos diferentes.', 'Contexto altera aparência.'],
  whyItMatters: 'É essencial para design, fotografia, interfaces e para entender ilusões visuais.', curiosity: 'Magenta não corresponde a um único comprimento de onda espectral; é uma percepção produzida pela combinação de sinais.', connections: ['Bauhaus', 'Fotografia', 'Óptica', 'Tipografia'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/2OrPMWBwZC7NPtZqScUICC',
      title: 'Por que seu cérebro te sabota (para o seu próprio bem)',
      caption: '13 min · LUDOCAST',
      sourceLabel: 'Spotify · LUDOCAST',
      sourceUrl: 'https://open.spotify.com/episode/2OrPMWBwZC7NPtZqScUICC',
    ),
  ],
);

const musicaTonalTopic = KnowledgeTopic(
  id: 'musica-tonal', eyebrow: 'MÚSICA / TEORIA', title: 'POR QUE ALGUMAS NOTAS PARECEM PEDIR RESOLUÇÃO?',
  summary: 'A música tonal cria expectativas por relações entre acordes, escala, repetição e cultura auditiva.', minutes: 7, tags: ['música', 'cultura'],
  quickTake: 'Tensão musical não está numa nota isolada: surge do contexto e das expectativas construídas.', simpleExplanation: 'Um acorde dominante antes da tônica costuma criar sensação de movimento que muitos ouvintes esperam ver resolvida.', example: 'Músicas podem adiar a resolução para aumentar expectativa antes de voltar ao centro tonal.',
  body: ['Tonalidade organiza notas e acordes em torno de centros percebidos.', 'Harmonia funcional descreve relações recorrentes entre acordes em muitas tradições ocidentais.', 'Consonância e dissonância dependem tanto de propriedades acústicas quanto de contexto e aprendizagem.', 'Ritmo e melodia também criam expectativas, não apenas harmonia.', 'Outras tradições musicais organizam altura e tensão de maneiras diferentes.'], remember: ['Contexto cria expectativa.', 'Tonalidade é um sistema, não uma lei universal.', 'Tensão pode ser adiada ou resolvida.'],
  whyItMatters: 'Ajuda a ouvir música percebendo arquitetura, não apenas melodia superficial.', curiosity: 'A cadência perfeita é uma das fórmulas de resolução mais reconhecíveis na música tonal ocidental.', connections: ['Jazz', 'Harmonia', 'Ritmo', 'Percepção'],
);

const democraciaAtenasTopic = KnowledgeTopic(
  id: 'democracia-atenas', eyebrow: 'HISTÓRIA / IDEIAS', title: 'A DEMOCRACIA NASCEU MESMO EM ATENAS?',
  summary: 'Atenas criou uma forma influente de participação política, mas muito diferente das democracias atuais.', minutes: 7, tags: ['história', 'sociedade'],
  quickTake: 'A democracia ateniense era direta para cidadãos elegíveis e excluía grande parte da população.', simpleExplanation: 'Em vez de eleger representantes para quase tudo, cidadãos podiam participar diretamente de assembleias e algumas funções eram sorteadas.', example: 'Mulheres, pessoas escravizadas e estrangeiros residentes não tinham cidadania política plena na Atenas clássica.',
  body: ['Reformas ao longo dos séculos VI e V a.C. ampliaram instituições participativas em Atenas.', 'A Assembleia permitia votação direta de cidadãos homens.', 'Sorteio era usado para diversos cargos como forma de reduzir concentração de poder.', 'A democracia coexistia com escravidão, guerra e exclusões profundas.', 'Experiências modernas de democracia representativa herdaram o termo, mas criaram instituições muito diferentes.'], remember: ['Era principalmente direta.', 'Cidadania era restrita.', 'Sorteio tinha papel político importante.'],
  whyItMatters: 'Ajuda a perceber que “democracia” mudou de significado e desenho institucional ao longo do tempo.', curiosity: 'A palavra deriva de demos, povo, e kratos, poder ou governo.', connections: ['Grécia', 'Cidadania', 'Filosofia', 'República'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/02ytO7POydAgsWx5lAD7vW',
      title: '004 Democracia Ateniense',
      caption: '1 h 3 min · Colunas de Hércules',
      sourceLabel: 'Spotify · Colunas de Hércules',
      sourceUrl: 'https://open.spotify.com/episode/02ytO7POydAgsWx5lAD7vW',
    ),
  ],
);

const escritaTopic = KnowledgeTopic(
  id: 'escrita', eyebrow: 'HISTÓRIA / LINGUAGEM', title: 'POR QUE INVENTAR A ESCRITA MUDOU TUDO?',
  summary: 'Registrar informação fora da memória humana permitiu novas formas de administração, cultura e transmissão de conhecimento.', minutes: 7, tags: ['história', 'linguagem'],
  quickTake: 'Escrita não surgiu uma única vez nem começou como literatura.', simpleExplanation: 'Uma lista de grãos ou impostos pode parecer banal, mas permite administrar recursos sem depender apenas da memória de uma pessoa.', example: 'Alguns dos registros mais antigos da Mesopotâmia estão ligados a contabilidade e administração.',
  body: ['Sistemas de escrita surgiram independentemente em diferentes regiões do mundo.', 'Na Mesopotâmia, marcas administrativas evoluíram para a escrita cuneiforme.', 'Escrita permite acumular informação entre pessoas, lugares e gerações.', 'Alfabetos representam apenas uma entre várias estratégias possíveis de escrita.', 'A alfabetização se expandiu de formas muito diferentes conforme tecnologia, instituições e educação.'], remember: ['Houve múltiplas invenções da escrita.', 'Administração foi um uso inicial importante.', 'Alfabeto não é o único sistema.'],
  whyItMatters: 'Sem escrita, Estados, ciência e memória cultural teriam escalas muito diferentes.', curiosity: 'A escrita cuneiforme foi usada para várias línguas durante milhares de anos.', connections: ['Mesopotâmia', 'Contabilidade', 'Imprensa', 'Linguagem'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/478UK94AQMItxwLacWWcs9',
      title: 'A Invenção da Escrita',
      caption: '2 min · Um Pouco da Nossa História',
      sourceLabel: 'Spotify · Um Pouco da Nossa História',
      sourceUrl: 'https://open.spotify.com/episode/478UK94AQMItxwLacWWcs9',
    ),
  ],
);

const imprensaTopic = KnowledgeTopic(
  id: 'imprensa', eyebrow: 'TECNOLOGIA / HISTÓRIA', title: 'COMO A IMPRENSA MUDOU A VELOCIDADE DAS IDEIAS?',
  summary: 'Tipos móveis e produção em escala reduziram o custo de copiar textos e ampliaram sua circulação.', minutes: 7, tags: ['tecnologia', 'história'],
  quickTake: 'A imprensa europeia do século XV não inventou livros, mas transformou sua reprodução.', simpleExplanation: 'Copiar um livro à mão pode levar meses; imprimir muitas cópias a partir de tipos reutilizáveis muda completamente a escala.', example: 'A Bíblia de Gutenberg tornou-se um símbolo da impressão europeia com tipos móveis.',
  body: ['Tecnologias de impressão já existiam na Ásia séculos antes de Gutenberg.', 'Na Europa, Johannes Gutenberg combinou tipos metálicos móveis, prensa e outros processos em meados do século XV.', 'Mais cópias ajudaram textos religiosos, científicos e políticos a circular com rapidez inédita.', 'Padronização facilitou referências compartilhadas, embora erros e desinformação também pudessem se espalhar.', 'Impressão ajudou a formar novos mercados de leitores e profissões.'], remember: ['Impressão existia antes de Gutenberg.', 'Escala e custo mudaram radicalmente.', 'Mais circulação não garante informação correta.'],
  whyItMatters: 'É um paralelo histórico poderoso para entender como novas mídias alteram sociedades.', curiosity: 'A Coreia já utilizava tipos móveis de metal antes da famosa Bíblia de Gutenberg.', connections: ['Renascimento', 'Escrita', 'Internet', 'Reforma'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/0qHp073h6tfBPAxJ02Aozi',
      title: 'Imprensa e ideologia política no Brasil',
      caption: '13 min · Soberania Informacional em Pauta',
      sourceLabel: 'Spotify · Soberania Informacional em Pauta',
      sourceUrl: 'https://open.spotify.com/episode/0qHp073h6tfBPAxJ02Aozi',
    ),
  ],
);

const oceanosTopic = KnowledgeTopic(
  id: 'oceanos', eyebrow: 'CIÊNCIA / PLANETA', title: 'POR QUE O OCEANO CONTROLA TANTO O CLIMA?',
  summary: 'A água armazena e transporta enorme quantidade de calor, conectando atmosfera, correntes e clima.', minutes: 7, tags: ['ciência', 'geografia'],
  quickTake: 'Oceanos funcionam como um gigantesco reservatório e sistema de transporte de energia.', simpleExplanation: 'Água aquece e esfria mais lentamente que o solo, moderando temperaturas de regiões costeiras.', example: 'Correntes transportam calor entre latitudes e influenciam padrões de chuva e temperatura.',
  body: ['Oceanos cobrem cerca de 71% da superfície terrestre.', 'Sua alta capacidade térmica permite absorver grande quantidade de energia.', 'Ventos, rotação da Terra, salinidade e temperatura ajudam a mover correntes.', 'Evaporação oceânica alimenta grande parte do ciclo global da água.', 'Mudanças na temperatura do oceano interagem com fenômenos como El Niño e La Niña.'], remember: ['Oceanos armazenam calor.', 'Correntes redistribuem energia.', 'Oceano e atmosfera formam um sistema acoplado.'],
  whyItMatters: 'Clima, pesca, tempestades e nível do mar dependem profundamente do estado dos oceanos.', curiosity: 'A maior parte do volume habitável do planeta está no oceano, não em terra firme.', connections: ['Clima', 'El Niño', 'Água', 'Mapas'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/4AZCH66FmHX6yfnxz6logm',
      title: 'Tiago Pitta e Cunha sobre a Conferência dos Oceanos',
      caption: '37 min · Azul',
      sourceLabel: 'Spotify · Azul',
      sourceUrl: 'https://open.spotify.com/episode/4AZCH66FmHX6yfnxz6logm',
    ),
  ],
);

const vulcoesTopic = KnowledgeTopic(
  id: 'vulcoes', eyebrow: 'CIÊNCIA / PLANETA', title: 'POR QUE EXISTEM VULCÕES?',
  summary: 'Calor interno, tectônica de placas e movimento de magma criam caminhos para material chegar à superfície.', minutes: 7, tags: ['ciência', 'geografia'],
  quickTake: 'Vulcões não aparecem aleatoriamente: muitos estão ligados a limites de placas ou pontos quentes.', simpleExplanation: 'Em algumas bordas de placas, uma placa mergulha sob outra e processos no manto favorecem a formação de magma.', example: 'O Círculo de Fogo do Pacífico concentra muitos vulcões e terremotos por causa de limites tectônicos.',
  body: ['A Terra mantém calor de sua formação e de decaimento radioativo interno.', 'Placas tectônicas se movem lentamente sobre camadas mais dúcteis do planeta.', 'Em zonas de subducção, dorsais oceânicas e pontos quentes, magma pode alcançar a crosta.', 'Composição do magma influencia viscosidade e estilo de erupção.', 'Vulcanismo também constrói novas terras e recicla materiais geológicos.'], remember: ['Muitos vulcões seguem limites de placas.', 'Magma e lava não são exatamente a mesma coisa.', 'Erupções têm estilos diferentes.'],
  whyItMatters: 'Vulcões conectam o interior da Terra à superfície e ajudam a explicar continentes, ilhas e riscos naturais.', curiosity: 'O arquipélago do Havaí se formou enquanto a placa do Pacífico se movia sobre um ponto quente.', connections: ['Tectônica', 'Terremotos', 'Oceanos', 'Havaí'],  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/0NDF0UEpsWnHnecJnWe2kO',
      title: 'Como vulcões moldam a vida?',
      caption: '29 min · Biologia em Meia Hora',
      sourceLabel: 'Spotify · Biologia em Meia Hora',
      sourceUrl: 'https://open.spotify.com/episode/0NDF0UEpsWnHnecJnWe2kO',
    ),
  ],
);

const egitoTopic = KnowledgeTopic(
  id: 'egito',
  eyebrow: 'HISTÓRIA / ANTIGUIDADE',
  title: 'COMO O EGITO ANTIGO DUROU MILÊNIOS?',
  summary:
      'O Egito antigo mudou muitas vezes, mas instituições duradouras, o Nilo e uma forte cultura política ajudaram seus reinos a se reorganizar por mais de três mil anos.',
  minutes: 8,
  tags: ['história', 'antiguidade'],
  quickTake:
      'A longevidade egípcia não veio de uma sociedade parada no tempo. Ela veio da capacidade de adaptar estruturas antigas a crises, invasões e novas dinastias.',
  simpleExplanation:
      'O Nilo funcionava como uma grande infraestrutura natural: suas cheias ajudavam a agricultura, o rio conectava cidades e o vale concentrava população. Sobre essa base, reis, templos, escribas e administrações criaram instituições que podiam sobreviver à troca de governantes.',
  example:
      'Mesmo quando o Egito se fragmentava politicamente, escribas continuavam usando tradições administrativas e religiosas antigas. Quando um novo poder reunificava o território, ele não precisava reconstruir tudo do zero.',
  body: [
    'A história do Egito faraônico costuma ser dividida em grandes períodos de centralização, como os Reinos Antigo, Médio e Novo, separados por fases de fragmentação política.',
    'O vale do Nilo favorecia agricultura intensiva e transporte por água, o que ajudava a conectar regiões distantes num território relativamente estreito.',
    'A escrita e a burocracia permitiam registrar impostos, propriedades, estoques, obras e decisões do Estado.',
    'Religião e poder político estavam profundamente ligados. Faraós mudavam, mas ideias sobre ordem, realeza e continuidade davam legitimidade às novas dinastias.',
    'O Egito também absorveu influências externas. Povos estrangeiros governaram partes do território em diferentes épocas, e ainda assim muitas instituições egípcias continuaram funcionando.',
    'Por isso, falar em três mil anos de Egito não significa imaginar uma única sociedade imutável, mas uma tradição que atravessou mudanças profundas.',
  ],
  remember: [
    'O Nilo ajudou agricultura, transporte e concentração populacional.',
    'A história egípcia alternou centralização e fragmentação.',
    'Continuidade cultural não significa ausência de mudança.',
  ],
  whyItMatters:
      'O Egito mostra como instituições, geografia e símbolos políticos podem dar continuidade a uma sociedade mesmo quando governantes e fronteiras mudam.',
  curiosity:
      'Cleópatra VII viveu muito mais perto da chegada do ser humano à Lua do que da construção das grandes pirâmides de Gizé.',
  connections: ['Nilo', 'Escrita', 'Pirâmides', 'Impérios antigos'],
  media: [
    KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: 'https://open.spotify.com/episode/3wNk6JKPxk2qnRJHwOatki',
      title: 'Egito Antigo: o que você aprendeu errado?',
      caption: '1 h 19 min · História FM',
      sourceLabel: 'Spotify · História FM',
      sourceUrl: 'https://open.spotify.com/episode/3wNk6JKPxk2qnRJHwOatki',
    ),
  ],
);
const mongolTopic = KnowledgeTopic(
  id: 'mongol',
  eyebrow: 'HISTÓRIA / IMPÉRIOS',
  title: 'COMO OS MONGÓIS CRIARAM UM IMPÉRIO GIGANTESCO?',
  summary:
      'Mobilidade, disciplina militar, informação rápida e capacidade de incorporar especialistas ajudaram os mongóis a conquistar territórios da China ao leste europeu.',
  minutes: 8,
  tags: ['história', 'geopolítica'],
  quickTake:
      'O sucesso mongol não veio só de cavalos ou brutalidade: organização, inteligência, logística e adaptação foram decisivos.',
  simpleExplanation:
      'Exércitos mongóis conseguiam se mover muito rápido porque dependiam de cavalos e levavam menos infraestrutura pesada que muitos adversários. Eles também coordenavam unidades, mensageiros e reconhecimento de território com grande eficiência.',
  example:
      'Um comandante podia receber informações de batedores, dividir suas forças em vários grupos e reuni-las depois num ponto combinado. Para o inimigo, isso fazia o exército parecer estar em vários lugares ao mesmo tempo.',
  body: [
    'No início do século XIII, Temujin unificou diferentes grupos das estepes e passou a ser conhecido como Gêngis Khan.',
    'A cavalaria era central, mas o diferencial também estava em organização, comunicação e capacidade de executar manobras coordenadas em grandes distâncias.',
    'Os mongóis incorporavam engenheiros, escribas, artesãos e especialistas de povos conquistados, usando conhecimentos locais em campanhas posteriores.',
    'Uma rede de estações de revezamento, conhecida como yam, facilitava circulação de mensageiros e informações pelo império.',
    'Depois de Gêngis Khan, seus sucessores ampliaram as conquistas e o império acabou dividido em grandes unidades políticas governadas por diferentes ramos da família.',
    'O domínio mongol também intensificou conexões comerciais e diplomáticas entre regiões da Eurásia, embora essas rotas continuassem perigosas e desiguais.',
  ],
  remember: [
    'Mobilidade e informação foram tão importantes quanto combate.',
    'Especialistas conquistados eram incorporados ao sistema mongol.',
    'O império depois se dividiu em vários canatos.',
  ],
  whyItMatters:
      'O caso mongol mostra como logística, comunicação e adaptação podem ser decisivas para o poder de um Estado, mesmo quando ele enfrenta sociedades muito maiores.',
  curiosity:
      'O chamado Império Mongol tornou-se o maior império terrestre contíguo da história.',
  connections: ['Gêngis Khan', 'Rota da Seda', 'China', 'Eurásia'],
);
const rotaSedaTopic = KnowledgeTopic(
  id: 'rota-seda',
  eyebrow: 'HISTÓRIA / TROCAS',
  title: 'A ROTA DA SEDA ERA UMA ÚNICA ESTRADA?',
  summary:
      'O nome descreve uma rede de rotas terrestres e marítimas que conectava partes da Ásia, Oriente Médio, África e Europa.',
  minutes: 7,
  tags: ['história', 'comércio'],
  quickTake:
      'A Rota da Seda não era uma rodovia contínua entre China e Europa. Mercadorias e ideias passavam por muitos intermediários e trajetos diferentes.',
  simpleExplanation:
      'Imagine uma encomenda que troca de caminhão, depósito e transportadora várias vezes antes de chegar ao destino. Algo parecido acontecia: um tecido podia viajar milhares de quilômetros sem que um único comerciante percorresse todo o caminho.',
  example:
      'Seda produzida na China podia passar por mercadores da Ásia Central, cidades persas e portos mediterrâneos antes de chegar a consumidores europeus.',
  body: [
    'As rotas que hoje chamamos de Rota da Seda existiram em diferentes formas durante muitos séculos.',
    'Elas conectavam cidades, oásis, portos e mercados através da Ásia Central e de outras regiões.',
    'Seda ficou famosa, mas especiarias, metais, cavalos, vidro, papel e muitos outros bens também circulavam.',
    'Religiões, técnicas, idiomas e conhecimentos viajavam junto com pessoas e mercadorias.',
    'A circulação também tinha efeitos negativos: redes comerciais podiam facilitar a propagação de doenças por longas distâncias.',
    'Mudanças políticas, guerras, novas rotas marítimas e transformações econômicas alteravam quais caminhos eram mais importantes em cada período.',
  ],
  remember: [
    'Era uma rede, não uma estrada única.',
    'Mercadorias passavam por muitos intermediários.',
    'Ideias e doenças também circulavam.',
  ],
  whyItMatters:
      'A Rota da Seda ajuda a enxergar globalização como um processo muito mais antigo que a internet ou os contêineres modernos.',
  curiosity:
      'O termo “Rota da Seda” foi popularizado apenas no século XIX, muito depois do auge de várias dessas redes comerciais.',
  connections: ['Mongóis', 'Comércio', 'China', 'Peste Negra'],
);
const vikingsTopic = KnowledgeTopic(
  id: 'vikings',
  eyebrow: 'HISTÓRIA / EUROPA',
  title: 'VIKINGS ERAM SÓ GUERREIROS?',
  summary:
      'As sociedades nórdicas da Era Viking incluíam agricultores, comerciantes, artesãos, navegadores, colonizadores e guerreiros.',
  minutes: 7,
  tags: ['história', 'cultura'],
  quickTake:
      '“Viking” descreve melhor uma atividade ligada a expedições do que todos os habitantes da Escandinávia medieval.',
  simpleExplanation:
      'Algumas pessoas saíam em expedições para negociar, explorar ou atacar. Muitas outras passavam a vida cultivando terras, criando animais e produzindo objetos em comunidades locais.',
  example:
      'Um navio nórdico podia servir a uma incursão militar, mas a mesma tecnologia naval também permitia comércio no Báltico, viagens até a Islândia e assentamentos no Atlântico Norte.',
  body: [
    'A chamada Era Viking costuma ser situada aproximadamente entre os séculos VIII e XI.',
    'Povos escandinavos desenvolveram embarcações leves e eficientes que navegavam tanto em mar aberto quanto em rios rasos.',
    'Ataques a mosteiros e cidades deram aos vikings uma reputação duradoura de violência, mas comércio e colonização também foram centrais.',
    'Mercadores nórdicos conectavam regiões do Atlântico Norte, Báltico e rotas que chegavam ao mundo bizantino e islâmico.',
    'Nórdicos fundaram assentamentos na Islândia, Groenlândia e, por um período, na América do Norte.',
    'Com o tempo, reinos escandinavos se cristianizaram e passaram por mudanças políticas que encerraram o período tradicionalmente chamado de Era Viking.',
  ],
  remember: [
    'Nem todo escandinavo medieval era “viking”.',
    'Navegação sustentava guerra, comércio e colonização.',
    'Os nórdicos chegaram à América do Norte antes de Colombo.',
  ],
  whyItMatters:
      'Separar o mito do guerreiro com capacete de chifres da história real revela sociedades conectadas a redes comerciais e políticas muito amplas.',
  curiosity:
      'Não há evidência de que guerreiros vikings usassem rotineiramente capacetes com chifres em batalha.',
  connections: ['Escandinávia', 'Comércio', 'Navegação', 'Cristianização'],
);
const maiasTopic = KnowledgeTopic(
  id: 'maias',
  eyebrow: 'HISTÓRIA / AMÉRICAS',
  title: 'POR QUE OS MAIAS NÃO DESAPARECERAM?',
  summary:
      'Algumas grandes cidades maias perderam população e poder, mas povos maias continuaram vivendo na Mesoamérica e existem até hoje.',
  minutes: 8,
  tags: ['história', 'américas'],
  quickTake:
      'O chamado “colapso maia” foi regional e político. Não foi o desaparecimento de um povo inteiro.',
  simpleExplanation:
      'É como uma região onde grandes centros urbanos entram em crise enquanto outras cidades e comunidades continuam existindo. O poder muda de lugar, mas a população e a cultura não somem.',
  example:
      'Muitas cidades das terras baixas do sul perderam importância entre os séculos VIII e X, enquanto centros no norte da península de Yucatán continuaram ativos.',
  body: [
    'A civilização maia ocupou uma ampla área que inclui partes do atual México, Guatemala, Belize, Honduras e El Salvador.',
    'Os maias nunca formaram um único império centralizado; existiam cidades-Estado e reinos com alianças e rivalidades.',
    'Entre os séculos VIII e X, várias cidades importantes das terras baixas do sul sofreram declínio populacional e político.',
    'Pesquisadores estudam combinações de seca, guerra, pressão ambiental e instabilidade política para explicar essas transformações.',
    'Outros centros maias continuaram existindo, e sociedades maias enfrentaram posteriormente a conquista espanhola.',
    'Hoje milhões de pessoas falam línguas maias e mantêm identidades culturais ligadas a essas tradições.',
  ],
  remember: [
    'Não existia um único Império Maia.',
    'O colapso foi desigual entre regiões.',
    'Povos maias existem no presente.',
  ],
  whyItMatters:
      'Esse tema mostra como a palavra “colapso” pode simplificar demais mudanças históricas complexas e apagar populações que continuam vivas.',
  curiosity:
      'A escrita maia é um dos sistemas de escrita mais desenvolvidos das Américas pré-colombianas e hoje pode ser lida em grande parte por especialistas.',
  connections: ['Mesoamérica', 'Cidades-Estado', 'Escrita', 'Astecas'],
);
const astecasTopic = KnowledgeTopic(
  id: 'astecas',
  eyebrow: 'HISTÓRIA / CIDADES',
  title: 'COMO TENOCHTITLÁN VIROU UMA MEGACIDADE?',
  summary:
      'A capital mexica cresceu numa ilha do lago Texcoco e combinou engenharia hidráulica, mercados, tributos e conexões por canais e calçadas.',
  minutes: 8,
  tags: ['história', 'cidade'],
  quickTake:
      'Tenochtitlán não era uma cidade improvisada: era um centro urbano planejado, conectado por água e por grandes vias elevadas.',
  simpleExplanation:
      'Construir numa ilha exigia controlar água, transporte e abastecimento. Os mexicas ampliaram áreas cultiváveis, criaram canais e conectaram a cidade às margens do lago.',
  example:
      'As chinampas — áreas agrícolas construídas em zonas rasas do lago — ajudavam a produzir alimentos perto de uma população urbana muito grande.',
  body: [
    'Tenochtitlán foi fundada no século XIV e se tornou a principal cidade do poder mexica no vale do México.',
    'A cidade ficava numa ilha e era conectada ao entorno por grandes calçadas elevadas.',
    'Canais funcionavam como vias de transporte, enquanto obras hidráulicas ajudavam a administrar água doce e áreas do lago.',
    'Mercados regionais movimentavam enorme variedade de produtos, e tributos de territórios subordinados alimentavam a economia da capital.',
    'Templos, palácios e bairros organizavam funções políticas, religiosas e residenciais.',
    'Após a conquista espanhola, grande parte da atual Cidade do México cresceu sobre e ao redor da antiga Tenochtitlán.',
  ],
  remember: [
    'A cidade foi construída numa ilha do lago Texcoco.',
    'Canais e calçadas eram parte da infraestrutura urbana.',
    'Tributos e comércio sustentavam uma grande população.',
  ],
  whyItMatters:
      'Tenochtitlán desmonta a ideia de que as Américas pré-colombianas não tinham grandes sistemas urbanos e de engenharia.',
  curiosity:
      'Relatos espanhóis do século XVI descrevem o tamanho e a movimentação dos mercados da região com grande espanto.',
  connections: ['Mexicas', 'Cidade do México', 'Chinampas', 'Mesoamérica'],
);
const incasTopic = KnowledgeTopic(
  id: 'incas',
  eyebrow: 'HISTÓRIA / ANDES',
  title: 'COMO OS INCAS ADMINISTRAVAM OS ANDES?',
  summary:
      'Estradas, depósitos, trabalho organizado e administradores locais permitiam governar um território enorme e montanhoso sem usar escrita alfabética.',
  minutes: 8,
  tags: ['história', 'américas'],
  quickTake:
      'O Estado inca conectava regiões por infraestrutura e obrigações de trabalho, não por uma economia baseada apenas em moedas e mercados.',
  simpleExplanation:
      'Imagine administrar cidades separadas por montanhas usando uma rede de estradas, mensageiros e armazéns. O governo precisava saber quem devia trabalhar, onde havia alimentos e como mover recursos rapidamente.',
  example:
      'Depósitos estatais ao longo de rotas podiam guardar alimentos, roupas e equipamentos para abastecer trabalhadores, exércitos e comunidades em momentos de necessidade.',
  body: [
    'O Tawantinsuyu, nome do Estado inca, expandiu-se rapidamente pelos Andes no século XV.',
    'Uma extensa rede viária conectava centros administrativos, áreas agrícolas e regiões muito distantes.',
    'Mensageiros conhecidos como chasquis corriam em revezamento para transportar informações.',
    'O sistema de mit’a organizava períodos de trabalho que comunidades deviam ao Estado para obras, agricultura, mineração e outras atividades.',
    'Quipus — conjuntos de cordões e nós — eram usados para registrar quantidades e informações administrativas.',
    'O governo também incorporava autoridades locais, reassentava populações e adaptava seu controle às realidades de diferentes regiões.',
  ],
  remember: [
    'Estradas eram infraestrutura política.',
    'Mit’a organizava trabalho devido ao Estado.',
    'Quipus eram instrumentos administrativos importantes.',
  ],
  whyItMatters:
      'O Império Inca mostra que Estados complexos podem organizar informação, trabalho e recursos de formas muito diferentes das instituições europeias modernas.',
  curiosity:
      'A rede de estradas andinas associada ao sistema inca alcançava dezenas de milhares de quilômetros.',
  connections: ['Andes', 'Quipus', 'Estradas', 'Impérios'],
);
const revolucaoIndustrialTopic = KnowledgeTopic(
  id: 'revolucao-industrial',
  eyebrow: 'HISTÓRIA / ECONOMIA',
  title: 'POR QUE A REVOLUÇÃO INDUSTRIAL MUDOU O COTIDIANO?',
  summary:
      'Máquinas, fábricas, novas fontes de energia e urbanização alteraram como bens eram produzidos, onde as pessoas viviam e como o trabalho era organizado.',
  minutes: 8,
  tags: ['história', 'economia'],
  quickTake:
      'A Revolução Industrial não foi apenas a invenção da máquina a vapor. Ela reorganizou energia, produção, trabalho, transporte e cidades.',
  simpleExplanation:
      'Antes, muitos produtos eram feitos em oficinas ou casas em pequenas quantidades. Fábricas reuniram máquinas, energia e trabalhadores no mesmo lugar, permitindo produzir em escalas muito maiores.',
  example:
      'Na indústria têxtil britânica, máquinas de fiação e tecelagem aumentaram a produção e ajudaram a transformar regiões inteiras em centros fabris.',
  body: [
    'A industrialização começou a ganhar força na Grã-Bretanha no século XVIII antes de se espalhar para outras regiões.',
    'Carvão mineral fornecia energia em grande escala, enquanto motores a vapor passaram a movimentar máquinas, minas, locomotivas e navios.',
    'A mecanização avançou cedo no setor têxtil, mas depois atingiu siderurgia, transportes e muitos outros ramos.',
    'O sistema fabril concentrou trabalhadores e horários, mudando profundamente a organização do trabalho.',
    'Cidades industriais cresceram rapidamente e enfrentaram problemas de habitação, saneamento, poluição e condições laborais.',
    'Ao longo do século XIX, novas tecnologias, ferrovias e produção em massa aceleraram a integração de mercados e a transformação social.',
  ],
  remember: [
    'Industrialização envolve mais que máquinas: energia e organização também mudaram.',
    'A Grã-Bretanha foi um dos primeiros grandes centros industriais.',
    'Urbanização e conflito trabalhista acompanharam o processo.',
  ],
  whyItMatters:
      'Grande parte da vida contemporânea — horários de trabalho, produção em massa, cidades industriais e cadeias globais — tem raízes nessa transformação.',
  curiosity:
      'O termo “Revolução Industrial” se popularizou depois que muitas das mudanças que ele descreve já estavam em andamento havia décadas.',
  connections: ['Máquina a vapor', 'Urbanização', 'Capitalismo industrial', 'Ferrovias'],
);
const primeiraGuerraTopic = KnowledgeTopic(
  id: 'primeira-guerra',
  eyebrow: 'HISTÓRIA / GUERRAS',
  title: 'POR QUE A PRIMEIRA GUERRA VIROU GUERRA DE TRINCHEIRAS?',
  summary:
      'No front ocidental, armas defensivas muito eficientes e exércitos enormes tornaram ataques frontais caros e ajudaram a criar um impasse de trincheiras.',
  minutes: 8,
  tags: ['história', 'geopolítica'],
  quickTake:
      'Trincheiras não foram falta de criatividade: elas eram resposta racional a metralhadoras, artilharia, arame farpado e dificuldade de avançar sem proteção.',
  simpleExplanation:
      'Atacar em campo aberto ficou muito mais perigoso do que defender uma posição preparada. Quando os dois lados perceberam isso, começaram a cavar e fortificar linhas cada vez mais extensas.',
  example:
      'Na Frente Ocidental, uma ofensiva podia conquistar poucos quilômetros ao custo de dezenas de milhares de baixas porque defensores tinham armas, abrigos e linhas sucessivas de proteção.',
  body: [
    'A guerra começou em 1914 após uma crise política desencadeada pelo assassinato do arquiduque Francisco Ferdinando, dentro de um sistema de alianças e tensões já existente.',
    'Planos iniciais apostavam em campanhas rápidas, mas o avanço alemão no oeste foi interrompido e os exércitos passaram a fortificar posições.',
    'Metralhadoras e artilharia aumentaram enormemente o poder defensivo.',
    'Trincheiras eram conectadas a abrigos, comunicações e linhas de suprimento, formando sistemas profundos em vez de simples valas.',
    'Novas tecnologias como gás, tanques e aviões tentaram romper o impasse com resultados variados.',
    'A guerra terminou em 1918 após esgotamento econômico, entrada dos Estados Unidos e colapso de impérios centrais.',
  ],
  remember: [
    'Trincheiras foram resposta ao poder defensivo.',
    'A guerra envolveu muito mais que a Frente Ocidental.',
    'Tecnologia mudou combate e escala de destruição.',
  ],
  whyItMatters:
      'A Primeira Guerra redesenhou fronteiras, derrubou impérios e criou condições políticas que influenciaram profundamente o século XX.',
  curiosity:
      'A linha de trincheiras na Frente Ocidental se estendia por centenas de quilômetros entre o Mar do Norte e a fronteira suíça.',
  connections: ['Segunda Guerra', 'Império Otomano', 'Nacionalismo', 'Tratado de Versalhes'],
);
const segundaGuerraTopic = KnowledgeTopic(
  id: 'segunda-guerra',
  eyebrow: 'HISTÓRIA / GUERRAS',
  title: 'POR QUE A SEGUNDA GUERRA FOI REALMENTE MUNDIAL?',
  summary:
      'Conflitos conectados na Europa, Ásia, África, oceanos e colônias mobilizaram dezenas de países e transformaram economias e populações civis em escala sem precedentes.',
  minutes: 9,
  tags: ['história', 'geopolítica'],
  quickTake:
      'A guerra não foi apenas Alemanha contra Aliados na Europa: Japão, China, União Soviética, impérios coloniais e frentes marítimas tornaram o conflito verdadeiramente global.',
  simpleExplanation:
      'Uma decisão militar numa região alterava produção, transporte e estratégia em outras partes do planeta. Combustível, alimentos, navios e soldados circulavam por uma rede mundial de guerra.',
  example:
      'Recursos e tropas de territórios coloniais foram mobilizados para campanhas no Norte da África, Europa, Ásia e Pacífico.',
  body: [
    'Na Europa, a invasão da Polônia pela Alemanha em 1939 levou Reino Unido e França a declarar guerra.',
    'Na Ásia, Japão já travava uma guerra de larga escala contra a China desde 1937.',
    'A invasão alemã da União Soviética em 1941 abriu uma frente gigantesca no leste europeu.',
    'O ataque japonês a Pearl Harbor levou os Estados Unidos diretamente ao conflito.',
    'A guerra mobilizou indústrias, ciência, propaganda e populações civis em escala extraordinária.',
    'O Holocausto e outros crimes em massa fizeram parte do caráter genocida e brutal do conflito.',
    'A rendição alemã ocorreu em maio de 1945; o Japão se rendeu em setembro após as bombas atômicas e a entrada soviética na guerra contra o Japão.',
  ],
  remember: [
    'Europa e Ásia já tinham conflitos conectados antes de 1941.',
    'Civis foram alvos e participantes centrais da guerra total.',
    'Holocausto foi um genocídio sistemático conduzido pela Alemanha nazista e seus colaboradores.',
  ],
  whyItMatters:
      'A guerra redefiniu fronteiras, acelerou a descolonização, criou novas instituições internacionais e estabeleceu bases da ordem mundial da Guerra Fria.',
  curiosity:
      'A Segunda Guerra foi o conflito mais letal da história, com dezenas de milhões de mortos militares e civis.',
  connections: ['Holocausto', 'Guerra Fria', 'ONU', 'Direitos Humanos'],
);
const direitosHumanosTopic = KnowledgeTopic(
  id: 'direitos-humanos',
  eyebrow: 'HISTÓRIA / DIREITO',
  title: 'DE ONDE VEIO A IDEIA MODERNA DE DIREITOS HUMANOS?',
  summary:
      'Ideias sobre dignidade e limites ao poder têm raízes antigas, mas o sistema internacional moderno ganhou forma sobretudo após as atrocidades da Segunda Guerra Mundial.',
  minutes: 8,
  tags: ['história', 'direito'],
  quickTake:
      'Direitos humanos modernos não nasceram de um único documento nem de uma única cultura; são resultado de longas disputas políticas, filosóficas e jurídicas.',
  simpleExplanation:
      'A ideia central é que certos direitos pertencem às pessoas por sua condição humana e não deveriam depender apenas da vontade de um governo.',
  example:
      'A Declaração Universal de 1948 afirma direitos civis, políticos, econômicos, sociais e culturais como referência comum para todos os povos.',
  body: [
    'Tradições religiosas, filosóficas e jurídicas de muitas sociedades discutiram deveres, dignidade e limites ao poder.',
    'Iluminismo, revoluções atlânticas e movimentos abolicionistas ajudaram a formular linguagens modernas de direitos individuais e cidadania.',
    'Essas declarações iniciais eram frequentemente excludentes na prática, especialmente em relação a mulheres, povos colonizados e pessoas escravizadas.',
    'Após a Segunda Guerra e o Holocausto, a criação da ONU abriu espaço para um sistema internacional mais explícito de proteção de direitos.',
    'A Declaração Universal dos Direitos Humanos foi adotada em 1948 como referência política e moral, embora não seja um tratado por si só.',
    'Tratados posteriores transformaram muitos princípios em obrigações jurídicas para Estados que os ratificaram.',
  ],
  remember: [
    'Direitos humanos têm história longa e disputada.',
    '1948 é um marco, não o começo absoluto.',
    'Declarações e tratados têm funções jurídicas diferentes.',
  ],
  whyItMatters:
      'A linguagem de direitos humanos estrutura debates atuais sobre liberdade, igualdade, trabalho, discriminação, migração e responsabilidade estatal.',
  curiosity:
      'A Declaração Universal foi elaborada por representantes de diferentes regiões e tradições jurídicas, não apenas por países europeus.',
  connections: ['ONU', 'Segunda Guerra', 'Abolicionismo', 'Direito internacional'],
);
const placasTectonicasTopic = KnowledgeTopic(
  id: 'placas-tectonicas',
  eyebrow: 'CIÊNCIA / PLANETA',
  title: 'OS CONTINENTES REALMENTE SE MOVEM?',
  summary:
      'A superfície sólida da Terra é dividida em placas que se deslocam alguns centímetros por ano sobre regiões mais quentes e deformáveis do manto.',
  minutes: 7,
  tags: ['ciência', 'geologia'],
  quickTake:
      'Continentes não deslizam sozinhos: eles fazem parte de grandes placas tectônicas que carregam crosta continental e oceânica.',
  simpleExplanation:
      'Imagine a casca de um ovo quebrada em grandes pedaços que se movem muito lentamente. Na Terra, esses pedaços podem se afastar, colidir ou deslizar lateralmente.',
  example:
      'O oceano Atlântico cresce lentamente porque nova crosta oceânica se forma ao longo da dorsal mesoatlântica enquanto as placas se afastam.',
  body: [
    'A litosfera terrestre é fragmentada em placas rígidas que se movem em escalas de milhões de anos.',
    'Em limites divergentes, placas se afastam e magma pode formar nova crosta.',
    'Em limites convergentes, uma placa pode mergulhar sob outra ou continentes podem colidir e formar cadeias de montanhas.',
    'Em limites transformantes, placas deslizam lateralmente e acumulam tensão que pode ser liberada em terremotos.',
    'O movimento está relacionado à dinâmica térmica do interior da Terra e às forças associadas à própria litosfera.',
    'A teoria da tectônica de placas unificou evidências antes separadas sobre vulcões, terremotos, montanhas e distribuição de fósseis.',
  ],
  remember: [
    'Placas carregam continentes e fundo oceânico.',
    'Elas se movem poucos centímetros por ano.',
    'Limites de placas concentram muitos terremotos e vulcões.',
  ],
  whyItMatters:
      'A tectônica de placas explica por que continentes, oceanos, terremotos e cadeias de montanhas estão ligados por um mesmo sistema planetário.',
  curiosity:
      'A velocidade de algumas placas é comparável ao crescimento de unhas humanas.',
  connections: ['Terremotos', 'Vulcões', 'Oceanos', 'Montanhas'],
);
const terremotosTopic = KnowledgeTopic(
  id: 'terremotos',
  eyebrow: 'CIÊNCIA / PLANETA',
  title: 'POR QUE A TERRA TREME?',
  summary:
      'Terremotos acontecem quando tensão acumulada nas rochas é liberada rapidamente, gerando ondas sísmicas que atravessam o planeta.',
  minutes: 7,
  tags: ['ciência', 'geologia'],
  quickTake:
      'O tremor não é causado pela placa inteira “batendo” de uma vez; normalmente ocorre quando uma falha geológica rompe após acumular tensão.',
  simpleExplanation:
      'Dobre lentamente uma régua: ela aguenta deformação até certo ponto. Quando a tensão supera a resistência, a energia é liberada de repente. Rochas podem se comportar de modo parecido.',
  example:
      'Na falha de San Andreas, placas deslizam lateralmente, mas partes da falha podem ficar travadas por anos antes de se moverem abruptamente.',
  body: [
    'Movimentos tectônicos deformam rochas e acumulam energia elástica em zonas de falha.',
    'Quando a resistência das rochas é superada, ocorre ruptura ou deslizamento súbito.',
    'Esse movimento produz ondas sísmicas que se propagam pelo interior e pela superfície da Terra.',
    'O hipocentro é o ponto no interior onde a ruptura começa; o epicentro é sua projeção na superfície.',
    'Magnitude descreve a energia liberada, enquanto intensidade descreve os efeitos observados em diferentes locais.',
    'Construção adequada, planejamento urbano e sistemas de alerta podem reduzir impactos, mas não é possível prever com precisão o momento exato de um grande terremoto.',
  ],
  remember: [
    'Terremotos liberam tensão acumulada em falhas.',
    'Magnitude e intensidade não são a mesma coisa.',
    'Risco depende também de construção e localização.',
  ],
  whyItMatters:
      'Entender terremotos ajuda a separar o fenômeno geológico do desastre social: a mesma energia pode causar impactos muito diferentes dependendo de infraestrutura e preparação.',
  curiosity:
      'Ondas sísmicas também ajudam cientistas a investigar o interior da Terra, porque mudam de velocidade e direção ao atravessar diferentes camadas.',
  connections: ['Placas tectônicas', 'Falhas', 'Tsunamis', 'Geologia'],
);
const auroraTopic = KnowledgeTopic(
  id: 'aurora',
  eyebrow: 'CIÊNCIA / CÉU',
  title: 'POR QUE O CÉU FICA VERDE NAS AURORAS?',
  summary:
      'Partículas carregadas vindas do Sol interagem com o campo magnético terrestre e excitam gases da alta atmosfera, que emitem luz.',
  minutes: 7,
  tags: ['ciência', 'astronomia'],
  quickTake:
      'O verde mais comum vem principalmente de oxigênio excitado em certas altitudes; outras condições podem produzir vermelho, azul ou violeta.',
  simpleExplanation:
      'É parecido com um letreiro de gás: energia entra nos átomos e, quando eles voltam a um estado de menor energia, liberam luz com cores características.',
  example:
      'Durante atividade solar intensa, mais partículas chegam à Terra e auroras podem aparecer em latitudes mais baixas do que o habitual.',
  body: [
    'O Sol emite continuamente partículas carregadas no chamado vento solar.',
    'O campo magnético da Terra desvia grande parte dessas partículas, mas canaliza algumas em direção às regiões polares.',
    'Ao colidir com oxigênio e nitrogênio na alta atmosfera, as partículas transferem energia para esses gases.',
    'Quando os átomos e moléculas liberam essa energia, emitem luz em comprimentos de onda específicos.',
    'Oxigênio costuma produzir o verde mais familiar e, em outras altitudes, vermelho; nitrogênio pode contribuir com azul e violeta.',
    'Auroras boreais e austrais são o mesmo fenômeno visto nos hemisférios norte e sul.',
  ],
  remember: [
    'Auroras ligam atividade solar e atmosfera terrestre.',
    'O campo magnético concentra partículas perto dos polos.',
    'A cor depende do gás e da altitude.',
  ],
  whyItMatters:
      'Auroras são uma manifestação visível do clima espacial, que também pode afetar satélites, comunicações e redes elétricas.',
  curiosity:
      'Tempestades geomagnéticas muito fortes já permitiram observar auroras a milhares de quilômetros das regiões polares.',
  connections: ['Sol', 'Campo magnético', 'Atmosfera', 'Clima espacial'],
);
const estrelasTopic = KnowledgeTopic(
  id: 'estrelas',
  eyebrow: 'CIÊNCIA / UNIVERSO',
  title: 'COMO NASCE E MORRE UMA ESTRELA?',
  summary:
      'Estrelas surgem quando nuvens de gás colapsam pela gravidade, acendem fusão nuclear e evoluem conforme sua massa inicial.',
  minutes: 8,
  tags: ['ciência', 'astronomia'],
  quickTake:
      'Massa é o fator central: estrelas parecidas com o Sol terminam de forma muito diferente das estrelas muito massivas.',
  simpleExplanation:
      'Uma estrela passa grande parte da vida equilibrando duas forças: gravidade puxando matéria para dentro e pressão gerada pela fusão empurrando para fora.',
  example:
      'O Sol transforma hidrogênio em hélio no núcleo. Quando esse combustível central mudar, ele se expandirá e entrará em uma nova fase de sua evolução.',
  body: [
    'Estrelas nascem em regiões de gás e poeira onde a gravidade concentra matéria em estruturas cada vez mais densas.',
    'Quando o núcleo fica quente e comprimido o suficiente, começa a fusão de hidrogênio, marcando uma fase estável chamada sequência principal.',
    'A massa inicial determina temperatura, luminosidade, duração e destino da estrela.',
    'Estrelas com massas próximas à do Sol podem se tornar gigantes vermelhas e terminar como anãs brancas.',
    'Estrelas muito mais massivas podem fundir elementos mais pesados e terminar em explosões de supernova.',
    'Após certas supernovas, o remanescente pode virar uma estrela de nêutrons ou, em casos extremos, um buraco negro.',
  ],
  remember: [
    'Estrelas nascem por colapso gravitacional.',
    'Fusão sustenta a maior parte de sua vida.',
    'A massa determina o destino final.',
  ],
  whyItMatters:
      'A evolução estelar explica de onde vêm muitos elementos químicos e conecta a história das estrelas à formação de planetas e da própria vida.',
  curiosity:
      'O Sol está aproximadamente no meio de sua fase estável de sequência principal.',
  connections: ['Fusão nuclear', 'Supernovas', 'Buracos negros', 'Elementos'],
);
const elementosTopic = KnowledgeTopic(
  id: 'elementos',
  eyebrow: 'CIÊNCIA / MATÉRIA',
  title: 'DE ONDE VÊM OS ÁTOMOS DO SEU CORPO?',
  summary:
      'Hidrogênio surgiu principalmente no universo primordial; muitos elementos mais pesados foram produzidos no interior de estrelas e em eventos estelares extremos.',
  minutes: 8,
  tags: ['ciência', 'química'],
  quickTake:
      'A frase “somos poeira de estrelas” é uma simplificação poética, mas tem base física: carbono, oxigênio e muitos outros elementos foram forjados por gerações anteriores de estrelas.',
  simpleExplanation:
      'O universo começou com poucos tipos de núcleos leves. Estrelas funcionam como fornos capazes de combinar núcleos e formar elementos mais pesados.',
  example:
      'O carbono presente em células e moléculas orgânicas foi produzido por reações nucleares em estrelas antes de entrar no material que formou o Sistema Solar.',
  body: [
    'Após o Big Bang, o universo era dominado por hidrogênio e hélio, com pequenas quantidades de outros núcleos leves.',
    'No interior das estrelas, fusão nuclear transforma elementos leves em outros mais pesados durante diferentes fases estelares.',
    'Estrelas massivas conseguem formar uma cadeia de elementos até regiões próximas ao ferro.',
    'Parte dos elementos mais pesados que o ferro surge em processos ricos em nêutrons associados a eventos como explosões estelares e fusões de estrelas de nêutrons.',
    'Quando estrelas perdem matéria ou explodem, enriquecem o gás interestelar com esses elementos.',
    'O Sistema Solar se formou a partir de material que já havia sido processado por gerações anteriores de estrelas.',
  ],
  remember: [
    'Hidrogênio é principalmente primordial.',
    'Estrelas produzem muitos elementos mais pesados.',
    'Eventos estelares espalham esse material pelo espaço.',
  ],
  whyItMatters:
      'A química do seu corpo faz parte da história cósmica: elementos biológicos só existem porque o universo passou por bilhões de anos de evolução estelar.',
  curiosity:
      'O ferro do sangue e o cálcio dos ossos não foram produzidos na Terra; seus átomos já existiam antes da formação do planeta.',
  connections: ['Estrelas', 'Supernovas', 'Química', 'Origem da vida'],
);
const antibioticosTopic = KnowledgeTopic(
  id: 'antibioticos',
  eyebrow: 'CIÊNCIA / SAÚDE',
  title: 'POR QUE ANTIBIÓTICO NÃO FUNCIONA CONTRA VÍRUS?',
  summary:
      'Antibióticos atuam em estruturas ou processos de bactérias. Vírus usam a maquinaria das células hospedeiras e não possuem muitos desses alvos.',
  minutes: 7,
  tags: ['ciência', 'saúde'],
  quickTake:
      'Antibióticos tratam infecções bacterianas específicas; tomar antibiótico contra resfriado ou gripe não ataca o vírus e ainda pode favorecer resistência bacteriana.',
  simpleExplanation:
      'É como usar uma chave para uma fechadura que não existe. Um antibiótico que bloqueia a parede bacteriana não consegue agir num vírus que nem possui essa parede.',
  example:
      'Penicilinas interferem na construção da parede celular de muitas bactérias. Vírus influenza não têm parede celular e, portanto, esse mecanismo não serve contra eles.',
  body: [
    'Bactérias são células completas, com estruturas e processos próprios para crescer e se dividir.',
    'Vírus são muito menores e dependem de células hospedeiras para produzir novas partículas virais.',
    'Diferentes classes de antibióticos atacam alvos como parede celular, ribossomos bacterianos ou certas enzimas.',
    'Como vírus não apresentam esses mesmos alvos, antibióticos não são tratamentos antivirais.',
    'Uso inadequado de antibióticos cria pressão seletiva que favorece bactérias resistentes.',
    'Algumas infecções virais podem ser tratadas com antivirais específicos, que usam mecanismos completamente diferentes.',
  ],
  remember: [
    'Antibiótico não é antiviral.',
    'O alvo do medicamento precisa existir no microrganismo.',
    'Uso inadequado favorece resistência bacteriana.',
  ],
  whyItMatters:
      'Entender essa diferença ajuda a evitar uso desnecessário de medicamentos e a compreender por que resistência antimicrobiana é um problema coletivo.',
  curiosity:
      'A descoberta da penicilina transformou a medicina, mas bactérias resistentes começaram a ser observadas poucos anos após sua introdução ampla.',
  connections: ['Bactérias', 'Vírus', 'Penicilina', 'Resistência antimicrobiana'],
);
const microbiomaTopic = KnowledgeTopic(
  id: 'microbioma',
  eyebrow: 'CIÊNCIA / CORPO',
  title: 'VOCÊ É UM ECOSSISTEMA?',
  summary:
      'O corpo humano abriga comunidades de microrganismos que variam entre pele, boca, intestino e outros ambientes e interagem com nossa fisiologia.',
  minutes: 8,
  tags: ['ciência', 'saúde'],
  quickTake:
      'Microbioma não é um único conjunto de “bactérias boas”. É uma comunidade diversa cuja composição muda com dieta, ambiente, idade, medicamentos e muitos outros fatores.',
  simpleExplanation:
      'Seu intestino funciona como um habitat. Diferentes microrganismos competem por recursos, produzem moléculas e interagem com células humanas.',
  example:
      'Algumas bactérias intestinais fermentam fibras que o corpo humano não digere diretamente e produzem compostos usados pelas células do intestino.',
  body: [
    'Microbiota é o conjunto de microrganismos de um ambiente; microbioma pode incluir também seus genes e o ecossistema associado.',
    'Diferentes partes do corpo oferecem condições distintas de oxigênio, acidez, umidade e nutrientes.',
    'No intestino, microrganismos participam da transformação de componentes da dieta e da produção de diversas moléculas.',
    'O sistema imune interage constantemente com essas comunidades e precisa distinguir relações toleráveis de ameaças reais.',
    'Antibióticos, dieta e doenças podem alterar a composição da microbiota, mas isso não significa que exista um único perfil “perfeito”.',
    'Pesquisas associam o microbioma a muitos aspectos da saúde, porém associação não é automaticamente prova de causa.',
  ],
  remember: [
    'Existem vários microbiomas no corpo.',
    'Diversidade e função importam mais que rótulos simples de “bom” ou “ruim”.',
    'Muitas relações ainda estão sendo estudadas.',
  ],
  whyItMatters:
      'O microbioma muda a visão do corpo humano de organismo isolado para sistema que convive continuamente com comunidades microbianas.',
  curiosity:
      'O conjunto de genes dos microrganismos intestinais supera em variedade o número de genes presentes no genoma humano.',
  connections: ['Imunidade', 'Antibióticos', 'Digestão', 'Fermentação'],
);
const memoriaTopic = KnowledgeTopic(
  id: 'memoria',
  eyebrow: 'PSICOLOGIA / CÉREBRO',
  title: 'POR QUE NOSSA MEMÓRIA NÃO É UMA GRAVAÇÃO?',
  summary:
      'Lembrar envolve reconstruir informações usando pistas, conhecimentos prévios e contexto — por isso memórias podem mudar sem que a pessoa perceba.',
  minutes: 8,
  tags: ['psicologia', 'neurociência'],
  quickTake:
      'Memória é útil justamente porque organiza e reconstrói experiências; o preço dessa flexibilidade é que detalhes podem ser distorcidos.',
  simpleExplanation:
      'Ao lembrar de uma cena, o cérebro não abre um arquivo de vídeo intacto. Ele recompõe partes do acontecimento usando traços armazenados e o que faz sentido no presente.',
  example:
      'Duas pessoas podem lembrar da mesma conversa com detalhes diferentes, especialmente quando a lembrança é evocada muitas vezes ou recebe informações novas depois.',
  body: [
    'Memória inclui sistemas diferentes para fatos, experiências, habilidades e informações mantidas por poucos segundos.',
    'Para uma experiência ser lembrada depois, ela precisa ser codificada, consolidada e recuperada.',
    'A recuperação depende de pistas e do contexto, o que explica por que certas lembranças aparecem diante de cheiros, lugares ou palavras específicas.',
    'Cada ato de lembrar pode tornar uma memória temporariamente maleável antes de ela ser armazenada novamente.',
    'Sugestões, expectativas e conhecimento prévio podem preencher lacunas e gerar lembranças sinceras, porém imprecisas.',
    'Isso não torna toda memória falsa; significa que recordar é um processo ativo e sujeito a erro.',
  ],
  remember: [
    'Memória possui vários sistemas.',
    'Recordar é reconstruir, não reproduzir um vídeo.',
    'Confiança numa lembrança não garante precisão absoluta.',
  ],
  whyItMatters:
      'Entender a natureza reconstrutiva da memória ajuda em aprendizagem, relações pessoais e interpretação de depoimentos e testemunhos.',
  curiosity:
      'Pesquisas de psicologia mostraram que a forma como uma pergunta é feita pode alterar detalhes que participantes relatam lembrar de um evento.',
  connections: ['Aprendizagem', 'Neuroplasticidade', 'Vieses', 'Sono'],
);
const dopaminaTopic = KnowledgeTopic(
  id: 'dopamina',
  eyebrow: 'PSICOLOGIA / CÉREBRO',
  title: 'DOPAMINA É O HORMÔNIO DO PRAZER?',
  summary:
      'Dopamina é um neurotransmissor envolvido em motivação, aprendizagem, movimento e expectativa de recompensa — não um simples “químico da felicidade”.',
  minutes: 7,
  tags: ['psicologia', 'neurociência'],
  quickTake:
      'Dopamina participa mais de aprender o que merece atenção e repetir comportamentos do que de produzir prazer isoladamente.',
  simpleExplanation:
      'Quando algo acontece melhor ou pior do que o esperado, certos circuitos dopaminérgicos ajudam o cérebro a atualizar expectativas. Isso influencia o que você aprende a buscar ou evitar.',
  example:
      'Se uma notificação traz uma recompensa inesperada, o cérebro pode aprender que vale a pena conferir o celular de novo — não porque dopamina seja “prazer líquido”, mas porque o sinal ajuda a reforçar previsão e comportamento.',
  body: [
    'Dopamina atua em diferentes circuitos do cérebro e também tem funções fora do sistema nervoso central.',
    'Alguns caminhos dopaminérgicos participam de motivação, recompensa e aprendizagem por reforço.',
    'Outros são importantes para controle do movimento; a perda de neurônios dopaminérgicos está relacionada à doença de Parkinson.',
    'A atividade dopaminérgica pode refletir diferenças entre recompensa esperada e recompensa obtida, chamadas de erros de previsão.',
    'Isso ajuda a explicar por que novidade, incerteza e antecipação podem ter grande força motivacional.',
    'Reduzir toda experiência de prazer ou vício a “dopamina alta” simplifica demais sistemas biológicos e psicológicos complexos.',
  ],
  remember: [
    'Dopamina não é sinônimo de prazer.',
    'Ela participa de aprendizagem e motivação.',
    'Diferentes circuitos dopaminérgicos têm funções diferentes.',
  ],
  whyItMatters:
      'Entender dopamina evita explicações pseudocientíficas para hábitos, motivação e uso de tecnologia.',
  curiosity:
      'Uma recompensa totalmente previsível pode gerar resposta diferente daquela provocada por uma recompensa inesperada.',
  connections: ['Hábitos', 'Recompensa', 'Parkinson', 'Aprendizagem'],
);
const habitosTopic = KnowledgeTopic(
  id: 'habitos',
  eyebrow: 'PSICOLOGIA / COMPORTAMENTO',
  title: 'COMO UM HÁBITO VIRA AUTOMÁTICO?',
  summary:
      'Com repetição em contextos semelhantes, ações podem depender cada vez menos de decisão consciente e mais de sinais ambientais.',
  minutes: 7,
  tags: ['psicologia', 'comportamento'],
  quickTake:
      'Hábitos não surgem por uma quantidade mágica de dias. Tempo, repetição, contexto e dificuldade do comportamento influenciam a automatização.',
  simpleExplanation:
      'Se você sempre faz algo depois do mesmo sinal — por exemplo, escova os dentes ao entrar no banheiro à noite — o contexto passa a “puxar” a ação com menos esforço consciente.',
  example:
      'Deixar uma garrafa de água sobre a mesa pode funcionar como pista visual e aumentar a chance de beber água sem precisar lembrar deliberadamente toda vez.',
  body: [
    'Um hábito é uma tendência de responder automaticamente a pistas recorrentes de contexto.',
    'Repetição fortalece a associação entre situação e comportamento, especialmente quando a ação é simples e estável.',
    'Recompensas podem ajudar no início, mas um hábito maduro pode continuar mesmo quando a recompensa imediata é pequena.',
    'Comportamentos complexos tendem a levar mais tempo para automatizar do que ações simples.',
    'Mudar o ambiente pode ser mais eficaz do que depender exclusivamente de força de vontade.',
    'Quebrar um hábito antigo costuma exigir identificar pistas e criar respostas alternativas, não apenas “parar”.',
  ],
  remember: [
    'Não existe um número universal de dias.',
    'Contexto repetido é uma pista poderosa.',
    'Ambiente pode facilitar ou dificultar hábitos.',
  ],
  whyItMatters:
      'Pensar em hábitos como relações entre contexto e comportamento ajuda a criar mudanças mais realistas do que depender só de motivação.',
  curiosity:
      'A popular ideia de “21 dias para formar um hábito” não é uma regra científica geral.',
  connections: ['Dopamina', 'Comportamento', 'Ambiente', 'Autocontrole'],
);
const linguagemCorporalTopic = KnowledgeTopic(
  id: 'linguagem-corporal',
  eyebrow: 'PSICOLOGIA / COMUNICAÇÃO',
  title: 'DÁ PARA LER ALGUÉM PELA LINGUAGEM CORPORAL?',
  summary:
      'Gestos, postura e expressão oferecem pistas sobre interação, mas não funcionam como um código universal capaz de revelar pensamentos com certeza.',
  minutes: 7,
  tags: ['psicologia', 'comunicação'],
  quickTake:
      'Cruzar os braços, desviar o olhar ou mexer as mãos não prova mentira, insegurança ou desinteresse sem considerar contexto e padrão individual.',
  simpleExplanation:
      'Um mesmo gesto pode ter motivos diferentes. Alguém pode cruzar os braços por frio, conforto, hábito ou tensão. Interpretar sem contexto cria conclusões frágeis.',
  example:
      'Evitar contato visual pode indicar desconforto em uma situação, mas também pode refletir cultura, neurodiversidade, timidez ou simplesmente concentração.',
  body: [
    'Comunicação não verbal inclui expressão facial, postura, distância, gestos, ritmo de fala e muitos outros sinais.',
    'Alguns padrões têm associações estatísticas com emoções ou intenções, mas raramente funcionam como provas isoladas.',
    'Contexto cultural altera o significado de gestos, distância interpessoal e contato visual.',
    'Pessoas também diferem muito em seu comportamento habitual, por isso mudanças em relação ao próprio padrão podem ser mais informativas que regras universais.',
    'Métodos populares de “detectar mentira” por um único gesto têm suporte científico fraco.',
    'Uma leitura responsável combina palavras, contexto, histórico da interação e múltiplas pistas — sempre com incerteza.',
  ],
  remember: [
    'Gesto isolado não revela intenção com certeza.',
    'Contexto e cultura importam.',
    'Detecção de mentira por linguagem corporal é limitada.',
  ],
  whyItMatters:
      'Evita julgamentos precipitados em entrevistas, relacionamentos e situações profissionais onde interpretações erradas podem ter consequências reais.',
  curiosity:
      'Mesmo profissionais treinados geralmente não identificam mentiras com precisão perfeita apenas observando comportamento não verbal.',
  connections: ['Comunicação', 'Vieses', 'Expressões faciais', 'Cultura'],
);
const pibTopic = KnowledgeTopic(
  id: 'pib',
  eyebrow: 'ECONOMIA / INDICADORES',
  title: 'O QUE O PIB MEDE — E O QUE ELE NÃO MEDE?',
  summary:
      'O Produto Interno Bruto mede o valor de bens e serviços finais produzidos numa economia durante determinado período.',
  minutes: 7,
  tags: ['economia', 'indicadores'],
  quickTake:
      'PIB ajuda a medir atividade econômica, mas não é uma medida completa de bem-estar, desigualdade, patrimônio ou sustentabilidade.',
  simpleExplanation:
      'Se uma economia produz mais carros, consultas médicas, softwares e outros bens e serviços finais, isso tende a aparecer no PIB. Mas o indicador não diz sozinho como essa renda foi distribuída.',
  example:
      'Dois países podem ter PIB por habitante semelhante e ainda apresentar diferenças grandes em desigualdade, saúde, segurança ou qualidade ambiental.',
  body: [
    'PIB soma o valor de produção final realizada dentro de um território em certo período.',
    'Ele pode ser calculado pelas óticas da produção, renda ou despesa; em teoria, as três chegam ao mesmo total.',
    'Na ótica da despesa, costuma-se organizar o PIB em consumo, investimento, gastos do governo e exportações líquidas.',
    'Para comparar crescimento ao longo do tempo, economistas usam medidas reais que descontam o efeito de preços.',
    'PIB per capita divide o total pela população, mas continua sendo uma média e não revela a distribuição de renda.',
    'Trabalho doméstico não remunerado, qualidade ambiental e vários aspectos de bem-estar ficam parcial ou totalmente fora do indicador.',
  ],
  remember: [
    'PIB mede produção, não felicidade.',
    'PIB nominal e real são diferentes.',
    'PIB per capita é uma média.',
  ],
  whyItMatters:
      'PIB aparece o tempo todo em notícias e decisões públicas; saber seus limites evita interpretar crescimento econômico como melhora automática de toda a sociedade.',
  curiosity:
      'Atividades de reconstrução após um desastre podem aumentar gastos e produção medidos pelo PIB mesmo quando houve grande perda de patrimônio e bem-estar.',
  connections: ['Inflação', 'Produtividade', 'Renda', 'Indicadores econômicos'],
);
const cambioTopic = KnowledgeTopic(
  id: 'cambio',
  eyebrow: 'ECONOMIA / MOEDAS',
  title: 'POR QUE O DÓLAR SOBE E DESCE?',
  summary:
      'Taxas de câmbio refletem oferta e demanda por moedas e respondem a juros, comércio, risco, expectativas e fluxos financeiros.',
  minutes: 8,
  tags: ['economia', 'finanças'],
  quickTake:
      'Não existe uma causa única para o câmbio. O mesmo dólar pode reagir a juros nos EUA, risco local, commodities, política fiscal ou mudanças globais de apetite por risco.',
  simpleExplanation:
      'Quando cresce a procura por dólares em relação à procura por reais, o preço do dólar em reais tende a subir. Quando ocorre o contrário, tende a cair.',
  example:
      'Uma empresa brasileira que precisa pagar uma dívida em dólares aumenta demanda pela moeda americana; já um investidor estrangeiro que traz dólares para comprar ativos no Brasil faz a operação inversa.',
  body: [
    'A taxa de câmbio é o preço de uma moeda em termos de outra.',
    'Em regimes flutuantes, operações de comércio, investimento e finanças influenciam continuamente oferta e demanda.',
    'Diferenças de juros podem alterar a atratividade relativa de ativos denominados em cada moeda.',
    'Percepção de risco e expectativas sobre inflação, crescimento e política econômica também afetam fluxos financeiros.',
    'Exportadores recebem moeda estrangeira enquanto importadores e devedores externos podem precisar comprá-la.',
    'Bancos centrais podem intervir no mercado, mas isso não significa que consigam fixar permanentemente qualquer taxa desejada num regime flutuante.',
  ],
  remember: [
    'Câmbio é um preço relativo.',
    'Juros e risco influenciam fluxos de capital.',
    'Comércio e finanças agem ao mesmo tempo.',
  ],
  whyItMatters:
      'O câmbio afeta preços de importados, viagens, dívidas, receitas de exportadores e parte da inflação, por isso aparece em quase toda discussão econômica.',
  curiosity:
      'Uma moeda “forte” não é automaticamente sinal de uma economia melhor; o nível do câmbio também altera competitividade de exportações e importações.',
  connections: ['Inflação', 'Juros', 'Comércio exterior', 'Bancos centrais'],
);
const acoesTopic = KnowledgeTopic(
  id: 'acoes',
  eyebrow: 'ECONOMIA / MERCADOS',
  title: 'O QUE VOCÊ COMPRA QUANDO COMPRA UMA AÇÃO?',
  summary:
      'Uma ação representa uma participação societária em uma empresa e dá ao investidor direitos econômicos e societários definidos por lei e pela classe do papel.',
  minutes: 8,
  tags: ['economia', 'finanças'],
  quickTake:
      'Comprar uma ação não é emprestar dinheiro à empresa como num título de dívida; é adquirir uma pequena parcela de propriedade.',
  simpleExplanation:
      'Se uma companhia divide seu capital em milhões de ações, cada papel representa uma fração muito pequena desse capital. Seu valor pode subir ou cair conforme expectativas sobre o negócio e o mercado.',
  example:
      'Uma empresa lucrativa pode distribuir parte do resultado aos acionistas por dividendos, mas não existe garantia de que isso aconteça em todo período.',
  body: [
    'Empresas podem emitir ações para captar capital e distribuir participação entre investidores.',
    'Acionistas assumem o risco residual do negócio: recebem valor depois que obrigações prioritárias são atendidas.',
    'Algumas classes de ações oferecem direito de voto; outras podem ter estruturas diferentes de direitos econômicos.',
    'O preço negociado em bolsa reflete expectativas de compradores e vendedores sobre resultados futuros, risco e alternativas de investimento.',
    'Dividendos são uma forma de distribuir resultados, mas empresas também podem reter lucros para reinvestir.',
    'Preço de mercado e valor contábil são conceitos diferentes e podem divergir bastante.',
  ],
  remember: [
    'Ação é participação, não empréstimo.',
    'Preço depende de expectativas futuras.',
    'Dividendos não são garantidos.',
  ],
  whyItMatters:
      'Entender o que uma ação representa ajuda a enxergar bolsa de valores como mercado de propriedade empresarial, e não apenas como um gráfico de preços.',
  curiosity:
      'Uma empresa pode valer na bolsa muito mais ou muito menos que seu patrimônio líquido contábil porque investidores precificam expectativas sobre o futuro.',
  connections: ['Bolsa', 'Dividendos', 'Valor de mercado', 'Contabilidade'],
);
const contabilidadeTopic = KnowledgeTopic(
  id: 'contabilidade',
  eyebrow: 'ECONOMIA / EMPRESAS',
  title: 'POR QUE A CONTABILIDADE USA DÉBITO E CRÉDITO?',
  summary:
      'Débito e crédito são lados de um sistema de registro em partidas dobradas que mantém o equilíbrio entre recursos, obrigações, patrimônio, receitas e despesas.',
  minutes: 8,
  tags: ['economia', 'contabilidade'],
  quickTake:
      'Na contabilidade, débito não significa necessariamente “coisa ruim” e crédito não significa necessariamente “dinheiro entrando”. Eles dependem da natureza da conta.',
  simpleExplanation:
      'Toda transação altera pelo menos duas partes do sistema. Se a empresa compra uma máquina à vista, aumenta um ativo chamado imobilizado e reduz outro ativo chamado caixa.',
  example:
      'Uma venda a prazo pode aumentar contas a receber e reconhecer receita no mesmo evento, mantendo o lançamento equilibrado entre débitos e créditos.',
  body: [
    'O método das partidas dobradas registra cada evento com valores equivalentes em pelo menos dois lados contábeis.',
    'Ativos normalmente aumentam por débito, enquanto passivos e patrimônio líquido normalmente aumentam por crédito.',
    'Receitas e despesas alimentam o resultado e, ao final, alteram o patrimônio líquido.',
    'O equilíbrio fundamental pode ser resumido pela relação entre ativos, passivos e patrimônio líquido.',
    'Esse sistema cria rastreabilidade e facilita detectar registros incompletos, embora equilíbrio matemático sozinho não garanta ausência de erro.',
    'Demonstrações como balanço patrimonial, DRE e fluxo de caixa organizam perspectivas diferentes da mesma realidade econômica.',
  ],
  chapters: [
    KnowledgeChapter(
      title: 'Por que existem dois lados em cada lançamento',
      paragraphs: [
        'Uma empresa compra uma máquina por dez mil reais e paga à vista. O imobilizado aumenta em dez mil e o caixa diminui no mesmo valor. O patrimônio total não cresce por causa dessa troca: mudou apenas a composição dos ativos. As partidas dobradas registram esses efeitos de forma conectada, permitindo acompanhar de onde veio cada movimentação.',
        'Agora imagine uma compra a prazo. A máquina entra no ativo e surge uma obrigação com o fornecedor. O dinheiro ainda não saiu do caixa, mas o fato econômico já aconteceu. Esse segundo exemplo mostra por que contabilidade não é uma simples lista de entradas e saídas de dinheiro.',
      ],
    ),
    KnowledgeChapter(
      title: 'O truque que evita confundir débito e crédito',
      paragraphs: [
        'Em contas do ativo, o débito costuma representar aumento; em contas do passivo e do patrimônio líquido, o crédito costuma representar aumento. Receitas geralmente aumentam por crédito e despesas, por débito. Essas regras descrevem a mecânica contábil, não um julgamento positivo ou negativo sobre a transação.',
        'Equilíbrio entre débitos e créditos é necessário, mas não suficiente para garantir demonstrações corretas. Se uma despesa for lançada na conta errada com a contrapartida certa, a soma ainda fechará. Por isso, classificação, documentos, competência e conciliações continuam indispensáveis.',
      ],
    ),
  ],
  remember: [
    'Débito e crédito não significam bom e ruim.',
    'Toda transação afeta pelo menos duas contas.',
    'Partidas dobradas preservam o equilíbrio contábil.',
  ],
  whyItMatters:
      'Contabilidade é a linguagem usada para transformar eventos de uma empresa em informação que gestores, investidores, bancos e governos conseguem analisar.',
  curiosity:
      'O sistema de partidas dobradas já era descrito em obras europeias do século XV e continua sendo a base da contabilidade moderna.',
  connections: ['Balanço', 'DRE', 'Fluxo de caixa', 'Ações'],
);
const supplyChainTopic = KnowledgeTopic(
  id: 'supply-chain',
  eyebrow: 'ECONOMIA / OPERAÇÕES',
  title: 'COMO UM PRODUTO ATRAVESSA O MUNDO ATÉ VOCÊ?',
  summary:
      'Uma cadeia de suprimentos conecta fornecedores, fábricas, estoques, transportes, centros de distribuição e clientes por fluxos físicos e de informação.',
  minutes: 8,
  tags: ['economia', 'operações'],
  quickTake:
      'Supply chain não é só transporte. Planejamento, compras, produção, estoque, dados e decisões sobre capacidade fazem parte do sistema.',
  simpleExplanation:
      'Para um tênis chegar à loja, materiais precisam existir no lugar certo, a fábrica precisa ter capacidade, o pedido precisa ser planejado e o transporte precisa conectar vários pontos sem atrasar.',
  example:
      'Se um componente barato falta, uma fábrica inteira pode parar mesmo tendo todos os outros materiais disponíveis.',
  body: [
    'Cadeias de suprimentos coordenam materiais, informações e dinheiro entre empresas e consumidores.',
    'Previsão de demanda ajuda a decidir quanto comprar, produzir e manter em estoque, mas toda previsão possui erro.',
    'Estoques protegem contra incerteza, porém custam capital, espaço e risco de obsolescência.',
    'Lead time mede o tempo entre uma necessidade e sua entrega e influencia quanto buffer o sistema precisa.',
    'Uma cadeia otimizada apenas para custo pode ficar vulnerável a interrupções, enquanto excesso de redundância também tem preço.',
    'Tecnologia melhora visibilidade, mas decisões continuam dependendo de prioridades como serviço, custo, velocidade e resiliência.',
  ],
  remember: [
    'Supply chain conecta mais que transporte.',
    'Estoque troca custo por proteção contra incerteza.',
    'Eficiência e resiliência podem entrar em tensão.',
  ],
  whyItMatters:
      'Crises logísticas, falta de chips e atrasos de produtos ficam muito mais compreensíveis quando você enxerga a cadeia como uma rede de dependências.',
  curiosity:
      'Uma peça de baixo valor pode ter impacto enorme se for o único componente que impede a conclusão de um produto caro.',
  connections: ['Logística', 'Estoque', 'Forecast', 'Produção'],
);
const criptografiaTopic = KnowledgeTopic(
  id: 'criptografia',
  eyebrow: 'TECNOLOGIA / SEGURANÇA',
  title: 'COMO A CRIPTOGRAFIA PROTEGE UMA MENSAGEM?',
  summary:
      'Criptografia transforma dados usando algoritmos e chaves para que apenas quem possui a informação correta consiga recuperar ou verificar o conteúdo.',
  minutes: 8,
  tags: ['tecnologia', 'segurança'],
  quickTake:
      'Segurança moderna não depende de esconder o algoritmo. Ela depende principalmente de chaves difíceis de descobrir e de métodos matemáticos bem analisados.',
  simpleExplanation:
      'Pense numa caixa com uma fechadura. O algoritmo define como a fechadura funciona; a chave define quem consegue abrir. Mesmo conhecendo o mecanismo, um invasor ainda precisa da chave correta.',
  example:
      'Em uma conexão HTTPS, criptografia ajuda a impedir que alguém no caminho leia ou altere facilmente os dados trocados entre seu navegador e o servidor.',
  body: [
    'Criptografia simétrica usa a mesma chave, ou chaves diretamente relacionadas, para cifrar e decifrar dados.',
    'Criptografia assimétrica utiliza pares de chaves com propriedades matemáticas diferentes, permitindo funções como troca segura de chaves e assinaturas digitais.',
    'Funções hash produzem resumos de tamanho fixo e são usadas para verificar integridade, armazenar senhas de forma apropriada e construir várias estruturas de segurança.',
    'Protocolos modernos combinam várias técnicas em vez de depender de um único algoritmo.',
    'A força de um sistema depende também de implementação, geração de chaves, armazenamento seguro e comportamento do usuário.',
    'Criptografia protege conteúdo e autenticidade, mas não resolve sozinha todos os problemas de privacidade e segurança.',
  ],
  remember: [
    'Algoritmo público pode continuar seguro.',
    'Chaves são centrais para o sistema.',
    'Hash, cifra e assinatura têm funções diferentes.',
  ],
  whyItMatters:
      'Mensagens, bancos, atualizações de software e compras online dependem de criptografia para funcionar com confiança em redes públicas.',
  curiosity:
      'Muitos sistemas modernos usam criptografia assimétrica apenas para estabelecer uma chave temporária e depois usam criptografia simétrica, que é mais eficiente para grandes volumes de dados.',
  connections: ['HTTPS', 'Assinatura digital', 'Senhas', 'Blockchain'],
  chapters: [
    KnowledgeChapter(
      title: 'Sigilo, integridade e autoria são problemas distintos',
      paragraphs: [
        'Imagine enviar um contrato pela internet. Você talvez queira impedir que terceiros leiam o conteúdo, perceber se alguém alterou uma linha e confirmar quem autorizou o documento. Essas são propriedades diferentes. A cifragem busca confidencialidade; mecanismos de autenticação e integridade ajudam a detectar adulterações; assinaturas digitais podem vincular uma assinatura a uma chave privada e permitir a verificação com a chave pública correspondente.',
        'Uma mensagem pode estar cifrada e ainda assim ter sido enviada pela pessoa errada se você não verificar com quem estabeleceu a conexão. Da mesma forma, uma assinatura digital pode ajudar a conferir a origem e a integridade de um documento sem esconder suas palavras. Saber formular o objetivo de segurança é tão importante quanto conhecer o nome de um algoritmo.',
      ],
    ),
    KnowledgeChapter(
      title: 'Por que misturamos técnicas diferentes',
      paragraphs: [
        'A criptografia simétrica usa uma chave secreta compartilhada e costuma ser eficiente para proteger grandes volumes de dados. Técnicas assimétricas trabalham com um par de chaves e podem ajudar a negociar segredos sem compartilhar antecipadamente a mesma chave por um canal inseguro. Protocolos modernos combinam essas peças, em vez de tentar fazer tudo com uma única fórmula.',
        'Um navegador ao acessar um serviço HTTPS precisa conferir uma identidade técnica e negociar material criptográfico para a sessão. Depois, a transmissão dos dados pode usar cifragem simétrica autenticada. Esse encadeamento ilustra uma regra de projeto: algoritmos respeitados não bastam se as chaves, os certificados e a implementação forem tratados de modo inadequado.',
      ],
    ),
    KnowledgeChapter(
      title: 'Hash não é uma mensagem trancada',
      paragraphs: [
        'Uma função hash criptográfica produz um resumo de tamanho definido a partir de um conteúdo. Não é uma cifra que alguém possa simplesmente abrir com uma chave: não existe um procedimento geral de decifrar o hash e recuperar a mensagem. O resumo pode ser usado como parte de verificações de integridade e de assinaturas, sempre considerando as propriedades e as limitações da função escolhida.',
        'Senhas exigem um cuidado adicional. Guardar apenas um hash rápido e comum costuma ser insuficiente quando um banco de dados vaza: atacantes podem testar muitas tentativas. Sistemas adequados usam técnicas de derivação deliberadamente custosas e sais individuais, além de outras defesas. Criptografia não apaga os riscos de golpes, dispositivos comprometidos nem falhas humanas; ela protege propriedades específicas dentro de um sistema maior.',
      ],
    ),
  ],

);
const cloudTopic = KnowledgeTopic(
  id: 'cloud',
  eyebrow: 'TECNOLOGIA / INFRAESTRUTURA',
  title: 'O QUE É A NUVEM DE VERDADE?',
  summary:
      'Computação em nuvem é o uso sob demanda de servidores, armazenamento, bancos de dados e outros recursos operados em data centers acessados por rede.',
  minutes: 7,
  tags: ['tecnologia', 'computação'],
  quickTake:
      'A nuvem não elimina computadores físicos: ela muda quem opera a infraestrutura e como recursos são contratados, escalados e distribuídos.',
  simpleExplanation:
      'Em vez de comprar um servidor para ficar anos numa sala da empresa, você pode alugar capacidade computacional por minutos ou horas e aumentar ou reduzir conforme a demanda.',
  example:
      'Um aplicativo pode executar em várias máquinas virtuais em um data center e criar novas instâncias automaticamente quando recebe mais acessos.',
  body: [
    'Provedores de nuvem mantêm grandes data centers com servidores, redes e sistemas de armazenamento.',
    'Virtualização e containers permitem compartilhar hardware físico entre muitas cargas de trabalho com isolamento lógico.',
    'Serviços de infraestrutura oferecem máquinas, redes e discos; plataformas gerenciadas também podem cuidar de bancos de dados, filas, funções e outras camadas.',
    'Elasticidade significa ajustar recursos conforme a necessidade, evitando comprar capacidade máxima o tempo todo.',
    'Regiões e zonas de disponibilidade ajudam a distribuir sistemas para reduzir impacto de falhas localizadas.',
    'Migrar para nuvem não elimina custos nem riscos: arquitetura, segurança e governança continuam sendo necessários.',
  ],
  remember: [
    'Nuvem continua sendo hardware físico.',
    'Elasticidade é uma vantagem central.',
    'Serviço gerenciado troca controle por conveniência.',
  ],
  whyItMatters:
      'Grande parte dos aplicativos modernos depende de infraestrutura em nuvem; entendê-la ajuda a enxergar o que existe por trás de serviços aparentemente “imateriais”.',
  curiosity:
      'Muitos aplicativos que você usa todos os dias podem mudar de servidor físico sem que você perceba.',
  connections: ['Data centers', 'Containers', 'Internet', 'Escalabilidade'],
);
const gpsTopic = KnowledgeTopic(
  id: 'gps',
  eyebrow: 'TECNOLOGIA / ESPAÇO',
  title: 'COMO O GPS SABE ONDE VOCÊ ESTÁ?',
  summary:
      'Receptores calculam posição medindo o tempo de chegada de sinais de vários satélites cujas órbitas e relógios são conhecidos com grande precisão.',
  minutes: 8,
  tags: ['tecnologia', 'geografia'],
  quickTake:
      'Seu celular não precisa enviar um pedido aos satélites para receber localização GPS. Ele escuta sinais e calcula distâncias.',
  simpleExplanation:
      'Se você souber sua distância até vários pontos conhecidos, consegue descobrir onde está. O GPS faz algo parecido usando o tempo que sinais de rádio levam para chegar.',
  example:
      'Um erro de apenas microssegundos na medição do tempo representa centenas de metros de erro na distância, por isso sincronização precisa é essencial.',
  body: [
    'Satélites GPS transmitem continuamente dados sobre tempo e posição orbital.',
    'O receptor compara o horário de transmissão com o horário de chegada do sinal para estimar distância até cada satélite.',
    'Com sinais de pelo menos quatro satélites, pode estimar latitude, longitude, altitude e corrigir o erro do próprio relógio.',
    'Relógios atômicos nos satélites fornecem referência extremamente estável.',
    'Efeitos previstos pelas teorias da relatividade alteram a marcha desses relógios e precisam ser corrigidos.',
    'Prédios, relevo e atmosfera podem degradar o sinal; celulares combinam GPS com outras fontes como Wi-Fi e sensores.',
  ],
  remember: [
    'GPS mede tempo de viagem de sinais.',
    'Quatro satélites permitem corrigir também o relógio do receptor.',
    'Relatividade é relevante para a precisão.',
  ],
  whyItMatters:
      'GPS sustenta navegação, agricultura, logística, sincronização de redes e muitas infraestruturas que vão muito além de mapas no celular.',
  curiosity:
      'Além do GPS americano, existem outros sistemas globais de navegação por satélite, como Galileo, GLONASS e BeiDou.',
  connections: ['Satélites', 'Relatividade', 'Mapas', 'Navegação'],
  chapters: [
    KnowledgeChapter(
      title: 'Os satélites transmitem; o celular faz a conta',
      paragraphs: [
        'Cada satélite de navegação transmite informações sobre sua posição orbital e o instante em que enviou o sinal. O receptor compara esse tempo com o instante de recebimento e estima a distância percorrida pela onda de rádio. Como o sinal viaja à velocidade da luz, diferenças minúsculas de tempo representam distâncias consideráveis. O celular não precisa perguntar ao satélite onde está: ele escuta mensagens transmitidas continuamente.',
        'Uma medida isolada localiza o receptor em algum ponto de uma superfície possível ao redor de um satélite. Ao combinar medidas de vários satélites, essas possibilidades se cruzam. No posicionamento tridimensional convencional, pelo menos quatro sinais permitem estimar três coordenadas e o desajuste do relógio do aparelho. O processo é chamado trilateração, porque trabalha com distâncias estimadas, não com ângulos.',
      ],
    ),
    KnowledgeChapter(
      title: 'Por que relógios e relatividade importam',
      paragraphs: [
        'Satélites possuem relógios de grande estabilidade, mas o celular usa um relógio muito menos preciso. O cálculo de posição precisa resolver também essa diferença. Um erro de tempo de apenas um microssegundo equivale a cerca de trezentos metros percorridos pela luz, antes de considerar outros fatores. É por isso que o quarto satélite não é simplesmente um luxo para deixar o mapa mais bonito.',
        'Os relógios em órbita também não marcam o tempo exatamente como relógios na superfície. Velocidade e diferença de campo gravitacional produzem efeitos previstos pela relatividade; os sistemas de navegação aplicam correções apropriadas para não acumular erros. Uma teoria que parece distante do cotidiano entra em ação quando alguém pede uma rota no celular.',
      ],
    ),
    KnowledgeChapter(
      title: 'A precisão depende do mundo ao redor',
      paragraphs: [
        'Em céu aberto, sinais vindos de diferentes direções ajudam o cálculo. Entre prédios altos, parte deles pode ser bloqueada ou refletida antes de chegar ao receptor. A atmosfera e a geometria da constelação também influenciam o resultado. Por isso, a localização exibida pelo aplicativo é uma estimativa com incerteza, e não um ponto perfeito conhecido pelo satélite.',
        'Celulares podem combinar sinais de diferentes constelações de navegação, redes móveis, Wi-Fi e sensores internos para melhorar a experiência. Um exemplo: dentro de um shopping, o aparelho pode continuar sugerindo seu deslocamento mesmo com pouca recepção dos satélites. Vale distinguir três coisas: o GPS calcula uma posição, o aplicativo escolhe como mostrá-la e uma base de mapas decide quais ruas existem.',
      ],
    ),
  ],

);
const semicondutoresTopic = KnowledgeTopic(
  id: 'semicondutores',
  eyebrow: 'TECNOLOGIA / HARDWARE',
  title: 'POR QUE CHIPS SÃO FEITOS DE SEMICONDUTORES?',
  summary:
      'Semicondutores permitem controlar o fluxo de corrente elétrica de forma precisa, tornando possível criar transistores e circuitos com bilhões de componentes.',
  minutes: 8,
  tags: ['tecnologia', 'computação'],
  quickTake:
      'Silício não é usado porque conduz muito bem, mas porque sua condutividade pode ser controlada por materiais adicionados e por campos elétricos.',
  simpleExplanation:
      'Um transistor funciona como uma chave minúscula controlada eletricamente. Milhões ou bilhões dessas chaves combinadas executam operações lógicas e armazenam informação.',
  example:
      'Ao aplicar tensão numa região de um transistor, o circuito pode permitir ou bloquear a passagem de corrente e representar estados usados em lógica digital.',
  body: [
    'Materiais semicondutores possuem propriedades elétricas intermediárias entre bons condutores e bons isolantes.',
    'Dopagem adiciona pequenas quantidades de outros elementos para modificar a quantidade e o tipo de portadores de carga.',
    'Junções entre regiões diferentes permitem criar diodos e transistores com comportamento controlável.',
    'Transistores MOSFET tornaram-se a base de grande parte da eletrônica digital moderna.',
    'Litografia projeta padrões extremamente pequenos sobre wafers para fabricar muitas camadas de circuitos integrados.',
    'Produzir chips avançados exige equipamentos, materiais e processos de altíssima precisão distribuídos por uma cadeia global complexa.',
  ],
  remember: [
    'Semicondutor tem condutividade controlável.',
    'Transistor funciona como elemento de chaveamento e amplificação.',
    'Chips combinam bilhões de transistores.',
  ],
  whyItMatters:
      'Quase toda tecnologia digital depende de semicondutores, por isso fabricação de chips se tornou questão econômica, industrial e geopolítica.',
  curiosity:
      'Um chip moderno pode conter bilhões de transistores numa área menor que uma unha.',
  connections: ['Transistores', 'Litografia', 'Computadores', 'Supply chain'],
);
const algoritmosTopic = KnowledgeTopic(
  id: 'algoritmos',
  eyebrow: 'TECNOLOGIA / LÓGICA',
  title: 'O QUE É UM ALGORITMO?',
  summary:
      'Um algoritmo é uma sequência finita e bem definida de passos para transformar entradas em saídas ou resolver uma classe de problemas.',
  minutes: 7,
  tags: ['tecnologia', 'computação'],
  quickTake:
      'Algoritmo não é sinônimo de inteligência artificial nem de rede social. Receitas, ordenação de listas e rotas de navegação também podem ser descritas algoritmicamente.',
  simpleExplanation:
      'Imagine instruções de cozinha suficientemente claras para que outra pessoa execute o processo e chegue ao mesmo tipo de resultado. Um algoritmo formaliza esse princípio.',
  example:
      'Para encontrar o maior número numa lista, você pode começar pelo primeiro valor, compará-lo com cada próximo item e guardar sempre o maior encontrado.',
  body: [
    'Algoritmos definem passos e regras aplicados a dados de entrada.',
    'Um mesmo problema pode ter vários algoritmos com custos muito diferentes de tempo e memória.',
    'Complexidade computacional estuda como esses custos crescem conforme o tamanho da entrada aumenta.',
    'Estruturas de dados e algoritmos trabalham juntos: a forma de armazenar informação influencia a eficiência das operações.',
    'Algoritmos podem ser determinísticos, probabilísticos, aproximados ou adaptativos dependendo do problema.',
    'Quando algoritmos influenciam decisões sobre pessoas, critérios, dados e vieses também se tornam questões sociais importantes.',
  ],
  remember: [
    'Algoritmo é procedimento, não necessariamente IA.',
    'Soluções diferentes podem ter eficiências muito diferentes.',
    'Dados e objetivos influenciam resultados.',
  ],
  whyItMatters:
      'Entender algoritmos ajuda a enxergar tecnologia como escolhas de regras e prioridades, não como uma caixa mágica neutra.',
  curiosity:
      'Alguns problemas fáceis de descrever se tornam impraticáveis de resolver exatamente quando a quantidade de dados cresce.',
  connections: ['Programação', 'Complexidade', 'IA', 'Dados'],
);
const openSourceTopic = KnowledgeTopic(
  id: 'open-source',
  eyebrow: 'TECNOLOGIA / CULTURA',
  title: 'O QUE SIGNIFICA SOFTWARE OPEN SOURCE?',
  summary:
      'Software open source disponibiliza seu código-fonte sob licenças que permitem estudar, modificar e redistribuir o programa dentro de condições definidas.',
  minutes: 7,
  tags: ['tecnologia', 'computação'],
  quickTake:
      'Open source não significa automaticamente gratuito, sem dono ou sem regras. Licenças determinam o que pode ser feito com o código.',
  simpleExplanation:
      'Em software fechado, você recebe o produto pronto. Em open source, além de usar o programa, desenvolvedores podem examinar como ele funciona e criar versões modificadas conforme a licença.',
  example:
      'Linux pode ser estudado e alterado por empresas, universidades e indivíduos, mas distribuições e serviços comerciais podem cobrar por suporte, integração ou infraestrutura.',
  body: [
    'Código-fonte é a forma legível por humanos usada por desenvolvedores para criar software.',
    'Licenças open source concedem direitos de uso, estudo, modificação e redistribuição.',
    'Licenças permissivas, como MIT e Apache, impõem poucas restrições; licenças copyleft, como GPL, exigem condições específicas ao redistribuir derivados.',
    'Projetos podem ser mantidos por voluntários, fundações, empresas ou combinações desses grupos.',
    'Empresas constroem negócios em torno de open source por suporte, hospedagem, serviços gerenciados e produtos complementares.',
    'Código aberto permite auditoria, mas não garante automaticamente segurança, qualidade ou manutenção ativa.',
  ],
  remember: [
    'Open source depende de licença.',
    'Aberto não significa necessariamente grátis.',
    'Projetos podem ter modelos comerciais.',
  ],
  whyItMatters:
      'Grande parte da infraestrutura digital mundial utiliza software open source, muitas vezes sem que o usuário final perceba.',
  curiosity:
      'Servidores, celulares, navegadores e linguagens modernas dependem amplamente de componentes open source.',
  connections: ['Linux', 'GitHub', 'Licenças', 'Comunidades de software'],
);
const arquiteturaGoticaTopic = KnowledgeTopic(
  id: 'arquitetura-gotica',
  eyebrow: 'ARQUITETURA / HISTÓRIA',
  title: 'COMO CATEDRAIS GÓTICAS FICARAM TÃO ALTAS?',
  summary:
      'Arcos apontados, abóbadas nervuradas e arcobotantes redistribuíram cargas e permitiram paredes mais altas, grandes janelas e interiores iluminados.',
  minutes: 8,
  tags: ['arquitetura', 'história'],
  quickTake:
      'O gótico não é só “estilo sombrio”: foi também uma solução estrutural sofisticada para construir espaços altos e luminosos.',
  simpleExplanation:
      'Em vez de fazer paredes muito grossas para segurar todo o peso, construtores transferiam parte das forças para pilares e apoios externos.',
  example:
      'Arcobotantes funcionam como braços de pedra que levam empuxos da cobertura para contrafortes fora da parede principal.',
  body: [
    'A arquitetura gótica se desenvolveu na Europa medieval a partir do século XII.',
    'Arcos apontados permitiam diferentes proporções e ajudavam a direcionar forças para apoios específicos.',
    'Abóbadas nervuradas concentravam cargas em estruturas mais definidas, reduzindo a necessidade de superfícies maciças.',
    'Arcobotantes levavam parte dos esforços laterais para contrafortes externos.',
    'Com paredes menos responsáveis pela sustentação, vitrais podiam ocupar áreas muito maiores.',
    'Catedrais também eram projetos urbanos, religiosos, econômicos e políticos que podiam atravessar gerações.',
  ],
  remember: [
    'Estrutura e estética andam juntas.',
    'Arcobotantes transferem esforços para fora.',
    'Grandes vitrais foram possíveis porque paredes ficaram menos estruturais.',
  ],
  whyItMatters:
      'Entender o gótico ajuda a ver edifícios históricos como sistemas de engenharia, não apenas como decoração religiosa.',
  curiosity:
      'Muitas catedrais medievais levaram décadas ou séculos para chegar à forma conhecida hoje.',
  connections: ['Vitrais', 'Idade Média', 'Estruturas', 'Cidades'],
);
const artDecoTopic = KnowledgeTopic(
  id: 'art-deco',
  eyebrow: 'DESIGN / CIDADE',
  title: 'POR QUE ART DÉCO PARECE LUXUOSO E MODERNO?',
  summary:
      'Geometria, materiais industriais, brilho e referências a máquinas transformaram o Art Déco numa linguagem associada à modernidade e ao glamour entre as décadas de 1920 e 1930.',
  minutes: 7,
  tags: ['design', 'arquitetura'],
  quickTake:
      'Art Déco mistura modernidade industrial e ornamentação — bem diferente do funcionalismo mais austero associado à Bauhaus.',
  simpleExplanation:
      'É como vestir uma máquina com joias geométricas: superfícies lisas, linhas escalonadas, metais e padrões simétricos combinam tecnologia com luxo.',
  example:
      'Arranha-céus como o Chrysler Building usam aço, formas radiantes e coroamentos geométricos para transformar a ideia de máquina em espetáculo.',
  body: [
    'O nome Art Déco vem da Exposição Internacional de Artes Decorativas e Industriais Modernas realizada em Paris em 1925.',
    'A linguagem combinava geometria, simetria, materiais brilhantes e referências a velocidade, aviação, automóveis e indústria.',
    'Arquitetura, mobiliário, cartazes, joias e objetos domésticos adotaram versões diferentes do estilo.',
    'O movimento absorveu influências de culturas antigas, vanguardas europeias e design de luxo.',
    'Nos Estados Unidos, edifícios altos transformaram o Déco em símbolo urbano da era dos arranha-céus.',
    'No Brasil, cinemas, prédios residenciais e edifícios públicos também incorporaram essa estética.',
  ],
  remember: [
    'Art Déco é moderno e ornamental ao mesmo tempo.',
    'Geometria e simetria são marcas frequentes.',
    'A estética apareceu em arquitetura e objetos.',
  ],
  whyItMatters:
      'O Déco mostra que modernidade visual não precisou significar abandono completo da ornamentação.',
  curiosity:
      'O Cristo Redentor, no Rio de Janeiro, é frequentemente associado ao contexto Art Déco por sua linguagem escultórica simplificada.',
  connections: ['Bauhaus', 'Arranha-céus', 'Moda', 'Design gráfico'],
);
const surrealismoTopic = KnowledgeTopic(
  id: 'surrealismo',
  eyebrow: 'ARTE / IMAGINAÇÃO',
  title: 'POR QUE O SURREALISMO PARECE UM SONHO?',
  summary:
      'Surrealistas exploraram sonho, automatismo, desejo e associações inesperadas para desafiar a lógica cotidiana.',
  minutes: 7,
  tags: ['arte', 'cultura'],
  quickTake:
      'Surrealismo não era só pintar coisas estranhas: foi um movimento artístico e literário interessado em liberar associações fora do controle racional.',
  simpleExplanation:
      'Num sonho, objetos familiares podem aparecer em combinações impossíveis. Surrealistas usavam essa lógica para produzir imagens e textos que escapassem da ordem comum.',
  example:
      'René Magritte pintava objetos comuns em situações impossíveis, enquanto Salvador Dalí usava técnica extremamente realista para representar cenas absurdas.',
  body: [
    'O movimento surrealista se organizou em Paris na década de 1920, especialmente após o manifesto de André Breton.',
    'Freud e debates sobre inconsciente influenciaram fortemente o imaginário do grupo.',
    'Automatismo buscava criar sem controle racional excessivo, deixando associações emergirem.',
    'Pintores, escritores, fotógrafos e cineastas desenvolveram caminhos muito diferentes dentro do movimento.',
    'O surrealismo também teve dimensões políticas e conflitos internos, não sendo apenas um estilo visual.',
    'Sua influência atravessou publicidade, cinema, moda, música e cultura pop.',
  ],
  remember: [
    'Surrealismo nasceu também na literatura.',
    'Sonho e inconsciente foram referências centrais.',
    'Não existe uma única estética surrealista.',
  ],
  whyItMatters:
      'O surrealismo mudou a forma como cultura visual usa estranhamento, sonho e justaposição para provocar interpretação.',
  curiosity:
      'Magritte não gostava de ser tratado apenas como pintor de sonhos; muitas obras funcionam como problemas sobre linguagem e representação.',
  connections: ['Freud', 'Cinema', 'Dadaísmo', 'Magritte'],
);
const popArtTopic = KnowledgeTopic(
  id: 'pop-art',
  eyebrow: 'ARTE / CONSUMO',
  title: 'POR QUE A POP ART TRANSFORMOU PRODUTOS EM ARTE?',
  summary:
      'Artistas incorporaram imagens de publicidade, quadrinhos, celebridades e embalagens para discutir a cultura de massa do pós-guerra.',
  minutes: 7,
  tags: ['arte', 'cultura'],
  quickTake:
      'Pop Art não é simplesmente “arte colorida”: ela aproxima a linguagem dos museus da linguagem de supermercados, revistas e televisão.',
  simpleExplanation:
      'Quando uma lata de sopa aparece numa galeria, o objeto comum muda de contexto e faz o público perguntar por que algumas imagens são consideradas arte e outras não.',
  example:
      'Andy Warhol repetia retratos e embalagens em séries, imitando a lógica de reprodução industrial e circulação de imagens.',
  body: [
    'Pop Art ganhou força no Reino Unido e nos Estados Unidos entre as décadas de 1950 e 1960.',
    'Publicidade, embalagens, cinema, televisão e quadrinhos forneceram um novo vocabulário visual.',
    'Artistas questionavam a separação entre cultura “alta” e cultura popular.',
    'Repetição e técnicas de reprodução mecânica aproximavam obras da produção em massa.',
    'Roy Lichtenstein ampliava linguagens de quadrinhos; Warhol trabalhava com celebridades e produtos cotidianos.',
    'O movimento podia celebrar, ironizar ou simplesmente observar a sociedade de consumo — interpretações variam conforme a obra.',
  ],
  remember: [
    'Cultura de massa virou matéria-prima artística.',
    'Repetição tem papel central em muitas obras.',
    'Pop Art não é só estética divertida.',
  ],
  whyItMatters:
      'A Pop Art antecipou uma cultura visual em que marcas, celebridades e imagens reproduzidas moldam identidade e consumo.',
  curiosity:
      'As famosas latas de sopa de Warhol eram produtos baratos e extremamente comuns nos Estados Unidos.',
  connections: ['Publicidade', 'Warhol', 'Consumo', 'Design gráfico'],
);
const minimalismoTopic = KnowledgeTopic(
  id: 'minimalismo',
  eyebrow: 'ARTE / DESIGN',
  title: 'MENOS É SEMPRE MAIS?',
  summary:
      'Minimalismo reduziu elementos, repetição e gesto individual em diferentes campos, mas “menos” nunca é uma regra universal de qualidade.',
  minutes: 7,
  tags: ['design', 'arte'],
  quickTake:
      'Minimalismo é contexto, não sinônimo de qualquer coisa simples, branca ou vazia.',
  simpleExplanation:
      'Retirar elementos pode tornar estrutura, material e proporção mais visíveis — mas remover demais também pode prejudicar função ou expressão.',
  example:
      'Uma interface com poucos botões pode ser clara, mas esconder funções importantes em menus invisíveis pode torná-la pior, não melhor.',
  body: [
    'Nas artes visuais, o minimalismo ganhou força nos Estados Unidos na década de 1960.',
    'Artistas exploravam formas simples, repetição, escala e materiais industriais.',
    'A obra frequentemente enfatizava a relação física entre objeto, espaço e observador.',
    'Em arquitetura e design, redução formal assumiu trajetórias diferentes e não deve ser confundida automaticamente com o movimento artístico.',
    'A ideia de “menos é mais” se tornou um slogan popular, mas design eficiente depende de contexto e uso.',
    'Hoje “minimalista” virou também um rótulo comercial para interfaces, interiores, moda e estilo de vida.',
  ],
  remember: [
    'Minimalismo histórico é mais específico que “visual simples”.',
    'Redução pode revelar estrutura.',
    'Menos não é automaticamente melhor.',
  ],
  whyItMatters:
      'Ajuda a avaliar design pela relação entre simplicidade e função, e não apenas pela ausência de elementos visuais.',
  curiosity:
      'Donald Judd rejeitava categorias tradicionais como pintura e escultura para muitas das obras associadas ao minimalismo.',
  connections: ['Modernismo', 'Design', 'Interfaces', 'Arte contemporânea'],
);
const grafiteTopic = KnowledgeTopic(
  id: 'grafite',
  eyebrow: 'ARTE / CIDADE',
  title: 'QUANDO O GRAFITE VIROU ARTE?',
  summary:
      'Inscrições urbanas existem há séculos, mas graffiti contemporâneo ganhou linguagem própria em cidades como Nova York e depois entrou em galerias, publicidade e debates sobre espaço público.',
  minutes: 7,
  tags: ['arte', 'cidade'],
  quickTake:
      'A fronteira entre graffiti, arte urbana e vandalismo depende de contexto, autorização, linguagem e disputa sobre quem pode ocupar visualmente a cidade.',
  simpleExplanation:
      'Uma mesma técnica pode ser vista como expressão artística num mural autorizado e como intervenção ilegal quando feita sem consentimento em propriedade alheia.',
  example:
      'Tags priorizam assinatura e presença; murais podem envolver letras elaboradas, personagens e composições de grande escala.',
  body: [
    'Escrever e desenhar em superfícies públicas é prática antiga, mas o graffiti moderno desenvolveu novas formas nas décadas de 1960 e 1970.',
    'Em Nova York, assinaturas e estilos de letras se espalharam por muros e sistemas de transporte.',
    'Competição por visibilidade incentivou escala, cor e complexidade crescentes.',
    'Graffiti se cruzou com hip-hop, embora os dois não sejam exatamente a mesma coisa.',
    'Museus e galerias passaram a incorporar artistas ligados à rua, gerando debates sobre institucionalização e mercado.',
    'Cidades continuam negociando limites entre expressão, propriedade, conservação e políticas públicas.',
  ],
  remember: [
    'Graffiti e muralismo não são sinônimos.',
    'Contexto legal muda a leitura da intervenção.',
    'A rua é parte central da linguagem.',
  ],
  whyItMatters:
      'Grafite revela como arte, propriedade e espaço público entram em conflito na construção visual das cidades.',
  curiosity:
      'O Brasil desenvolveu linguagens urbanas próprias, incluindo a pixação paulistana, que possui estética e história distintas do graffiti internacional.',
  connections: ['Hip-hop', 'Cidade', 'Arte urbana', 'Espaço público'],
);
const hipHopTopic = KnowledgeTopic(
  id: 'hip-hop',
  eyebrow: 'MÚSICA / CULTURA',
  title: 'COMO O HIP-HOP VIROU UMA CULTURA GLOBAL?',
  summary:
      'Festas de bairro no Bronx combinaram DJing, MCing, dança e arte urbana; décadas depois, essas práticas se espalharam e foram reinterpretadas no mundo inteiro.',
  minutes: 8,
  tags: ['música', 'cultura'],
  quickTake:
      'Hip-hop é maior que rap: música, performance, dança, produção e expressão visual fazem parte de uma cultura mais ampla.',
  simpleExplanation:
      'DJs começaram a prolongar trechos rítmicos de discos para manter a pista dançando. MCs passaram a falar e rimar sobre essas batidas, e o rap ganhou cada vez mais centralidade.',
  example:
      'O uso de dois toca-discos permitia repetir breaks de uma gravação e criar, ao vivo, uma nova base rítmica a partir de discos existentes.',
  body: [
    'Hip-hop se desenvolveu no Bronx, em Nova York, durante a década de 1970, em comunidades negras e latinas.',
    'DJs como Kool Herc ficaram associados à técnica de prolongar breaks rítmicos para dançarinos.',
    'MCs passaram de animadores de festa a intérpretes de versos cada vez mais elaborados.',
    'Breakdance, graffiti e práticas de DJ também ganharam identidades próprias dentro da cultura.',
    'Gravações comerciais ampliaram o alcance do rap e transformaram o gênero numa indústria global.',
    'Em diferentes países, artistas adaptaram hip-hop a idiomas, políticas, ritmos e experiências locais.',
  ],
  remember: [
    'Hip-hop não é só rap.',
    'Nasceu em contexto urbano específico do Bronx.',
    'A cultura se transformou ao circular globalmente.',
  ],
  whyItMatters:
      'Hip-hop é uma das linguagens culturais mais influentes do mundo contemporâneo e conecta música, moda, política, linguagem e cidade.',
  curiosity:
      'O termo “break” está ligado aos trechos instrumentais que DJs isolavam e prolongavam nas festas.',
  connections: ['Graffiti', 'DJ', 'Sampling', 'Reggae'],
);
const bossaNovaTopic = KnowledgeTopic(
  id: 'bossa-nova',
  eyebrow: 'MÚSICA / BRASIL',
  title: 'POR QUE A BOSSA NOVA SOA TÃO DIFERENTE?',
  summary:
      'Violão sincopado, canto contido e harmonias sofisticadas aproximaram samba e jazz numa linguagem urbana que ganhou projeção internacional.',
  minutes: 8,
  tags: ['música', 'brasil'],
  quickTake:
      'Bossa nova não é simplesmente “samba lento”: ela reorganiza ritmo, harmonia, timbre e interpretação de forma muito particular.',
  simpleExplanation:
      'O violão pode condensar elementos do samba numa batida íntima, enquanto a voz evita o estilo projetado e dramático comum em parte da música popular anterior.',
  example:
      'A batida associada a João Gilberto distribui baixos e acordes de modo sincopado, criando sensação de balanço mesmo em volume baixo.',
  body: [
    'A bossa nova ganhou forma no Rio de Janeiro no fim da década de 1950.',
    'João Gilberto foi central para consolidar uma maneira nova de tocar violão e cantar.',
    'Tom Jobim expandiu a linguagem harmônica em canções que se tornaram repertório internacional.',
    'Letras de Vinicius de Moraes e outros autores associaram a estética a temas urbanos, amorosos e cotidianos.',
    'A aproximação com músicos de jazz ampliou sua circulação fora do Brasil.',
    'O movimento também recebeu críticas por representar sobretudo ambientes de classe média e por não resumir a diversidade da música brasileira.',
  ],
  remember: [
    'Violão sincopado é uma marca central.',
    'João Gilberto e Tom Jobim foram figuras decisivas.',
    'Bossa nova dialoga com samba e jazz sem ser idêntica a nenhum dos dois.',
  ],
  whyItMatters:
      'A bossa nova alterou a imagem internacional da música brasileira e influenciou cantores, compositores e instrumentistas em várias partes do mundo.',
  curiosity:
      '“Garota de Ipanema” se tornou uma das canções brasileiras mais conhecidas internacionalmente.',
  connections: ['Samba', 'Jazz', 'Tom Jobim', 'Rio de Janeiro'],
);
const cinemaMudoTopic = KnowledgeTopic(
  id: 'cinema-mudo',
  eyebrow: 'CINEMA / HISTÓRIA',
  title: 'FILME MUDO ERA REALMENTE SILENCIOSO?',
  summary:
      'Os filmes não traziam diálogo sincronizado gravado, mas sessões frequentemente tinham música ao vivo, efeitos sonoros e até narradores.',
  minutes: 7,
  tags: ['cinema', 'história'],
  quickTake:
      '“Mudo” descreve a ausência de som sincronizado na própria cópia do filme — não uma sala necessariamente silenciosa.',
  simpleExplanation:
      'O filme projetado podia não carregar uma faixa de áudio, mas o cinema era uma experiência ao vivo: pianistas, pequenos conjuntos ou orquestras acompanhavam a projeção.',
  example:
      'Uma cena de perseguição podia receber música acelerada tocada ao vivo para aumentar tensão e ritmo.',
  body: [
    'O cinema surgiu no fim do século XIX antes de existir uma solução industrial estável para gravar e reproduzir imagem e som perfeitamente sincronizados.',
    'A música ao vivo ajudava a criar atmosfera, ritmo e continuidade durante as sessões.',
    'Algumas salas utilizavam efeitos sonoros ou profissionais que narravam e explicavam acontecimentos.',
    'Intertítulos exibiam diálogos, informações e transições entre cenas.',
    'Diretores e atores desenvolveram linguagem visual sofisticada com montagem, enquadramento e performance corporal.',
    'A partir do fim da década de 1920, sistemas de som sincronizado se tornaram comercialmente dominantes e transformaram a indústria.',
  ],
  remember: [
    'Filme mudo podia ter muito som na sala.',
    'Intertítulos não substituíam toda a narrativa visual.',
    'A chegada do som mudou produção e atuação.',
  ],
  whyItMatters:
      'Entender o cinema mudo mostra que linguagem cinematográfica não depende apenas de diálogo e ajuda a perceber como imagem e montagem contam histórias.',
  curiosity:
      'Em diferentes países, narradores ao vivo podiam ter papel tão importante que o mesmo filme ganhava experiências bastante diferentes conforme a sessão.',
  connections: ['Montagem', 'Chaplin', 'Música', 'Som no cinema'],
);
const efeitosVisuaisTopic = KnowledgeTopic(
  id: 'efeitos-visuais',
  eyebrow: 'CINEMA / TECNOLOGIA',
  title: 'COMO O CINEMA CRIA COISAS QUE NÃO EXISTEM?',
  summary:
      'Miniaturas, composição, maquiagem, telas verdes, computação gráfica e captura de movimento combinam imagens reais e artificiais para construir cenas impossíveis.',
  minutes: 8,
  tags: ['cinema', 'tecnologia'],
  quickTake:
      'Efeito visual não é sinônimo de CGI. Cinema usa truques ópticos e físicos desde muito antes dos computadores.',
  simpleExplanation:
      'Uma cena final pode ser uma colagem de muitas camadas: ator filmado em estúdio, cenário parcial, céu digital, partículas, correção de cor e objetos simulados.',
  example:
      'Uma cidade futurista pode misturar uma rua real, extensão digital de prédios e veículos criados por computador numa única imagem.',
  body: [
    'Georges Méliès já utilizava cortes, sobreposição e cenários para criar ilusões no início do cinema.',
    'Miniaturas e matte paintings permitiram representar espaços grandes demais ou inexistentes.',
    'Chroma key isola uma cor de fundo para combinar atores com outras imagens.',
    'CGI cria objetos e ambientes tridimensionais por modelagem, iluminação, animação e renderização.',
    'Captura de movimento registra atuação humana para orientar personagens digitais.',
    'Grandes produções misturam efeitos práticos e digitais porque cada técnica resolve problemas diferentes.',
  ],
  remember: [
    'VFX existia antes de computadores.',
    'CGI é apenas uma categoria de efeito.',
    'Imagem final costuma combinar muitas camadas.',
  ],
  whyItMatters:
      'Conhecer VFX muda a forma de assistir a filmes: você começa a perceber cinema como integração entre fotografia, design, atuação e computação.',
  curiosity:
      'Algumas das melhores cenas “digitais” funcionam justamente porque objetos reais, luz física e efeitos práticos fornecem referências convincentes ao olho.',
  connections: ['CGI', 'Montagem', 'Fotografia', 'Games'],
);
const modaJeansTopic = KnowledgeTopic(
  id: 'moda-jeans',
  eyebrow: 'MODA / HISTÓRIA',
  title: 'COMO O JEANS VIROU UMA ROUPA UNIVERSAL?',
  summary:
      'Uma peça ligada ao trabalho no século XIX atravessou cinema, juventude, contracultura e indústria global até virar básico do vestuário.',
  minutes: 7,
  tags: ['moda', 'cultura'],
  quickTake:
      'Jeans não virou universal apenas por resistência do tecido: símbolos de trabalho, rebeldia, juventude e consumo foram se acumulando ao redor da peça.',
  simpleExplanation:
      'Uma roupa criada para durar em atividades físicas ganhou novos significados quando passou a aparecer em estrelas de cinema, músicos e movimentos juvenis.',
  example:
      'Na metade do século XX, atores usando denim em filmes ajudaram a associar jeans a juventude e rebeldia fora do ambiente de trabalho.',
  body: [
    'Tecidos de algodão resistentes já existiam antes da calça jeans moderna.',
    'No século XIX, Levi Strauss e Jacob Davis ficaram ligados ao uso de rebites metálicos para reforçar pontos de tensão em roupas de trabalho.',
    'O denim foi associado a trabalhadores, mineradores e atividades rurais.',
    'No século XX, cinema e cultura juvenil ampliaram seu significado simbólico.',
    'Lavagens, cortes e tratamentos transformaram o jeans em produto de moda com enorme variedade.',
    'Hoje a cadeia do denim envolve produção global e debates sobre consumo de água, químicos, trabalho e sustentabilidade.',
  ],
  remember: [
    'Jeans começou fortemente ligado a roupa de trabalho.',
    'Cinema ajudou a transformar sua imagem cultural.',
    'Denim virou plataforma para muitas modas diferentes.',
  ],
  whyItMatters:
      'A história do jeans mostra como objetos cotidianos mudam de significado conforme atravessam trabalho, mídia, identidade e consumo.',
  curiosity:
      'O índigo tradicional tinge principalmente a superfície dos fios, ajudando a explicar o desbotamento característico do denim.',
  connections: ['Moda', 'Cinema', 'Trabalho', 'Cultura jovem'],
);
const tenisTopic = KnowledgeTopic(
  id: 'tenis',
  eyebrow: 'MODA / DESIGN',
  title: 'COMO O TÊNIS SAIU DO ESPORTE PARA DOMINAR A MODA?',
  summary:
      'Tecnologia esportiva, cultura juvenil, basquete, corrida, hip-hop e colaborações transformaram calçados atléticos em objetos de identidade e desejo.',
  minutes: 8,
  tags: ['moda', 'design'],
  quickTake:
      'Sneakers deixaram de ser apenas equipamento porque marcas e comunidades passaram a atribuir história, status e linguagem visual a modelos específicos.',
  simpleExplanation:
      'Um tênis pode resolver um problema físico — amortecer corrida — e ao mesmo tempo comunicar pertencimento cultural, gosto e estilo.',
  example:
      'Modelos ligados a atletas famosos ultrapassaram quadras e passaram a ser usados como parte de looks cotidianos e coleções.',
  body: [
    'Calçados com sola de borracha ganharam espaço em esportes e lazer a partir do fim do século XIX e início do XX.',
    'Basquete, tênis e corrida impulsionaram tecnologias e silhuetas específicas.',
    'A cultura hip-hop ajudou a transformar determinados modelos em símbolos de rua e identidade.',
    'Associações com atletas e celebridades criaram narrativas que ultrapassavam desempenho técnico.',
    'Edições limitadas e colaborações alimentaram o mercado de colecionadores e revenda.',
    'Hoje tênis mistura ergonomia, materiais, branding, nostalgia e moda em escala global.',
  ],
  remember: [
    'Função esportiva e símbolo cultural coexistem.',
    'Comunidades ajudaram a transformar modelos em ícones.',
    'Escassez e colaboração influenciam valor percebido.',
  ],
  whyItMatters:
      'Tênis é um exemplo claro de como design funcional pode virar linguagem cultural e mercado de colecionismo.',
  curiosity:
      'Alguns modelos originalmente criados para desempenho décadas atrás retornam como itens de moda quase sem alteração estrutural.',
  connections: ['Hip-hop', 'Basquete', 'Design de produto', 'Streetwear'],
);
const fermentacaoTopic = KnowledgeTopic(
  id: 'fermentacao',
  eyebrow: 'GASTRONOMIA / CIÊNCIA',
  title: 'O QUE A FERMENTAÇÃO FAZ COM A COMIDA?',
  summary:
      'Microrganismos transformam açúcares e outras moléculas, produzindo ácidos, gases, álcool e compostos aromáticos que mudam sabor, textura e conservação.',
  minutes: 8,
  tags: ['gastronomia', 'ciência'],
  quickTake:
      'Fermentação não é uma técnica única: pão, iogurte, vinho, queijo e kimchi envolvem microrganismos e processos diferentes.',
  simpleExplanation:
      'Leveduras e bactérias “comem” moléculas disponíveis e liberam outras substâncias. Essas novas moléculas transformam o alimento.',
  example:
      'No pão, leveduras produzem dióxido de carbono, que fica preso na massa e cria bolhas responsáveis por parte do crescimento.',
  body: [
    'Fermentação é um conjunto de processos metabólicos realizados por microrganismos em diferentes condições.',
    'Leveduras podem converter açúcares em álcool e dióxido de carbono.',
    'Bactérias ácido-láticas transformam açúcares em ácido lático, acidificando alimentos.',
    'Acidez, álcool e competição microbiana podem dificultar crescimento de organismos indesejados e aumentar conservação.',
    'Tempo, temperatura, sal, oxigênio e composição do alimento alteram quais microrganismos dominam.',
    'Muitos alimentos fermentados dependem de comunidades microbianas complexas e tradições locais.',
  ],
  remember: [
    'Fermentação muda sabor e conservação.',
    'Microrganismos diferentes produzem resultados diferentes.',
    'Controle de ambiente é fundamental.',
  ],
  whyItMatters:
      'Fermentação conecta gastronomia a microbiologia e ajuda a entender alimentos presentes em praticamente todas as culturas.',
  curiosity:
      'Café, cacau e chá podem passar por etapas chamadas de fermentação ou processamento microbiano antes mesmo de chegarem à cozinha.',
  connections: ['Pão', 'Vinho', 'Microbioma', 'Queijo'],
);
const chocolateTopic = KnowledgeTopic(
  id: 'chocolate',
  eyebrow: 'GASTRONOMIA / PROCESSO',
  title: 'POR QUE CHOCOLATE NÃO TEM GOSTO DE CACAU CRU?',
  summary:
      'Fermentação, secagem, torra, moagem, mistura e cristalização transformam sementes de cacau intensamente amargas em chocolate.',
  minutes: 8,
  tags: ['gastronomia', 'ciência'],
  quickTake:
      'O sabor de chocolate não existe pronto dentro da fruta: ele é construído em várias etapas químicas e sensoriais.',
  simpleExplanation:
      'É parecido com café: a matéria-prima crua não tem o mesmo aroma da bebida final porque fermentação e calor criam novos compostos.',
  example:
      'Durante a torra, reações entre açúcares e aminoácidos geram centenas de moléculas aromáticas associadas ao sabor de chocolate.',
  body: [
    'Sementes de cacau são retiradas de frutos cercadas por polpa rica em açúcares.',
    'A fermentação altera a semente e cria precursores importantes para aroma e sabor.',
    'Após secagem, as amêndoas são torradas, etapa que intensifica aromas por reações químicas complexas.',
    'Moagem transforma nibs em uma pasta rica em gordura chamada liquor ou massa de cacau.',
    'Chocolate combina proporções diferentes de sólidos de cacau, manteiga de cacau, açúcar e, em alguns tipos, leite.',
    'Temperagem controla formas cristalinas da manteiga de cacau para obter brilho, textura firme e boa quebra.',
  ],
  remember: [
    'Fermentação começa a construir o sabor.',
    'Torra cria muitos aromas.',
    'Temperagem controla textura e brilho.',
  ],
  whyItMatters:
      'O chocolate mostra como processamento transforma completamente uma matéria-prima e como química aparece em experiências sensoriais cotidianas.',
  curiosity:
      'A manteiga de cacau pode cristalizar em diferentes formas; apenas algumas produzem o acabamento desejado em um bom chocolate.',
  connections: ['Fermentação', 'Cacau', 'Torra', 'Cristalização'],
);
const paoTopic = KnowledgeTopic(
  id: 'pao',
  eyebrow: 'GASTRONOMIA / CIÊNCIA',
  title: 'POR QUE O PÃO CRESCE?',
  summary:
      'Fermentação produz gás, e uma rede de proteínas e amido ajuda a prender essas bolhas enquanto a massa se expande e depois se fixa no forno.',
  minutes: 7,
  tags: ['gastronomia', 'ciência'],
  quickTake:
      'Fermento produz gás, mas o crescimento só funciona porque a estrutura da massa consegue reter esse gás.',
  simpleExplanation:
      'Pense num balão microscópico dentro da massa: levedura produz dióxido de carbono e a rede formada principalmente por glúten ajuda a impedir que ele escape imediatamente.',
  example:
      'Ao sovar uma massa de trigo, proteínas se organizam numa rede mais elástica capaz de segurar bolhas durante a fermentação.',
  body: [
    'Farinha de trigo contém proteínas que podem formar glúten quando hidratadas e trabalhadas.',
    'Leveduras metabolizam açúcares e liberam dióxido de carbono e outros compostos.',
    'As bolhas de gás ficam presas na estrutura da massa e aumentam de volume.',
    'Durante o forno, gases se expandem e a atividade da levedura aumenta por um curto período antes de cessar pelo calor.',
    'Proteínas se fixam e amidos gelatinizam, estabilizando a estrutura do miolo.',
    'Na superfície, perda de água e reações de escurecimento formam crosta e aromas.',
  ],
  remember: [
    'Gás sozinho não basta: precisa ser retido.',
    'Glúten ajuda a criar estrutura em pães de trigo.',
    'Calor fixa o formato final.',
  ],
  whyItMatters:
      'Pão é um laboratório cotidiano de microbiologia, química de proteínas, gases e transferência de calor.',
  curiosity:
      'Pães de fermentação natural usam comunidades de leveduras e bactérias, por isso acidez e aroma diferem de massas feitas apenas com fermento comercial.',
  connections: ['Fermentação', 'Glúten', 'Levedura', 'Reação de Maillard'],
);
const umamiTopic = KnowledgeTopic(
  id: 'umami',
  eyebrow: 'GASTRONOMIA / SENTIDOS',
  title: 'O QUE É UMAMI?',
  summary:
      'Umami é um gosto básico associado especialmente ao glutamato e a nucleotídeos presentes naturalmente em alimentos como tomate, queijo curado, cogumelos e carnes.',
  minutes: 7,
  tags: ['gastronomia', 'ciência'],
  quickTake:
      'Umami não é simplesmente “comida gostosa” nem sinônimo de salgado. É uma modalidade de gosto detectada por receptores específicos.',
  simpleExplanation:
      'Assim como açúcar ativa receptores ligados ao doce, certas moléculas como glutamato ativam receptores associados ao umami.',
  example:
      'Parmesão, tomate maduro e cogumelos podem intensificar sensação de profundidade e sabor mesmo sem grande quantidade de sal.',
  body: [
    'O químico japonês Kikunae Ikeda identificou no início do século XX um gosto associado ao glutamato presente no kombu.',
    'Glutamato é um aminoácido encontrado naturalmente em muitos alimentos.',
    'Nucleotídeos como inosinado e guanilato podem reforçar fortemente a percepção de umami quando combinados com glutamato.',
    'Receptores gustativos específicos participam da detecção dessas moléculas.',
    'Cozimento, maturação, fermentação e secagem podem aumentar disponibilidade de compostos associados ao umami.',
    'Glutamato monossódico é um sal do glutamato e ativa o mesmo sistema sensorial básico.',
  ],
  remember: [
    'Umami é um gosto básico.',
    'Glutamato ocorre naturalmente em alimentos.',
    'Certas combinações produzem efeito sinérgico.',
  ],
  whyItMatters:
      'Entender umami ajuda a perceber como cozinheiros constroem intensidade de sabor sem depender apenas de sal, açúcar ou gordura.',
  curiosity:
      'Combinar glutamato e certos nucleotídeos pode produzir uma sensação de umami maior que a soma simples dos dois componentes separados.',
  connections: ['Glutamato', 'Fermentação', 'Queijo', 'Tomate'],
);
const alfabetoTopic = KnowledgeTopic(
  id: 'alfabeto',
  eyebrow: 'LINGUAGEM / ESCRITA',
  title: 'COMO POUCAS LETRAS ESCREVEM TANTAS PALAVRAS?',
  summary:
      'Alfabetos representam unidades sonoras com um conjunto relativamente pequeno de sinais que podem ser combinados em inúmeras sequências.',
  minutes: 7,
  tags: ['linguagem', 'escrita'],
  quickTake:
      'Um alfabeto não precisa ter um símbolo para cada palavra: ele reutiliza letras para representar partes menores da fala.',
  simpleExplanation:
      'Com poucas dezenas de letras você consegue combinar sons em milhares de palavras, do mesmo modo que poucas notas musicais formam inúmeras melodias.',
  example:
      'As letras c, a, s e o podem ser reorganizadas e combinadas com outras para formar palavras diferentes sem criar um novo símbolo para cada ideia.',
  body: [
    'Sistemas de escrita podem representar palavras, sílabas, consoantes ou unidades sonoras menores.',
    'Os alfabetos grego e latino fazem parte de uma longa história que inclui sistemas semíticos anteriores.',
    'No alfabeto latino, letras representam sons de maneira imperfeita porque línguas mudam e reaproveitam a mesma escrita.',
    'Ortografia preserva história e convenções, por isso a relação entre letra e som nem sempre é direta.',
    'Novos símbolos, acentos e combinações surgiram conforme o alfabeto foi adaptado a diferentes idiomas.',
    'A eficiência do sistema vem da capacidade combinatória de um inventário pequeno de sinais.',
  ],
  remember: [
    'Alfabeto representa unidades menores que palavras.',
    'Escrita e pronúncia não evoluem no mesmo ritmo.',
    'O alfabeto latino é resultado de adaptações históricas.',
  ],
  whyItMatters:
      'Entender como alfabetos funcionam ajuda a perceber escrita como tecnologia cultural, e não como reflexo perfeito da fala.',
  curiosity:
      'As formas e nomes de várias letras latinas descendem de sinais muito mais antigos que passaram por alfabetos fenício, grego e etrusco.',
  connections: ['Escrita', 'Etimologia', 'Linguística', 'Imprensa'],
);
const etimologiaTopic = KnowledgeTopic(
  id: 'etimologia',
  eyebrow: 'LINGUAGEM / HISTÓRIA',
  title: 'POR QUE PALAVRAS CARREGAM FÓSSEIS DA HISTÓRIA?',
  summary:
      'Etimologia investiga como palavras surgiram, mudaram de forma e sentido e viajaram entre línguas ao longo do tempo.',
  minutes: 7,
  tags: ['linguagem', 'história'],
  quickTake:
      'A origem de uma palavra não determina seu significado atual. Etimologia explica história, não uma suposta “verdade escondida” do vocabulário.',
  simpleExplanation:
      'Palavras mudam como cidades: novas camadas aparecem sobre estruturas antigas. A forma atual pode guardar marcas de pronúncias e significados anteriores.',
  example:
      '“Janela” e “window” significam a mesma coisa hoje, mas têm histórias diferentes porque português e inglês herdaram e criaram vocabulário por caminhos distintos.',
  body: [
    'Línguas mudam continuamente em som, gramática e vocabulário.',
    'Palavras podem ser herdadas de ancestrais linguísticos ou emprestadas de outras línguas.',
    'Empréstimos mudam pronúncia e significado para se adaptar ao novo contexto.',
    'Mudanças semânticas podem ampliar, restringir ou transformar completamente o sentido original.',
    'Linguistas comparam padrões sistemáticos entre palavras para reconstruir relações históricas.',
    'Etimologias populares surgem quando semelhanças ocasionais são tratadas como parentesco sem evidência histórica.',
  ],
  remember: [
    'Palavras mudam de forma e significado.',
    'Empréstimos são parte normal das línguas.',
    'Origem não determina uso atual.',
  ],
  whyItMatters:
      'Etimologia revela contatos culturais, migrações e mudanças sociais escondidas em palavras usadas todos os dias.',
  curiosity:
      'Muitas palavras portuguesas de origem árabe preservam o artigo “al-”, como algoritmo, álcool e alfândega, embora suas histórias específicas sejam diferentes.',
  connections: ['Alfabeto', 'Latim', 'Árabe', 'Linguística'],
);
const tempoFusosTopic = KnowledgeTopic(
  id: 'tempo-fusos',
  eyebrow: 'GEOGRAFIA / TEMPO',
  title: 'POR QUE O MUNDO TEM FUSOS HORÁRIOS?',
  summary:
      'A rotação da Terra faz o meio-dia solar acontecer em momentos diferentes, e a expansão de ferrovias e telecomunicações levou países a padronizar horários regionais.',
  minutes: 7,
  tags: ['geografia', 'história'],
  quickTake:
      'Fusos horários não são divisões naturais perfeitas de 15 graus: fronteiras políticas e decisões econômicas deformam bastante o mapa.',
  simpleExplanation:
      'Antes de horários padronizados, cidades podiam ajustar relógios pelo Sol local. Isso ficava impraticável quando trens precisavam seguir tabelas entre muitas cidades.',
  example:
      'Duas cidades relativamente próximas podiam usar minutos diferentes de horário local até redes ferroviárias pressionarem por padrões comuns.',
  body: [
    'A Terra gira aproximadamente 360 graus em 24 horas, sugerindo uma diferença média de uma hora a cada 15 graus de longitude.',
    'Durante séculos, muitas comunidades usaram o meio-dia solar local como referência.',
    'Ferrovias do século XIX transformaram pequenas diferenças locais em problemas de operação e segurança.',
    'Empresas e governos passaram a adotar horários padronizados por regiões.',
    'O meridiano de Greenwich tornou-se uma referência internacional importante no fim do século XIX.',
    'Hoje fronteiras de fusos seguem decisões políticas e podem incluir meia hora ou 45 minutos de diferença, além das horas inteiras.',
  ],
  remember: [
    'Rotação da Terra cria a base astronômica.',
    'Ferrovias aceleraram padronização.',
    'Fusos reais seguem política, não apenas geometria.',
  ],
  whyItMatters:
      'Fusos mostram como uma realidade física — rotação da Terra — vira uma convenção social necessária para coordenar uma economia global.',
  curiosity:
      'Alguns países usam um único horário em territórios que geograficamente poderiam ocupar vários fusos.',
  connections: ['Longitude', 'Greenwich', 'Ferrovias', 'Calendário'],
);
const cidadesTopic = KnowledgeTopic(
  id: 'cidades',
  eyebrow: 'GEOGRAFIA / SOCIEDADE',
  title: 'POR QUE AS CIDADES EXISTEM?',
  summary:
      'Cidades concentram pessoas, infraestrutura e atividades porque proximidade facilita troca, especialização, serviços e circulação de conhecimento.',
  minutes: 8,
  tags: ['geografia', 'cidade'],
  quickTake:
      'Cidades geram vantagens de proximidade, mas também concentram problemas como congestionamento, custo de moradia, poluição e desigualdade.',
  simpleExplanation:
      'Quando muitas pessoas e empresas estão próximas, fica mais fácil encontrar clientes, trabalhadores, fornecedores e serviços especializados.',
  example:
      'Um hospital de alta complexidade precisa de muitos profissionais e pacientes; uma grande cidade oferece densidade suficiente para sustentar esse tipo de serviço.',
  body: [
    'As primeiras grandes cidades surgiram ligadas a agricultura excedente, poder político, comércio e organização religiosa.',
    'Proximidade reduz certos custos de transporte e comunicação e facilita mercados especializados.',
    'Economistas chamam de economias de aglomeração os ganhos produzidos quando pessoas e empresas se concentram.',
    'Infraestrutura compartilhada — água, transporte, energia e serviços públicos — torna densidade possível.',
    'Ao mesmo tempo, solo urbano disputado eleva preços e pode intensificar segregação.',
    'Tecnologia muda funções urbanas, mas não eliminou a vantagem de encontros, redes e serviços concentrados.',
  ],
  remember: [
    'Densidade cria ganhos e custos.',
    'Infraestrutura sustenta concentração.',
    'Cidades são sistemas econômicos e sociais, não só conjuntos de prédios.',
  ],
  whyItMatters:
      'Mais da metade da população mundial vive em áreas urbanas, então entender cidades ajuda a pensar moradia, transporte, clima e desigualdade.',
  curiosity:
      'Algumas das maiores cidades do mundo funcionam hoje como regiões metropolitanas formadas por vários municípios conectados.',
  connections: ['Urbanismo', 'Metrô', 'Habitação', 'Infraestrutura'],
);
const metroTopic = KnowledgeTopic(
  id: 'metro',
  eyebrow: 'CIDADE / MOBILIDADE',
  title: 'COMO UM METRÔ MOVE TANTA GENTE?',
  summary:
      'Trens grandes, vias exclusivas, estações frequentes e operação coordenada permitem transportar milhares de passageiros por hora sem disputar espaço com carros.',
  minutes: 8,
  tags: ['cidade', 'tecnologia'],
  quickTake:
      'A força do metrô não é velocidade máxima: é capacidade de mover muita gente de forma repetível num corredor de alta demanda.',
  simpleExplanation:
      'Um trem leva centenas ou milhares de pessoas de uma vez e outro pode chegar poucos minutos depois, usando uma faixa de infraestrutura dedicada.',
  example:
      'Uma linha movimentada consegue oferecer dezenas de trens por hora em cada direção quando sinalização, estações e operação suportam intervalos curtos.',
  body: [
    'Metrôs usam direito de passagem segregado, evitando cruzamentos e congestionamentos do trânsito comum.',
    'A capacidade depende do tamanho dos trens, frequência, sinalização e tempo de parada nas estações.',
    'Sistemas modernos controlam distância entre trens para manter segurança com intervalos menores.',
    'Estações precisam escoar rapidamente passageiros para evitar que plataformas virem gargalos.',
    'Integração com ônibus, caminhada e outros modos determina quantas pessoas conseguem acessar a rede.',
    'Construção é cara, por isso metrôs fazem mais sentido em corredores com demanda alta e persistente.',
  ],
  remember: [
    'Capacidade depende muito da frequência.',
    'Via exclusiva evita congestionamento externo.',
    'Estação também pode ser gargalo.',
  ],
  whyItMatters:
      'Metrôs mostram como infraestrutura e operação precisam funcionar juntas para transformar densidade urbana em mobilidade eficiente.',
  curiosity:
      'Algumas redes usam operação automática para reduzir variação entre trens e permitir intervalos muito curtos.',
  connections: ['Cidades', 'Urbanismo', 'Sinalização', 'Transporte público'],
);
const aviacaoTopic = KnowledgeTopic(
  id: 'aviacao',
  eyebrow: 'TECNOLOGIA / FÍSICA',
  title: 'COMO UM AVIÃO CONSEGUE VOAR?',
  summary:
      'As asas desviam ar e criam uma diferença de pressão que gera sustentação; motores fornecem empuxo para manter velocidade suficiente contra o arrasto.',
  minutes: 8,
  tags: ['tecnologia', 'ciência'],
  quickTake:
      'A sustentação não vem de uma única explicação simples sobre ar “percorrer distâncias iguais” sobre a asa. Pressão, circulação e desvio do fluxo fazem parte do mesmo fenômeno aerodinâmico.',
  simpleExplanation:
      'Ao avançar, a asa encontra o ar com um formato e ângulo que fazem o fluxo ser desviado para baixo. A interação produz uma força resultante para cima.',
  example:
      'Ao aumentar o ângulo de ataque até certo ponto, a asa pode gerar mais sustentação; acima de um limite, o fluxo se separa e ocorre estol.',
  body: [
    'Quatro forças principais aparecem no voo: peso, sustentação, empuxo e arrasto.',
    'O formato da asa e seu ângulo em relação ao fluxo criam distribuição de pressão e desviam ar para baixo.',
    'A sustentação cresce com velocidade, densidade do ar, área da asa e coeficiente aerodinâmico.',
    'Motores não “seguram” o avião no ar diretamente; fornecem empuxo para vencer arrasto e manter movimento.',
    'Flaps alteram a geometria da asa para gerar mais sustentação em velocidades menores durante decolagem e pouso.',
    'Pilotos controlam atitude e trajetória usando superfícies móveis e potência.',
  ],
  remember: [
    'Voo envolve quatro forças principais.',
    'Asas geram sustentação pela interação com o fluxo de ar.',
    'Estol ocorre quando o fluxo se separa demais da asa.',
  ],
  whyItMatters:
      'Aviação combina física, materiais, motores, meteorologia e sistemas de controle numa das tecnologias de transporte mais complexas do cotidiano.',
  curiosity:
      'Um avião comercial pode continuar planando por uma distância considerável mesmo sem empuxo dos motores, porque suas asas continuam produzindo sustentação enquanto houver velocidade.',
  connections: ['Aerodinâmica', 'Motores', 'Meteorologia', 'GPS'],
);
const psicanaliseTopic = KnowledgeTopic(
 id:'psicanalise', eyebrow:'PSICOLOGIA / IDEIAS', title:'O QUE FREUD MUDOU NA FORMA DE PENSAR A MENTE?', summary:'A psicanálise colocou conflitos inconscientes, infância e interpretação no centro de uma nova teoria da vida psíquica.', minutes:7, tags:['psicologia', 'história'],
 quickTake:'Freud não descobriu simplesmente uma parte escondida do cérebro; ele propôs um modelo teórico da mente que teve enorme influência cultural.', simpleExplanation:'Pense em uma decisão para a qual você inventa uma explicação racional depois: a psicanálise popularizou a ideia de que nem todos os motivos estão disponíveis à consciência.', example: 'Em uma obra de ficção, um personagem pode defender uma escolha com argumentos racionais enquanto a narrativa revela desejos que ele não reconhece. É uma forma de ilustrar a hipótese psicanalítica, não de comprová-la.', body:['No fim do século XIX, Freud desenvolveu métodos baseados em fala, associação e interpretação.', 'O conceito de inconsciente já existia, mas ganhou uma formulação nova em sua obra.', 'Sonhos, lapsos e sintomas eram interpretados como possíveis expressões de conflitos.', 'Muitas proposições freudianas são controversas ou difíceis de testar pelos padrões científicos atuais.', 'A influência da psicanálise permanece forte em clínica, literatura, cinema e crítica cultural.'], remember:['Psicanálise é teoria e prática clínica.', 'Freud não inventou sozinho a ideia de inconsciente.', 'Influência cultural e validação científica são questões diferentes.'],
 whyItMatters: 'A psicanálise moldou a linguagem cotidiana sobre desejos, infância e conflitos internos. Conhecer seu contexto permite reconhecer essa influência em filmes e livros, sem confundir impacto cultural com comprovação científica de todas as teses freudianas.', curiosity:'Freud começou sua carreira como neurologista antes de desenvolver a psicanálise.', connections:['Vieses', 'Memória', 'Surrealismo', 'Sonhos'],
);

const existencialismoTopic = KnowledgeTopic(
 id:'existencialismo', eyebrow:'FILOSOFIA / VIDA', title:'O QUE SIGNIFICA DIZER QUE A EXISTÊNCIA VEM ANTES DA ESSÊNCIA?', summary:'Pensadores existencialistas exploraram liberdade, responsabilidade, absurdo e a construção de sentido numa vida sem roteiro pronto.', minutes:7, tags:['filosofia', 'cultura'],
 quickTake:'Existencialismo não é simplesmente pessimismo; muitas de suas ideias enfatizam liberdade e responsabilidade.', simpleExplanation:'Se não existe uma função humana totalmente determinada de antemão, escolhas ajudam a construir quem uma pessoa se torna.', example: 'Uma pessoa pode seguir a carreira esperada pela família ou escolher outro caminho. A reflexão existencialista pergunta como ela assume responsabilidade por essa decisão, reconhecendo também os limites de suas circunstâncias.', body:['O termo reúne autores que não concordavam em tudo.', 'Søren Kierkegaard e Nietzsche são frequentemente tratados como precursores.', 'Jean-Paul Sartre formulou a ideia de que a existência precede a essência.', 'Simone de Beauvoir aplicou questões de liberdade e situação à experiência social.', 'Albert Camus discutiu o absurdo, embora rejeitasse ser rotulado simplesmente como existencialista.'], remember:['Não é uma doutrina única.', 'Liberdade implica responsabilidade.', 'Camus tinha relação complexa com o rótulo.'],
 whyItMatters: 'O existencialismo oferece uma linguagem para discutir escolhas, responsabilidade e busca de sentido. Também ajuda a perceber a diferença entre afirmar que nossas decisões importam e supor, incorretamente, que todos enfrentam as mesmas possibilidades.', curiosity:'Sartre recusou o Prêmio Nobel de Literatura em 1964.', connections:['Estoicismo', 'Iluminismo', 'Psicologia', 'Literatura'],
  media:[KnowledgeMedia(type:KnowledgeMediaType.audio,url:'https://open.spotify.com/episode/4wP3UFSdtmQqnH4am6QUFj',title:'O Existencialismo, o Absurdo e a Pedra de Sísifo',caption:'8 min · Filosofia em Meia Hora',sourceLabel:'Spotify · Filosofia em Meia Hora',sourceUrl:'https://open.spotify.com/episode/4wP3UFSdtmQqnH4am6QUFj'),]);

const romaTopic = KnowledgeTopic(
 id:'roma-imperio', eyebrow:'HISTÓRIA / IMPÉRIOS', title:'COMO ROMA PASSOU DE CIDADE A IMPÉRIO?', summary:'Alianças, exércitos, cidadania, estradas e instituições permitiram a Roma incorporar territórios durante séculos.', minutes:7, tags:['história', 'geopolítica'],
 quickTake:'Roma não conquistou o Mediterrâneo num único plano contínuo; expansão e instituições mudaram ao longo do tempo.', simpleExplanation:'Uma cidade derrotada podia ser destruída, aliada ou incorporada com diferentes graus de cidadania, criando uma rede política flexível.', example: 'Uma cidade aliada podia fornecer soldados a Roma, manter parte de suas instituições locais e, ao longo do tempo, negociar novas formas de participação no sistema romano.', body:['Roma passou por monarquia, república e governo imperial.', 'A República expandiu-se primeiro pela península Itálica e depois pelo Mediterrâneo.', 'Estradas e portos ajudaram a mover exércitos, impostos e comércio.', 'A cidadania romana foi gradualmente ampliada a populações muito além da cidade.', 'O poder imperial no Ocidente terminou no século V, enquanto Constantinopla permaneceu como centro romano oriental.'], remember:['Roma teve várias formas de governo.', 'Cidadania foi instrumento político.', 'O fim de Roma não aconteceu numa única data para todo o império.'],
 whyItMatters: 'A expansão romana ajuda a entender que impérios não crescem apenas por batalhas: alianças, cidadania, infraestrutura e negociações também alteram a integração política. Esse olhar torna comparações históricas menos simplistas.', curiosity:'O Império Romano do Oriente continuou por quase mil anos após o fim do império ocidental.', connections:['Democracia ateniense', 'Império Otomano', 'Alfabeto', 'Cristianismo'],
);

const renascimentoCientificoTopic = KnowledgeTopic(
 id:'renascimento-cientifico', eyebrow:'CIÊNCIA / HISTÓRIA', title:'COMO A CIÊNCIA MODERNA COMEÇOU A TOMAR FORMA?', summary:'Observação, matemática, instrumentos e novas comunidades de investigação transformaram o estudo da natureza entre os séculos XVI e XVII.', minutes:7, tags:['ciência', 'história'],
 quickTake:'A chamada Revolução Científica não foi um instante em que ciência substituiu ignorância; foi uma transformação gradual e disputada.', simpleExplanation:'Um telescópio permitiu observar fenômenos celestes que argumentos filosóficos sozinhos não conseguiam resolver.', example: 'Imagine observar a trajetória de um planeta, registrar posições em datas diferentes e comparar o resultado com previsões rivais. A passagem da autoridade do argumento para o teste observável é parte importante dessa transformação.', body:['Copérnico publicou um modelo heliocêntrico em 1543.', 'Kepler descreveu órbitas planetárias elípticas com relações matemáticas.', 'Galileu combinou experimentos, matemática e observações telescópicas.', 'Newton unificou fenômenos terrestres e celestes com leis do movimento e gravitação.', 'Sociedades científicas e impressão aceleraram comunicação e crítica de resultados.'], remember:['Foi gradual e coletiva.', 'Instrumentos mudaram o que podia ser observado.', 'Matemática tornou-se cada vez mais central.'],
 whyItMatters: 'Conhecer as mudanças nos métodos de investigação ajuda a diferenciar uma ideia plausível de uma conclusão sustentada por observações e testes. A ciência moderna se desenvolveu gradualmente, não com uma descoberta isolada.', curiosity:'Galileu aperfeiçoou e usou telescópios para astronomia, mas não inventou o telescópio.', connections:['Renascimento', 'Imprensa', 'Relatividade', 'Iluminismo'],
  media:[KnowledgeMedia(type:KnowledgeMediaType.audio,url:'https://open.spotify.com/episode/60dxhMsLkBLs3XKcVO8zHD',title:'Aristóteles - Revolução Científica 1/2',caption:'33 min · Filosofia',sourceLabel:'Spotify · Filosofia',sourceUrl:'https://open.spotify.com/episode/60dxhMsLkBLs3XKcVO8zHD'),]);

const evolucaoInternetTopic = KnowledgeTopic(
 id:'evolucao-internet', eyebrow:'TECNOLOGIA / HISTÓRIA', title:'COMO A INTERNET VIROU A REDE DO PLANETA?', summary:'Redes experimentais, protocolos abertos e infraestrutura comercial conectaram bilhões de dispositivos ao longo de décadas.', minutes:7, tags:['tecnologia', 'história'],
 quickTake:'Internet e Web não são a mesma coisa: a Web é um serviço que funciona sobre a infraestrutura da internet.', simpleExplanation:'Um e-mail e uma página web podem atravessar a mesma rede usando protocolos diferentes.', example: 'Ao abrir uma página no celular, seu aparelho solicita dados pela rede usando protocolos compartilhados. Você pode estar conectado por Wi-Fi enquanto o servidor usa outro tipo de infraestrutura; a comunicação ainda funciona.', body:['ARPANET conectou computadores de pesquisa nos Estados Unidos a partir de 1969.', 'TCP/IP criou uma linguagem comum para interligar redes diferentes.', 'A adoção de TCP/IP em 1983 é um marco da internet moderna.', 'Tim Berners-Lee propôs a World Wide Web em 1989.', 'Comercialização, cabos submarinos, Wi‑Fi e redes móveis ampliaram o acesso global.'], chapters: [
  KnowledgeChapter(title: 'O desafio inicial era conectar redes diferentes', paragraphs: [
    'Antes de serviços populares como sites e aplicativos, pesquisadores buscavam formas de compartilhar recursos entre computadores distantes. A ARPANET foi uma etapa importante, mas não era a internet inteira. O desafio posterior foi fazer redes construídas com tecnologias diferentes trocarem informações seguindo regras comuns.',
    'Essa dificuldade ajudou a orientar o desenvolvimento dos protocolos que fundamentam a internet. Em vez de exigir que todas as redes usem o mesmo equipamento, a arquitetura permite a troca de pacotes entre sistemas interconectados. Uma mensagem inteira pode atravessar vários equipamentos e enlaces até chegar ao destino.',
  ]),
  KnowledgeChapter(title: 'Internet e web são duas coisas diferentes', paragraphs: [
    'A internet é a infraestrutura lógica que interliga redes; a World Wide Web é um dos serviços que usam essa infraestrutura. O correio eletrônico e outras aplicações também podem funcionar nela sem serem páginas web. Confundir essas camadas é um pouco como chamar toda uma rede de estradas de serviço de entregas.',
    'A web ajudou a tornar conteúdos ligados por endereços e hiperlinks mais acessíveis a pessoas fora de comunidades técnicas. Mas o crescimento do uso público dependeu de muitos elementos em conjunto: computadores pessoais, telecomunicações, padrões compartilhados, navegadores e serviços comerciais.',
  ]),
  KnowledgeChapter(title: 'Siga os passos de uma mensagem', paragraphs: [
    'Quando você abre um site, seu dispositivo normalmente precisa localizar o endereço de rede relacionado ao domínio, estabelecer uma conexão e solicitar os recursos da página. Cada etapa pode passar por equipamentos e prestadores diferentes. Por isso, uma falha de resolução de nomes pode impedir o acesso mesmo quando seu Wi-Fi parece conectado.',
    'Esse mapa mental ajuda a distinguir problemas locais, indisponibilidade de um servidor e interrupções no caminho. Também explica por que a internet não é controlada por um único botão central: ela depende de cooperação técnica, infraestrutura física e decisões distribuídas, ainda que alguns serviços concentrem bastante tráfego.',
  ]),
 ],
 remember:['Internet é infraestrutura de redes.', 'Web é um serviço sobre ela.', 'Protocolos abertos permitiram interoperabilidade.'],
 whyItMatters: 'Entender que a internet é uma rede de redes ajuda a separar conexão, serviços e plataformas. Isso torna mais fáceis conversas sobre privacidade, interrupções, neutralidade e dependência de grandes provedores.', curiosity:'A primeira mensagem da ARPANET, em 1969, pretendia escrever LOGIN, mas a conexão caiu depois de LO.', connections:['Cloud', 'Criptografia', 'Open source', 'IA'],
  media:[KnowledgeMedia(type:KnowledgeMediaType.audio,url:'https://open.spotify.com/episode/2KKNSHafRynRMcVHFNxQPG',title:'Historia de Internet: la red que lo cambió todo',caption:'39 min · DianaUribe.fm',sourceLabel:'Spotify · DianaUribe.fm',sourceUrl:'https://open.spotify.com/episode/2KKNSHafRynRMcVHFNxQPG'),]);

const impressionismoTopic = KnowledgeTopic(
 id:'impressionismo', eyebrow:'ARTE / HISTÓRIA', title:'POR QUE OS IMPRESSIONISTAS PARECIAM TÃO RADICAIS?', summary:'Pinceladas visíveis, cenas modernas e atenção à luz desafiaram convenções acadêmicas da pintura do século XIX.', minutes:7, tags:['arte', 'cultura'],
 quickTake:'Impressionismo não era apenas pintar paisagens bonitas; também mudou temas, técnica e a própria ideia de acabamento.', simpleExplanation:'Em vez de esconder cada pincelada, artistas deixavam marcas de tinta perceptíveis para sugerir luz e movimento.', example: 'De perto, uma pintura pode parecer feita de manchas soltas. Ao se afastar, as pinceladas se combinam visualmente e sugerem o reflexo mutável da luz sobre a água.', body:['O primeiro salão impressionista independente ocorreu em Paris em 1874.', 'Monet, Renoir, Degas, Morisot e Pissarro estiveram entre figuras importantes, com trajetórias distintas.', 'Tintas em tubos facilitaram trabalhar fora do ateliê.', 'Fotografia e gravuras japonesas influenciaram novas composições.', 'Cenas de lazer, ruas e vida moderna apareceram com frequência.'], chapters: [
  KnowledgeChapter(title: 'Uma outra maneira de retratar a modernidade', paragraphs: [
    'Parte dos artistas associados ao impressionismo procurou representar cenas da vida urbana e paisagens sem reproduzir necessariamente o acabamento minucioso valorizado por instituições acadêmicas. Mudanças na vida das cidades, novos espaços de lazer e interesse em efeitos fugazes de luz ofereceram temas e problemas visuais.',
    'Nas exposições coletivas organizadas a partir de 1874, participantes tinham trajetórias e abordagens diferentes. A palavra impressionismo tornou-se um rótulo conveniente, mas não descreve um conjunto de regras obrigatórias seguido de maneira idêntica por todos.',
  ]),
  KnowledgeChapter(title: 'A pincelada pode ser parte da informação', paragraphs: [
    'Em vez de esconder todo o processo de pintura sob superfícies perfeitamente uniformes, muitos artistas deixavam marcas rápidas e perceptíveis. Cores próximas e contrastes eram utilizados para sugerir mudanças de luz e atmosfera. O efeito pode mudar muito conforme a distância do observador até a tela.',
    'Isso não quer dizer que os pintores simplesmente trabalhavam sem planejamento. Composição, séries de estudos e atenção às condições de observação faziam parte de diversas obras. A aparente espontaneidade podia ser fruto de escolhas cuidadosas.',
  ]),
  KnowledgeChapter(title: 'Quem aparece numa cena cotidiana também importa', paragraphs: [
    'Observe uma pintura de estação ferroviária, jardim, café ou ambiente doméstico. Pergunte o que ela revela sobre lazer, trabalho, classe social ou papéis de gênero no período. Uma cena aparentemente comum pode guardar marcas da modernização das cidades e dos hábitos das pessoas.',
    'Também vale comparar quais artistas receberam prestígio histórico e quem ficou menos visível. A participação de pintoras como Berthe Morisot e Mary Cassatt ajuda a evitar uma narrativa composta exclusivamente por poucos nomes masculinos.',
  ]),
 ],
 remember:['1874 é um marco.', 'O grupo não tinha um estilo único.', 'Tecnologia dos materiais ajudou novas práticas.'],
 whyItMatters: 'O impressionismo oferece uma forma de observar como luz, cor e percepção mudam a representação de uma mesma cena. Ele também mostra por que movimentos artísticos podem desafiar os critérios dominantes de sua época.', curiosity:'O nome do movimento veio de uma crítica ao quadro Impression, soleil levant, de Claude Monet.', connections:['Fotografia', 'Perspectiva', 'Modernismo', 'Paris'],
  media:[KnowledgeMedia(type:KnowledgeMediaType.audio,url:'https://open.spotify.com/episode/5q9fOah2rdZ1NgLnWRXSUe',title:'Claude Monet: O Pintor da Luz e das Cores',caption:'6 min · Loucos por Biografias',sourceLabel:'Spotify · Loucos por Biografias',sourceUrl:'https://open.spotify.com/episode/5q9fOah2rdZ1NgLnWRXSUe'),]);

const arquiteturaModernaTopic = KnowledgeTopic(
 id:'arquitetura-moderna', eyebrow:'ARQUITETURA / DESIGN', title:'POR QUE O MODERNISMO QUIS REINVENTAR OS EDIFÍCIOS?', summary:'Novos materiais, industrialização e mudanças sociais incentivaram arquitetos a abandonar parte da ornamentação histórica.', minutes:7, tags:['arquitetura', 'design'],
 quickTake:'Arquitetura moderna não significa apenas prédio novo; refere-se a movimentos históricos com ideias específicas sobre espaço e construção.', simpleExplanation:'Estruturas de aço e concreto permitem separar paredes de funções que antes eram necessariamente estruturais.', example: 'Em um edifício com pilares estruturais independentes, divisórias internas podem ser reposicionadas com mais liberdade do que em uma construção na qual cada parede carrega o peso dos andares.', body:['Industrialização trouxe aço, concreto armado e vidro em novas escalas.', 'Arquitetos questionaram a cópia de estilos históricos.', 'Plantas mais livres tornaram-se possíveis com novas estruturas.', 'Bauhaus e Le Corbusier difundiram ideias modernistas internacionalmente.', 'O modernismo assumiu formas diferentes conforme clima, política e cultura local.'], remember:['Moderno não significa apenas contemporâneo.', 'Materiais mudaram possibilidades.', 'Houve muitos modernismos.'],
 whyItMatters: 'Ao observar edifícios modernos, vale perguntar como materiais, estrutura, circulação e clima influenciam a experiência das pessoas. A história do movimento ajuda a avaliar suas propostas e críticas sem reduzi-lo a fachadas retas.', curiosity:'A frase forma segue a função é anterior à Bauhaus e foi associada ao arquiteto Louis Sullivan.', connections:['Bauhaus', 'Brasília', 'Lina Bo Bardi', 'Brutalismo'],
  media:[KnowledgeMedia(type:KnowledgeMediaType.audio,url:'https://open.spotify.com/episode/40rZc48u83PN4fzRd6xKap',title:'Arquicast 211 – Villa Savoye',caption:'1 h 25 min · Arquicast',sourceLabel:'Spotify · Arquicast',sourceUrl:'https://open.spotify.com/episode/40rZc48u83PN4fzRd6xKap'),]);

const linguisticaTopic = KnowledgeTopic(
 id:'linguistica', eyebrow:'LINGUAGEM / CIÊNCIA', title:'COMO OS LINGUISTAS ESTUDAM UMA LÍNGUA SEM DIZER O QUE É “CERTO”?', summary:'A linguística descreve padrões de sons, palavras, frases, significados e usos observados entre falantes.', minutes:7, tags:['linguagem', 'ciência'],
 quickTake:'Linguística descritiva pergunta como as pessoas realmente falam; gramáticas normativas definem convenções para certos contextos.', simpleExplanation:'Dizer nós vai pode ser socialmente estigmatizado em alguns contextos, mas ainda possui padrões linguísticos analisáveis.', example: 'Se um grupo usa a mesma construção gramatical de modo consistente em sua comunidade, o linguista descreve quando e como ela funciona. A escolha de usá-la em uma entrevista formal é outra questão.', body:['Fonética e fonologia estudam sons sob perspectivas diferentes.', 'Morfologia investiga estrutura interna de palavras.', 'Sintaxe analisa como elementos formam frases.', 'Semântica e pragmática tratam de significado e contexto.', 'Sociolinguística mostra como variação se relaciona a região, grupo, identidade e situação.'], chapters: [
  KnowledgeChapter(title: 'Descrever primeiro, avaliar depois', paragraphs: [
    'Quando uma comunidade utiliza uma língua, seus participantes empregam padrões compartilhados mesmo sem consultar gramáticas escolares. A linguística procura descobrir como esses padrões funcionam e variam: sons, formação de palavras, estrutura de frases, significados e usos em contextos específicos. Seu objetivo científico não é começar dizendo quais pessoas falam bem ou mal.',
    'Uma regra de linguagem formal pode ser relevante em provas ou documentos profissionais, mas isso não torna variedades populares desprovidas de organização. Distinguir convenção social, adequação ao contexto e descrição científica é essencial para entender o trabalho de um linguista.',
  ]),
  KnowledgeChapter(title: 'Mudanças acontecem porque línguas estão vivas', paragraphs: [
    'Pronúncias, palavras e construções circulam entre pessoas e gerações. Contato entre grupos, tecnologias, migração e hábitos cotidianos podem contribuir para mudanças. Quem estuda esse processo compara registros históricos, observações de comunidades e, quando possível, padrões encontrados em muitos falantes.',
    'Uma variedade regional não é uma versão fracassada de outra: pode ter estruturas, vocabulário e trajetórias próprias. Ao mesmo tempo, sociedades atribuem prestígio desigual a certas maneiras de falar. A linguística investiga esses julgamentos sem pressupor que a variedade socialmente prestigiada seja intrinsecamente superior.',
  ]),
  KnowledgeChapter(title: 'A língua também revela relações de poder', paragraphs: [
    'Considere uma entrevista de emprego, uma conversa entre amigos e uma mensagem enviada por aplicativo. A mesma pessoa pode variar vocabulário, pronúncia e construção de frases conforme interlocutores e objetivos. Esse ajuste contextual não representa necessariamente falsidade ou falta de conhecimento: faz parte da competência comunicativa.',
    'Conhecer esses mecanismos ajuda a interpretar preconceito linguístico, ensino de idiomas, tradução e tecnologias de reconhecimento de fala. Um sistema treinado apenas com uma variedade pode funcionar pior para falantes de outras; a diversidade da linguagem é também uma questão prática de projeto.',
  ]),
 ],
 remember:['Descrever não é prescrever.', 'Variação tem padrões.', 'Fala e escrita são sistemas relacionados, mas diferentes.'],
 whyItMatters: 'A linguística ajuda a compreender variação regional, mudança histórica e preconceito linguístico. Uma forma de falar pode seguir regras consistentes e, ao mesmo tempo, receber avaliações sociais diferentes conforme o contexto.', curiosity:'Todas as línguas naturais conhecidas possuem estruturas complexas, mesmo quando não têm tradição escrita.', connections:['Etimologia', 'Alfabeto', 'Evolução das línguas', 'Comunicação'],
  media:[KnowledgeMedia(type:KnowledgeMediaType.audio,url:'https://open.spotify.com/episode/0Ysv78HC9HMqFgwtk3jj8V',title:'Variação linguística, uma conversa com Raquel Freitag',caption:'29 min · Linguística ON',sourceLabel:'Spotify · Linguística ON',sourceUrl:'https://open.spotify.com/episode/0Ysv78HC9HMqFgwtk3jj8V'),]);

const antropologiaTopic = KnowledgeTopic(
 id:'antropologia', eyebrow:'SOCIEDADE / CULTURA', title:'O QUE A ANTROPOLOGIA TENTA ENTENDER?', summary:'A disciplina compara formas humanas de viver, significar, organizar relações e transformar ambientes.', minutes:7, tags:['sociedade', 'cultura'],
 quickTake:'Antropologia não estuda apenas povos distantes; também investiga empresas, cidades, internet, ciência e cotidiano.', simpleExplanation:'Um pesquisador pode acompanhar durante meses a rotina de uma comunidade para entender práticas a partir do contexto de quem participa delas.', example: 'O significado de compartilhar uma refeição pode variar muito entre grupos. Observar quem serve, quem se reúne e em que ocasiões ajuda a entender o costume sem supor que exista uma explicação universal.', body:['Antropologia possui tradições culturais, sociais, biológicas, linguísticas e arqueológicas.', 'Trabalho de campo tornou-se central em muitas vertentes.', 'Etnografia combina observação, participação, entrevistas e interpretação.', 'A disciplina revisou criticamente vínculos históricos com colonialismo.', 'Comparação cultural ajuda a questionar aquilo que uma sociedade trata como natural ou óbvio.'], remember:['Não estuda apenas sociedades antigas.', 'Etnografia é um método central.', 'A disciplina também critica sua própria história.'],
 whyItMatters: 'A antropologia oferece métodos para interpretar práticas sociais a partir do ponto de vista de seus participantes. Isso ajuda a questionar generalizações e distinguir diferenças culturais de julgamentos apressados.', curiosity:'Etnografia tornou-se um método influente muito além da própria antropologia.', connections:['Cultura', 'Linguagem', 'Cidades', 'História'],
  media:[KnowledgeMedia(type:KnowledgeMediaType.audio,url:'https://open.spotify.com/episode/0z2OK3gS8Mxp18iC2f87M6',title:'Antropologia Clássica: dos primórdios à Escola de Manchester',caption:'1 h 56 min · História FM',sourceLabel:'Spotify · História FM',sourceUrl:'https://open.spotify.com/episode/0z2OK3gS8Mxp18iC2f87M6'),]);

const origemVidaTopic = KnowledgeTopic(
 id:'origem-vida', eyebrow:'CIÊNCIA / GRANDES QUESTÕES', title:'COMO A VIDA PODE TER COMEÇADO?', summary:'Pesquisadores investigam caminhos químicos pelos quais moléculas simples poderiam formar sistemas capazes de replicação e evolução.', minutes:7, tags:['ciência', 'biologia'],
 quickTake:'A origem da vida ainda é uma questão aberta; evolução explica como populações mudam depois que sistemas replicadores existem.', simpleExplanation:'Moléculas capazes de copiar informação com erros ocasionais criariam condições para seleção natural agir.', example: 'Pesquisadores podem testar em laboratório se certas moléculas se formam em condições que simulam ambientes antigos. Um resultado positivo mostra uma etapa possível, não uma recriação demonstrada da origem da vida.', body:['A Terra formou-se há cerca de 4,5 bilhões de anos.', 'Evidências indicam vida muito antiga, mas os primeiros sistemas não foram preservados de forma completa.', 'Hipóteses investigam ambientes como fontes hidrotermais e superfícies minerais.', 'RNA é interessante porque pode carregar informação e também catalisar certas reações.', 'Nenhum cenário único é hoje uma explicação completa e confirmada.'], chapters: [
  KnowledgeChapter(title: 'O problema começa antes dos primeiros organismos', paragraphs: [
    'Investigar a origem da vida é perguntar como sistemas químicos passaram a apresentar características associadas a organismos: armazenamento de informação, manutenção de processos e capacidade de produzir descendentes sujeitos à evolução. Como não há registro completo desse período distante, pesquisadores combinam geologia, química, biologia e experimentos.',
    'Uma hipótese importante envolve moléculas capazes de armazenar informação e participar de reações antes das células modernas. Outra pergunta envolve membranas e compartimentos que permitiriam concentrar substâncias e manter condições internas. Não há motivo para supor que todos esses componentes tenham surgido de uma vez ou na ordem exata das células atuais.',
  ]),
  KnowledgeChapter(title: 'Uma hipótese precisa produzir previsões testáveis', paragraphs: [
    'Experimentos podem investigar se moléculas relevantes se formam em ambientes que lembram determinados cenários antigos. Estudos de meteoritos, ambientes hidrotermais e organismos atuais oferecem pistas complementares. Cada linha de evidência tem limitações; obter uma molécula em laboratório não equivale a demonstrar como surgiram os primeiros seres vivos.',
    'É importante distinguir duas perguntas: como a vida começou e como seres vivos passaram a se diversificar depois que sistemas capazes de evolução já existiam. A seleção natural explica muito da evolução biológica, mas não substitui toda a investigação sobre a etapa pré-biológica.',
  ]),
  KnowledgeChapter(title: 'O que ainda não sabemos é parte da história', paragraphs: [
    'A astrobiologia procura entender condições de habitabilidade e possíveis sinais biológicos dentro e fora do Sistema Solar. Descobrir água, moléculas orgânicas ou um ambiente potencialmente habitável é interessante, mas nenhuma dessas observações isoladas confirma a existência de vida.',
    'A pergunta sobre a origem da vida permanece aberta porque cenários distintos podem explicar partes dos dados. Uma boa leitura científica separa achados reproduzíveis, hipóteses em investigação e narrativas atraentes que ainda carecem de comprovação.',
  ]),
 ],
 remember:['É uma questão em aberto.', 'Origem da vida e evolução são perguntas diferentes.', 'Química prebiótica oferece pistas, não uma resposta final.'],
 whyItMatters: 'Estudar a origem da vida ensina a separar hipóteses sobre os primeiros sistemas vivos da evolução biológica posterior. Também mostra como pesquisas combinam química, geologia e biologia sem fingir que o problema já foi resolvido.', curiosity:'Experimentos já mostraram que moléculas orgânicas podem surgir em condições não biológicas, mas isso não resolve toda a origem da vida.', connections:['Evolução', 'DNA', 'Oceanos', 'Fermi'],
  media:[KnowledgeMedia(type:KnowledgeMediaType.audio,url:'https://open.spotify.com/episode/4LHl7iXkD7vHjEgbpis17H',title:'Origem da Vida',caption:'8 min · Pílulas de Biologia',sourceLabel:'Spotify · Pílulas de Biologia',sourceUrl:'https://open.spotify.com/episode/4LHl7iXkD7vHjEgbpis17H'),]);

const mitologiaGregaTopic = KnowledgeTopic(
 id:'mitologia-grega', eyebrow:'HISTÓRIA / MITOLOGIA', title:'POR QUE OS MITOS GREGOS CONTINUAM EM TODO LUGAR?', summary:'Histórias de deuses e heróis foram reinterpretadas por séculos e continuam estruturando referências na arte, literatura e linguagem.', minutes:7, tags:['história', 'cultura'],
 quickTake:'Mitologia grega não era um livro único com uma versão oficial: histórias variavam conforme época, cidade e autor.', simpleExplanation:'Um mesmo herói podia aparecer de maneira diferente numa epopeia, numa peça teatral e numa tradição local.', example: 'Compare duas narrativas sobre o mesmo deus ou herói escritas em épocas e regiões diferentes: detalhes, valores e personagens secundários podem mudar sem que uma versão precise ser a única válida.', body:['Mitos ajudavam a explicar origens, rituais, relações sociais e fenômenos naturais.', 'Homero e Hesíodo registraram versões muito influentes, mas não exclusivas.', 'Deuses gregos possuíam poderes extraordinários e comportamentos profundamente humanos.', 'Roma reinterpretou muitas divindades e narrativas gregas.', 'Renascimento e neoclassicismo recuperaram intensamente esses temas.'], remember:['Não havia cânone único.', 'Mitos mudavam conforme contexto.', 'Roma ajudou a transmitir muitas histórias.'],
 whyItMatters:'Amplia o repertório e conecta este assunto a temas históricos, científicos e culturais já presentes no app.', curiosity:'Muitos nomes de planetas e constelações que usamos hoje preservam tradições mitológicas greco-romanas.', connections:['Democracia ateniense', 'Roma', 'Renascimento', 'Literatura'],
  media:[KnowledgeMedia(type:KnowledgeMediaType.audio,url:'https://open.spotify.com/episode/2kbRJwvpZjuuya51NWUHru',title:'Mitologia Grega: o Início do Mundo',caption:'21 min · Filosofatos',sourceLabel:'Spotify · Filosofatos',sourceUrl:'https://open.spotify.com/episode/2kbRJwvpZjuuya51NWUHru'),]);

const reformaProtestanteTopic = KnowledgeTopic(
 id:'reforma-protestante', eyebrow:'HISTÓRIA / RELIGIÃO', title:'COMO A REFORMA PROTESTANTE TRANSFORMOU A EUROPA?', summary:'Críticas religiosas, imprensa e disputas políticas fragmentaram a cristandade ocidental no século XVI.', minutes:7, tags:['história', 'cultura'],
 quickTake:'A Reforma não foi obra de uma única pessoa nem teve apenas causas religiosas.', simpleExplanation:'As 95 teses associadas a Martinho Lutero entraram num ambiente em que textos podiam circular muito mais rapidamente graças à imprensa.', example: 'Um texto religioso impresso podia chegar a leitores de cidades diferentes muito mais rapidamente do que uma cópia manuscrita, ampliando o alcance das disputas sobre doutrina e autoridade.', body:['Em 1517, Lutero tornou públicas críticas ligadas especialmente às indulgências.', 'Reformadores como Calvino e Zwinglio desenvolveram tradições distintas.', 'Governantes viram nas disputas religiosas também oportunidades e riscos políticos.', 'A Igreja Católica respondeu com reformas internas e o Concílio de Trento.', 'Guerras e acordos religiosos redesenharam partes da Europa.'], remember:['1517 é um marco simbólico.', 'Houve várias reformas protestantes.', 'Imprensa acelerou circulação de ideias.'],
 whyItMatters:'Amplia o repertório e conecta este assunto a temas históricos, científicos e culturais já presentes no app.', curiosity:'A tradução da Bíblia para línguas locais também influenciou alfabetização e padronização linguística.', connections:['Imprensa', 'Iluminismo', 'Europa', 'Linguagem'],
  media:[KnowledgeMedia(type:KnowledgeMediaType.audio,url:'https://open.spotify.com/episode/2ItxGh1gXSKsVeOtvsFOcc',title:'Reformas Protestantes: mudando os rumos do Cristianismo',caption:'1 h 7 min · História FM',sourceLabel:'Spotify · História FM',sourceUrl:'https://open.spotify.com/episode/2ItxGh1gXSKsVeOtvsFOcc'),]);

const revolucaoRussaTopic = KnowledgeTopic(
 id:'revolucao-russa', eyebrow:'HISTÓRIA / REVOLUÇÕES', title:'POR QUE HOUVE DUAS REVOLUÇÕES NA RÚSSIA EM 1917?', summary:'Guerra, crise econômica e perda de legitimidade derrubaram o czar e depois permitiram aos bolcheviques tomar o poder.', minutes:7, tags:['história', 'geopolítica'],
 quickTake:'A Revolução Russa de 1917 teve fases diferentes e não foi um único levante contínuo.', simpleExplanation:'Em fevereiro, o regime czarista caiu; meses depois, em outubro, os bolcheviques derrubaram o Governo Provisório.', example: 'Uma pessoa que saiu às ruas contra o czar no início de 1917 não precisava apoiar a tomada de poder bolchevique que ocorreu meses depois. Os participantes e objetivos desses momentos não eram idênticos.', body:['A Primeira Guerra agravou escassez, inflação e desgaste militar.', 'Protestos e motins levaram à abdicação de Nicolau II.', 'Um Governo Provisório dividiu autoridade com sovietes de trabalhadores e soldados.', 'Lenin e os bolcheviques defenderam transferência de poder aos sovietes e saída da guerra.', 'Após outubro, uma guerra civil consolidou um novo regime que daria origem à URSS.'], remember:['Fevereiro e outubro foram fases distintas.', 'A Primeira Guerra foi decisiva.', 'A URSS surgiu depois, em 1922.'],
 whyItMatters:'Amplia o repertório e conecta este assunto a temas históricos, científicos e culturais já presentes no app.', curiosity:'A Rússia ainda utilizava o calendário juliano, por isso as datas históricas mudam quando convertidas ao calendário gregoriano.', connections:['Primeira Guerra', 'Guerra Fria', 'URSS', 'Revolução Francesa'],
  media:[KnowledgeMedia(type:KnowledgeMediaType.audio,url:'https://open.spotify.com/episode/5EEQDyqXECl4zhY1m5O3pl',title:'Revolução Russa',caption:'37 min · História em Meia Hora',sourceLabel:'Spotify · História em Meia Hora',sourceUrl:'https://open.spotify.com/episode/5EEQDyqXECl4zhY1m5O3pl'),]);

const penicilinaTopic = KnowledgeTopic(
 id:'penicilina', eyebrow:'CIÊNCIA / MEDICINA', title:'COMO UM FUNGO AJUDOU A REVOLUCIONAR A MEDICINA?', summary:'A descoberta da penicilina abriu caminho para antibióticos capazes de tratar muitas infecções bacterianas antes frequentemente fatais.', minutes:7, tags:['ciência', 'saúde'],
 quickTake:'Fleming observou o fenômeno, mas transformar penicilina em medicamento exigiu anos de trabalho de muitos pesquisadores.', simpleExplanation:'Uma contaminação por mofo numa placa bacteriana revelou uma zona onde bactérias não cresciam.', example: 'Depois da descoberta do efeito antibacteriano, transformar a substância em medicamento útil exigiu pesquisa adicional sobre purificação, produção e testes. Observar algo promissor não é o mesmo que ter um tratamento pronto.', body:['Alexander Fleming observou o efeito antibacteriano do Penicillium em 1928.', 'Ele publicou a descoberta, mas a substância era difícil de purificar e produzir.', 'Howard Florey, Ernst Chain e equipes posteriores desenvolveram métodos para transformá-la em terapia prática.', 'Produção industrial aumentou rapidamente nos anos 1940.', 'O uso de antibióticos também criou forte pressão evolutiva para resistência.'], remember:['1928 foi a descoberta inicial.', 'Medicamento exigiu trabalho coletivo.', 'Resistência é consequência evolutiva.'],
 whyItMatters:'Amplia o repertório e conecta este assunto a temas históricos, científicos e culturais já presentes no app.', curiosity:'A produção em massa de penicilina ganhou escala durante a Segunda Guerra Mundial.', connections:['Antibióticos', 'Evolução', 'Segunda Guerra', 'Microbioma'],
);

const neuroplasticidadeTopic = KnowledgeTopic(
 id:'neuroplasticidade', eyebrow:'CIÊNCIA / CÉREBRO', title:'O CÉREBRO CONSEGUE SE REORGANIZAR?', summary:'Experiência, aprendizagem e lesões podem alterar conexões e funções de circuitos neurais ao longo da vida.', minutes:7, tags:['ciência', 'psicologia'],
 quickTake:'Neuroplasticidade não significa que o cérebro possa se transformar sem limites; mudanças dependem de biologia, idade, treino e contexto.', simpleExplanation:'Praticar uma habilidade repetidamente pode fortalecer e reorganizar redes envolvidas naquela tarefa.', example: 'Ao aprender uma sequência musical, a pessoa corrige erros e repete movimentos. A experiência é um exemplo cotidiano de aprendizagem associada a mudanças na atividade e organização de circuitos neurais.', body:['Sinapses podem fortalecer ou enfraquecer com atividade.', 'Aprendizagem envolve alterações em redes distribuídas.', 'Após algumas lesões, outras áreas podem assumir parte de funções perdidas.', 'Plasticidade é maior em certos períodos do desenvolvimento, mas continua na vida adulta.', 'Mudanças plásticas podem ser úteis ou contribuir para problemas, como dor crônica.'], chapters: [
  KnowledgeChapter(title: 'O cérebro se modifica com a experiência', paragraphs: [
    'Neuroplasticidade é a capacidade de redes neurais apresentarem mudanças associadas a experiência, desenvolvimento, aprendizagem ou recuperação. Algumas alterações dizem respeito à eficácia da comunicação entre neurônios; outras envolvem organização de circuitos e respostas de regiões cerebrais. Não existe um único indicador que represente todas essas mudanças.',
    'Aprender a tocar uma sequência musical ou praticar um movimento são exemplos úteis: repetição acompanhada de feedback pode mudar o desempenho e se associar a adaptações neurais. A melhora observada, entretanto, não mostra automaticamente qual mudança cerebral específica aconteceu naquela pessoa.',
  ]),
  KnowledgeChapter(title: 'Mudança não significa crescimento sem limites', paragraphs: [
    'O termo aparece muito em promessas populares de que qualquer pessoa pode reprogramar inteiramente o cérebro em poucos dias. Isso vai além do que o conceito garante. Plasticidade ocorre sob diferentes condições e pode envolver também ajustes pouco benéficos; idade, contexto, saúde, prática e tipo de tarefa influenciam resultados.',
    'Em estudos de neuroimagem, pesquisadores podem observar medidas que variam após experiências ou treinamento. Interpretar o que esses sinais representam exige cuidado com o método, a duração da observação e a possibilidade de outras explicações. Uma medida alterada não deve ser traduzida automaticamente como criação de neurônios.',
  ]),
  KnowledgeChapter(title: 'Como aplicar a ideia sem cair em milagres', paragraphs: [
    'Em vez de procurar um exercício que supostamente ative todo o cérebro, escolha uma habilidade concreta, divida-a em tarefas treináveis e acompanhe erros e acertos. Aprendizagem e memória dependem de muitos processos; melhora gradual com prática é uma expectativa mais adequada do que transformação instantânea.',
    'Há diferença entre estudar neuroplasticidade e prescrever tratamento para uma condição neurológica. Reabilitação clínica exige avaliação individual e acompanhamento profissional. Para o leitor, a ideia central é compreender que o cérebro é dinâmico, mas não infinitamente maleável.',
  ]),
 ],
 remember:['Plasticidade continua na vida adulta.', 'Não é ilimitada.', 'Aprendizagem altera redes.'],
 whyItMatters:'Amplia o repertório e conecta este assunto a temas históricos, científicos e culturais já presentes no app.', curiosity:'Aprender a ler modifica a maneira como certas regiões visuais respondem a símbolos escritos.', connections:['Memória', 'Hábitos', 'Sono', 'Linguagem'],
  media:[KnowledgeMedia(type:KnowledgeMediaType.audio,url:'https://open.spotify.com/episode/245I29JwNsHuxcO5slMIc1',title:'Dra. Patrícia Brocardo: Neuroplasticidade Cerebral',caption:'1 h 4 min · Eslen Podcast',sourceLabel:'Spotify · Eslen Podcast',sourceUrl:'https://open.spotify.com/episode/245I29JwNsHuxcO5slMIc1'),]);

const teoriaJogosTopic = KnowledgeTopic(
 id:'teoria-jogos', eyebrow:'ECONOMIA / ESTRATÉGIA', title:'O QUE A TEORIA DOS JOGOS TEM A VER COM DECISÕES REAIS?', summary:'Ela estuda situações em que o resultado de cada participante depende também das escolhas dos outros.', minutes:7, tags:['economia', 'matemática'],
 quickTake:'Um jogo, nesse contexto, pode ser uma negociação, competição de preços ou acordo internacional — não precisa ser entretenimento.', simpleExplanation:'Se duas empresas escolhem preços sabendo que cada decisão afeta a reação da concorrente, existe interdependência estratégica.', example: 'Duas cafeterias na mesma rua decidem se fazem uma promoção. O resultado para cada uma depende não só de sua escolha, mas também do que a concorrente decidir.', body:['Modelos especificam participantes, estratégias, informações e resultados.', 'John von Neumann e Oskar Morgenstern foram fundamentais na formalização moderna.', 'John Nash desenvolveu um conceito de equilíbrio para estratégias mutuamente consistentes.', 'Jogos repetidos podem criar incentivos diferentes de interações únicas.', 'A teoria é usada em economia, biologia, ciência política e computação.'], chapters: [
  KnowledgeChapter(title: 'O resultado depende das escolhas alheias', paragraphs: [
    'Imagine duas empresas que decidem seus preços sem conhecer antecipadamente a decisão da concorrente. O ganho de cada uma depende do preço que ela escolher e também da reação da outra. A teoria dos jogos estuda situações assim, nas quais ações de participantes diferentes são estrategicamente interdependentes.',
    'Um modelo descreve jogadores, alternativas disponíveis, informações e resultados associados a combinações de escolhas. Ele simplifica a realidade de propósito. A utilidade vem de deixar explícitas hipóteses que poderiam ficar escondidas em frases vagas sobre competição ou colaboração.',
  ]),
  KnowledgeChapter(title: 'Por que a cooperação às vezes falha', paragraphs: [
    'No dilema do prisioneiro, o arranjo de incentivos pode levar participantes a escolher individualmente uma alternativa que produz um resultado coletivo inferior ao da cooperação. O exemplo não prova que as pessoas sejam sempre egoístas; mostra o que pode acontecer sob determinadas regras e informações.',
    'Mudar as regras ou a possibilidade de interação futura pode alterar as decisões. Confiança, repetição, contratos e reputação são alguns dos elementos que podem modificar incentivos, dependendo do contexto. Essa é uma razão para desconfiar de análises que tratam um jogo isolado como explicação universal de todo comportamento humano.',
  ]),
  KnowledgeChapter(title: 'Use uma matriz para organizar uma decisão', paragraphs: [
    'Desenhe uma tabela de duas empresas, cada uma com a escolha de manter ou reduzir preços. Em cada combinação, anote resultados plausíveis para ambas. Sem precisar adivinhar exatamente o mercado, esse exercício já mostra quais decisões exigem considerar a concorrência.',
    'Na prática, decisões também envolvem incerteza, informação incompleta, leis, restrições operacionais e vários participantes. O conceito de equilíbrio ajuda a analisar situações em que nenhum jogador tem incentivo para mudar unilateralmente sua escolha, mas não significa que o resultado seja necessariamente justo ou socialmente desejável.',
  ]),
 ],
 remember:['Decisões são interdependentes.', 'Equilíbrio não significa melhor resultado.', 'Repetição muda incentivos.'],
 whyItMatters:'Amplia o repertório e conecta este assunto a temas históricos, científicos e culturais já presentes no app.', curiosity:'O famoso dilema do prisioneiro mostra como decisões individualmente racionais podem produzir um resultado coletivo ruim.', connections:['Probabilidade', 'Economia', 'Xadrez', 'Algoritmos'],
  media:[KnowledgeMedia(type:KnowledgeMediaType.audio,url:'https://open.spotify.com/episode/5HtIgdor3blsJdckLMN0qa',title:'Como você ganha: Teoria dos Jogos',caption:'14 min · LABORATÓRIO Podcast',sourceLabel:'Spotify · LABORATÓRIO Podcast',sourceUrl:'https://open.spotify.com/episode/5HtIgdor3blsJdckLMN0qa'),]);

const blockchainTopic = KnowledgeTopic(
 id:'blockchain', eyebrow:'TECNOLOGIA / INTERNET', title:'O QUE UMA BLOCKCHAIN FAZ ALÉM DE CRIPTOMOEDAS?', summary:'Ela mantém um registro compartilhado cuja ordem e integridade são verificadas por regras criptográficas e mecanismos de consenso.', minutes:7, tags:['tecnologia', 'finanças'],
 quickTake:'Blockchain é um tipo específico de banco de dados distribuído; nem todo problema precisa dela.', simpleExplanation:'Vários participantes podem manter cópias de um histórico e concordar sobre novas entradas sem uma única base central controlando tudo.', example: 'Duas organizações que compartilham registros de uma cadeia logística poderiam consultar um mesmo histórico distribuído. Isso ajuda a comparar alterações, mas não garante que a informação cadastrada inicialmente seja verdadeira.', body:['Blocos agrupam registros e referências criptográficas ao histórico anterior.', 'Hashes tornam alterações retroativas detectáveis.', 'Redes precisam de um mecanismo para concordar sobre o estado válido.', 'Blockchains públicas sacrificam algumas eficiências para reduzir dependência de uma autoridade central.', 'Contratos inteligentes permitem executar regras programadas em algumas redes.'], remember:['É um registro distribuído.', 'Consenso é essencial.', 'Descentralização traz custos e benefícios.'],
 whyItMatters:'Amplia o repertório e conecta este assunto a temas históricos, científicos e culturais já presentes no app.', curiosity:'Bitcoin popularizou a combinação de blockchain com prova de trabalho.', connections:['Bitcoin', 'Criptografia', 'Internet', 'Algoritmos'],
);

const reggaeTopic = KnowledgeTopic(
 id:'reggae', eyebrow:'MÚSICA / CULTURA', title:'COMO O REGGAE DA JAMAICA VIROU UMA VOZ GLOBAL?', summary:'Ritmos jamaicanos, sistemas de som e mensagens sociais transformaram um gênero local em influência mundial.', minutes:7, tags:['música', 'cultura'],
 quickTake:'Reggae é uma tradição diversa que nasceu de estilos jamaicanos anteriores, especialmente ska e rocksteady.', simpleExplanation:'A guitarra frequentemente acentua tempos fracos do compasso, criando a pulsação imediatamente reconhecível do gênero.', example: 'Escute uma música de reggae e tente bater palmas com os acordes curtos que aparecem entre as batidas mais fortes: perceber os contratempos ajuda a reconhecer parte de sua identidade rítmica.', body:['Sistemas de som foram fundamentais na cultura musical jamaicana.', 'Ska surgiu antes, com andamento geralmente mais rápido.', 'Rocksteady desacelerou o pulso e destacou linhas de baixo.', 'Reggae consolidou-se no fim dos anos 1960.', 'Rastafári, desigualdade e política aparecem em parte importante de seu repertório.'], remember:['Veio de tradições anteriores.', 'Baixo e contratempo são marcantes.', 'Bob Marley popularizou, não inventou.'],
 whyItMatters:'Amplia o repertório e conecta este assunto a temas históricos, científicos e culturais já presentes no app.', curiosity:'Bob Marley ampliou enormemente a projeção internacional do reggae, mas não foi seu inventor.', connections:['Hip-hop', 'Jazz', 'Jamaica', 'Cultura'],
);

const rococoTopic = KnowledgeTopic(
 id:'rococo', eyebrow:'ARTE / HISTÓRIA', title:'POR QUE O ROCOCÓ PARECE TÃO EXAGERADAMENTE DELICADO?', summary:'Curvas, cores claras, ornamentação e cenas de lazer criaram uma linguagem associada às elites europeias do século XVIII.', minutes:7, tags:['arte', 'design'],
 quickTake:'Rococó não é simplesmente barroco mais decorado; desenvolveu escala, temas e atmosferas próprias.', simpleExplanation:'Interiores podiam combinar espelhos, douramento, curvas assimétricas e tons pastéis para dissolver visualmente paredes e teto.', example: 'Em um salão rococó, um espelho pode prolongar visualmente uma parede curva e refletir adornos dourados, fazendo a decoração parecer continuar além do espaço físico.', body:['O estilo floresceu especialmente na França do início do século XVIII.', 'Salões privados substituíram parte da monumentalidade de palácios anteriores.', 'Pintores como Watteau e Fragonard exploraram cenas de lazer e sedução.', 'Ornamentos assimétricos inspirados na natureza eram frequentes.', 'O neoclassicismo depois reagiu contra aspectos associados ao excesso rococó.'], chapters: [
  KnowledgeChapter(title: 'Leveza visual não significa simplicidade técnica', paragraphs: [
    'O rococó se associou a interiores, objetos e pinturas de ornamentação dinâmica, curvas e efeitos assimétricos. Conchas estilizadas, folhagens, superfícies brilhantes e composições delicadas podiam exigir artesãos de grande habilidade. Sua aparência leve muitas vezes escondia trabalho intenso de projeto e execução.',
    'O estilo circulou por ambientes e regiões distintos ao longo do século XVIII. Não foi somente a pintura de uma corte específica; móveis, talheres, espelhos, gravuras e espaços interiores também carregavam elementos dessa linguagem.',
  ]),
  KnowledgeChapter(title: 'Como um estilo viaja entre sociedades', paragraphs: [
    'Gravuras, livros de desenho, mercadorias importadas e trabalhadores especializados ajudaram motivos rococós a atravessar fronteiras. Ao chegar a outro contexto, uma forma decorativa podia ser reinterpretada conforme materiais, recursos econômicos e preferências locais. A circulação não produziu réplicas idênticas em todos os lugares.',
    'Uma cadeira e uma parede decorada podem compartilhar curvas e motivos ornamentais sem cumprir a mesma função. Compará-las ajuda a observar como uma linguagem visual pode existir em escalas e técnicas diferentes.',
  ]),
  KnowledgeChapter(title: 'Um olhar além do rótulo exagerado', paragraphs: [
    'Escolha um ambiente rococó e acompanhe as linhas que atravessam molduras, espelhos e elementos esculpidos. Observe como elas produzem movimento e como a luz amplia a decoração. Depois compare o espaço a um interior de formas mais geométricas e simétricas.',
    'Evite a ideia de que um estilo substituiu outro em todas as regiões ao mesmo tempo. Barroco, rococó, classicismos e tradições locais coexistiram e se transformaram em calendários diferentes; rótulos históricos organizam a observação, mas não eliminam as sobreposições.',
  ]),
 ],
 remember:['Século XVIII foi central.', 'Interiores eram fundamentais.', 'Neoclassicismo reagiu ao estilo.'],
 whyItMatters:'Amplia o repertório e conecta este assunto a temas históricos, científicos e culturais já presentes no app.', curiosity:'O nome rococó está ligado à palavra francesa rocaille, associada à ornamentação com pedras e conchas.', connections:['Barroco', 'Iluminismo', 'Moda', 'Art Déco'],
);

const urbanismoTopic = KnowledgeTopic(
 id:'urbanismo', eyebrow:'CIDADE / DESIGN', title:'QUEM DESENHA UMA CIDADE?', summary:'Ruas, leis, transportes, mercado imobiliário e decisões coletivas moldam cidades continuamente — muito além do trabalho de um único urbanista.', minutes:7, tags:['cidade', 'design'],
 quickTake:'Uma cidade não funciona como um prédio ampliado: milhões de decisões descentralizadas alteram o plano original.', simpleExplanation:'Abrir uma linha de metrô pode mudar onde empresas e moradores desejam se instalar, alterando preços e densidade.', example: 'Ao planejar uma nova linha de ônibus, não basta desenhar o trajeto mais curto: é preciso observar horários de trabalho, acessibilidade, conexões e quem ficará sem atendimento.', body:['Urbanismo organiza relações entre uso do solo, mobilidade, infraestrutura e espaço público.', 'Zoneamento influencia onde diferentes atividades podem acontecer.', 'Redes de transporte alteram acessibilidade e valor da terra.', 'Espaços públicos dependem tanto de desenho quanto de uso e manutenção.', 'Planejamento contemporâneo precisa lidar com clima, desigualdade, habitação e crescimento metropolitano.'], remember:['Cidade é sistema dinâmico.', 'Transporte e uso do solo interagem.', 'Plano e realidade nunca são idênticos.'],
 whyItMatters:'Amplia o repertório e conecta este assunto a temas históricos, científicos e culturais já presentes no app.', curiosity:'Planos urbanos frequentemente produzem efeitos diferentes dos previstos décadas depois.', connections:['Cidades', 'Metrô', 'Brasília', 'Arquitetura moderna'],
);

const barrocoTopic = KnowledgeTopic(
 id:'barroco', eyebrow:'ARTE / HISTÓRIA', title:'POR QUE O BARROCO É TÃO DRAMÁTICO?', summary:'Contrastes, movimento e teatralidade transformaram arte e arquitetura dos séculos XVII e XVIII.', minutes:7, tags:['arte', 'história'], quickTake:'Barroco não é apenas excesso decorativo: luz, escala e composição eram usados para produzir emoção e presença.', simpleExplanation:'Uma igreja barroca pode dirigir o olhar com curvas, douramento e luz para transformar o espaço numa experiência quase teatral.', example: 'Diante de uma pintura com forte contraste entre luz e sombra, observe como seu olhar é conduzido até o rosto ou gesto principal. A encenação visual é uma forma de produzir intensidade dramática.', body:['O estilo desenvolveu-se na Europa a partir do fim do século XVI.', 'Contrastes intensos de luz marcaram parte importante da pintura barroca.', 'Arquitetura explorou curvas, eixos e efeitos espaciais.', 'Igreja, monarquias e elites financiaram muitas obras.', 'Nas Américas, tradições locais transformaram modelos europeus.'], chapters: [
  KnowledgeChapter(title: 'Movimento e dramatização são técnicas', paragraphs: [
    'O barroco reúne práticas diversas desenvolvidas a partir do fim do século XVI em contextos religiosos, políticos e culturais variados. Pintura, arquitetura, música e escultura exploraram recursos próprios para criar presença e intensidade. Uma pintura de contraste luminoso extremo não produz o mesmo tipo de efeito que uma igreja cheia de curvas, embora ambas possam dirigir fortemente a atenção.',
    'Em muitas obras, a organização da cena conduz o olhar até um gesto, rosto ou acontecimento central. Esse recurso não é simplesmente decoração excessiva: composição, iluminação, materiais e posição do observador participam da experiência.',
  ]),
  KnowledgeChapter(title: 'Não existe um único barroco', paragraphs: [
    'Na pintura, a linguagem naturalista e a luz dramática associadas a Caravaggio influenciaram numerosos artistas. Ao mesmo tempo, outras correntes barrocas mantiveram maior equilíbrio compositivo ou desenvolveram soluções distintas. Não é preciso escolher um único exemplo como definição de todas as manifestações.',
    'Nas Américas, materiais, oficinas e tradições regionais transformaram linguagens vindas da Europa. No Brasil, obras ligadas a igrejas e centros urbanos oferecem perspectivas próprias sobre a circulação e a adaptação dessas formas.',
  ]),
  KnowledgeChapter(title: 'Como perceber a intenção de uma obra', paragraphs: [
    'Repare onde fica a área mais iluminada, para onde as figuras olham, como os corpos se movimentam e qual parte da composição parece convidar sua atenção. Esse exercício ajuda a reconhecer a teatralidade visual sem reduzir a análise ao gosto pessoal.',
    'Depois compare dois objetos barrocos de regiões e funções distintas. A diferença entre eles pode ser tão informativa quanto a semelhança: estilos são convenções históricas úteis, não receitas de aparência obrigatória.',
  ]),
 ],
 remember:['Drama é estrutural, não só decorativo.', 'Houve vários barrocos.', 'O Brasil criou expressões próprias.'], whyItMatters:'Amplia o repertório e cria novas conexões com assuntos já existentes no app.', curiosity:'O barroco ganhou linguagens próprias no Brasil, especialmente em Minas Gerais.', connections:['Rococó', 'Renascimento', 'Minas Gerais', 'Arquitetura'],
);

const turingTopic = KnowledgeTopic(
 id:'turing', eyebrow:'TECNOLOGIA / HISTÓRIA', title:'QUEM FOI ALAN TURING E POR QUE ELE IMPORTA?', summary:'Suas ideias ajudaram a estabelecer fundamentos teóricos da computação e influenciaram criptografia e inteligência artificial.', minutes:7, tags:['tecnologia', 'ciência'], quickTake:'Turing não inventou sozinho o computador, mas formulou ideias fundamentais sobre o que significa computar.', simpleExplanation:'Uma máquina de Turing é um modelo abstrato extremamente simples capaz de representar a lógica de qualquer algoritmo computável.', example: 'Imagine uma máquina idealizada que lê um símbolo por vez, pode escrevê-lo ou apagá-lo e segue instruções precisas. Esse exercício abstrato ajuda a discutir o que significa executar um procedimento computável.', body:['Em 1936, Turing publicou um trabalho fundamental sobre computabilidade.', 'Durante a Segunda Guerra, trabalhou em criptoanálise britânica em Bletchley Park.', 'Após a guerra, contribuiu para projetos de computadores eletrônicos.', 'Também pesquisou morfogênese matemática em biologia.', 'Foi perseguido pelo Estado britânico por sua homossexualidade e morreu em 1954.'], chapters: [
  KnowledgeChapter(title: 'Antes dos computadores como os conhecemos', paragraphs: [
    'Na década de 1930, uma pergunta central da lógica era saber que problemas poderiam ser resolvidos por um procedimento mecânico, feito de instruções bem definidas. Alan Turing propôs um modelo abstrato de computação: uma máquina idealizada capaz de manipular símbolos segundo regras precisas. Ela não era um projeto de notebook, mas uma ferramenta para investigar os limites do cálculo.',
    'Uma das ideias poderosas é a máquina universal: um mesmo dispositivo abstrato pode executar diferentes procedimentos quando recebe a descrição apropriada. Essa separação entre mecanismo e instruções é uma base conceitual para compreender computadores programáveis, embora muitas outras pessoas e avanços técnicos tenham participado do desenvolvimento das máquinas reais.',
  ]),
  KnowledgeChapter(title: 'Da teoria à história real', paragraphs: [
    'Durante a Segunda Guerra Mundial, Turing trabalhou na criptoanálise britânica em Bletchley Park. A quebra de sistemas de comunicação criptografados foi um esforço coletivo que reuniu matemáticos, linguistas, engenheiros e operadores. Atribuir todo o trabalho a uma pessoa transforma uma história de colaboração em mito.',
    'Depois da guerra, Turing esteve ligado a projetos de computação eletrônica, incluindo o trabalho com o Automatic Computing Engine, conhecido pela sigla ACE. Seu percurso atravessa matemática, engenharia, discussão sobre inteligência de máquinas e até modelos matemáticos de processos biológicos.',
  ]),
  KnowledgeChapter(title: 'Computar não é a mesma coisa que compreender', paragraphs: [
    'Em um artigo de 1950, Turing propôs uma maneira de discutir o comportamento de máquinas em uma situação de imitação conversacional. A ideia ficou popularmente associada ao chamado teste de Turing. Conseguir produzir respostas que parecem humanas, entretanto, não resolve por si só todas as perguntas filosóficas e científicas sobre entendimento, consciência ou inteligência.',
    'Sua biografia inclui também a perseguição legal que sofreu por ser homossexual, em um contexto no qual relações entre homens eram criminalizadas no Reino Unido. Estudar Turing sem esse aspecto deixaria de fora como instituições sociais podem prejudicar pessoas cuja obra transformou o conhecimento.',
  ]),
 ],
 remember:['Computabilidade foi sua contribuição central.', 'Atuou também em criptografia e biologia.', 'Sua perseguição é parte importante de sua história.'], whyItMatters:'Amplia o repertório e cria novas conexões com assuntos já existentes no app.', curiosity:'O chamado Teste de Turing apareceu num artigo de 1950 sobre inteligência de máquinas.', connections:['Algoritmos', 'Criptografia', 'IA', 'Segunda Guerra'],
);

const sambaTopic = KnowledgeTopic(
 id:'samba', eyebrow:'MÚSICA / BRASIL', title:'COMO O SAMBA VIROU UM SÍMBOLO DO BRASIL?', summary:'Tradições afro-brasileiras, urbanização, rádio e carnaval transformaram práticas diversas numa linguagem musical nacional.', minutes:7, tags:['música', 'brasil'], quickTake:'Samba nunca foi um único ritmo imutável: existem tradições, estilos e contextos muito diferentes.', simpleExplanation:'Rodas, terreiros, casas e depois estúdios e rádios ajudaram a música a circular por redes sociais muito diferentes.', example: 'Uma roda de samba combina canto, instrumentos e participação coletiva; ao passar para gravações e rádio, o gênero ganhou novas formas de produção e circulação sem perder toda a diversidade local.', body:['O samba possui raízes profundas em culturas afro-brasileiras.', 'No Rio de Janeiro, comunidades negras foram decisivas para sua formação urbana.', 'Gravação e rádio ampliaram sua circulação no século XX.', 'Escolas de samba transformaram o carnaval carioca.', 'Partido-alto, samba-canção, pagode e outras vertentes mostram sua diversidade.'], chapters: [
  KnowledgeChapter(title: 'Muito antes de virar um rótulo nacional', paragraphs: [
    'O samba não nasceu pronto, nem tem uma única origem pontual. Tradições musicais e corporais afro-brasileiras circularam por diferentes regiões; no Recôncavo Baiano, o samba de roda reúne canto, dança, instrumentos e participação coletiva. Seu desenvolvimento está ligado às comunidades que preservaram e transformaram práticas culturais apesar da escravidão e de suas consequências.',
    'Com movimentos populacionais e trocas culturais, experiências musicais como as do samba de roda contribuíram para o desenvolvimento do samba urbano no Rio de Janeiro. Isso não significa que todos os tipos de samba tenham a mesma batida ou que a história possa ser resumida à trajetória de um compositor. Há participantes, lugares e tradições nem sempre igualmente lembrados.',
  ]),
  KnowledgeChapter(title: 'A cidade e a tecnologia mudam a música', paragraphs: [
    'Com a expansão da gravação, do rádio e do carnaval urbano no século XX, o samba passou a circular por públicos mais amplos. A gravação fixa uma determinada interpretação, enquanto uma roda permite variações e respostas entre músicos e participantes. Essas formas de circulação coexistiram, influenciaram umas às outras e modificaram a ideia do que seria um samba.',
    'A transformação também envolveu disputas por reconhecimento, trabalho profissional e representação nacional. Quando um estilo passa a simbolizar um país inteiro, vale perguntar quem é convidado a contar essa história e quais tradições recebem menos atenção. Chamar o samba de símbolo brasileiro não deve apagar suas raízes negras nem sua diversidade regional.',
  ]),
  KnowledgeChapter(title: 'Treine o ouvido e amplie a pergunta', paragraphs: [
    'Compare um registro de samba de roda com um samba-canção e uma gravação de partido-alto. Observe andamento, resposta do coro, papel dos instrumentos e relação entre intérpretes. Nenhum exemplo sozinho representa todas as manifestações; é a comparação que torna audível a variedade interna desse universo.',
    'A UNESCO reconhece especificamente o samba de roda do Recôncavo Baiano como patrimônio cultural imaterial, não todos os tipos de samba como uma manifestação idêntica. Essa distinção ajuda a entender por que preservar uma tradição exige atenção às comunidades, aos instrumentos e às práticas de transmissão entre gerações.',
  ]),
 ],
 remember:['Raízes afro-brasileiras são centrais.', 'Rádio ampliou alcance.', 'Samba possui muitas vertentes.'], whyItMatters:'Amplia o repertório e cria novas conexões com assuntos já existentes no app.', curiosity:'Pelo Telefone, registrado em 1916, costuma aparecer como marco da história fonográfica do samba.', connections:['Bossa Nova', 'Jazz', 'Brasil', 'Carnaval'],
);

const imunidadeTopic = KnowledgeTopic(
 id:'imunidade', eyebrow:'CIÊNCIA / CORPO', title:'COMO O CORPO RECONHECE O QUE É PERIGOSO?', summary:'Barreiras, células e moléculas do sistema imune detectam padrões, coordenam respostas e constroem memória.', minutes:7, tags:['ciência', 'saúde'], quickTake:'Imunidade não é um exército que simplesmente ataca tudo que é estrangeiro; ela precisa distinguir contextos e regular a própria resposta.', simpleExplanation:'A pele impede muitas invasões antes que células especializadas sequer precisem agir.', example: 'Ao entrar em contato com uma vacina, o sistema imune pode desenvolver respostas específicas e memória imunológica. Isso ilustra como reconhecer um agente e responder rapidamente são processos relacionados, mas diferentes.', body:['Barreiras físicas e químicas formam uma primeira linha de proteção.', 'Imunidade inata responde rapidamente a padrões de perigo e infecção.', 'Imunidade adaptativa cria respostas altamente específicas.', 'Células B podem produzir anticorpos e células T exercem diferentes funções.', 'Mecanismos regulatórios evitam que a resposta cause dano excessivo ao próprio corpo.'], chapters: [
  KnowledgeChapter(title: 'A defesa começa antes do confronto', paragraphs: [
    'Nosso organismo não depende de uma única célula heroica. Pele, mucosas e outras barreiras reduzem a entrada de diversos microrganismos. Se um agente ultrapassa essas barreiras, componentes da imunidade inata podem reconhecer padrões associados à infecção e iniciar respostas rápidas, como processos inflamatórios e recrutamento de células de defesa.',
    'Inflamação não é sinônimo de doença nem de proteção perfeita. Ela é uma resposta que pode ser útil em determinadas situações, mas também causar danos quando excessiva ou inadequada. Por isso, um sistema imune saudável precisa de reconhecimento e de mecanismos que controlem a duração e a intensidade das próprias reações.',
  ]),
  KnowledgeChapter(title: 'Duas formas de responder que cooperam', paragraphs: [
    'A imunidade adaptativa envolve respostas mais específicas. Linfócitos B podem produzir anticorpos, enquanto diferentes grupos de linfócitos T participam da coordenação das respostas ou do combate a células infectadas. A ação de um grupo influencia a do outro: a divisão entre imunidade inata e adaptativa é útil para estudar, mas não descreve equipes isoladas.',
    'Parte das respostas específicas pode produzir memória imunológica. Assim, diante de uma nova exposição a um agente já reconhecido, o organismo pode responder de maneira mais rápida ou eficaz. Isso não significa que toda exposição gere proteção permanente: duração da memória, variações do agente e características individuais também importam.',
  ]),
  KnowledgeChapter(title: 'Por que vacinar não equivale a contrair a doença', paragraphs: [
    'Uma vacina apresenta ao organismo antígenos, microrganismos preparados ou instruções para produzir determinados antígenos, dependendo da tecnologia. O objetivo é estimular respostas de proteção sem exigir que a pessoa passe pela doença contra a qual se busca proteção. Algumas vacinas usam doses adicionais para reforçar a resposta e a memória.',
    'Uma pergunta importante é qual resultado está sendo medido: risco de infecção, de doença sintomática ou de desfechos graves não são medidas idênticas. A proteção pode variar conforme o agente e a vacina, e nenhuma resposta biológica dispensa o exame de evidências clínicas. Esse cuidado permite avaliar afirmações sobre imunidade com mais precisão.',
  ]),
 ],
 remember:['Inata e adaptativa cooperam.', 'Anticorpos são apenas uma parte.', 'Regulação é tão importante quanto ataque.'], whyItMatters:'Amplia o repertório e cria novas conexões com assuntos já existentes no app.', curiosity:'Febre e inflamação são respostas do organismo, não microrganismos em si.', connections:['Vacinas', 'Antibióticos', 'Microbioma', 'DNA'],
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
  stoicismTopic,
  renaissanceTopic,
  frenchRevolutionTopic,
  blackDeathTopic,
  evolutionTopic,
  quantumTopic,
  dnaTopic,
  aiTopic,
  internetTopic,
  bitcoinTopic,
  jazzTopic,
  cinemaTopic,
  fashionTopic,
  coffeeTopic,
  mapsTopic,
  placeboTopic,
  languageTopic,
  illuminismoTopic,
  imperioOtomanoTopic,
  guerraFriaTopic,
  relatividadeTopic,
  buracosNegrosTopic,
  vacinasTopic,
  sonoTopic,
  viesesTopic,
  jurosCompostosTopic,
  bolhasTopic,
  fotografiaTopic,
  perspectivaTopic,
  sushiTopic,
  perfumeTopic,
  coresTopic,
  musicaTonalTopic,
  democraciaAtenasTopic,
  escritaTopic,
  imprensaTopic,
  oceanosTopic,
  vulcoesTopic,
  egitoTopic,
  mongolTopic,
  rotaSedaTopic,
  vikingsTopic,
  maiasTopic,
  astecasTopic,
  incasTopic,
  revolucaoIndustrialTopic,
  primeiraGuerraTopic,
  segundaGuerraTopic,
  direitosHumanosTopic,
  placasTectonicasTopic,
  terremotosTopic,
  auroraTopic,
  estrelasTopic,
  elementosTopic,
  antibioticosTopic,
  microbiomaTopic,
  memoriaTopic,
  dopaminaTopic,
  habitosTopic,
  linguagemCorporalTopic,
  pibTopic,
  cambioTopic,
  acoesTopic,
  contabilidadeTopic,
  supplyChainTopic,
  criptografiaTopic,
  cloudTopic,
  gpsTopic,
  semicondutoresTopic,
  algoritmosTopic,
  openSourceTopic,
  arquiteturaGoticaTopic,
  artDecoTopic,
  surrealismoTopic,
  popArtTopic,
  minimalismoTopic,
  grafiteTopic,
  hipHopTopic,
  bossaNovaTopic,
  cinemaMudoTopic,
  efeitosVisuaisTopic,
  modaJeansTopic,
  tenisTopic,
  fermentacaoTopic,
  chocolateTopic,
  paoTopic,
  umamiTopic,
  alfabetoTopic,
  etimologiaTopic,
  tempoFusosTopic,
  cidadesTopic,
  metroTopic,
  aviacaoTopic,
  psicanaliseTopic,
  existencialismoTopic,
  romaTopic,
  renascimentoCientificoTopic,
  evolucaoInternetTopic,
  impressionismoTopic,
  arquiteturaModernaTopic,
  linguisticaTopic,
  antropologiaTopic,
  origemVidaTopic,
  mitologiaGregaTopic,
  reformaProtestanteTopic,
  revolucaoRussaTopic,
  penicilinaTopic,
  neuroplasticidadeTopic,
  teoriaJogosTopic,
  blockchainTopic,
  reggaeTopic,
  rococoTopic,
  urbanismoTopic,
  barrocoTopic,
  turingTopic,
  sambaTopic,
  imunidadeTopic,
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

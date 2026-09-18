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


const stoicismTopic = KnowledgeTopic(
  id: 'estoicismo', eyebrow: 'FILOSOFIA / VIDA', title: 'ESTOICISMO NÃO É “NÃO SENTIR NADA”',
  summary: 'Uma filosofia antiga sobre distinguir o que depende de nós do que não depende.', minutes: 7,
  tags: ['filosofia', 'psicologia'], quickTake: 'Estoicismo busca agir bem diante do que acontece, não eliminar emoções.',
  simpleExplanation: 'Os estoicos propunham concentrar energia em julgamentos, escolhas e ações próprias, aceitando que muitos acontecimentos externos escapam ao nosso controle.',
  example: 'Você não controla o atraso de um voo, mas controla como reorganiza seus planos e trata as pessoas ao redor.',
  body: ['O estoicismo surgiu no mundo helenístico e foi desenvolvido por pensadores como Zenão, Sêneca, Epicteto e Marco Aurélio.','Para os estoicos, uma vida boa depende sobretudo de virtude e razão, não de riqueza, fama ou conforto.','A famosa distinção entre o que depende e o que não depende de nós funciona como ferramenta prática para direcionar atenção e responsabilidade.','Aceitação estoica não significa passividade: agir é importante quando a ação está ao nosso alcance.','A filosofia voltou a ganhar popularidade porque oferece linguagem simples para lidar com incerteza, frustração e escolhas.'],
  remember: ['Controle não é o mesmo que influência.','Aceitar não significa desistir.','Virtude e ação importam mais que conforto.'],
  whyItMatters: 'Ajuda a separar problemas que pedem ação daqueles que pedem adaptação.', curiosity: 'Marco Aurélio escreveu suas Meditações como notas pessoais, não como um livro pensado para publicação.',
  connections: ['Epicteto', 'Marco Aurélio', 'Ética', 'Resiliência'],
);

const renaissanceTopic = KnowledgeTopic(
  id: 'renascimento', eyebrow: 'ARTE / HISTÓRIA', title: 'POR QUE O RENASCIMENTO FOI TÃO IMPORTANTE?',
  summary: 'Arte, ciência, comércio e redescoberta de textos antigos transformaram a Europa entre os séculos XIV e XVI.', minutes: 8,
  tags: ['arte', 'história'], quickTake: 'O Renascimento não foi um simples “retorno” à Antiguidade, mas uma reinvenção feita num mundo em mudança.',
  simpleExplanation: 'Artistas e estudiosos passaram a observar com intensidade o corpo, a natureza, a perspectiva e textos clássicos, enquanto cidades ricas financiavam novas obras.',
  example: 'A perspectiva linear permitiu organizar uma pintura como se o espaço continuasse para dentro da parede.',
  body: ['O movimento ganhou força em cidades italianas como Florença, Veneza e Roma.','Humanistas estudaram autores gregos e romanos e colocaram grande atenção na experiência humana, sem que isso significasse abandonar a religião.','Artistas exploraram anatomia, luz, proporção e perspectiva com métodos cada vez mais sistemáticos.','Mecenas, cortes, Igreja e famílias de comerciantes financiaram obras que também funcionavam como símbolos de poder.','A imprensa ajudou ideias e textos a circular em escala muito maior.'],
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
  connections: ['Iluminismo', 'Napoleão', 'Direitos humanos', 'Antigo Regime'],
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
  connections: ['Darwin', 'Genética', 'DNA', 'Resistência bacteriana'],
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
  connections: ['Átomo', 'Semicondutores', 'Laser', 'Relatividade'],
);

const dnaTopic = KnowledgeTopic(
  id: 'dna', eyebrow: 'CIÊNCIA / BIOLOGIA', title: 'O QUE O DNA REALMENTE FAZ?',
  summary: 'DNA armazena informação hereditária, mas genes funcionam dentro de redes celulares e ambientais complexas.', minutes: 7,
  tags: ['ciência', 'biologia'], quickTake: 'DNA é informação biológica, não um roteiro rígido que determina sozinho tudo sobre um organismo.',
  simpleExplanation: 'Trechos de DNA podem orientar a produção de moléculas, especialmente proteínas e RNAs, enquanto células regulam quando e como essa informação é usada.',
  example: 'Quase todas as células do corpo têm o mesmo DNA, mas uma célula da pele e um neurônio ativam conjuntos diferentes de genes.',
  body: ['O DNA é formado por nucleotídeos organizados em uma dupla hélice.','A sequência das bases carrega informação que pode ser copiada e transmitida.','Genes representam apenas parte do genoma e sua expressão é regulada.','Ambiente e desenvolvimento interagem com a genética, por isso muitos traços não têm uma causa genética simples.','Mutações podem ser neutras, prejudiciais ou vantajosas dependendo do contexto.'],
  remember: ['Mesmo DNA, usos diferentes em células diferentes.','Gene não é destino.','Mutações geram variação.'],
  whyItMatters: 'Ajuda a interpretar notícias sobre hereditariedade, testes genéticos, medicina e biotecnologia.', curiosity: 'Se esticado, o DNA de uma única célula humana teria aproximadamente dois metros.',
  connections: ['Genética', 'Evolução', 'RNA', 'CRISPR'],
);

const aiTopic = KnowledgeTopic(
  id: 'ia-generativa', eyebrow: 'TECNOLOGIA / IA', title: 'COMO UMA IA GENERATIVA PRODUZ TEXTO?',
  summary: 'Modelos de linguagem aprendem padrões estatísticos em grandes conjuntos de dados e geram sequências token por token.', minutes: 8,
  tags: ['tecnologia', 'ia'], quickTake: 'Um modelo de linguagem não consulta uma frase pronta: calcula continuamente quais tokens são plausíveis a seguir.',
  simpleExplanation: 'Durante o treinamento, o modelo aprende relações entre palavras, ideias e estruturas. Na geração, usa o contexto recebido para estimar o próximo token repetidamente.',
  example: 'Ao receber “o céu está”, o modelo distribui probabilidades entre continuações possíveis e escolhe uma delas conforme sua configuração.',
  body: ['Texto é dividido em unidades chamadas tokens.','Redes do tipo transformer usam mecanismos de atenção para relacionar partes do contexto.','Treinamento ajusta muitos parâmetros para reduzir erros de previsão.','A geração pode produzir respostas convincentes e ainda assim factualmente erradas, porque plausibilidade linguística não garante verdade.','Ferramentas externas, recuperação de documentos e verificações podem melhorar a fundamentação.'],
  remember: ['Geração acontece token por token.','Plausível não significa verdadeiro.','Contexto muda a resposta.'],
  whyItMatters: 'Entender o mecanismo ajuda a usar IA com expectativas melhores e verificar respostas quando precisão importa.', curiosity: 'Transformers foram apresentados em 2017 e rapidamente se tornaram uma arquitetura central para modelos de linguagem.',
  connections: ['Machine learning', 'Transformer', 'Tokens', 'Redes neurais'],
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
  connections: ['DNS', 'HTTPS', 'Servidor', 'Navegador'],
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
  connections: ['Blockchain', 'Criptografia', 'Moeda', 'Prova de trabalho'],
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
  connections: ['Blues', 'Louis Armstrong', 'Bebop', 'Improvisação'],
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
  connections: ['Kuleshov', 'Eisenstein', 'Narrativa', 'Fotografia'],
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
  connections: ['Paris', 'Luxo', 'Prêt-à-porter', 'História da moda'],
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
  connections: ['Fermentação', 'Torra', 'Espresso', 'Química dos aromas'],
);

const mapsTopic = KnowledgeTopic(
  id: 'mapas', eyebrow: 'GEOGRAFIA / MUNDO', title: 'POR QUE TODO MAPA DISTORCE O MUNDO?',
  summary: 'Transformar a superfície curva da Terra em um plano exige compromissos entre área, forma, distância e direção.', minutes: 7,
  tags: ['geografia', 'mundo'], quickTake: 'Não existe projeção plana perfeita: cada mapa escolhe o que preservar e o que distorcer.',
  simpleExplanation: 'Tente abrir a casca de uma laranja e deixá-la perfeitamente plana sem rasgar ou esticar. O mesmo problema aparece ao representar a Terra.',
  example: 'Na projeção de Mercator, regiões próximas aos polos parecem muito maiores em relação às áreas equatoriais.',
  body: ['Projeções cartográficas são métodos matemáticos para representar uma superfície curva em um plano.','Mercator preserva ângulos locais, característica útil historicamente para navegação.','Projeções equivalentes priorizam proporções de área, mas alteram formas.','Escala e objetivo determinam qual projeção é mais adequada.','Mapas também envolvem escolhas sobre centro, orientação, fronteiras, nomes e dados.'],
  remember: ['Todo mapa plano distorce algo.','Mercator não foi criada para comparar áreas.','Escolher uma projeção é escolher prioridades.'],
  whyItMatters: 'Ajuda a ler mapas criticamente e perceber como representação influencia nossa imagem mental do mundo.', curiosity: 'A Groenlândia parece gigantesca em muitos mapas Mercator, embora a África seja cerca de 14 vezes maior em área.',
  connections: ['Mercator', 'Cartografia', 'Geopolítica', 'Escala'],
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
  connections: ['Ensaios clínicos', 'Nocebo', 'Dor', 'Expectativa'],
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
  connections: ['Latim', 'Sotaque', 'Etimologia', 'Sociolinguística'],
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

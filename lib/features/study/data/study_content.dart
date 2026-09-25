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
    QuizQuestion(
      prompt: 'Uma fachada inteiramente de vidro é automaticamente um bom exemplo de projeto modernista bem resolvido?',
      options: [
        'Sim, porque parece contemporânea',
        'Sim, se tiver linhas retas',
        'Não: função, conforto e adequação ao clima também precisam ser analisados',
        'Não, porque o modernismo proibia vidro',
      ],
      correctIndex: 2,
      explanation: 'Materiais e linguagem não dispensam a análise da função e das condições concretas de uso.',
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
    QuizQuestion(
      prompt: 'A descoberta de milhares de exoplanetas resolve o paradoxo de Fermi?',
      options: [
        'Sim, porque prova que existe vida inteligente',
        'Não: sabemos mais sobre planetas, mas pouco sobre surgimento de vida e civilizações detectáveis',
        'Sim, se alguns estiverem em zonas habitáveis',
        'Não, porque planetas fora do Sistema Solar não podem ter vida',
      ],
      correctIndex: 1,
      explanation: 'Contar planetas informa apenas parte do problema; as variáveis ligadas à vida e à tecnologia seguem incertas.',
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
    QuizQuestion(
      prompt: 'O fim do governo imperial no Ocidente significou que a cultura romana desapareceu imediatamente?',
      options: [
        'Sim, toda lei e língua romanas sumiram em 476',
        'Sim, tanto no Ocidente quanto no Oriente',
        'Não, instituições e práticas tiveram continuidades e mudanças em ritmos diferentes',
        'Não, porque o Ocidente nunca mudou de autoridade',
      ],
      correctIndex: 2,
      explanation: '476 é um marco político; cultura, leis, redes econômicas e o Império do Oriente tiveram trajetórias distintas.',
    ),

  ],
  'contabilidade': [
    QuizQuestion(
      prompt: 'Uma empresa compra uma máquina à vista. Qual é o efeito inicial desse lançamento?',
      options: [
        'Ativo aumenta e receita aumenta',
        'Imobilizado aumenta e caixa diminui',
        'Passivo aumenta e caixa aumenta',
        'Despesa aumenta e imobilizado diminui',
      ],
      correctIndex: 1,
      explanation: 'A aquisição troca um tipo de ativo por outro; o caixa sai e o imobilizado entra.',
    ),
    QuizQuestion(
      prompt: 'Qual grupo de contas normalmente aumenta por débito?',
      options: [
        'Passivo e receitas',
        'Patrimônio líquido e receitas',
        'Ativo e despesas',
        'Todas as contas sem exceção',
      ],
      correctIndex: 2,
      explanation: 'Ativo e despesas geralmente aumentam no lado do débito; passivo, patrimônio e receitas costumam aumentar por crédito.',
    ),
    QuizQuestion(
      prompt: 'Débitos e créditos de um lançamento se equilibram. Isso prova que a classificação está correta?',
      options: [
        'Sim, o equilíbrio elimina qualquer erro',
        'Não, a conta escolhida ainda pode estar incorreta',
        'Sim, desde que o valor seja alto',
        'Não, pois partidas dobradas nunca se equilibram',
      ],
      correctIndex: 1,
      explanation: 'O equilíbrio é indispensável, mas uma despesa lançada na conta errada pode manter a mesma soma.',
    ),
  ],
  'brutalismo': [
    QuizQuestion(
      prompt: 'Qual expressão francesa se relaciona ao concreto aparente de muitas obras brutalistas?',
      options: [
        'Art nouveau',
        'Béton brut',
        'Belle époque',
        'Déjà vu',
      ],
      correctIndex: 1,
      explanation: 'Béton brut significa concreto cru. Materialidade é importante, mas nem toda obra brutalista precisa ser de concreto.',
    ),
    QuizQuestion(
      prompt: 'Qual análise é mais útil para reconhecer arquitetura brutalista?',
      options: [
        'Verificar se há qualquer elemento de concreto',
        'Observar materialidade, estrutura aparente e contexto do projeto',
        'Confirmar que o edifício foi construído antes de 1900',
        'Verificar se o arquiteto evitou totalmente formas monumentais',
      ],
      correctIndex: 1,
      explanation: 'O movimento é relacionado à exposição de materiais e estrutura; concreto por si só não basta.',
    ),
    QuizQuestion(
      prompt: 'Qual afirmação evita uma simplificação sobre o nome brutalismo?',
      options: [
        'O termo foi inventado por fabricantes de concreto',
        'Béton brut é relevante, mas o Novo Brutalismo também tem uma história ligada aos Smithson e ao debate arquitetônico',
        'O movimento exigia obrigatoriamente concreto em todos os projetos',
        'Brutalismo é sempre sinônimo de arquitetura abandonada',
      ],
      correctIndex: 1,
      explanation: 'A história do termo inclui a discussão sobre o Novo Brutalismo e sua valorização de materiais e estruturas visíveis.',
    ),

  ],
  'samba': [
    QuizQuestion(
      prompt: "O samba tem uma origem única que explique todos os estilos?",
      options: ["Sim, uma única gravação deu origem a tudo", "Não; tradições afro-brasileiras diversas contribuíram para a sua história", "Sim, nasceu exclusivamente nas emissoras de rádio", "Sim, todas as regiões adotaram o mesmo ritmo"],
      correctIndex: 1,
      explanation: "Há trajetórias regionais e comunitárias diversas, com contribuições afro-brasileiras decisivas.",
    ),
    QuizQuestion(
      prompt: "O que a popularização do rádio modificou na história do samba?",
      options: ["Acabou com rodas e encontros comunitários", "Ampliou a circulação de certas gravações e interpretações", "Fez todos os estilos terem a mesma batida", "Impossibilitou que músicos trabalhassem profissionalmente"],
      correctIndex: 1,
      explanation: "A circulação por meios de comunicação alcançou novos públicos, sem apagar outras práticas.",
    ),
    QuizQuestion(
      prompt: "Qual manifestação recebeu o reconhecimento específico da UNESCO?",
      options: ["Todo tipo de samba indiferenciadamente", "O samba-canção das emissoras de rádio", "O samba de roda do Recôncavo Baiano", "Todas as escolas de samba urbanas"],
      correctIndex: 2,
      explanation: "O registro da UNESCO refere-se à manifestação do Recôncavo Baiano.",
    ),
  ],
  'imunidade': [
    QuizQuestion(
      prompt: "Qual é o papel inicial da pele e das mucosas?",
      options: ["Impedir a entrada de diversos agentes antes de outras respostas imunes", "Produzir todos os anticorpos do corpo", "Garantir que nenhuma infecção seja possível", "Desligar a resposta inflamatória"],
      correctIndex: 0,
      explanation: "São barreiras de proteção, mas nenhuma defesa impede todas as infecções.",
    ),
    QuizQuestion(
      prompt: "Como a imunidade inata e a adaptativa se relacionam?",
      options: ["São sistemas inteiramente independentes", "A inata deixa de existir depois da infância", "Cooperam e influenciam as respostas do organismo", "A adaptativa atua somente sobre a pele"],
      correctIndex: 2,
      explanation: "A divisão ajuda a estudar funções distintas, mas os componentes cooperam.",
    ),
    QuizQuestion(
      prompt: "Por que a vacinação não exige que a pessoa contraia a doença-alvo?",
      options: ["Porque não envolve nenhuma reação biológica", "Porque estimula proteção com antígenos ou instruções, segundo a tecnologia utilizada", "Porque elimina imediatamente todos os agentes infecciosos", "Porque torna desnecessária a memória imunológica"],
      correctIndex: 1,
      explanation: "O objetivo é preparar respostas protetoras sem exigir a ocorrência da doença.",
    ),
  ],
  'turing': [
    QuizQuestion(
      prompt: "Para que serve o modelo conhecido como máquina de Turing?",
      options: ["Projetar o hardware exato dos notebooks modernos", "Investigar o que procedimentos computáveis podem realizar", "Garantir consciência artificial", "Operar todos os computadores da Segunda Guerra"],
      correctIndex: 1,
      explanation: "O modelo abstrato ajuda a estudar computabilidade e limites de procedimentos.",
    ),
    QuizQuestion(
      prompt: "Qual frase descreve com mais precisão Bletchley Park?",
      options: ["Turing realizou sozinho todos os trabalhos de criptoanálise", "A criptoanálise foi um esforço coletivo do qual Turing participou", "Todos os projetos foram comerciais e posteriores à guerra", "Os projetos não envolveram matemática ou engenharia"],
      correctIndex: 1,
      explanation: "A contribuição de Turing foi importante em um trabalho de equipe.",
    ),
    QuizQuestion(
      prompt: "O teste associado a Turing prova definitivamente a consciência de uma máquina?",
      options: ["Sim, sempre que ela imita respostas humanas", "Não; examina desempenho numa situação de imitação", "Sim, se o computador resolve contas rápidas", "Não, porque modelos teóricos não têm regras"],
      correctIndex: 1,
      explanation: "O teste não elimina todas as questões sobre entendimento e consciência.",
    ),
  ],
  'evolucao-internet': [
    QuizQuestion(
      prompt: "Qual a relação entre internet e World Wide Web?",
      options: ["São dois nomes para a mesma coisa", "A web é um serviço que utiliza a internet", "A internet funciona apenas em navegadores", "A web inventou todas as redes de computadores"],
      correctIndex: 1,
      explanation: "A internet conecta redes e suporta muitos serviços, incluindo a web.",
    ),
    QuizQuestion(
      prompt: "Qual foi uma dificuldade central para o crescimento da internet?",
      options: ["Exigir equipamentos de um único fabricante", "Interligar redes de tecnologias distintas por regras compartilhadas", "Eliminar qualquer infraestrutura física", "Permitir acesso somente a computadores militares"],
      correctIndex: 1,
      explanation: "Protocolos compartilhados ajudaram redes diferentes a trocar dados.",
    ),
    QuizQuestion(
      prompt: "Por que o ícone de Wi-Fi ativo não garante que um site abra?",
      options: ["A conexão local é apenas uma parte de todo o caminho até o site", "Navegadores não usam redes", "O DNS funciona apenas por Bluetooth", "Páginas web nunca dependem de servidores"],
      correctIndex: 0,
      explanation: "Resolução de nomes, rotas e disponibilidade dos servidores são outras etapas.",
    ),
  ],
  'neuroplasticidade': [
    QuizQuestion(
      prompt: "Qual definição corresponde à neuroplasticidade?",
      options: ["A formação obrigatória de novos neurônios a cada atividade", "A capacidade de redes neurais mudarem associada a experiência e outros processos", "A impossibilidade de aprender depois da infância", "Uma técnica específica de leitura rápida"],
      correctIndex: 1,
      explanation: "A plasticidade reúne diferentes mecanismos de mudança neural.",
    ),
    QuizQuestion(
      prompt: "Qual interpretação de um exame cerebral exige cuidado?",
      options: ["A aprendizagem envolve diversos processos", "Uma mudança medida demonstra automaticamente a formação de neurônios", "A experiência pode estar associada a adaptações neurais", "Um estudo precisa considerar o método"],
      correctIndex: 1,
      explanation: "Os sinais de neuroimagem dependem dos métodos e não provam um mecanismo único.",
    ),
    QuizQuestion(
      prompt: "Qual aplicação da ideia é mais adequada?",
      options: ["Esperar transformação ilimitada em um único dia", "Treinar uma habilidade concreta com prática, feedback e metas realistas", "Substituir qualquer reabilitação por um aplicativo", "Considerar toda mudança cerebral necessariamente positiva"],
      correctIndex: 1,
      explanation: "A compreensão científica da plasticidade não justifica promessas ilimitadas.",
    ),
  ],
  'linguistica': [
    QuizQuestion(
      prompt: "O que distingue a descrição linguística do julgamento sobre a fala?",
      options: ["A linguística investiga padrões existentes em comunidades, sem começar rotulando falantes", "A linguística proíbe diferenças regionais", "Toda língua tem apenas a gramática de um livro", "Toda variedade precisa ser usada em qualquer contexto"],
      correctIndex: 0,
      explanation: "A descrição analisa como as pessoas realmente usam e organizam línguas.",
    ),
    QuizQuestion(
      prompt: "O que significa dizer que uma variedade tem menor prestígio social?",
      options: ["Ela não possui regras consistentes", "Ela recebe avaliações sociais diferentes, apesar de ter organização linguística", "Seus falantes não conseguem expressar ideias complexas", "Ela não muda ao longo das gerações"],
      correctIndex: 1,
      explanation: "Prestígio é avaliação social, não uma medida de capacidade gramatical.",
    ),
    QuizQuestion(
      prompt: "Por que uma ferramenta de reconhecimento de voz pode errar mais com alguns sotaques?",
      options: ["Porque só existe uma pronúncia correta", "Porque dados e modelos podem não abranger bem toda a variação linguística", "Porque a língua falada não tem estrutura", "Porque todos os falantes usam palavras idênticas"],
      correctIndex: 1,
      explanation: "A diversidade representada nos dados afeta o desempenho de sistemas linguísticos.",
    ),
  ],
  'dna': [
    QuizQuestion(prompt: "Como a informação contida no DNA pode participar da produção de proteínas?", options: ["As células leem todas as regiões continuamente", "Determinadas sequências são transcritas para RNA e podem orientar a síntese de proteínas", "As proteínas escrevem diretamente todas as bases do genoma", "Toda base do DNA representa uma proteína inteira"], correctIndex: 1, explanation: "Parte das informações do DNA passa por moléculas de RNA antes de participar da produção de proteínas."),
    QuizQuestion(prompt: "É correto afirmar que um gene isolado determina inevitavelmente todos os resultados associados a ele?", options: ["Sim, ambiente e regulação nunca importam", "Não, fatores genéticos e ambientais podem interagir", "Sim, desde que exista um cromossomo", "Não, porque o DNA não possui informação"], correctIndex: 1, explanation: "Regulação, desenvolvimento, ambiente e outras variações influenciam resultados biológicos."),
    QuizQuestion(prompt: "Por que um estudo que encontra associação entre variante genética e característica exige cuidado?", options: ["Porque correlação estatística não demonstra determinação inevitável", "Porque nenhum estudo usa populações", "Porque genes nunca variam", "Porque todas as pessoas têm DNA idêntico"], correctIndex: 0, explanation: "A magnitude, a população e as possíveis explicações alternativas precisam ser consideradas."),
  ],
  'ia-generativa': [
    QuizQuestion(prompt: "Como modelos de linguagem autorregressivos aprendem uma habilidade central durante o pré-treinamento?", options: ["Armazenando uma resposta fixa para qualquer pergunta", "Ajustando parâmetros para prever tokens seguintes a partir do contexto", "Fazendo pesquisas na internet obrigatoriamente em cada exemplo", "Verificando todas as respostas com especialistas em tempo real"], correctIndex: 1, explanation: "Prever unidades seguintes é um objetivo de treinamento relevante de muitos modelos generativos."),
    QuizQuestion(prompt: "O que distingue inferência e treinamento?", options: ["São sempre o mesmo processo", "Inferência usa parâmetros treinados para produzir saídas diante de um contexto", "Inferência necessariamente altera todos os parâmetros do modelo", "Treinamento nunca usa dados"], correctIndex: 1, explanation: "Na inferência normal, o modelo produz respostas usando parâmetros existentes."),
    QuizQuestion(prompt: "Uma resposta de IA parece convincente. O que isso prova?", options: ["Que todos os fatos estão corretos", "Que nenhuma referência precisa ser consultada", "Nada sobre precisão, que depende de evidências e verificação", "Que qualquer número mencionado é reproduzível"], correctIndex: 2, explanation: "Fluência e precisão factual são propriedades diferentes."),
  ],
  'mapas': [
    QuizQuestion(prompt: "Por que qualquer projeção plana do globo envolve distorções?", options: ["Porque todo mapa usa cores erradas", "Porque transformar uma superfície curva em plano exige compromissos geométricos", "Porque as escalas cartográficas são inventadas", "Porque nenhum lugar possui coordenadas"], correctIndex: 1, explanation: "Projeções priorizam propriedades como áreas, direções, distâncias ou formas."),
    QuizQuestion(prompt: "Por que a Groenlândia pode parecer enorme num mapa de Mercator?", options: ["A área verdadeira fica maior quando o papel é estendido", "A projeção amplia a representação em latitudes elevadas", "O hemisfério norte está mais perto do Sol", "A legenda muda a extensão territorial"], correctIndex: 1, explanation: "Mercator não preserva as áreas relativas em escala global."),
    QuizQuestion(prompt: "Uma linha de metrô é desenhada fora da escala. Isso torna o mapa sempre ruim?", options: ["Sim, qualquer desvio geométrico o inutiliza", "Não, o desenho pode priorizar clareza das conexões", "Sim, porque projeções não podem distorcer", "Não, porque mapas não representam informações"], correctIndex: 1, explanation: "Um mapa é uma ferramenta; diferentes finalidades justificam diferentes escolhas."),
  ],
  'teoria-jogos': [
    QuizQuestion(prompt: "Quando uma decisão tem interdependência estratégica?", options: ["Quando o resultado depende também das escolhas dos demais participantes", "Quando uma pessoa escolhe sem efeitos externos", "Quando há somente cálculos de juros", "Quando ninguém conhece regras"], correctIndex: 0, explanation: "A teoria dos jogos estuda decisões com resultados interdependentes."),
    QuizQuestion(prompt: "O dilema do prisioneiro ilustra qual problema?", options: ["Que todas as pessoas cooperam", "Que incentivos individuais podem levar a resultados coletivos piores", "Que decisões não dependem de outras pessoas", "Que só é possível escolher em grupos grandes"], correctIndex: 1, explanation: "A estrutura de incentivos pode produzir resultados distintos da cooperação."),
    QuizQuestion(prompt: "Um equilíbrio estratégico é necessariamente justo ou melhor para todos?", options: ["Sim, por definição", "Não, estabilidade unilateral não garante justiça nem eficiência", "Sim, quando há duas empresas", "Não, porque equilíbrio significa decisão aleatória"], correctIndex: 1, explanation: "A estabilidade das escolhas não é o mesmo que avaliar seu resultado social."),
  ],
  'origem-vida': [
    QuizQuestion(prompt: "Qual pergunta corresponde ao estudo da origem da vida?", options: ["Como sistemas químicos passaram a adquirir propriedades associadas à vida", "Qual é a data exata do primeiro ser humano", "Por que todos os organismos atuais são idênticos", "Como uma espécie evoluiu há poucos anos"], correctIndex: 0, explanation: "A origem da vida investiga transições químicas anteriores aos primeiros sistemas biológicos."),
    QuizQuestion(prompt: "Criar moléculas orgânicas em laboratório demonstra exatamente como a vida surgiu?", options: ["Sim, basta observar moléculas", "Não, experimentos investigam etapas plausíveis sem necessariamente reproduzir toda a origem", "Sim, quando a experiência usa água", "Não, porque a química não contribui para biologia"], correctIndex: 1, explanation: "As evidências apoiam ou limitam hipóteses, mas não recompõem automaticamente toda a história."),
    QuizQuestion(prompt: "A descoberta de água líquida em outro mundo comprova presença de vida?", options: ["Sim, água significa organismos", "Não, habitabilidade potencial não equivale a evidência confirmada de vida", "Sim, sempre que houver atmosfera", "Não, porque água não existe fora da Terra"], correctIndex: 1, explanation: "Condições potencialmente adequadas e detecção de vida são observações diferentes."),
  ],
  'renascimento': [
    QuizQuestion(prompt: "O Renascimento substituiu toda a cultura medieval de uma só vez?", options: ["Sim, a produção medieval desapareceu", "Não, houve transformações e continuidades em ritmos diferentes", "Sim, todas as cidades seguiram o mesmo calendário", "Não, porque não existiu atividade artística"], correctIndex: 1, explanation: "Novas ideias e técnicas também dialogaram com instituições e práticas anteriores."),
    QuizQuestion(prompt: "O humanismo renascentista significava necessariamente rejeitar a religião?", options: ["Sim, todos os humanistas eram ateus", "Não, estudos clássicos e contextos religiosos frequentemente coexistiam", "Sim, porque nenhuma igreja patrocinava obras", "Não, porque humanistas nunca estudavam textos"], correctIndex: 1, explanation: "Estudiosos e artistas tiveram posições e relações religiosas diversas."),
    QuizQuestion(prompt: "Qual detalhe pode ajudar a interpretar um retrato renascentista?", options: ["Somente seu tamanho", "Postura, objetos e contexto de encomenda", "Apenas a moldura, sem observar a pintura", "A ausência obrigatória de temas políticos"], correctIndex: 1, explanation: "Retratos podem comunicar identidade e posição social por meio de escolhas visuais."),
  ],
  'perspectiva': [
    QuizQuestion(prompt: "O que é um ponto de fuga em uma representação em perspectiva linear?", options: ["Um elemento que aumenta o brilho", "Um ponto para o qual convergem representações de determinadas linhas paralelas no espaço", "Uma sombra obrigatória de todos os objetos", "O lugar onde o papel precisa ser dobrado"], correctIndex: 1, explanation: "A convergência aparente ajuda a criar profundidade a partir de um ponto de vista."),
    QuizQuestion(prompt: "A perspectiva linear representa automaticamente toda a percepção humana?", options: ["Sim, sem qualquer escolha geométrica", "Não, organiza uma construção a partir de condições e de um observador", "Sim, desde que a imagem tenha cores", "Não, porque pinturas não podem ter profundidade"], correctIndex: 1, explanation: "É um sistema de representação espacial, não uma cópia perfeita da visão."),
    QuizQuestion(prompt: "Quais são outras pistas de profundidade numa imagem?", options: ["Sobreposição e variações de escala", "Somente a cor azul", "A assinatura do artista", "A idade do suporte"], correctIndex: 0, explanation: "Oclusão, escala e outras técnicas podem complementar a perspectiva linear."),
  ],
  'impressionismo': [
    QuizQuestion(prompt: "O que tornou muitas obras impressionistas diferentes de modelos acadêmicos?", options: ["A proibição de retratar pessoas", "O uso de pinceladas perceptíveis e interesse em luz e cenas contemporâneas", "A obrigação de pintar somente de memória", "A exclusão de qualquer planejamento"], correctIndex: 1, explanation: "A atenção a efeitos de luz e novas escolhas de pincelada alterou a experiência visual."),
    QuizQuestion(prompt: "Todos os artistas impressionistas seguiam exatamente as mesmas regras?", options: ["Sim, havia uma receita obrigatória", "Não, tinham trajetórias e abordagens distintas", "Sim, pois pintavam apenas uma paisagem", "Não, porque nenhum participou de exposições coletivas"], correctIndex: 1, explanation: "O rótulo histórico agrupa uma produção diversificada."),
    QuizQuestion(prompt: "Que pergunta amplia a leitura de uma cena impressionista?", options: ["Qual tinta era legalmente permitida?", "O que a cena revela sobre hábitos, espaços e grupos sociais de seu tempo?", "Por que todas as figuras não têm rosto?", "Qual pincel é o único correto?"], correctIndex: 1, explanation: "Temas e enquadramentos também registram aspectos da vida moderna."),
  ],
  'rococo': [
    QuizQuestion(prompt: "Qual característica é frequentemente associada à ornamentação rococó?", options: ["A proibição de curvas", "Curvas, motivos naturalistas e efeitos decorativos elaborados", "A exclusão de interiores", "Uso obrigatório de concreto exposto"], correctIndex: 1, explanation: "Motivos como conchas e folhagens são recorrentes nessa linguagem."),
    QuizQuestion(prompt: "Como o rococó circulou internacionalmente?", options: ["Somente por uma pintura famosa", "Por gravuras, objetos, artesãos e trocas culturais", "Exclusivamente pela internet", "Sem adaptações locais"], correctIndex: 1, explanation: "A circulação material e humana ajudou a espalhar e transformar motivos."),
    QuizQuestion(prompt: "O rococó substituiu o barroco simultaneamente em todo o mundo?", options: ["Sim, na mesma data", "Não, estilos coexistiram e se desenvolveram em contextos diferentes", "Sim, porque a arte tem apenas uma escola por século", "Não, porque rococó não envolve objetos"], correctIndex: 1, explanation: "Rótulos históricos não eliminam continuidades e sobreposições."),
  ],
  'barroco': [
    QuizQuestion(prompt: "O barroco pode ser definido somente por excesso decorativo?", options: ["Sim, sem exceção", "Não, luz, composição e movimento podem ser estruturantes", "Sim, porque nunca usou pintura", "Não, pois só existe em música"], correctIndex: 1, explanation: "Drama e teatralidade podem resultar da organização visual e espacial."),
    QuizQuestion(prompt: "Qual artista influenciou correntes barrocas por meio de luz dramática e naturalismo?", options: ["Caravaggio", "Mondrian", "Andy Warhol", "Paul Klee"], correctIndex: 0, explanation: "Caravaggio foi uma referência importante, sem representar toda a diversidade barroca."),
    QuizQuestion(prompt: "Ao observar duas obras barrocas de regiões diferentes, qual atitude ajuda a compreender o movimento?", options: ["Assumir que devem parecer idênticas", "Comparar soluções, funções e contextos específicos", "Ignorar a técnica utilizada", "Classificar todas por uma única regra imutável"], correctIndex: 1, explanation: "O barroco reúne práticas diversas, reinterpretadas em diferentes regiões."),
  ],
  'helvetica': [
    QuizQuestion(
      prompt: 'Qual era o nome original da Helvetica?',
      options: ['Neue Haas Grotesk', 'Univers Serif', 'Akzidenz Roman', 'Swiss Modern'],
      correctIndex: 0,
      explanation: 'A fonte foi criada como Neue Haas Grotesk e rebatizada na expansão internacional.',
    ),
    QuizQuestion(
      prompt: 'Qual decisão aumenta a clareza de uma página além de escolher Helvetica?',
      options: [
        'Eliminar todo espaço vazio',
        'Aplicar grade, hierarquia e espaçamento adequados ao contexto',
        'Escrever tudo em letras maiúsculas',
        'Usar o maior número possível de estilos',
      ],
      correctIndex: 1,
      explanation: 'Tipografia funciona junto da organização visual; nenhuma fonte resolve sozinha a hierarquia.',
    ),
    QuizQuestion(
      prompt: 'Uma interface escrita em Helvetica é automaticamente acessível?',
      options: [
        'Sim, porque a fonte é considerada neutra',
        'Sim, desde que o fundo seja branco',
        'Não; tamanho, contraste, espaçamento e testes de uso também importam',
        'Não; Helvetica só funciona em cartazes impressos',
      ],
      correctIndex: 2,
      explanation: 'A reputação de legibilidade não substitui testes com tamanhos, contextos e leitores diferentes.',
    ),
  ],
  'internet': [
    QuizQuestion(
      prompt: 'Depois de encontrar o endereço de um site, qual etapa pode proteger a troca de dados?',
      options: ['A negociação TLS numa conexão HTTPS', 'Aumentar o brilho da tela', 'Escolher uma fonte serifada', 'Desligar o cache DNS'],
      correctIndex: 0,
      explanation: 'TLS protege o transporte da conexão; DNS tem outra função: ajudar a encontrar o destino.',
    ),
    QuizQuestion(
      prompt: 'Um cadeado HTTPS prova que o vendedor online é confiável?',
      options: ['Sim, é um certificado de honestidade', 'Não: protege a conexão, mas não valida as promessas comerciais da página', 'Sim, desde que use CDN', 'Não, porque HTTPS não usa criptografia'],
      correctIndex: 1,
      explanation: 'O certificado vincula uma identidade técnica ao domínio; golpes também podem ocorrer em conexões cifradas.',
    ),
    QuizQuestion(
      prompt: 'HTML chegou rapidamente, mas a página ainda demora a parecer pronta. Uma hipótese possível é:',
      options: ['O DNS apaga automaticamente o HTML', 'A internet não suporta imagens', 'Fontes, CSS, scripts e imagens ainda estão sendo processados', 'O navegador só recebe um arquivo por dia'],
      correctIndex: 2,
      explanation: 'Renderização envolve vários recursos e processamento além do download do HTML inicial.',
    ),
  ],
  'gps': [
    QuizQuestion(
      prompt: 'Como o celular usa um sinal de satélite para estimar sua distância?',
      options: ['Lê o mapa desenhado no satélite', 'Compara o instante transmitido com o recebimento do sinal', 'Envia uma foto da rua ao satélite', 'Mede diretamente o volume do sinal'],
      correctIndex: 1,
      explanation: 'Tempo de propagação e velocidade conhecida do sinal permitem estimar a distância.',
    ),
    QuizQuestion(
      prompt: 'Por que são usados pelo menos quatro sinais no posicionamento 3D convencional?',
      options: ['O quarto transmite nomes de ruas', 'Três sinais corrigem automaticamente todos os relógios', 'Eles permitem resolver as três coordenadas e o erro do relógio do receptor', 'Sem o quarto satélite o celular não recebe nenhum sinal'],
      correctIndex: 2,
      explanation: 'O relógio do aparelho não é atômico; seu desajuste é uma incógnita adicional.',
    ),
    QuizQuestion(
      prompt: 'Por que a posição pode piorar entre prédios altos?',
      options: ['Sinais podem sofrer bloqueio e reflexões, gerando estimativas imprecisas', 'A relatividade deixa de existir na cidade', 'O satélite precisa de Wi-Fi do edifício', 'O aplicativo apaga a constelação à noite'],
      correctIndex: 0,
      explanation: 'Obstáculos, reflexões e geometria dos satélites alteram a precisão recebida.',
    ),
  ],
  'fotografia': [
    QuizQuestion(
      prompt: 'Para congelar um corredor em movimento, qual ajuste costuma ser mais decisivo?',
      options: ['Obturador mais rápido', 'Balanço de branco mais quente', 'Lente sempre no modo manual', 'Maior compressão do arquivo'],
      correctIndex: 0,
      explanation: 'Reduzir o tempo de exposição limita quanto o objeto se move durante o registro.',
    ),
    QuizQuestion(
      prompt: 'Ao manter abertura e tempo constantes numa câmera digital, elevar ISO significa...',
      options: ['Que a lente recebeu mais luz', 'Que a velocidade da luz aumentou', 'Alterar o ganho ou processamento, sem criar mais luz capturada', 'Que a profundidade de campo aumenta obrigatoriamente'],
      correctIndex: 2,
      explanation: 'ISO ajuda a entregar uma imagem mais clara, mas não aumenta o número de fótons capturados nessas condições.',
    ),
    QuizQuestion(
      prompt: 'Duas pessoas fotografam a mesma rua de posições diferentes. Por que as fotos contam histórias distintas?',
      options: ['Fotografias mostram tudo o que acontece fora do enquadramento', 'Posição e enquadramento selecionam relações visuais e excluem partes da cena', 'ISO determina sozinho o sentido da cena', 'Toda lente muda o horário em que a foto foi tirada'],
      correctIndex: 1,
      explanation: 'Enquadrar e escolher o ponto de vista já são decisões expressivas antes de qualquer filtro.',
    ),
  ],
  'criptografia': [
    QuizQuestion(
      prompt: 'Qual técnica é feita para produzir um resumo, e não para permitir recuperação direta do conteúdo?',
      options: ['Criptografia simétrica', 'Função hash criptográfica', 'Decifragem com chave privada', 'Transporte HTTP sem TLS'],
      correctIndex: 1,
      explanation: 'Hash produz um resumo não reversível por um procedimento geral de decifragem.',
    ),
    QuizQuestion(
      prompt: 'Uma assinatura digital válida tem como objetivo principal...',
      options: ['Esconder o conteúdo do documento', 'Garantir que a senha nunca será roubada', 'Verificar origem vinculada à chave e integridade da mensagem', 'Apagar a necessidade de verificar identidades'],
      correctIndex: 2,
      explanation: 'Assinaturas ajudam na autenticidade da origem e integridade; não proporcionam sigilo sozinhas.',
    ),
    QuizQuestion(
      prompt: 'Por que sistemas HTTPS combinam mecanismos criptográficos?',
      options: ['Porque nenhuma operação criptográfica tem função específica', 'Para negociar segredos, conferir identidade e proteger eficientemente os dados', 'Porque todas as mensagens devem ficar públicas', 'Para dispensar a gestão de chaves'],
      correctIndex: 1,
      explanation: 'O protocolo combina mecanismos com responsabilidades diferentes, inclusive troca de chaves e cifragem autenticada.',
    ),
  ],
  'estoicismo': [
    QuizQuestion(
      prompt: 'Para os estoicos, quais áreas faziam parte do sistema filosófico?',
      options: ['Somente conselhos motivacionais', 'Lógica, investigação da natureza e ética', 'Apenas treinamento militar', 'Somente exercícios de respiração'],
      correctIndex: 1,
      explanation: 'A tradição estoica reunia lógica, física e ética, não apenas frases sobre tranquilidade.',
    ),
    QuizQuestion(
      prompt: 'Você se prepara para uma entrevista, mas não controla a decisão final. Qual atitude combina com a distinção estoica?',
      options: ['Não estudar, pois o resultado é incerto', 'Exigir um resultado específico', 'Preparar-se bem, agir de modo justo e aceitar que a decisão final não é sua', 'Considerar todas as emoções uma falha moral'],
      correctIndex: 2,
      explanation: 'A distinção separa escolhas e ações responsáveis de resultados que não dependem exclusivamente de nós.',
    ),
    QuizQuestion(
      prompt: 'Aceitação estoica significa ignorar injustiças e nunca sentir tristeza?',
      options: ['Não; justiça e exame dos julgamentos fazem parte da tradição', 'Sim, porque toda emoção é proibida', 'Sim, porque o futuro já está decidido', 'Somente para filósofos romanos'],
      correctIndex: 0,
      explanation: 'A tradição enfatiza o caráter, os deveres e a reflexão sobre as reações, não passividade ou repressão mecânica.',
    ),
  ],
  'sono': [
    QuizQuestion(
      prompt: 'Qual dupla ajuda a regular quando sentimos sono?',
      options: ['Apenas vontade e idade', 'Pressão de sono e ritmos circadianos', 'Memória e preferência musical', 'Somente a temperatura externa'],
      correctIndex: 1,
      explanation: 'A necessidade acumulada de descanso interage com relógios biológicos que respondem a pistas ambientais.',
    ),
    QuizQuestion(
      prompt: 'Uma noite normal costuma envolver...',
      options: ['Somente sono REM', 'Um único estágio do começo ao fim', 'Alternância entre diferentes estágios NREM e REM', 'O cérebro totalmente desligado'],
      correctIndex: 2,
      explanation: 'O sono percorre ciclos com estados de atividade cerebral distintos.',
    ),
    QuizQuestion(
      prompt: 'Por que usar um relógio de consumo para diagnosticar uma doença do sono é inadequado?',
      options: ['Porque os relógios impedem todos os sonhos', 'Porque só médicos podem contar horas', 'Porque todas as pessoas precisam de oito horas exatas', 'Porque estimativas do dispositivo não substituem avaliação clínica'],
      correctIndex: 3,
      explanation: 'Informações de wearables podem sugerir tendências, mas sintomas persistentes exigem métodos diagnósticos adequados.',
    ),
  ],
  'vieses': [
    QuizQuestion(
      prompt: 'O que diferencia um viés de uma heurística útil?',
      options: ['Todo atalho é necessariamente um erro', 'Uma heurística simplifica; em alguns contextos pode produzir erros sistemáticos', 'Vieses só afetam pessoas sem formação', 'Heurísticas exigem sempre cálculos complexos'],
      correctIndex: 1,
      explanation: 'Os atalhos de decisão economizam esforço, mas podem gerar padrões de erro dependendo do ambiente.',
    ),
    QuizQuestion(
      prompt: 'Ao testar uma hipótese, qual estratégia enfrenta melhor o viés de confirmação?',
      options: ['Buscar apenas os exemplos favoráveis', 'Ignorar toda evidência quantitativa', 'Definir o que poderia contrariar a hipótese e procurar esses dados', 'Trocar de opinião a cada comentário isolado'],
      correctIndex: 2,
      explanation: 'A disposição de encontrar evidências contrárias torna uma hipótese mais testável.',
    ),
    QuizQuestion(
      prompt: 'Um preço inicial exagerado muda sua avaliação de uma promoção. Qual fenômeno pode estar presente?',
      options: ['Ancoragem', 'Sono REM', 'Dilatação temporal', 'Seleção natural'],
      correctIndex: 0,
      explanation: 'O primeiro número apresentado pode deslocar estimativas seguintes, mesmo sendo pouco informativo.',
    ),
  ],
  'juros-compostos': [
    QuizQuestion(
      prompt: 'R\$ 1.000 rendem 5% ao ano com capitalização anual. Sem movimentações, qual o saldo após dois anos?',
      options: ['R\$ 1.100,00', 'R\$ 1.102,50', 'R\$ 1.050,00', 'R\$ 1.500,00'],
      correctIndex: 1,
      explanation: 'O segundo rendimento é 5% de R\$ 1.050, ou seja, R\$ 52,50; o total vai para R\$ 1.102,50.',
    ),
    QuizQuestion(
      prompt: 'Por que comparar diretamente uma taxa mensal com outra anual é enganoso?',
      options: ['Porque o calendário não influencia investimentos', 'Porque toda taxa anual é menor', 'Porque períodos diferentes exigem conversão para bases compatíveis', 'Porque juros só existem em meses'],
      correctIndex: 2,
      explanation: 'É necessário compatibilizar os períodos, a capitalização e as hipóteses antes da comparação.',
    ),
    QuizQuestion(
      prompt: 'Saldo nominal maior significa obrigatoriamente mais poder de compra?',
      options: ['Sim, em qualquer cenário', 'Apenas em dívidas', 'Apenas com taxas anuais', 'Não; inflação, custos e tributos afetam o resultado real'],
      correctIndex: 3,
      explanation: 'O ganho real depende do rendimento líquido em relação ao comportamento dos preços.',
    ),
  ],
  'buracos-negros': [
    QuizQuestion(
      prompt: 'O horizonte de eventos de um buraco negro é...',
      options: ['Uma casca sólida feita de gás', 'Um limite a partir do qual sinais não chegam a observadores distantes', 'Um telescópio situado dentro da galáxia', 'Uma parede de matéria escura'],
      correctIndex: 1,
      explanation: 'O horizonte é um limite causal do espaço-tempo, não uma superfície sólida.',
    ),
    QuizQuestion(
      prompt: 'Como astrônomos estudam regiões próximas a buracos negros?',
      options: ['Somente por imagens do interior', 'Medindo a luz emitida de dentro do horizonte', 'Observando matéria ao redor, movimentos e ondas gravitacionais', 'Acompanhando fotografias de estrelas vistas a olho nu'],
      correctIndex: 2,
      explanation: 'Os instrumentos registram efeitos externos, inclusive radiação de gás quente e ondas gravitacionais.',
    ),
    QuizQuestion(
      prompt: 'Qual afirmação sobre o interior dos buracos negros é mais cuidadosa?',
      options: ['Já fotografamos diretamente sua singularidade', 'A física do interior está completamente resolvida', 'Eles são aspiradores que sugam todo o universo', 'Há previsões matemáticas e perguntas físicas ainda em debate'],
      correctIndex: 3,
      explanation: 'A relatividade fornece previsões, mas certas condições extremas ainda desafiam a descrição física completa.',
    ),
  ],
  'quantica': [
    QuizQuestion(
      prompt: 'Por que os estados de energia de um elétron ligado lembram degraus?',
      options: ['Toda quantidade física tem sempre qualquer valor', 'Certos estados de energia do sistema são discretos', 'O elétron é literalmente uma escada', 'A observação humana cria a energia do átomo'],
      correctIndex: 1,
      explanation: 'A quantização permite apenas determinados estados de energia em sistemas como átomos.',
    ),
    QuizQuestion(
      prompt: 'Na física quântica, medir um sistema significa...',
      options: ['Imaginar um resultado com bastante força', 'Transformar a teoria numa crença pessoal', 'Realizar uma interação física que permite obter resultados', 'Interromper todas as leis matemáticas'],
      correctIndex: 2,
      explanation: 'Medições são interações físicas; a teoria usa amplitudes para calcular probabilidades dos resultados.',
    ),
    QuizQuestion(
      prompt: 'Qual tecnologia existente depende de princípios quânticos?',
      options: ['Somente computadores quânticos experimentais', 'Somente relógios mecânicos', 'Apenas lentes de aumento comuns', 'Transistores semicondutores e lasers'],
      correctIndex: 3,
      explanation: 'Bandas eletrônicas e transições de energia explicam tecnologias já amplamente utilizadas.',
    ),
  ],
  'cloud': [
    QuizQuestion(
      prompt: 'Qual característica do modelo de nuvem permite ajustar recursos conforme a demanda?',
      options: ['Elasticidade rápida', 'Um único servidor fixo', 'A ausência de redes físicas', 'A eliminação de custos operacionais'],
      correctIndex: 0,
      explanation: 'Elasticidade permite aumentar e reduzir capacidade sem substituir manualmente toda a infraestrutura.',
    ),
    QuizQuestion(
      prompt: 'Em um banco de dados gerenciado, o cliente pode ignorar permissões e proteção de dados?',
      options: ['Sim, o provedor assume todos os riscos', 'Não; a divisão de responsabilidades precisa ser definida e aplicada', 'Sim, desde que tenha CDN', 'Somente se o aplicativo estiver num celular'],
      correctIndex: 1,
      explanation: 'Serviços gerenciados não eliminam decisões sobre acesso, informações e configuração.',
    ),
    QuizQuestion(
      prompt: 'O que pode aumentar inesperadamente a conta de um serviço em nuvem?',
      options: ['Usar um serviço medido de maneira eficiente', 'Reduzir máquinas durante horários ociosos', 'Criar recursos sem limites e transferir muitos dados entre regiões', 'Medir consumo e configurar alertas'],
      correctIndex: 2,
      explanation: 'Elasticidade e cobrança por uso exigem monitoramento e limites bem planejados.',
    ),
  ],
  'semicondutores': [
    QuizQuestion(
      prompt: 'Por que o silício é útil na fabricação de circuitos?',
      options: ['Sua condutividade pode ser modificada e controlada', 'É sempre o melhor condutor possível', 'Dispensa processos industriais', 'Seus transistores não produzem calor'],
      correctIndex: 0,
      explanation: 'Dopagem e campos elétricos permitem controlar o comportamento eletrônico do silício.',
    ),
    QuizQuestion(
      prompt: 'Uma porta lógica digital pode ser construída com...',
      options: ['Somente ímãs permanentes', 'Apenas um cabo de rede', 'Combinações de transistores', 'Papel fotossensível isolado'],
      correctIndex: 2,
      explanation: 'Transistores conectados formam portas lógicas e blocos funcionais de circuitos.',
    ),
    QuizQuestion(
      prompt: 'Qual é a função da litografia na produção de microchips?',
      options: ['Refrescar os servidores da nuvem', 'Projetar padrões minúsculos sobre camadas de um wafer', 'Traduzir todo software para texto', 'Substituir todos os testes de fabricação'],
      correctIndex: 1,
      explanation: 'A litografia transfere padrões que orientam várias etapas da fabricação por camadas.',
    ),
  ],
  'fermentacao': [
    QuizQuestion(
      prompt: 'Qual processo ajuda uma massa de pão a crescer?',
      options: ['O congelamento de toda a água', 'Gás carbônico produzido por leveduras fica retido na massa', 'Aumento automático da quantidade de sal', 'Desaparecimento de todos os microrganismos'],
      correctIndex: 1,
      explanation: 'Leveduras podem gerar gás carbônico ao metabolizar açúcares, formando bolhas na massa.',
    ),
    QuizQuestion(
      prompt: 'Por que receitas testadas importam para conservas fermentadas?',
      options: ['Qualquer pote fechado é sempre seguro', 'A acidez não influencia os microrganismos', 'Condições como acidez, sal e temperatura interferem na segurança', 'Fermentação dispensa higiene'],
      correctIndex: 2,
      explanation: 'Conservação depende de controle adequado; sinais visuais sozinhos não garantem segurança.',
    ),
    QuizQuestion(
      prompt: 'Todo alimento fermentado usa exatamente o mesmo microrganismo?',
      options: ['Sim, todos usam a mesma espécie de levedura', 'Não; matéria-prima, comunidades e processos podem ser diferentes', 'Sim, desde que tenha açúcar', 'Não, porque nenhum alimento fermentado contém microrganismos'],
      correctIndex: 1,
      explanation: 'Leveduras e bactérias diferentes participam de processos e tradições distintos.',
    ),
  ],
  'imprensa': [
    QuizQuestion(
      prompt: 'Por que a história da impressão não pode começar somente na Europa do século XV?',
      options: ['A Ásia já possuía tradições de impressão e tipos móveis antes de Gutenberg', 'Todos os livros foram inventados em 1900', 'Gutenberg criou a escrita', 'Não existiam textos antes da prensa europeia'],
      correctIndex: 0,
      explanation: 'China e Coreia desenvolveram diferentes técnicas de impressão antes da difusão europeia.',
    ),
    QuizQuestion(
      prompt: 'Qual foi uma transformação importante das oficinas de tipos móveis na Europa?',
      options: ['Proibir automaticamente a cópia de manuscritos', 'Impedir toda circulação de textos', 'Reproduzir mais cópias após preparar uma composição reutilizável', 'Tornar toda pessoa imediatamente alfabetizada'],
      correctIndex: 2,
      explanation: 'A composição reutilizável ajudou a ampliar a escala e a circulação de textos.',
    ),
    QuizQuestion(
      prompt: 'Maior circulação de textos significa que toda informação impressa é verdadeira?',
      options: ['Sim, impressão elimina erros', 'Não; revisão, produção e distribuição também precisam ser examinadas', 'Sim, desde que existam muitas cópias', 'Não, porque livros nunca trazem informação confiável'],
      correctIndex: 1,
      explanation: 'Meios de reprodução podem multiplicar tanto ideias fundamentadas quanto erros e propaganda.',
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
    QuizQuestion(prompt: "Se a inflação caiu de 10% para 5%, os preços voltaram automaticamente ao nível anterior?", options: ["Sim, todos diminuíram 5%", "Não, o nível geral ainda pode estar subindo em ritmo menor", "Sim, pois qualquer desinflação é deflação", "Não, porque o índice deixa de medir preços"], correctIndex: 1, explanation: "Uma taxa positiva menor significa desaceleração da alta, não reversão automática dos preços."),
    QuizQuestion(prompt: "Uma alta isolada no preço do tomate é suficiente para medir toda a inflação?", options: ["Sim, pois basta escolher um produto representativo", "Não, índices acompanham cestas de bens e serviços", "Sim, quando a safra é afetada", "Não, porque alimentos nunca entram em índices"], correctIndex: 1, explanation: "Índices de preços acompanham diferentes itens e pesos de consumo."),
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
  'samba': [
    SourceEntry(label: "UNESCO — Samba de roda do Recôncavo Baiano", url: "https://ich.unesco.org/en/RL/samba-de-roda-of-the-recncavo-of-bahia-00101", note: "Tradição e transmissão comunitária."),
  ],
  'imunidade': [
    SourceEntry(label: "OMS — Como funcionam as vacinas", url: "https://www.who.int/pt/news-room/feature-stories/detail/how-do-vaccines-work", note: "Barreiras, respostas imunológicas e memória."),
  ],
  'turing': [
    SourceEntry(label: "Computer History Museum — Pilot ACE", url: "https://www.computerhistory.org/revolution/story/96", note: "Turing e a história da computação eletrônica."),
  ],
  'evolucao-internet': [
    SourceEntry(label: "Computer History Museum — Internet History", url: "https://www.computerhistory.org/internethistory/", note: "Linha do tempo da interconexão de redes."),
  ],
  'neuroplasticidade': [
    SourceEntry(label: "PubMed — The neuroplastic brain", url: "https://pubmed.ncbi.nlm.nih.gov/40280532/", note: "Revisão científica dos mecanismos de plasticidade."),
  ],
  'linguistica': [
    SourceEntry(label: "Open Textbook Library — Essentials of Linguistics", url: "https://open.umn.edu/opentextbooks/textbooks/599", note: "Livro aberto sobre diversidade e fundamentos linguísticos."),
  ],
  'dna': [
    SourceEntry(label: "NHGRI — DNA Fact Sheet", url: "https://www.genome.gov/about-genomics/fact-sheets/Deoxyribonucleic-Acid-Fact-Sheet", note: "Papel do DNA, genes e regulação."),
  ],
  'ia-generativa': [
    SourceEntry(label: "Google — Introdução aos modelos de linguagem", url: "https://developers.google.com/machine-learning/crash-course/llm?hl=pt-br", note: "Tokens, modelos de linguagem e geração de texto."),
  ],
  'mapas': [
    SourceEntry(label: "USGS — Map Projections", url: "https://www.usgs.gov/publications/map-projections-a-working-manual", note: "Por que diferentes projeções distorcem propriedades diferentes."),
  ],
  'teoria-jogos': [
    SourceEntry(label: "OpenStax — Oligopoly e teoria dos jogos", url: "https://openstax.org/books/principles-economics-2e/pages/10-2-oligopoly", note: "Interdependência estratégica e o dilema do prisioneiro."),
  ],
  'origem-vida': [
    SourceEntry(label: "NASA — Astrobiology", url: "https://www.nasa.gov/missions/nasas-search-for-life-astrobiology-in-the-solar-system-and-beyond/", note: "Perguntas, métodos e limites da busca por vida."),
  ],
  'renascimento': [
    SourceEntry(label: "The Met — The Renaissance Portrait", url: "https://www.metmuseum.org/pt/met-publications/the-renaissance-portrait-from-donatello-to-bellini", note: "Retrato, patronato e transformações visuais renascentistas."),
  ],
  'perspectiva': [
    SourceEntry(label: "Smarthistory — Linear Perspective Explained", url: "https://smarthistory.org/linear-perspective-explained/", note: "Perspectiva linear com demonstração visual."),
  ],
  'impressionismo': [
    SourceEntry(label: "The Met — Impressionism, Art and Modernity", url: "https://www.metmuseum.org/pt/essays/impressionism-art-and-modernity", note: "Modernidade, estética e história das exposições."),
  ],
  'rococo': [
    SourceEntry(label: "The Met — American Rococo", url: "https://www.metmuseum.org/pt/essays/american-rococo", note: "Características e difusão internacional da ornamentação rococó."),
  ],
  'barroco': [
    SourceEntry(label: "The Met — Art in Naples", url: "https://www.metmuseum.org/es/essays/art-of-the-seventeenth-and-eighteenth-centuries-in-naples", note: "Naturalismo, expressão e claro-escuro na arte barroca."),
  ],
  'helvetica': [
    SourceEntry(
      label: 'Monotype — O legado complexo da Helvetica',
      url: 'https://www.monotype.com/resources/articles/complicated-legacy-helvetica',
      note: 'Desenho, tecnologias de composição, difusão e debates sobre seu uso.',
    ),
    SourceEntry(
      label: 'Monotype — Da Neue à Helvetica Now',
      url: 'https://www.monotype.com/resources/font-stories/neue-now',
      note: 'A Neue Helvetica de 1983 e o redesenho para novos meios.'
    ),
  ],
  'internet': [
    SourceEntry(
      label: 'MDN — Como a web funciona',
      url: 'https://developer.mozilla.org/en-US/docs/Learn_web_development/Getting_started/Web_standards/How_the_web_works',
      note: 'DNS, HTTP, clientes e servidores.',
    ),
    SourceEntry(
      label: 'MDN — Como navegadores carregam sites',
      url: 'https://developer.mozilla.org/en-US/docs/Learn_web_development/Getting_started/Web_standards/How_browsers_load_websites',
      note: 'HTML, CSS, scripts, recursos e renderização.',
    ),
  ],
  'gps': [
    SourceEntry(
      label: 'GPS.gov — Trilateração em quatro satélites',
      url: 'https://www.gps.gov/trilateration',
      note: 'Tempo de propagação, distâncias estimadas e posicionamento.',
    ),
    SourceEntry(
      label: 'ESA — Correções relativísticas do relógio',
      url: 'https://gssc.esa.int/navipedia/index.php/Relativistic_Clock_Correction',
      note: 'Efeitos de velocidade e gravidade nos relógios de navegação.',
    ),
    SourceEntry(
      label: 'GPS.gov — Precisão e suas limitações',
      url: 'https://www.gps.gov/gps-accuracy',
      note: 'Geometria, atmosfera, obstáculos e qualidade do receptor.',
    ),
  ],
  'fotografia': [
    SourceEntry(
      label: 'Nikon — Fundamentos de exposição',
      url: 'https://en.nikon.ca/learn-and-explore/c/tips-and-techniques/a-basic-look-at-the-basics-of-exposure',
      note: 'Abertura, tempo de exposição e ISO.',
    ),
    SourceEntry(
      label: 'Nikon — Controle de ISO',
      url: 'https://www.nikonusa.com/learn-and-explore/c/products-and-innovation/iso-control',
      note: 'Sensibilidade e ganho de sinal na fotografia digital.',
    ),
  ],
  'criptografia': [
    SourceEntry(
      label: 'NIST — Criptografia simétrica',
      url: 'https://csrc.nist.gov/glossary/term/Symmetric_Cryptography',
      note: 'Definição de cifra com chave compartilhada.',
    ),
    SourceEntry(
      label: 'NIST — Criptografia assimétrica',
      url: 'https://csrc.nist.gov/glossary/term/asymmetric_cryptography',
      note: 'Pares de chaves e seus usos.',
    ),
    SourceEntry(
      label: 'NIST — Hash criptográfico',
      url: 'https://csrc.nist.gov/glossary/term/Cryptographic_hash_function',
      note: 'Resumo de tamanho fixo, resistência e limitações.',
    ),
    SourceEntry(
      label: 'NIST — Assinatura digital',
      url: 'https://csrc.nist.gov/glossary/term/digital_signature',
      note: 'Autenticidade da origem e integridade, não sigilo.',
    ),
  ],
  'estoicismo': [
    SourceEntry(
      label: 'Stanford Encyclopedia of Philosophy — Stoicism',
      url: 'https://plato.stanford.edu/entries/stoicism/',
      note: 'História e estrutura da escola: lógica, física e ética.',
    ),
  ],
  'sono': [
    SourceEntry(
      label: 'NIH / NHLBI — Por que o sono é importante',
      url: 'https://www.nhlbi.nih.gov/health/sleep/why-sleep-important',
      note: 'Aprendizagem, funções físicas e saúde.',
    ),
    SourceEntry(
      label: 'NIH / NHLBI — Fases do sono',
      url: 'https://www.nhlbi.nih.gov/health/sleep/stages-of-sleep',
      note: 'NREM, REM e ciclos.',
    ),
  ],
  'vieses': [
    SourceEntry(
      label: 'APA Dictionary — Confirmation bias',
      url: 'https://dictionary.apa.org/confirmation-bias',
      note: 'Definição de viés de confirmação.',
    ),
    SourceEntry(
      label: 'APA Dictionary — Anchoring bias',
      url: 'https://dictionary.apa.org/anchoring-bias',
      note: 'Termos associados a heurísticas e julgamentos.',
    ),
  ],
  'juros-compostos': [
    SourceEntry(
      label: 'CFPB — Como funcionam os juros compostos',
      url: 'https://www.consumerfinance.gov/ask-cfpb/how-does-compound-interest-work-en-1683/',
      note: 'Exemplo numérico com capitalização anual.',
    ),
  ],
  'buracos-negros': [
    SourceEntry(
      label: 'NASA — Anatomia dos buracos negros',
      url: 'https://science.nasa.gov/universe/black-holes/anatomy/',
      note: 'Horizonte de eventos, acreção e observações externas.',
    ),
    SourceEntry(
      label: 'NASA — Buracos negros em perspectiva',
      url: 'https://www.nasa.gov/universe/what-are-black-holes/',
      note: 'Formação e descobertas observacionais.',
    ),
  ],
  'quantica': [
    SourceEntry(label: 'IBM — Fundamentos de computação quântica', url: 'https://www.ibm.com/think/topics/quantum-computing', note: 'Superposição, medição, interferência e limites tecnológicos.'),
    SourceEntry(label: 'NIST — Quantum Information Science', url: 'https://www.nist.gov/quantum-information-science', note: 'Pesquisa e aplicações em física quântica.'),
  ],
  'cloud': [
    SourceEntry(label: 'NIST — Definição de computação em nuvem', url: 'https://www.nist.gov/publications/nist-definition-cloud-computing', note: 'Características essenciais, modelos de serviço e implantação.'),
  ],
  'semicondutores': [
    SourceEntry(label: 'ASML — Como são fabricados os microchips', url: 'https://www.asml.com/en/technology/all-about-microchips/how-microchips-are-made', note: 'Camadas, litografia e fabricação industrial.'),
    SourceEntry(label: 'ASML — Princípios da litografia', url: 'https://www.asml.com/en/technology/lithography-principles', note: 'Óptica e projeção de padrões sobre wafers.'),
  ],
  'fermentacao': [
    SourceEntry(label: 'University of Minnesota — Fermentação e conservação', url: 'https://extension.umn.edu/es/node/172346', note: 'Tipos de fermentação, acidez e segurança alimentar.'),
  ],
  'imprensa': [
    SourceEntry(label: 'Museu Gutenberg — Impressão na Ásia Oriental', url: 'https://www.mainz.de/en/microsite/gutenberg-museum/Forschung_Sammlung_/Ostasien_und_Islam', note: 'Impressão anterior a Gutenberg e trajetórias culturais distintas.'),
  ],
  'inflacao': [
    SourceEntry(
      label: 'Banco Central do Brasil — Inflação',
      url: 'https://www.bcb.gov.br/controleinflacao',
    ),
    SourceEntry(label: "IBGE — Entenda inflação, IPCA e INPC", url: "https://www.ibge.gov.br/explica/inflacao.php", note: "Como as cestas de consumo entram nos índices."),
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

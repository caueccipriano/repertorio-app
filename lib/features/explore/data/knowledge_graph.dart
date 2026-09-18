const knowledgeGraph = <String, List<String>>{
  'bauhaus': ['modernismo', 'helvetica', 'brutalismo'],
  'modernismo': ['bauhaus', 'brutalismo', 'roma'],
  'fermi': ['inflacao', 'roma', 'bauhaus'],
  'roma': ['modernismo', 'inflacao', 'fermi'],
  'brutalismo': ['modernismo', 'bauhaus', 'helvetica'],
  'helvetica': ['bauhaus', 'brutalismo', 'modernismo'],
  'inflacao': ['roma', 'fermi', 'vinho'],
  'vinho': ['inflacao', 'bauhaus', 'fermi'],
};

List<String> neighborsFor(String topicId) =>
    knowledgeGraph[topicId] ?? const [];

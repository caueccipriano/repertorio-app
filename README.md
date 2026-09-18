# Repertório

> Aprenda um pouco sobre tudo e construa um repertório que você realmente consegue lembrar, conectar e usar.

Repertório é o codinome de um app de cultura geral e conhecimento conectado. A proposta não é ser uma enciclopédia tradicional, mas transformar assuntos interessantes em repertório útil para conversas, trabalho e compreensão do mundo.

## Foundation 1.0

A primeira base inclui:

- Flutter organizado por feature;
- identidade editorial inspirada em Bauhaus/Swiss + scrapbook;
- tema e tokens visuais;
- navegação Hoje / Explorar / Salvos / Eu;
- Home editorial;
- artigo completo de demonstração sobre Bauhaus;
- Rabbit Hole inicial;
- áreas de conhecimento;
- perfil de repertório;
- testes básicos e CI.

## Rodar localmente

1. Instale Flutter estável.
2. Na raiz do projeto:

```bash
flutter pub get
flutter test
flutter run
```

Se o clone ainda não tiver as pastas nativas da plataforma desejada, gere-as uma vez:

```bash
flutter create . --platforms=android,ios,web
```

Depois execute `flutter run` normalmente.

## Estrutura

```text
lib/
├── app/
│   ├── app.dart
│   ├── app_shell.dart
│   └── theme/
├── core/
│   └── widgets/
└── features/
    ├── article/
    ├── explore/
    ├── profile/
    ├── saved/
    └── today/
```

Veja também [docs/design-system.md](docs/design-system.md).

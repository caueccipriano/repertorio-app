import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../today/domain/knowledge_topic.dart';

class TopicMediaSection extends StatelessWidget {
  const TopicMediaSection({
    super.key,
    required this.media,
  });

  final List<KnowledgeMedia> media;

  @override
  Widget build(BuildContext context) {
    final visualMedia = media
        .where((item) => item.type != KnowledgeMediaType.audio)
        .toList(growable: false);

    if (visualMedia.isEmpty) {
      return const SizedBox.shrink();
    }

    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'VEJA',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: colors.primary,
                fontSize: 10,
                letterSpacing: 1.2,
              ),
        ),
        const SizedBox(height: 12),
        ...visualMedia.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: _MediaCard(item: item),
          ),
        ),
      ],
    );
  }
}

class _MediaCard extends StatelessWidget {
  const _MediaCard({required this.item});

  final KnowledgeMedia item;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border.all(color: colors.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (item.type == KnowledgeMediaType.image)
            AspectRatio(
              aspectRatio: 16 / 10,
              child: Image.network(
                item.url,
                fit: BoxFit.cover,
                webHtmlElementStrategy: WebHtmlElementStrategy.fallback,
                errorBuilder: (_, __, ___) => _MediaFallback(
                  icon: Icons.image_not_supported_outlined,
                  label: 'não consegui carregar a foto',
                  actionLabel:
                      item.sourceUrl == null ? null : 'abrir foto na fonte',
                  onTap: item.sourceUrl == null
                      ? null
                      : () => _open(item.sourceUrl!),
                ),
              ),
            )
          else
            _VideoPreview(item: item),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 15,
                      ),
                ),
                if (item.caption != null) ...[
                  const SizedBox(height: 6),
                  Text(
                    item.caption!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                  ),
                ],
                if (item.sourceLabel != null) ...[
                  const SizedBox(height: 9),
                  Text(
                    item.sourceLabel!,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: colors.onSurfaceVariant,
                          fontSize: 9,
                        ),
                  ),
                ],
                if (item.sourceUrl != null) ...[
                  const SizedBox(height: 7),
                  InkWell(
                    onTap: () => _open(item.sourceUrl!),
                    child: Text(
                      'ver fonte',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: colors.primary,
                            fontSize: 9,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VideoPreview extends StatelessWidget {
  const _VideoPreview({required this.item});

  final KnowledgeMedia item;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () => _open(item.url),
      child: Container(
        height: 116,
        color: colors.primary,
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Icon(
              Icons.play_circle_outline,
              color: colors.onPrimary,
              size: 40,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                'abrir vídeo',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: colors.onPrimary,
                    ),
              ),
            ),
            Icon(
              Icons.open_in_new,
              color: colors.onPrimary.withValues(alpha: .7),
            ),
          ],
        ),
      ),
    );
  }
}

class _MediaFallback extends StatelessWidget {
  const _MediaFallback({
    required this.icon,
    required this.label,
    this.actionLabel,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final String? actionLabel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Material(
      color: colors.surfaceContainerHighest,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 32, color: colors.onSurfaceVariant),
                const SizedBox(height: 8),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: colors.onSurfaceVariant),
                ),
                if (actionLabel != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    actionLabel!,
                    style: TextStyle(
                      color: colors.primary,
                      fontWeight: FontWeight.w800,
                      fontSize: 11,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _open(String url) async {
  final uri = Uri.tryParse(url);
  if (uri == null) {
    return;
  }
  await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
  );
}

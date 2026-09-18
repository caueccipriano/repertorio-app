import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/theme/app_colors.dart';
import '../../today/domain/knowledge_topic.dart';

class TopicMediaSection extends StatelessWidget {
  const TopicMediaSection({
    super.key,
    required this.media,
  });

  final List<KnowledgeMedia> media;

  @override
  Widget build(BuildContext context) {
    if (media.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'VEJA / OUÇA',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.blue,
                fontSize: 10,
                letterSpacing: 1.2,
              ),
        ),
        const SizedBox(height: 12),
        ...media.map(
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
    return Container(
      decoration: BoxDecoration(
        color: AppColors.paperWhite,
        border: Border.all(color: AppColors.ink),
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
                errorBuilder: (_, __, ___) => const _MediaFallback(
                  icon: Icons.image_not_supported_outlined,
                  label: 'imagem indisponível',
                ),
              ),
            )
          else
            _ExternalMediaPreview(item: item),
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
                          color: AppColors.muted,
                        ),
                  ),
                ],
                if (item.sourceUrl != null) ...[
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () => _open(item.sourceUrl!),
                    child: Text(
                      item.sourceLabel ?? 'fonte',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: AppColors.blue,
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
}

class _ExternalMediaPreview extends StatelessWidget {
  const _ExternalMediaPreview({required this.item});

  final KnowledgeMedia item;

  @override
  Widget build(BuildContext context) {
    final isVideo = item.type == KnowledgeMediaType.video;

    return InkWell(
      onTap: () async {
        final uri = Uri.tryParse(item.url);
        if (uri == null) {
          return;
        }
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      },
      child: Container(
        height: 122,
        color: AppColors.deepBlue,
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Icon(
              isVideo ? Icons.play_circle_outline : Icons.headphones,
              color: Colors.white,
              size: 42,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                isVideo ? 'abrir vídeo' : 'ouvir áudio',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            const Icon(
              Icons.open_in_new,
              color: Colors.white70,
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
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.line,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 32),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}

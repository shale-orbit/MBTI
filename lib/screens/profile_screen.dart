import 'package:flutter/material.dart';

import '../data/personality_types.dart';
import '../models.dart';
import '../widgets/dimension_bar.dart';
import '../widgets/portraits.dart';

class ProfileScreen extends StatelessWidget {
  final String? resultType;
  final Map<String, int>? counts;
  final SavedResult? saved;
  final VoidCallback onRetest;
  final Future<void> Function() onSave;

  const ProfileScreen({
    super.key,
    required this.resultType,
    required this.counts,
    required this.saved,
    required this.onRetest,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final type = resultType == null
        ? null
        : personalityTypes[resultType] ??
            const PersonalityType(name: '未知类型', tagline: '', desc: '');

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      children: [
        Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const CartoonAvatar(size: 64),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('M 同学', style: textTheme.titleLarge),
                      const SizedBox(height: 4),
                      Text(
                        'Flutter 学习者 · 原型体验中',
                        style: textTheme.bodyMedium?.copyWith(
                          color: scheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        if (resultType == null)
          _EmptyResult(onStart: onRetest)
        else
          _ResultCard(
            resultType: resultType!,
            type: type!,
            counts: counts,
          ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: onRetest,
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('重新测试'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FilledButton.icon(
                onPressed: resultType == null
                    ? null
                    : () async {
                        await onSave();
                        if (!context.mounted) {
                          return;
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('已保存本次结果')),
                        );
                      },
                icon: const Icon(Icons.save_outlined),
                label: const Text('保存结果'),
              ),
            ),
          ],
        ),
        if (saved != null) ...[
          const SizedBox(height: 10),
          Text(
            '上次保存：${saved!.savedAt}',
            style: textTheme.bodySmall?.copyWith(
              color: scheme.onSurfaceVariant,
            ),
          ),
        ],
        const SizedBox(height: 20),
        Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info_outline, color: scheme.onSurfaceVariant),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '结果仅供课程原型演示与自我了解参考，不构成专业心理评估或诊断。',
                    style: textTheme.bodySmall?.copyWith(
                      color: scheme.onSurfaceVariant,
                      height: 1.6,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _EmptyResult extends StatelessWidget {
  final VoidCallback onStart;

  const _EmptyResult({required this.onStart});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Icon(
              Icons.psychology_outlined,
              size: 48,
              color: scheme.onSurfaceVariant,
            ),
            const SizedBox(height: 12),
            Text('还没有测试结果', style: textTheme.titleMedium),
            const SizedBox(height: 6),
            Text(
              '完成 40 道情景题后，这里会显示你的四字母人格类型和各维度倾向。',
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(
                color: scheme.onSurfaceVariant,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: onStart,
              child: const Text('去答题'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ResultCard extends StatelessWidget {
  final String resultType;
  final PersonalityType type;
  final Map<String, int>? counts;

  const _ResultCard({
    required this.resultType,
    required this.type,
    required this.counts,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PersonalityCollage(size: 48),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('人格说明', style: textTheme.titleMedium),
                      const SizedBox(height: 6),
                      Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Chip(label: Text(resultType)),
                          Text(type.name, style: textTheme.titleLarge),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        type.tagline,
                        style: textTheme.labelLarge?.copyWith(
                          color: scheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(height: 1),
            const SizedBox(height: 16),
            Text(
              type.desc,
              style: textTheme.bodyMedium?.copyWith(height: 1.7),
            ),
            const SizedBox(height: 12),
            const Divider(height: 1),
            const SizedBox(height: 6),
            for (final dimension in dimensionPoles.keys)
              DimensionBar(
                dimension: dimension,
                leftCount: counts?[dimensionPoles[dimension]![0]] ?? 0,
                rightCount: counts?[dimensionPoles[dimension]![1]] ?? 0,
              ),
          ],
        ),
      ),
    );
  }
}

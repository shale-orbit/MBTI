import 'package:flutter/material.dart';

import '../data/personality_types.dart';

class DimensionBar extends StatelessWidget {
  final String dimension;
  final int leftCount;
  final int rightCount;

  const DimensionBar({
    super.key,
    required this.dimension,
    required this.leftCount,
    required this.rightCount,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final poles = dimensionPoles[dimension]!;
    final total = leftCount + rightCount;
    final ratio = total == 0 ? 0.0 : leftCount / total;
    final percent = (ratio * 100).round();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '${poles[0]} ${poleLabels[poles[0]]}',
                style: textTheme.labelLarge,
              ),
              const Spacer(),
              Text(
                '$percent%',
                style: textTheme.labelMedium?.copyWith(
                  color: scheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Text(
                '${poles[1]} ${poleLabels[poles[1]]}',
                style: textTheme.labelLarge,
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: ratio,
              minHeight: 8,
              backgroundColor: scheme.surfaceContainerHighest,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            dimensionLabels[dimension]!,
            style: textTheme.bodySmall?.copyWith(
              color: scheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

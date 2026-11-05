import 'package:flutter/material.dart';

import '../data/questions.dart';
import '../models.dart';

class QuizScreen extends StatelessWidget {
  final int index;
  final List<int?> answers;
  final ValueChanged<int> onAnswer;
  final VoidCallback onPrev;
  final VoidCallback onNext;
  final VoidCallback onFinish;

  const QuizScreen({
    super.key,
    required this.index,
    required this.answers,
    required this.onAnswer,
    required this.onPrev,
    required this.onNext,
    required this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final question = questionBank[index];
    final selected = answers[index];
    final isLast = index == questionBank.length - 1;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    '第 ${index + 1} / ${questionBank.length} 题',
                    style: textTheme.labelLarge,
                  ),
                  const Spacer(),
                  Text(
                    '${questionBank.length} 题 · 4 个维度',
                    style: textTheme.labelSmall?.copyWith(
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: (index + 1) / questionBank.length,
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Column(
              children: [
                Card(
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '第 ${index + 1} 题',
                              style: textTheme.labelLarge?.copyWith(
                                color: scheme.primary,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '单选题',
                              style: textTheme.labelSmall?.copyWith(
                                color: scheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Text(
                          question.text,
                          style: textTheme.titleLarge?.copyWith(height: 1.45),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                for (var i = 0; i < question.options.length; i++)
                  _OptionCard(
                    letter: String.fromCharCode(65 + i),
                    option: question.options[i],
                    selected: selected == i,
                    onTap: () => onAnswer(i),
                  ),
                const SizedBox(height: 4),
                Text(
                  '选择更接近你的一项；可以随时返回上一题查看或修改答案。',
                  style: textTheme.bodySmall?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
        SafeArea(
          top: false,
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
            decoration: BoxDecoration(
              color: scheme.surface,
              border: Border(
                top: BorderSide(color: scheme.outlineVariant),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: index == 0 ? null : onPrev,
                    icon: const Icon(Icons.arrow_back_rounded),
                    label: const Text('上一题'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton(
                    onPressed: selected == null
                        ? null
                        : (isLast ? onFinish : onNext),
                    child: Text(isLast ? '查看结果' : '下一题'),
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

class _OptionCard extends StatelessWidget {
  final String letter;
  final OptionItem option;
  final bool selected;
  final VoidCallback onTap;

  const _OptionCard({
    required this.letter,
    required this.option,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      color: selected ? scheme.primaryContainer : null,
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        leading: CircleAvatar(
          backgroundColor:
              selected ? scheme.primary : scheme.surfaceContainerHighest,
          foregroundColor:
              selected ? scheme.onPrimary : scheme.onSurfaceVariant,
          child: Text(
            letter,
            style: textTheme.labelLarge?.copyWith(
              color: selected ? scheme.onPrimary : scheme.onSurfaceVariant,
            ),
          ),
        ),
        title: Text(
          option.text,
          style: textTheme.bodyLarge?.copyWith(
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        trailing: Icon(
          selected ? Icons.check_circle : Icons.radio_button_unchecked,
          color: selected ? scheme.primary : scheme.outline,
        ),
      ),
    );
  }
}

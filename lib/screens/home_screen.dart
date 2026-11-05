import 'package:flutter/material.dart';

import '../data/personality_types.dart';
import '../models.dart';
import '../widgets/portraits.dart';

class HomeScreen extends StatelessWidget {
  final SavedResult? saved;
  final VoidCallback onStart;
  final VoidCallback onOpenRecord;

  const HomeScreen({
    super.key,
    required this.saved,
    required this.onStart,
    required this.onOpenRecord,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final savedType = saved == null ? null : personalityTypes[saved!.type];
    final recentText = saved == null
        ? '完成 40 道题后，这里会显示最近结果'
        : '已保存：${saved!.type} · ${savedType?.name ?? ''} · ${saved!.savedAt}';

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
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
                    Icon(
                      Icons.psychology_alt_outlined,
                      size: 28,
                      color: scheme.primary,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        '测一测你的 MBTI',
                        style: textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Text(
                  '共 40 道情景题，4 个维度各 10 题，按选项计分并生成四字母人格类型。',
                  style: textTheme.bodyLarge?.copyWith(height: 1.5),
                ),
                const SizedBox(height: 10),
                Text(
                  '结果仅供课程原型演示与自我了解参考，不构成专业心理评估或诊断；测试不接入后端，也不收集个人数据。没有标准答案，按第一反应选更接近你的一项，完成后可保存最近一次结果。放轻松，玩得愉快！',
                  style: textTheme.bodyMedium?.copyWith(
                    color: scheme.onSurfaceVariant,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: onStart,
                    icon: const Icon(Icons.play_arrow_rounded),
                    label: const Text('开始测试'),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '约 15 分钟 · 4 个维度 · 本地保存',
                  style: textTheme.bodySmall?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 22),
        Text('最近记录', style: textTheme.titleMedium),
        const SizedBox(height: 8),
        Card(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          child: ListTile(
            leading: const PersonalityCollage(size: 48),
            title: const Text('人格说明'),
            subtitle: Text(recentText),
            trailing: const Icon(Icons.chevron_right),
            onTap: onOpenRecord,
          ),
        ),
        const SizedBox(height: 22),
        Text('测试说明', style: textTheme.titleMedium),
        const SizedBox(height: 8),
        Card(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.timer_outlined),
                title: const Text('约 15 分钟'),
                subtitle: const Text('40 道情景题，按第一反应作答'),
              ),
              const Divider(height: 1, indent: 16, endIndent: 16),
              ListTile(
                leading: const Icon(Icons.grid_view_rounded),
                title: const Text('4 个维度'),
                subtitle: const Text('能量来源、信息获取、决策方式、生活态度'),
              ),
              const Divider(height: 1, indent: 16, endIndent: 16),
              ListTile(
                leading: const Icon(Icons.lock_outline),
                title: const Text('本地保存'),
                subtitle: const Text('结果只保存在当前设备，不上传'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

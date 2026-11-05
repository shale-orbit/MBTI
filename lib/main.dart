import 'package:flutter/material.dart';

import 'data/personality_types.dart';
import 'data/questions.dart';
import 'models.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/quiz_screen.dart';
import 'store.dart';

void main() {
  runApp(const MbtiApp());
}

class MbtiApp extends StatelessWidget {
  const MbtiApp({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = ColorScheme.fromSeed(seedColor: const Color(0xFF6750A4));
    return MaterialApp(
      title: 'MBTI 性格小测试',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: scheme,
      ),
      home: const MbtiShell(),
    );
  }
}

class MbtiShell extends StatefulWidget {
  const MbtiShell({super.key});

  @override
  State<MbtiShell> createState() => _MbtiShellState();
}

class _MbtiShellState extends State<MbtiShell> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _page = 0;
  int _questionIndex = 0;
  List<int?> _answers = List<int?>.filled(questionBank.length, null);
  String? _resultType;
  Map<String, int>? _counts;
  SavedResult? _saved;

  @override
  void initState() {
    super.initState();
    _loadSaved();
  }

  Future<void> _loadSaved() async {
    final saved = await ResultStore.load();
    if (!mounted || saved == null) {
      return;
    }
    setState(() {
      _saved = saved;
      _resultType = saved.type;
      _counts = Map<String, int>.from(saved.counts);
      _answers = List<int?>.generate(
        questionBank.length,
        (index) => index < saved.answers.length && saved.answers[index] >= 0
            ? saved.answers[index]
            : null,
      );
    });
  }

  void _startTest() {
    setState(() {
      _page = 1;
      _questionIndex = 0;
      _answers = List<int?>.filled(questionBank.length, null);
      _resultType = null;
      _counts = null;
    });
  }

  void _selectAnswer(int value) {
    setState(() {
      _answers[_questionIndex] = value;
    });
  }

  void _prevQuestion() {
    if (_questionIndex == 0) {
      return;
    }
    setState(() {
      _questionIndex--;
    });
  }

  void _nextQuestion() {
    if (_answers[_questionIndex] == null) {
      return;
    }
    if (_questionIndex == questionBank.length - 1) {
      _finishTest();
      return;
    }
    setState(() {
      _questionIndex++;
    });
  }

  void _finishTest() {
    final counts = <String, int>{
      'E': 0,
      'I': 0,
      'S': 0,
      'N': 0,
      'T': 0,
      'F': 0,
      'J': 0,
      'P': 0,
    };

    for (var i = 0; i < questionBank.length; i++) {
      final answer = _answers[i];
      if (answer == null) {
        continue;
      }
      final pole = questionBank[i].options[answer].pole;
      counts[pole] = (counts[pole] ?? 0) + 1;
    }

    final buffer = StringBuffer();
    for (final dimension in dimensionPoles.keys) {
      final poles = dimensionPoles[dimension]!;
      final left = counts[poles[0]] ?? 0;
      final right = counts[poles[1]] ?? 0;
      buffer.write(left >= right ? poles[0] : poles[1]);
    }

    setState(() {
      _counts = counts;
      _resultType = buffer.toString();
      _page = 2;
    });
  }

  Future<void> _saveResult() async {
    final type = _resultType;
    final counts = _counts;
    if (type == null || counts == null) {
      return;
    }

    final now = DateTime.now();
    final record = SavedResult(
      type: type,
      counts: counts,
      answers: _answers.map((answer) => answer ?? -1).toList(),
      total: questionBank.length,
      savedAt:
          '${_twoDigits(now.month)}-${_twoDigits(now.day)} ${_twoDigits(now.hour)}:${_twoDigits(now.minute)}',
    );

    await ResultStore.save(record);
    if (!mounted) {
      return;
    }
    setState(() {
      _saved = record;
    });
  }

  void _openSavedRecord() {
    if (_saved == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('还没有保存的测试记录，先完成一次测试吧')),
      );
      return;
    }
    setState(() {
      _page = 2;
    });
  }

  String _twoDigits(int value) => value.toString().padLeft(2, '0');

  void _closeDrawerAndGo(int page) {
    _scaffoldKey.currentState?.closeDrawer();
    setState(() {
      _page = page;
    });
  }

  Drawer _buildDrawer() {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: scheme.primaryContainer),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.psychology_alt_outlined,
                    size: 32,
                    color: scheme.onPrimaryContainer,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'MBTI 性格小测试',
                    style: textTheme.titleLarge?.copyWith(
                      color: scheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '40 道情景题 · 本地原型',
                    style: textTheme.bodySmall?.copyWith(
                      color: scheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('首页列表'),
              selected: _page == 0,
              onTap: () => _closeDrawerAndGo(0),
            ),
            ListTile(
              leading: const Icon(Icons.quiz_outlined),
              title: const Text('详情答题'),
              selected: _page == 1,
              onTap: () => _closeDrawerAndGo(1),
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('个人中心'),
              selected: _page == 2,
              onTap: () => _closeDrawerAndGo(2),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.restart_alt),
              title: const Text('重新开始测试'),
              onTap: () {
                _scaffoldKey.currentState?.closeDrawer();
                _startTest();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const titles = ['MBTI 性格小测试', '答题详情', '个人中心'];

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text(titles[_page])),
      drawer: _buildDrawer(),
      body: switch (_page) {
        0 => HomeScreen(
            saved: _saved,
            onStart: _startTest,
            onOpenRecord: _openSavedRecord,
          ),
        1 => QuizScreen(
            index: _questionIndex,
            answers: _answers,
            onAnswer: _selectAnswer,
            onPrev: _prevQuestion,
            onNext: _nextQuestion,
            onFinish: _finishTest,
          ),
        _ => ProfileScreen(
            resultType: _resultType,
            counts: _counts,
            saved: _saved,
            onRetest: _startTest,
            onSave: _saveResult,
          ),
      },
    );
  }
}

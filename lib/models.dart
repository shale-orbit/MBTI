class OptionItem {
  final String text;
  final String pole;

  const OptionItem({required this.text, required this.pole});
}

class Question {
  final String dim;
  final String text;
  final List<OptionItem> options;

  const Question({required this.dim, required this.text, required this.options});
}

class PersonalityType {
  final String name;
  final String tagline;
  final String desc;

  const PersonalityType({
    required this.name,
    required this.tagline,
    required this.desc,
  });
}

class SavedResult {
  final String type;
  final Map<String, int> counts;
  final List<int> answers;
  final int total;
  final String savedAt;

  const SavedResult({
    required this.type,
    required this.counts,
    required this.answers,
    required this.total,
    required this.savedAt,
  });

  Map<String, dynamic> toJson() => {
        'type': type,
        'counts': counts,
        'answers': answers,
        'total': total,
        'savedAt': savedAt,
      };

  factory SavedResult.fromJson(Map<String, dynamic> json) {
    final rawCounts = json['counts'] as Map<String, dynamic>? ?? {};
    final rawAnswers = json['answers'] as List<dynamic>? ?? [];
    return SavedResult(
      type: json['type'] as String? ?? '',
      counts: rawCounts.map((key, value) => MapEntry(key, value as int)),
      answers: rawAnswers.map((value) => value as int).toList(),
      total: json['total'] as int? ?? 40,
      savedAt: json['savedAt'] as String? ?? '',
    );
  }
}

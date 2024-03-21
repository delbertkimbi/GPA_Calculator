import 'dart:convert';

class Subject {
  String name;
  String grade;
  double creditValue;
  Subject({
    required this.name,
    required this.grade,
    required this.creditValue,
  });

  Subject copyWith({
    String? name,
    String? grade,
    double? creditValue,
  }) {
    return Subject(
      name: name ?? this.name,
      grade: grade ?? this.grade,
      creditValue: creditValue ?? this.creditValue,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'grade': grade});
    result.addAll({'creditValue': creditValue});

    return result;
  }

  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
      name: map['name'] ?? '',
      grade: map['grade'] ?? '',
      creditValue: map['creditValue']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Subject.fromJson(String source) =>
      Subject.fromMap(json.decode(source));

  @override
  String toString() =>
      'Subject(name: $name, grade: $grade, creditValue: $creditValue)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Subject &&
        other.name == name &&
        other.grade == grade &&
        other.creditValue == creditValue;
  }

  @override
  int get hashCode => name.hashCode ^ grade.hashCode ^ creditValue.hashCode;
}

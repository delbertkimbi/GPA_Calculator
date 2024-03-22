import 'package:flutter/material.dart';
import 'package:gpa_calculator/Presention/pages/screens/results.dart';
import 'package:gpa_calculator/Presention/pages/widget/form_row.dart';

class SubjectEntry extends StatelessWidget {
  final int numberOfSubjects;

  SubjectEntry({
    super.key,
    required this.numberOfSubjects,
  });

  final _formKey = GlobalKey<FormState>();

  final List<String> subjectNames = [];
  final List<String> subjectGrades = [];
  final List<double> subjectCreditValues = [];
  void updateSubjectDetails({
    required int index,
    required String subjectName,
    required String subjectGrade,
    required double subjectCreditValue,
  }) {
    subjectNames[index] = subjectName;
    subjectGrades[index] = subjectGrade;
    subjectCreditValues[index] = subjectCreditValue;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            ListView.builder(
              itemCount: numberOfSubjects > 0 ? numberOfSubjects : 0,
              shrinkWrap: true,
              itemBuilder: (context, index) => FormRow(
                subjectNames: subjectNames,
                subjectGrades: subjectGrades,
                subjectCreditValues: subjectCreditValues,
                index: index,
                // onUpdateSubjectDetails: updateSubjectDetails,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    subjectCreditValues.clear();
                  } else if (_formKey.currentState!.validate()) {
                    List<double> gpaValues = calculateGPA(
                      subjectNames,
                      subjectGrades,
                      subjectCreditValues,
                    );
                    double gpa = gpaValues[0];
                    double ccv = gpaValues[1]; // Total credits
                    double cwgp = gpaValues[2]; // Total quality points
                    debugPrint('GPA: $gpa, CCV: $ccv, CWGP: $cwgp');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          gpa: gpa,
                          ccv: ccv,
                          cwgp: cwgp,
                        ),
                      ),
                    );
                  }
                },
                child: const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<double> calculateGPA(
    List<String> subjectNames,
    List<String> subjectGrades,
    List<double> subjectCreditValues,
  ) {
    double totalQualityPoints = 0.0;
    double totalCredits = 0.0;
    for (int i = 0; i < subjectNames.length; i++) {
      double qualityPoints = convertGradeToQualityPoints(subjectGrades[i]);
      totalQualityPoints += qualityPoints * subjectCreditValues[i];
      totalCredits += subjectCreditValues[i];
    }

    if (totalCredits == 0.0) {
      debugPrint('Error: Total credits cannot be zero.');
      // Return default values for informative display in ResultPage
      return [0.0, 0.0, 0.0]; // Or calculate GPA as 0.0 with a message
    } else {
      debugPrint('Total quality points: $totalQualityPoints');
      return [
        totalQualityPoints / totalCredits,
        totalCredits,
        totalQualityPoints
      ];
    }
  }

  double convertGradeToQualityPoints(String grade) {
    switch (grade.toUpperCase()) {
      case "A":
        return 4.0;
      case "B+":
        return 3.5;
      case "B":
        return 3.0;
      case "C+":
        return 2.5;
      case "C":
        return 2.0;
      case "D+":
        return 1.5;
      case "D":
        return 1.0;
      case "F":
        return 0.0;
      default:
        return 0.0;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:gpa_calculator/pages/screens/results.dart';

class SubjectEntry extends StatelessWidget {
  SubjectEntry({
    super.key,
    required this.numberOfSubjects,
  });

  final _formKey = GlobalKey<FormState>();
  final int numberOfSubjects;

  // Use more specific names for clarity
  final List<String> subjectNames = [];
  final List<String> subjectGrades = [];
  final List<double> subjectCreditValues = [];

  Widget buildSubjectRow(int index) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(hintText: 'Subject ${index + 1}'),
            validator: (value) =>
                value!.isEmpty ? 'Please enter subject name' : null,
            onSaved: (value) => subjectNames[index] = value!,
          ),
        ),
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(hintText: 'Grade'),
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter grade";
              }
              return null;
            },
            onSaved: (value) => subjectGrades[index] = value!,
          ),
        ),
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(labelText: 'Credit Value'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a credit value';
              } else if (double.tryParse(value) == null) {
                return 'Credit value must be a number';
              } else {
                return null; // Valid input
              }
            },
            onSaved: (value) =>
                subjectCreditValues[index] = double.parse(value!),
          ),
        ),
      ],
    );
  }

  List calculateGPA(List<String> subjectNames, List<String> subjectGrades,
      List<double> subjectCreditValues) {
    double totalQualityPoints = 0.0;
    double totalCredits = 0.0;
    for (int i = 0; i < subjectNames.length; i++) {
      double qualityPoints = convertGradeToQualityPoints(subjectGrades[i]);
      totalQualityPoints += qualityPoints * subjectCreditValues[i];
      totalCredits += subjectCreditValues[i];
    }
    return [
      totalQualityPoints / totalCredits,
      totalCredits,
      totalQualityPoints
    ];
  }

  double convertGradeToQualityPoints(String grade) {
    switch (grade.toString().toUpperCase()) {
      case 'A':
        return 4.0;
      case "B+":
        return 3.5;
      case 'B':
        return 3.0;
      case "C+":
        return 2.5;
      case 'C':
        return 2.0;
      case "D+":
        return 1.5;
      case 'D':
        return 1.0;
      case 'F':
        return 0.0;
      default:
        return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            ListView.builder(
              itemCount: numberOfSubjects,
              shrinkWrap: true,
              itemBuilder: (context, index) => buildSubjectRow(index),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    double gpa = calculateGPA(
                        subjectNames, subjectGrades, subjectCreditValues)[0];
                    double ccv = calculateGPA(
                        subjectNames, subjectGrades, subjectCreditValues)[1];
                    double cwgp = calculateGPA(
                        subjectNames, subjectGrades, subjectCreditValues)[2];

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          ccv: ccv,
                          cwgp: cwgp,
                          gpa: gpa,
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
}

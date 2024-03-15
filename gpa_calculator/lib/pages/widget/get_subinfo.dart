import 'package:flutter/material.dart';
import 'package:gpa_calculator/pages/screens/results.dart'; // Assuming ResultPage is here

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
              } else if (double.tryParse(value) == null ||
                  double.parse(value) <= 0) {
                return 'Credit value must be a positive number';
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

  List<double> calculateGPA(List<String> subjectNames,
      List<String> subjectGrades, List<double> subjectCreditValues) {
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
    switch (grade.toString().toUpperCase()) {
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            ListView.builder(
              // Ensure numberOfSubjects > 0 to avoid errors
              itemCount: numberOfSubjects > 0 ? numberOfSubjects : 0,
              shrinkWrap: true,
              itemBuilder: (context, index) => buildSubjectRow(index),
            ),
            const SizedBox(
              height: 7,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    subjectCreditValues.clear(); // Or set all to 0.0
                  } else if (_formKey.currentState!.validate()) {
                    List<double> gpaValues = calculateGPA(
                        subjectNames, subjectGrades, subjectCreditValues);
                    double gpa = gpaValues[0];
                    double ccv = gpaValues[1]; // Total credits
                    double cwgp = gpaValues[2]; // Total quality points
                    debugPrint('GPA: $gpa, CCV: $ccv, CWGP');
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
}

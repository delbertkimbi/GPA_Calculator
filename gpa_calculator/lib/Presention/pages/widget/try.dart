// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gpa_calculator/cubit/gpa_cubit.dart';
// import 'package:gpa_calculator/pages/screens/results.dart';

// class SubjectEntry extends StatelessWidget {
//   const SubjectEntry({
//     super.key,
//     required this.numberOfSubjects,
//   });

//   final int numberOfSubjects;

//   @override
//   Widget build(BuildContext context) {
//     final subjectKeys =
//         List.generate(numberOfSubjects, (index) => GlobalKey<FormState>());

//     return Column(
//       children: [
//         ListView.builder(
//           itemCount: numberOfSubjects,
//           shrinkWrap: true,
//           itemBuilder: (context, index) {
//             return Form(
//               key: subjectKeys[index],
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         hintText: "Subject ${index + 1}",
//                         border: const OutlineInputBorder(),
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Please enter a subject name";
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: TextFormField(
//                       decoration: const InputDecoration(
//                         hintText: "grade",
//                         border: OutlineInputBorder(),
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Please enter grade";
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: TextFormField(
//                       decoration: const InputDecoration(
//                         hintText: "credit value",
//                         border: OutlineInputBorder(),
//                       ),
//                       keyboardType:
//                           TextInputType.number, // Encourage numeric input
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Please enter a credit value";
//                         }
//                         try {
//                           int.parse(value);
//                           return null; // Valid input
//                         } on FormatException {
//                           return "Please enter a valid credit value (integer)";
//                         }
//                       },
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//         Center(
//           child: ElevatedButton(
//             onPressed: () async {
//               double ccv = 0.0; // Initialize course credit value
//               double cwgp = 0.0; // Initialize course weighted grade points

//               for (int i = 0; i < numberOfSubjects; i++) {
//                 final formState =
//                     Form.of(context)!; // Get FormState using Form.of(context)
//                 if (formState.validate()) {
//                   final subject =
//                       formState.currentState!.fields['subjectName']!.value;
//                   final grade = formState.currentState!.fields['grade']!.value;
//                   final creditValue = int.parse(
//                       formState.currentState!.fields['credit value']!.value);

//                   // Calculate course weighted grade point for each subject
//                   double gradePoints = calculateGradePoints(
//                       grade); // Implement this function to convert grade to points

//                   cwgp += gradePoints * creditValue;
//                   ccv += creditValue;

//                   BlocProvider.of<GpaCubit>(context)
//                       .addSubject(subject, grade, creditValue);
//                 }
//               }

//               // Calculate GPA if ccv is not zero (to avoid division by zero)
//               final gpa = ccv > 0 ? cwgp / ccv : 0.0;

//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => ResultPage(
//                     ccv: ccv,
//                     cwgp: cwgp,
//                     gpa: gpa,
//                   ),
//                 ),
//               );
//             },
//             child: const Text("Submit"),
//           ),
//         ),
//       ],
//     );
//   }

//   // Function to calculate grade points based on your grading system (implement this)
//   double calculateGradePoints(String grade) {
//     final gradeMap = {
//       'A': 4.0,
//       'B+': 3.5,
//       'B': 3.0,
//       'C+': 2.5,
//       'C': 2.0,
//       'D+': 1.5,
//       'D': 1.0,
//       'F': 0.0,
//     };

//     return gradeMap[grade] ?? 0.0;
//   }
// }

import 'package:flutter/material.dart';

class FormRow extends StatelessWidget {
  const FormRow({
    super.key,
    required this.subjectNames,
    required this.subjectGrades,
    required this.subjectCreditValues,
    required this.index,
  });

  final List<String> subjectNames;
  final List<String> subjectGrades;
  final List<double> subjectCreditValues;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Subject ${index + 1}',
              border: const OutlineInputBorder(),
            ),
            validator: (value) =>
                value!.isEmpty ? 'Please enter subject name' : null,
            onSaved: (value) => subjectNames[index] = value!,
          ),
        ),
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Grade',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter grade';
              }
              return null;
            },
            onSaved: (value) => subjectGrades[index] = value!,
          ),
        ),
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Credit Value',
              border: OutlineInputBorder(),
            ),
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
}

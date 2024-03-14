import 'package:flutter/material.dart';

import 'package:gpa_calculator/pages/screens/results.dart';

class SubjectEntry extends StatelessWidget {
  const SubjectEntry({
    super.key,
    required this.numberOfSubjects,
  });

  final int numberOfSubjects;

  @override
  Widget build(BuildContext context) {
    TextEditingController subjectController = TextEditingController();
    TextEditingController gradeController = TextEditingController();
    TextEditingController creditValueController = TextEditingController();
    return Column(
      children: [
        ListView.builder(
          // Ensure at least one row is always built
          itemCount: numberOfSubjects,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Form(
              key: UniqueKey(),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Subject ${index + 1}",
                        border: const OutlineInputBorder(),
                      ),
                      controller: subjectController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter a subject name";
                        }
                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "grade",
                        border: OutlineInputBorder(),
                      ),
                      controller: gradeController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter grade";
                        }
                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: "credit value",
                          border: OutlineInputBorder()),
                      controller: creditValueController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter a credit value";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            );
          },
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ResultPage(ccv: 34, cwgp: 60),
                ),
              );
            },
            child: const Text("Submit"),
          ),
        ),
      ],
    );
  }
}

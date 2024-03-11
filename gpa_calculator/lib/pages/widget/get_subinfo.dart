import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/cubit/gpa_cubit.dart';
import 'package:gpa_calculator/pages/screens/results.dart';

class SubjectEntry extends StatelessWidget {
  const SubjectEntry({
    super.key,
    required this.numberOfSubjects,
  });

  final int numberOfSubjects;

  @override
  Widget build(BuildContext context) {
    TextEditingController _subjectController = TextEditingController();
    TextEditingController _gradeController = TextEditingController();
    TextEditingController _creditValueController = TextEditingController();
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
                      controller: _subjectController,
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
                      controller: _gradeController,
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
                      controller: _creditValueController,
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
              for (int i = 0; i < numberOfSubjects - 1; i++) {
                BlocProvider.of<GpaCubit>(context).addSubject(
                  _subjectController.text[i],
                  _gradeController.text[i],
                  int.parse(
                    _creditValueController.text[i],
                  ),
                );
              }
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

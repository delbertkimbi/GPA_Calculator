import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for FilteringTextInputFormatter

import 'package:gpa_calculator/pages/results.dart'; // Assuming ResultPage exists

class SubjectsInfo extends StatefulWidget {
  const SubjectsInfo({super.key});

  @override
  State<SubjectsInfo> createState() => _SubjectsInfoState();
}

class _SubjectsInfoState extends State<SubjectsInfo> {
  final subjectNumberController =
      TextEditingController(text: "0"); // Set initial value

  @override
  void dispose() {
    subjectNumberController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  int tryParseInt(String value) {
    try {
      return int.parse(value);
    } catch (e) {
      // Handle exception (e.g., show an error message)
      debugPrint("Invalid number entered: $e");
      return 0; // Return a default value if parsing fails
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Subjects Info"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Text("data"),
            TextField(
              decoration: const InputDecoration(
                label: Text(
                  "number of subjects",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              controller: subjectNumberController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ], // Allow only digits
            ),
            ListView.builder(
              itemCount: tryParseInt(subjectNumberController.text),
              itemBuilder: (context, index) {
                return Form(
                  key: UniqueKey(),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Subject ${index + 1}",
                          ),
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
                            labelText: "grade",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter grade";
                            }
                            // Add more validation (e.g., format) here
                            return null;
                          },
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "credit value",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter a credit value";
                            }
                            // Add validation for numerical value here
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Form is valid, navigate to ResultsPage
                    // (logic for displaying results without data collection)
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const ResultPage(), // Assuming ResultPage exists
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

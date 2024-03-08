import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for FilteringTextInputFormatter

import 'package:gpa_calculator/pages/results.dart';

// Assuming ResultPage exists

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

  int numberOfSubjects = 0;
  //final _formKey = GlobalKey<FormState>();

  /// Check and make sure the input number of subjects is valid
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
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.deepPurple[100],
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Enter the number of subjects you registered",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    label: const Text(
                      "number of subjects",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                controller: subjectNumberController,
                keyboardType: TextInputType.number,

                ///Ensure user input is an int
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ], // Allow only digits
                onChanged: (value) {
                  // Update the number of subjects when the value changes
                  setState(() {
                    numberOfSubjects = tryParseInt(value);
                  });
                },
              ),
              const SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Fill in the spaces below with the Correct information",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(5),
                          )),
                      child: const Text(
                        "Subject Name",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      color: Colors.deepPurple[400],
                      child: const Text(
                        "Grade",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple[200],
                          borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(5),
                          )),
                      child: const Text(
                        "Credit Value",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 0,
              ),
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
              const SizedBox(
                height: 25,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const ResultPage(ccv: 34, cwgp: 60),
                      ),
                    );
                  },
                  child: const Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

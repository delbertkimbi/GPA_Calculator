import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpa_calculator/pages/widget/entry_static_tittles.dart';
import 'package:gpa_calculator/pages/widget/get_subinfo.dart'; // Import for FilteringTextInputFormatter

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
          child: SingleChildScrollView(
            child: Column(
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

                ///Calls the satic subject info Widget.
                const SizedBox(
                  height: 10,
                ),
                const Headers(), //   const InfoEntryTittle(),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 0,
                ),

                ///Calls the listview of subjectInfo input (subject_info.dart)
                SubjectEntry(numberOfSubjects: numberOfSubjects),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

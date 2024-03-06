import 'package:flutter/material.dart';
import 'package:gpa_calculator/pages/user_input.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GPA Calculator"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        // Have list of semesters and the user should be able to select before calculating their GPA
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SubjectsInfo()),
            );
          },
          child: const Text(
            "Calculate GPA",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gpa_calculator/pages/screens/grading_system.dart';
import 'package:gpa_calculator/pages/screens/user_input.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List semesters = [
    'First Semester',
    'Second Semester',
    "Resit Semester",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          title: const Text(
            "GPA Calcos",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: () {},
        //   backgroundColor: const Color.fromRGBO(103, 58, 183, 1),
        //   label: const Text("Edit Semesters"),
        //   tooltip: "Edit the semesters",
        // ),
        body: Center(
          // Have list of semesters and the user should be able to select before calculating their GPA
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 50, 16, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Welcome to GPA calcos",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Choose a semester to calculate your GPA",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: semesters.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SubjectsInfo()),
                        );
                      },
                      child: Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.deepPurple[400],
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(semesters[index]),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.drag_indicator_sharp),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const GradingSystem();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        backgroundColor: Colors.deepPurple[400],
                      ),
                      child: const Text(
                        "Check Grading System",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class GradingSystem extends StatefulWidget {
  const GradingSystem({super.key});

  @override
  State<GradingSystem> createState() => _GradingSystemState();
}

class _GradingSystemState extends State<GradingSystem> {
  TextStyle tableText1 = const TextStyle(
      color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
  TextStyle tableText2 = const TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );
  List<String> grades = ["A", "B+", "B", "C+", "C", "D+", "D", "F"];
  List<String> scoreRange = [
    "80-100",
    "70-79",
    "60-69",
    "55-59",
    "50-54",
    "45-49",
    "40-44",
    "0-39"
  ];
  List<double> gradePoints = [4, 3.5, 3, 2.5, 2, 1.5, 1, 0];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Grading System',
            style: tableText1,
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
              child: Table(
                border: TableBorder.all(
                  color: Colors.deepPurple,
                ),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    children: [
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Score/100", style: tableText1),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Grade",
                            style: tableText1,
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Grade point/4",
                            style: tableText1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ...List.generate(8, (index) {
                    return TableRow(
                      children: [
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              scoreRange[index],
                              style: tableText2,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              grades[index],
                              style: tableText2,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${gradePoints[index]}",
                              style: tableText2,
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 3, 20, 0),
              child: RichText(
                text: TextSpan(
                  text: "NB",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.deepPurple[400],
                  ),
                  children: [
                    const TextSpan(
                      text: "\n",
                    ),
                    TextSpan(
                      text:
                          "The grade system is based on  University of Buea(Cameroon) approach to grading students.\n",
                      style: tableText2,
                    ),
                    TextSpan(
                      text:
                          "If it does not suit your school, you can always edit by clicking on the button below.\n\n",
                      style: tableText2,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.deepPurple[400],
                ),
                child: const Text(
                  "Customize contents",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

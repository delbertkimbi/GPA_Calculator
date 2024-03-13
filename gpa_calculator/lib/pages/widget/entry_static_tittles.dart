import 'package:flutter/material.dart';

class Headers extends StatelessWidget {
  const Headers({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle tableText1 = const TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);

    return Container(
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
        ]));
  }
}

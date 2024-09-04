import 'package:flutter/material.dart';

class LaserMarkingScreen extends StatefulWidget {
  const LaserMarkingScreen({super.key});

  @override
  State<LaserMarkingScreen> createState() => _LaserMarkingScreenState();
}

class _LaserMarkingScreenState extends State<LaserMarkingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text('Laser Marking', style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Table(
          border: TableBorder.all(),
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(),
            1: FlexColumnWidth(),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: const [
            TableRow(
              children: [
                TableCell(child: _TableCellContent(text: "PCB Processed")),
                TableCell(child: _TableCellContent(text: "")),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: _TableCellContent(text: "Laser start from")),
                TableCell(child: _TableCellContent(text: "")),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: _TableCellContent(text: "Job ID")),
                TableCell(child: _TableCellContent(text: "")),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: _TableCellContent(text: "Time Cycle")),
                TableCell(child: _TableCellContent(text: "")),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: _TableCellContent(text: "Time Stamp")),
                TableCell(child: _TableCellContent(text: "")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TableCellContent extends StatelessWidget {
  final String text;

  const _TableCellContent({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
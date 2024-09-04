import 'package:flutter/material.dart';

class SmdPickPlaceScreen extends StatefulWidget {
  const SmdPickPlaceScreen({super.key});

  @override
  State<SmdPickPlaceScreen> createState() => _SmdPickPlaceScreenState();
}

class _SmdPickPlaceScreenState extends State<SmdPickPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.purple,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,),),
        title: const Text('SMD Pick & Place', style: TextStyle(color: Colors.black),),
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
                TableCell(child: _TableCellContent(text: "Total PCB Load")),
                TableCell(child: _TableCellContent(text: "100")),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: _TableCellContent(text: "Process Complete")),
                TableCell(child: _TableCellContent(text: "48")),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: _TableCellContent(text: "In Process")),
                TableCell(child: _TableCellContent(text: "52")),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: _TableCellContent(text: "Job ID")),
                TableCell(child: _TableCellContent(text: "105")),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: _TableCellContent(text: "Attendent ID")),
                TableCell(child: _TableCellContent(text: "12 TO 14 Digit")),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: _TableCellContent(text: "Time Cycle")),
                TableCell(child: _TableCellContent(text: "25 Sec")),
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
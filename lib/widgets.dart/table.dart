import 'package:flutter/material.dart';
import 'package:hpe_work/widgets.dart/ui_colors.dart';

class TableW extends StatelessWidget {
  const TableW(this._data, {super.key});

  final List<List<dynamic>> _data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: DataTable(
            columns: _createColumn(),
            rows: _createRow(_data),
            //headingRowColor: WidgetStateColor.resolveWith(callback),
            headingTextStyle: TextStyle(
              fontSize: 16,
              fontFamily: 'MetricHPE',
              color: Colors.white,
            ),
            dataTextStyle: const TextStyle(
              fontSize: 16,
              fontFamily: 'MetricHPE',
              color: Colors.white,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.secondary, //Color.fromARGB(226, 54, 54, 57),
            ),
          ),
        ),
      ),
    );
  }
}

List<DataColumn> _createColumn() => [
  DataColumn(label: Text('SNo.')),
  DataColumn(label: Text('Neighbour Id')),
  DataColumn(label: Text('IP Version')),
  DataColumn(label: Text('Area Id')),
  DataColumn(label: Text('Router Id')),
  DataColumn(label: Text('Initial State')),
  DataColumn(label: Text('Final State')),
];

List<DataRow> _createRow(List<List<dynamic>> data) {
  return List.generate(data.length, (index) {
    return DataRow(
      cells: [
        DataCell(Text((index + 1).toString())),
        DataCell(Text(data[index][5].toString())),
        DataCell(Text(data[index][6].toString())),
        DataCell(Text(data[index][7].toString())),
        DataCell(Text(data[index][8].toString())),
        DataCell(Text(data[index][9].toString())),
        DataCell(Text(data[index][10].toString())),
      ],
    );
  });
}

  // List<DataRow> rows = [];

  // for (int i = 1; i < data.length; i++) {
  //   rows.add(
  //     DataRow(
  //       cells: [
  //         DataCell(Text(data[i].toString())),
  //         DataCell(Text(data[i][5].toString())),
  //         DataCell(Text(data[i][6].toString())),
  //         DataCell(Text(data[i][7].toString())),
  //         DataCell(Text(data[i][8].toString())),
  //         DataCell(Text(data[i][9].toString())),
  //         DataCell(Text(data[i][10].toString())),
  //       ],
  //     ),
  //   );
  // }
  // return rows;


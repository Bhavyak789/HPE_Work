import 'package:flutter/material.dart';
//import 'package:hpe_work/data/dropdown_vals.dart';
import 'package:hpe_work/data/model.dart';
import 'package:hpe_work/widgets.dart/ui_colors.dart';
//import 'dart:convert';
//import 'package:hpe_work/data/dropdown_vals.dart';

class TableW2 extends StatelessWidget {
  const TableW2(this._data, {super.key});

  final List<LogData> _data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: DataTable(
          border: TableBorder.all(
            color: Colors.white,
            style: BorderStyle.solid,
            width: 1.5,
            borderRadius: BorderRadius.circular(8),
          ),
          headingRowColor: WidgetStateColor.resolveWith((callback) {
            return AppColors.primary;
          }),
          columns: _createColumn(),
          sortColumnIndex: 6,
          sortAscending: true,
          rows: _createRow(_data),

          // sortColumnIndex: 6,
          // sortAscending: true,
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
    );
  }
}

List<DataColumn> _createColumn() => [
  DataColumn(label: Text('SNo.')),
  DataColumn(label: Text('Router Id')),
  DataColumn(label: Text('Stable neighbours')),
  //DataColumn(label: Text('Un-Stable neighbours')),
  DataColumn(label: Text('Area Id')),
  DataColumn(label: Text('IP Version')),
  DataColumn(label: Text('Full Time')),
  DataColumn(label: Text('Down Time')),
];

List<DataRow> _createRow(List<LogData> data) {
  return List.generate(data.length, (index) {
    return DataRow(
      cells: [
        DataCell(Text((index + 1).toString())),
        DataCell(Text(data[index].routerID.toString())),
        DataCell(Text(data[index].nbrID.toString())),
        DataCell(Text(data[index].areaID.toString())),
        DataCell(Text(data[index].IPversion.toString())),
        DataCell(Text(data[index].Full.toString())),
        DataCell(Text(data[index].Down.toString())),
      ],
    );
  });
}

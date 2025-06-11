import 'package:flutter/material.dart';
//import 'package:hpe_work/data/dropdown_vals.dart';
import 'package:hpe_work/data/model.dart';
import 'package:hpe_work/widgets.dart/ui_colors.dart';
//import 'dart:convert';
//import 'package:hpe_work/data/dropdown_vals.dart';

class TableW3 extends StatelessWidget {
  const TableW3(this._data, {super.key});

  final List<LogData> _data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: DataTable(
            // border: TableBorder.all(
            //   color: Colors.white,
            //   style: BorderStyle.solid,
            //   width: 1.5,
            //   borderRadius: BorderRadius.circular(8),
            // ),
            headingRowColor: WidgetStateColor.resolveWith((callback) {
              return Colors.white;
            }),
            columns: _createColumn(),
            // sortColumnIndex: 6,
            // sortAscending: true,
            rows: _createRow(_data),

            // sortColumnIndex: 6,
            // sortAscending: true,
            headingTextStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'MetricHPE',
              color: Colors.black,
            ),
            dataTextStyle: const TextStyle(
              fontSize: 16,
              fontFamily: 'MetricHPE',
              color: Colors.black,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
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
  DataColumn(label: Text('Un-Stable Neighbours')),
  DataColumn(label: Text('IP Version')),
  DataColumn(label: Text('Router ID')),

  //DataColumn(label: Text('Stable neighbours')),
  DataColumn(label: Text('Area ID')),

  DataColumn(label: Text('Avg Init to Full Time (Sec)')),
  DataColumn(label: Text('Avg Down Time (Sec)')),
  DataColumn(label: Text('Churn above Mean Count')), //Above Mean Recovery Count
  DataColumn(label: Text('Avg Up Time (Sec)')),
];

List<DataRow> _createRow(List<LogData> data) {
  return List.generate(data.length, (index) {
    return DataRow(
      cells: [
        DataCell(Text((index + 1).toString())),
        DataCell(Text(data[index].nbrID.toString())),
        DataCell(Text(data[index].IPversion.toString())),
        DataCell(Text(data[index].routerID.toString())),

        DataCell(Text(data[index].areaID.toString())),

        DataCell(
          Text((data[index].avgInitToFullTime?.toStringAsFixed(2)) ?? '0.00'),
        ),
        DataCell(Text((data[index].DownAvg?.toStringAsFixed(2)) ?? '0.00')),
        DataCell(Text(data[index].initToFullTimeAboveMeanCnt.toString())),
        DataCell(Text((data[index].FullAvg?.toStringAsFixed(2)) ?? '0.00')),
      ],
    );
  });
}

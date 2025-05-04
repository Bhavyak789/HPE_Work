import 'package:flutter/material.dart';
//import 'package:hpe_work/data/model.dart';
import 'package:hpe_work/data/model2.dart';
import 'package:hpe_work/widgets.dart/ui_colors.dart';
//import 'package:hpe_work/data/dropdown_vals.dart';

class TableW extends StatelessWidget {
  const TableW(this._data, {super.key});

  final List<LogData2> _data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
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
  DataColumn(label: Text('Down State')),
  //DataColumn(label: Text('Attempt State')),
  DataColumn(label: Text('Init State')),
  //DataColumn(label: Text('Two-Way State')),
  DataColumn(label: Text('Extart State')),
  DataColumn(label: Text('Exchange State')),
  DataColumn(label: Text('Loading State')),
  DataColumn(label: Text('Full State')),
];

List<DataRow> _createRow(List<LogData2> data) {
  return List.generate(data.length, (index) {
    return DataRow(
      cells: [
        DataCell(Text((index + 1).toString())),
        DataCell(Text(data[index].nbrID.toString())),
        DataCell(Text(data[index].IPversion.toString())),
        DataCell(Text(data[index].areaID.toString())),
        DataCell(Text(data[index].routerID.toString())),
        DataCell(Text(data[index].Down.toString())),
        //DataCell(Text(data[index].Attempt.toString())),
        DataCell(Text(data[index].Init.toString())),
        //DataCell(Text(data[index].TwoWay.toString())),
        DataCell(Text(data[index].Exstart.toString())),
        DataCell(Text(data[index].Exchange.toString())),
        DataCell(Text(data[index].Loading.toString())),
        DataCell(Text(data[index].Full.toString())),
      ],
    );
  });
}

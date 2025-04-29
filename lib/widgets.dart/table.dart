import 'package:flutter/material.dart';
import 'package:hpe_work/widgets.dart/ui_colors.dart';
//import 'package:hpe_work/data/dropdown_vals.dart';

class TableW extends StatelessWidget {
  const TableW(this._data, this.areaAdd, this.nbrAdd, this.rtrAdd, {super.key});

  final String nbrAdd;
  final String rtrAdd;
  final String areaAdd;

  final List<List<dynamic>> _data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
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
  DataColumn(label: Text('Down State')),
  DataColumn(label: Text('Attempt State')),
  DataColumn(label: Text('Init State')),
  DataColumn(label: Text('2-Way State')),
  DataColumn(label: Text('Extart State')),
  DataColumn(label: Text('Exchange State')),
  DataColumn(label: Text('Loading State')),
  DataColumn(label: Text('Full State')),
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

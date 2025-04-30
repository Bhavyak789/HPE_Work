import 'package:flutter/material.dart';
//import 'package:hpe_work/data/dropdown_vals.dart';
import 'package:hpe_work/data/model.dart';
import 'package:hpe_work/widgets.dart/ui_colors.dart';

class TableW3 extends StatefulWidget {
  const TableW3(this._data, {super.key});

  final List<LogData> _data;

  @override
  State<TableW3> createState() => _TableW2State();
}

class _TableW2State extends State<TableW3> {
  late List<LogData> _sortedData;
  bool _isAscending = true;
  int? _sortColumnIndex;

  @override
  void DownState() {
    //super.DownState();
    _sortedData = widget._data; // Downialize sorted data with the original data
  }

  void _sort<T>(
    Comparable<T> Function(LogData log) getField,
    int columnIndex,
    bool ascending,
  ) {
    setState(() {
      _isAscending = ascending;
      _sortColumnIndex = columnIndex;
      _sortedData.sort((a, b) {
        final aValue = getField(a);
        final bValue = getField(b);
        return ascending
            ? Comparable.compare(aValue, bValue)
            : Comparable.compare(bValue, aValue);
      });
    });
  }

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
            sortColumnIndex: _sortColumnIndex,
            sortAscending: _isAscending,
            rows: _createRow(_sortedData),
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
              color: AppColors.secondary,
            ),
          ),
        ),
      ),
    );
  }

  List<DataColumn> _createColumn() => [
    DataColumn(label: Text('SNo.')),
    DataColumn(label: Text('Router Id')),
    DataColumn(label: Text('Stable neighbours')),
    DataColumn(label: Text('Un-Stable neighbours')),
    DataColumn(label: Text('Area Id')),
    DataColumn(label: Text('IP Version')),
    DataColumn(
      label: Text('Full Time'),
      onSort: (columnIndex, ascending) {
        _sort((log) => log.Full ?? 0.0, columnIndex, ascending);
      },
    ),
    DataColumn(
      label: Text('Down Time'),
      onSort: (columnIndex, ascending) {
        _sort((log) => log.Down ?? 0.0, columnIndex, ascending);
      },
    ),
  ];

  List<DataRow> _createRow(List<LogData> data) {
    return List.generate(data.length, (index) {
      print(data[index].routerID.toString());
      return DataRow(
        cells: [
          DataCell(Text((index + 1).toString())),
          DataCell(Text(data[index].routerID.toString())),
          DataCell(Text(data[index].nbrID.toString())),
          DataCell(Text(data[index].nbrID.toString())),
          DataCell(Text(data[index].areaID.toString())),
          DataCell(Text(data[index].IPversion.toString())),
          DataCell(Text(data[index].Full.toString())),
          DataCell(Text(data[index].Down.toString())),
        ],
      );
    });
  }
}

import 'package:flutter/material.dart';
//import 'package:hpe_work/data/dropdown_vals.dart';
import 'package:hpe_work/data/model.dart';
import 'package:hpe_work/widgets.dart/ui_colors.dart';
//import 'dart:convert';
//import 'package:hpe_work/data/dropdown_vals.dart';

class TableW3 extends StatelessWidget {
  const TableW3(this._data, {super.key});

  final List<LogData> _data;

  // double predictedTime(int index) {
  //   double leftTime;
  //   if (_data[index].currentDateAndTime != null &&
  //       _data[index].currentState.toString() == "Full") {
  //     double remainingTime = (_data[index].FullAvg ?? 0.0);
  //     DateTime time = DateTime.parse(
  //       _data[index].currentDateAndTime.toString(),
  //     );
  //     double localMillisPrev = time.millisecondsSinceEpoch.toDouble();
  //     double fullAvg = (remainingTime) * 1000;

  //     double localMillisNow = DateTime.now().millisecondsSinceEpoch.toDouble();

  //     remainingTime = localMillisNow - localMillisPrev;
  //     leftTime = fullAvg - remainingTime;
  //     return leftTime / 1000;
  //   }

  //   return 0.0;
  // }

  // Color _getColor(int index) {
  //   DateTime time = DateTime.parse(_data[index].currentDateAndTime.toString());
  //   double localMillisPrev = time.millisecondsSinceEpoch.toDouble();
  //   double localMillisNow = DateTime.now().millisecondsSinceEpoch.toDouble();
  //   double temp = (_data[index].FullAvg ?? 0 - (_data[index].FullSD ?? 0));
  //   if (_data[index].currentState.toString() == "Full") {
  //     if (localMillisNow - localMillisPrev <= temp) {
  //       return AppColors.Green;
  //     } else if (localMillisNow - localMillisPrev <=
  //         (_data[index].FullAvg ?? 0)) {
  //       return AppColors.Yellow;
  //     } else {
  //       return AppColors.Red;
  //     }
  //   } else {
  //     return AppColors.secondary; // Default color for other states
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: DataTable(
            headingRowColor: WidgetStateColor.resolveWith((callback) {
              return Colors.white;
            }),
            columns: _createColumn(),
            rows: _createRow(_data),
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
              //color: AppColors.secondary, //Color.fromARGB(226, 54, 54, 57),
            ),
          ),
        ),
      ),
    );
  }
}

List<DataColumn> _createColumn() => [
  DataColumn(label: Text('SNo.')),
  DataColumn(label: Text('State')),
  //DataColumn(label: Text('Predicted Up Time')),
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
  //TableW3 tableW3 = TableW3(data);
  return List.generate(data.length, (index) {
    return DataRow(
      // color: WidgetStateColor.resolveWith((callback) {
      //   return tableW3._getColor(index);
      // }),
      cells: [
        DataCell(Text((index + 1).toString())),
        DataCell(Text(data[index].currentState.toString())),
        // DataCell(
        //   Text((tableW3.predictedTime(index)).toStringAsFixed(2)), //,
        // ), // P
        DataCell(Text(data[index].nbrID.toString())),
        DataCell(Text(data[index].IPversion.toString())),
        DataCell(Text(data[index].routerID.toString())),

        DataCell(Text(data[index].areaID.toString())),

        DataCell(
          Text((data[index].avgInitToFullTime?.toStringAsFixed(2)) ?? '0.00'),
        ),
        DataCell(Text((data[index].DownAvg?.toStringAsFixed(2)) ?? '0.00')),
        DataCell(
          Text(
            data[index].numberOfTimesInitToFullTimeGoesAboveMeanInitToFullTime
                .toString(),
          ),
        ),
        DataCell(Text((data[index].FullAvg?.toStringAsFixed(2)) ?? '0.00')),
      ],
    );
  });
}

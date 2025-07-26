import 'package:flutter/material.dart';
import 'package:hpe_work/data/model.dart';
import 'package:hpe_work/widgets.dart/ui_colors.dart';
//import 'dart:convert';

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

  Color _getColor(int index) {
    var status = _data[index].status;
    if (status == 'Green')
      return AppColors.Green;
    else if (status == 'Yellow')
      return AppColors.Yellow;
    else if (status == 'Red')
      return AppColors.Red;
    else if (status == 'Light Green')
      return AppColors.lightGreen;
    else if (status == 'Lighter Green')
      return AppColors.vLightGreen;
    else
      return AppColors.Gray;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: DataTable(
          columnSpacing: 0,
          headingRowColor: WidgetStateColor.resolveWith((callback) {
            return Colors.white;
          }),
          columns: _createColumn(),
          rows: _createRow(_data),
          headingTextStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'MetricHPE',
            color: Colors.black,
          ),
          dataTextStyle: const TextStyle(
            fontSize: 14,
            fontFamily: 'MetricHPE',
            color: Colors.black,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: AppColors.secondary, //Color.fromARGB(226, 54, 54, 57),
          ),
        ),
      ),
    );
  }
}

List<DataColumn> _createColumn() => [
  DataColumn(label: Text('SNo.')),

  DataColumn(label: Text('Un-Stable Neighbours')),
  // DataColumn(label: Text('IP Version')),
  DataColumn(label: Text('Router ID')),

  // DataColumn(label: Text('Stable neighbours')),
  DataColumn(label: Text('Area ID')),

  DataColumn(label: Text('Avg Init to Full\nTime (Sec)')),
  // DataColumn(label: Text('Avg Down\nTime (Sec)')),
  DataColumn(label: Text('Predicted\nUp Time')),
  DataColumn(
    label: Text('Churn above\nMean Count'),
  ), // Above Mean Recovery Count
  DataColumn(label: Text('Avg Up\nTime (Sec)')),

  DataColumn(label: Text('Down Time (Sec)')),
  DataColumn(label: Text('State')),

  DataColumn(label: Text('Event')),
];

List<DataRow> _createRow(List<LogData> data) {
  TableW3 tableW3 = TableW3(data);
  return List.generate(data.length, (index) {
    return DataRow(
      color: WidgetStateColor.resolveWith((callback) {
        return tableW3._getColor(index);
      }),
      cells: [
        DataCell(Text((index + 1).toString())),

        DataCell(Text(data[index].nbrID.toString())),
        // DataCell(Text(data[index].IPversion.toString())),
        DataCell(Text(data[index].routerID.toString())),

        DataCell(Text(data[index].areaID.toString())),

        DataCell(
          Text((data[index].avgInitToFullTime?.toStringAsFixed(2)) ?? '0.00'),
        ),

        // DataCell(Text((data[index].DownAvg?.toStringAsFixed(2)) ?? '0.00')),
        DataCell(
          Text(
            data[index].timeLeftOnCurrentState != null
                ? data[index].timeLeftOnCurrentState!.toStringAsFixed(2)
                : '0.00',
          ),
        ),
        DataCell(
          Text(
            data[index].numberOfTimesInitToFullTimeGoesAboveMeanInitToFullTime
                .toString(),
          ),
        ),
        DataCell(Text((data[index].FullAvg?.toStringAsFixed(2)) ?? '0.00')),

        DataCell(
          Text(
            data[index].timePassedOnCurrentState != null
                ? data[index].timePassedOnCurrentState!.toStringAsFixed(2)
                : '0.00',
          ),
        ),

        DataCell(Text(data[index].currentState.toString())),

        DataCell(Text(data[index].event.toString())),
      ],
    );
  });
}

import 'package:flutter/material.dart';
import 'package:hpe_work/data/model.dart';
import 'package:hpe_work/widgets.dart/ui_colors.dart';
import 'dart:convert';
import 'dart:async';

class TableW2 extends StatelessWidget {
  const TableW2(this._data, {super.key});

  final List<LogData> _data;

  //final double predictedUpTime;

  // Stream<String> timerStream(int index) async* {
  //   await Future.delayed(Duration(seconds: 5));
  //   if (_data[index].currentDateAndTime != null &&
  //       _data[index].currentState.toString() == "Full") {
  //     double remainingTime = (_data[index].FullAvg ?? 0.0);
  //     DateTime time = DateTime.parse(
  //       _data[index].currentDateAndTime.toString(),
  //     );
  //     double localMillisPrev = time.millisecondsSinceEpoch.toDouble();
  //     // print(localMillisPrev);
  //     // double fullAvg =
  //     //     (_data[index].FullAvg ?? 0.0) * 1000; // Convert to seconds

  //     double localMillisNow = DateTime.now().millisecondsSinceEpoch.toDouble();
  //     //remainingTime = localMillisPrev - localMillisNow;

  //     // Timer.periodic(Duration(seconds: 1), (timer) {
  //     //   remainingTime = remainingTime - 1; //localMillisPrev - localMillisNow;
  //     // });

  //     yield (remainingTime - 5).toString(); // Placeholder value
  //   }

  //   yield '0.00';
  // }

  double predictedTime(int index) {
    double leftTime;
    if (_data[index].currentDateAndTime != null &&
        _data[index].currentState.toString() == "Full") {
      double remainingTime = (_data[index].FullAvg ?? 0.0);
      DateTime time = DateTime.parse(
        _data[index].currentDateAndTime.toString(),
      );
      double localMillisPrev = time.millisecondsSinceEpoch.toDouble();
      double fullAvg = (remainingTime) * 1000;

      double localMillisNow = DateTime.now().millisecondsSinceEpoch.toDouble();

      remainingTime = localMillisNow - localMillisPrev;
      leftTime = fullAvg - remainingTime;
      return leftTime / 1000;
    }

    return 0.0;
  }

  Color _getColor(int index) {
    DateTime time = DateTime.parse(_data[index].currentDateAndTime.toString());
    double localMillisPrev = time.millisecondsSinceEpoch.toDouble();
    double localMillisNow = DateTime.now().millisecondsSinceEpoch.toDouble();
    double temp = (_data[index].FullAvg ?? 0 - (_data[index].FullSD ?? 0));
    if (_data[index].currentState.toString() == "Full") {
      if (localMillisNow - localMillisPrev <= temp) {
        return AppColors.Green;
      } else if (localMillisNow - localMillisPrev <=
          (_data[index].FullAvg ?? 0)) {
        return AppColors.Yellow;
      } else {
        return AppColors.Red;
      }
    } else {
      return AppColors.secondary; // Default color for other states
    }
  }

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
              borderRadius: BorderRadius.circular(8),
              //color: _getColor(index), //Change color here
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
  DataColumn(label: Text('Predicted Up Time')),
  DataColumn(label: Text('Stable Neighbours')),
  DataColumn(label: Text('IP Version')),
  DataColumn(label: Text('Router ID')),

  DataColumn(label: Text('Area ID')),

  DataColumn(label: Text('Avg Up Time (Sec)')),

  DataColumn(label: Text('Standard Deviation (Sec)')),
  DataColumn(label: Text('Avg Down Time (Sec)')),
  DataColumn(label: Text('Up Time below Mean Count')),
];

List<DataRow> _createRow(List<LogData> data) {
  TableW2 tableW2 = TableW2(data);
  return List.generate(data.length, (index) {
    return DataRow(
      color: WidgetStateColor.resolveWith((callback) {
        return tableW2._getColor(index);
      }),
      cells: [
        DataCell(Text((index + 1).toString())),
        DataCell(Text(data[index].currentState.toString())),
        DataCell(
          Text((tableW2.predictedTime(index)).toStringAsFixed(2)), //,
        ), // Predicted Up Time
        DataCell(Text(data[index].nbrID.toString())),
        DataCell(Text(data[index].IPversion.toString())),
        DataCell(Text(data[index].routerID.toString())),

        DataCell(Text(data[index].areaID.toString())),

        DataCell(Text((data[index].FullAvg?.toStringAsFixed(2)) ?? '0.00')),
        DataCell(Text((data[index].FullSD?.toStringAsFixed(2)) ?? '0.00')),
        DataCell(Text((data[index].DownAvg?.toStringAsFixed(2)) ?? '0.00')),

        DataCell(
          Text(
            data[index].numberOfTimesFullTimeGoesBelowMeanFullTime.toString(),
          ),
        ),
      ],
    );
  });
}

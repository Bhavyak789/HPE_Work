import 'package:flutter/material.dart';
//import 'package:hpe_work/data/model.dart';
import 'package:hpe_work/data/model_all.dart';
import 'package:hpe_work/widgets.dart/ui_colors.dart';
//import 'package:hpe_work/data/dropdown_vals.dart';

class TableW extends StatelessWidget {
  const TableW(this._data, {super.key});

  final List<LogData2> _data;

  // int predictedTime(int index) {
  //   int leftTime;
  //   if (_data[index].currentDateAndTime != null &&
  //       _data[index].currentState.toString() == "Full") {
  //     int remainingTime;
  //     double fullAvg = _data[index].FullAvg ?? 0.0;
  //     //print("NbrID :  ${_data[index].nbrID}");

  //     //print('AVG : $fullAvg');

  //     String currentDateTime = _data[index].currentDateAndTime.toString();
  //     currentDateTime = currentDateTime.substring(
  //       0,
  //       currentDateTime.length - 2,
  //     ); // Ensure the string is in UTC format
  //     //print('Prev DateTime: $currentDateTime');
  //     DateTime localDateTimePrev = DateTime.parse(currentDateTime);
  //     // print('new Prev DateTime: $localDateTimePrev');
  //     DateTime localDateTimeNow = DateTime.now().toLocal();
  //     //print('Curren DateTime: $localDateTimeNow');
  //     remainingTime =
  //         (localDateTimeNow.difference(localDateTimePrev).inSeconds);
  //     //.toInt();
  //     //print('Remaining Time: $remainingTime seconds');
  //     leftTime = ((fullAvg - remainingTime)).toInt();
  //     // time2 = DateTime.fromMillisecondsSinceEpoch(
  //     //   leftTime,
  //     // ); // Convert seconds to milliseconds
  //     //print('Left Time :$leftTime');
  //     return leftTime;
  //   }

  //   return 0;
  // }

  // Color _getColor(int index) {
  //   String currentDateTime = _data[index].currentDateAndTime.toString();
  //   currentDateTime = currentDateTime.substring(0, currentDateTime.length - 1);
  //   DateTime localDateTimePrev = DateTime.parse(currentDateTime).toUtc();
  //   DateTime localDateTimeNow = DateTime.now().toLocal();
  //   double fullAvg = _data[index].FullAvg ?? 0.0; // Convert to milliseconds
  //   int remainingTime =
  //       (localDateTimePrev.difference(localDateTimeNow).inSeconds).toInt();
  //   int leftTime = ((fullAvg - remainingTime)).toInt();
  //   if (_data[index].currentState.toString() == "Full") {
  //     if (leftTime <= fullAvg) {
  //       return AppColors.Green;
  //     } else if (leftTime > fullAvg) {
  //       return AppColors.Yellow;
  //     } else {
  //       return AppColors.Red;
  //     }
  //   } else {
  //     return AppColors.secondary; //grey  // Default color for other states
  //   }
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
            borderRadius: BorderRadius.circular(8),
            //color: AppColors.secondary, //Color.fromARGB(226, 54, 54, 57),
          ),
        ),
      ),
    );
  }
}

List<DataColumn> _createColumn() => [
  DataColumn(label: Text('SNo.')),

  //DataColumn(label: Text('Predicted Up Time')),
  DataColumn(label: Text('Neighbour ID')),
  DataColumn(label: Text('IP Version')),
  DataColumn(label: Text('Router ID')),
  DataColumn(label: Text('Area ID')),

  //DataColumn(label: Text('Init to Full Time')),
  //DataColumn(label: Text('Avg Init to Full Time')),
  DataColumn(label: Text('Avg Up Time (Sec)')),
  DataColumn(label: Text('Avg Down Time (Sec)')),
  DataColumn(label: Text('Time Passed on\nFull State (Sec)')),
  DataColumn(label: Text('State')),
  DataColumn(label: Text('Event')),
];

List<DataRow> _createRow(List<LogData2> data) {
  TableW tableW = TableW(data);
  return List.generate(data.length, (index) {
    return DataRow(
      color: WidgetStateColor.resolveWith((callback) {
        return tableW._getColor(index);
      }),
      cells: [
        DataCell(Text((index + 1).toString())),

        // DataCell(
        //   Text(
        //     data[index].timeLeftOnCurrentState != null
        //         ? data[index].timeLeftOnCurrentState!.toStringAsFixed(2)
        //         : '0.00',
        //   ),
        // ), // predicted up time
        DataCell(Text(data[index].nbrID.toString())),
        DataCell(Text(data[index].IPversion.toString())),
        DataCell(Text(data[index].routerID.toString())),
        DataCell(Text(data[index].areaID.toString())),

        //DataCell(Text(data[index].Init.toString())),
        //DataCell(Text(data[index].avgInitToFullTime.toString())),
        DataCell(Text((data[index].FullAvg?.toStringAsFixed(2)) ?? '0.00')),
        //DataCell(Text(data[index].FullAvg.toString())),
        DataCell(Text((data[index].DownAvg?.toStringAsFixed(2)) ?? '0.00')),
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

import 'package:flutter/material.dart';
import 'package:hpe_work/data/dropdown_vals.dart';
import 'package:hpe_work/data/model.dart';
import 'package:hpe_work/data/model_all.dart';
import 'package:hpe_work/widgets.dart/table_stable.dart';
import 'package:hpe_work/widgets.dart/table_all.dart';
import 'package:hpe_work/widgets.dart/table_unstable.dart';
import 'package:hpe_work/widgets.dart/ui_colors.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class chatbot extends StatefulWidget {
  const chatbot({super.key});

  @override
  State<chatbot> createState() => _chatbotState();
}

class _chatbotState extends State<chatbot> {
  String chatUrl = '';

  void _loadJSON3() async {
    //All data
    final url = Uri.http(chatUrl, 'filter');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        //TODO
      }),
    );
    // print('Json3');
    // print(response.statusCode);

    // print('Fetching data from URL: $url');
    // print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
    //final response = await http.get(url);
    final List<dynamic> _Tempdata = json.decode(response.body);
    final List<LogData2> _Loaddata = [];
    for (final item in _Tempdata) {
      _Loaddata.add(
        LogData2(
          routerID: item['routerID'] ?? "-",
          nbrID: item['nbrID'] ?? "-",
          areaID: item['areaID'] ?? "-",
          IPversion: item['IPversion'] ?? "-",
          DownAvg:
              (item['DownAvg'] is int)
                  ? (item['DownAvg'] as int).toDouble()
                  : (item['DownAvg'] ?? 0.0),
          FullAvg:
              (item['FullAvg'] is int)
                  ? (item['FullAvg'] as int).toDouble()
                  : (item['FullAvg'] ?? 0.0),
          InitAvg:
              (item['InitAvg'] is int)
                  ? (item['InitAvg'] as int).toDouble()
                  : (item['InitAvg'] ?? 0.0),
          avgInitToFullTime: item['avgInitToFullTime'],
          currentState: item['currentState'] ?? "-",
          currentDateAndTime: item['currentDateAndTime'] ?? "-",
        ),
      );
    }

    // setState(() {
    //   _data3 = _Loaddata;
    //   //initState();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Chatbot',
                style: TextStyle(fontSize: 24, color: AppColors.primary),
              ),
              Text(
                'This is a placeholder for the chatbot interface.',
                style: TextStyle(fontSize: 16),
              ),
              // Add your chatbot widget here
            ],
          ),
        ),
      ),
    );
  }
}

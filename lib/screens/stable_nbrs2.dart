//import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:hpe_work/data/dropdown_vals.dart';
import 'package:hpe_work/data/model.dart';
import 'package:hpe_work/data/model_all.dart';
import 'package:hpe_work/chatbot.dart';
import 'package:hpe_work/widgets.dart/table_stable.dart';
import 'package:hpe_work/widgets.dart/table_all.dart';
import 'package:hpe_work/widgets.dart/table_unstable.dart';
import 'package:hpe_work/widgets.dart/ui_colors.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StableNbrs extends StatefulWidget {
  const StableNbrs({super.key});

  @override
  State<StableNbrs> createState() => _StableNbrsState();
}

class _StableNbrsState extends State<StableNbrs> {
  List<LogData> _data = [];
  List<LogData> _data2 = [];
  List<LogData2> _data3 = [];

  int table = 3;
  final String serverUrl = 'harris-eddie-shorts-projected.trycloudflare.com';

  String nbrValue = nbrId[0];
  String rtrValue = routerId[0];
  String areaValue = areaId[0];
  String IPversionalue = IPversion[0];

  String? nbrAdd;
  String? rtrAdd;
  String? areaAdd;
  String? ipAdd;

  // void initState() {
  //   super.initState();
  //   _loadNbrID;
  //   _loadRtrID;
  //   _loadareaID;
  // }

  Widget _buildTable() {
    if (table == 2) {
      _loadJSON2();
      return TableW3(_data2); //Unstable Data
    } else if (table == 1) {
      _loadJSON();
      return TableW2(_data); //Stable data
    } else {
      _loadJSON3();
      return TableW(_data3); //All data

      // return TableW(
      //   nbrValue == 'Neighbour Id' &&
      //           areaValue == 'Area Id' &&
      //           rtrValue == 'Router Id' &&
      //           IPversionalue == 'IP Version'
      //       ? _data3
      //       : _filteredData1,
      // );
    }
  }

  // Methods to dynamically load unique IDs from the backend

  // void _loadNbrID() async {
  //   final url = Uri.http(serverUrl, 'nbrID');
  //   final response = await http.get(url);
  //   final List<String> nbrID = List<String>.from(
  //     json.decode(response.body),
  //   ); //json.decode(response.body);
  // }

  // void _loadRtrID() async {
  //   final url = Uri.http(serverUrl, 'rtrID');
  //   final response = await http.get(url);
  //   final List<String> routerID = json.decode(response.body);
  // }

  // void _loadareaID() async {
  //   final url = Uri.http(serverUrl, 'nbrID');
  //   final response = await http.get(url);
  //   final List<String> areaID = json.decode(response.body);
  // }

  void _loadJSON() async {
    //Stable Data
    final url = Uri.http(serverUrl, 'stability');
    //final response = await http.get(url);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'nbrID': nbrValue,
        'routerID': rtrValue,
        'areaID': areaValue,
        'IPversion': IPversionalue,
      }),
    );
    final List<dynamic> _Tempdata = json.decode(response.body);
    final List<LogData> _Loaddata = [];
    for (final item in _Tempdata) {
      _Loaddata.add(
        LogData(
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
          FullSD:
              (item['FullSD'] is int)
                  ? (item['FullSD'] as int).toDouble()
                  : (item['FullSD'] ?? -1),
          avgInitToFullTime: item['avgInitToFullTime'], //?? 0,
          numberOfTimesFullTimeGoesBelowMeanFullTime:
              item['numberOfTimesFullTimeGoesBelowMeanFullTime'], //?? 0,  FullBelowMeanCnt
          currentState: item['currentState'] ?? "-",
          currentDateAndTime: item['currentDateAndTime'] ?? "-",
          status: item['status'] ?? "-",
          timeLeftOnCurrentState:
              (item['timeLeftOnCurrentState'] is int)
                  ? (item['timeLeftOnCurrentState'] as int).toDouble()
                  : (item['timeLeftOnCurrentState'] ?? 0.0),
          event: item['event'] ?? "-",
          timePassedOnCurrentState:
              (item['timePassedOnCurrentState'] is int)
                  ? (item['timePassedOnCurrentState'] as int).toDouble()
                  : (item['timePassedOnCurrentState'] ?? 0.0),
        ),
      );
    }
    // print('Json1');
    // print(_Loaddata);

    setState(() {
      _data = _Loaddata;
      // _sendJSON();
      // _filterData();
    });
  }

  void _loadJSON2() async {
    // Unstable Data
    final url = Uri.http(serverUrl, 'unstability');
    // final response = await http.get(url);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'nbrID': nbrValue,
        'routerID': rtrValue,
        'areaID': areaValue,
        'IPversion': IPversionalue,
      }),
    );
    final List<dynamic> _Tempdata = json.decode(response.body);
    final List<LogData> _Loaddata = [];
    for (final item in _Tempdata) {
      _Loaddata.add(
        LogData(
          routerID: item['routerID'] ?? "-",
          nbrID: item['nbrID'] ?? "-",
          areaID: item['areaID'] ?? "-",
          IPversion: item['IPversion'] ?? "-",
          avgInitToFullTime: item['avgInitToFullTime'],
          DownAvg:
              (item['DownAvg'] is int)
                  ? (item['DownAvg'] as int).toDouble()
                  : (item['DownAvg'] ?? 0.0),
          FullAvg:
              (item['FullAvg'] is int)
                  ? (item['FullAvg'] as int).toDouble()
                  : (item['FullAvg'] ?? 0.0),
          numberOfTimesInitToFullTimeGoesAboveMeanInitToFullTime: //initToFullTimeAboveMeanCnt
              item['numberOfTimesInitToFullTimeGoesAboveMeanInitToFullTime'], //?? 0,
          currentState: item['currentState'] ?? "-",
          currentDateAndTime: item['currentDateAndTime'] ?? "-",
          status: item['status'] ?? "-",
          event: item['event'] ?? "-",
          timePassedOnCurrentState:
              (item['timePassedOnCurrentState'] is int)
                  ? (item['timePassedOnCurrentState'] as int).toDouble()
                  : (item['timePassedOnCurrentState'] ?? 0.0),
        ),
      );
    }
    // print('Json2');
    // print(_Loaddata);

    setState(() {
      _data2 = _Loaddata;
      //_sendJSON();
      //_filterData();
    });
  }

  void _loadJSON3() async {
    //All data
    final url = Uri.http(serverUrl, 'filter');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'nbrID': nbrValue,
        'routerID': rtrValue,
        'areaID': areaValue,
        'IPversion': IPversionalue,
      }),
    );
    // print('Json3');
    // print(response.statusCode);

    // print('Fetching data from URL: $url');
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    // final response = await http.get(url);
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
          status: item['status'] ?? "-",
          event: item['event'] ?? "-",
          timePassedOnCurrentState:
              (item['timePassedOnCurrentState'] is int)
                  ? (item['timePassedOnCurrentState'] as int).toDouble()
                  : (item['timePassedOnCurrentState'] ?? 0.0),
        ),
      );
    }

    // print(_Tempdata);

    setState(() {
      _data3 = _Loaddata;
      // initState();
    });
  }

  void _chatOverlay() {
    showModalBottomSheet(
      constraints: const BoxConstraints(maxWidth: 1100),
      enableDrag: true,
      backgroundColor: AppColors.secondary,
      useSafeArea: true,
      clipBehavior: Clip.antiAlias,
      context: context,
      builder: (ctx) => (chatbot()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _chatOverlay,
        backgroundColor: AppColors.primary2,
        child: const Icon(Icons.chat_bubble, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // endDrawer: _chatOverlay(),
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text(
          'HPE Network Analytics',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'MetricHPE',
          ),
        ),
        backgroundColor: AppColors.primary2,
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/BG.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 57,
                // width: 1290,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        ' Result Data',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'MetricHPE',
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 38,
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10),

                        // DropDown search implementation testing

                        // child: DropdownSearch<String>(
                        //   key: Key('nbrId'),
                        //   items: (filter, loadProps) => nbrId,
                        //   decoratorProps: DropDownDecoratorProps(
                        //     decoration: InputDecoration(labelText: "Nbr Id"),
                        //   ),
                        // ),
                        // child: SearchAnchor.bar(
                        //   constraints: const BoxConstraints(maxWidth: 200),
                        //   //barBackgroundColor: AppColors.Gray,
                        //   //viewBackgroundColor: Colors.transparent,
                        //   barLeading: Text(''),
                        //   barHintText: 'Neighbour ID',
                        //   suggestionsBuilder: (
                        //     BuildContext context,
                        //     SearchController controller,
                        //   ) {
                        //     final String input = controller.value.text;
                        //     return nbrId
                        //         .where(
                        //           (String item) => item.toLowerCase().contains(
                        //             input.toLowerCase(),
                        //           ),
                        //         )
                        //         .map(
                        //           (String item) => ListTile(
                        //             title:
                        //                 item == ''
                        //                     ? Text("Neighbour ID")
                        //                     : Text(item),
                        //             onTap: () {
                        //               controller.value = TextEditingValue(
                        //                 text:
                        //                     item == '' ? "Neighbour ID" : item,
                        //               );
                        //               controller.closeView(item);
                        //             },
                        //           ),
                        //         )
                        //         .toList();
                        //   },
                        // ),
                        child: DropdownButton(
                          items:
                              nbrId.map((String item1) {
                                return DropdownMenuItem(
                                  value: item1,
                                  child:
                                      item1 == ''
                                          ? Text("Neighbour ID")
                                          : Text(item1),
                                );
                              }).toList(),
                          onChanged: (String? newNbrValue) {
                            setState(() {
                              nbrValue = newNbrValue!;
                              nbrAdd = newNbrValue;
                            });
                          },
                          value: nbrValue,
                          borderRadius: BorderRadius.circular(10),
                          dropdownColor:
                              Colors
                                  .white, //const Color.fromARGB( 226,54,54,57),
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 16,
                            fontFamily: 'MetricHPE',
                          ),
                          underline: Container(),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 38,
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: DropdownButton(
                          items:
                              routerId.map((String item2) {
                                return DropdownMenuItem(
                                  value: item2,
                                  child:
                                      item2 == ''
                                          ? Text("Router ID")
                                          : Text(item2),
                                );
                              }).toList(),
                          onChanged: (String? newRtrValue) {
                            setState(() {
                              rtrValue = newRtrValue!;
                              rtrAdd = newRtrValue;
                            });
                          },
                          value: rtrValue,
                          borderRadius: BorderRadius.circular(8),
                          dropdownColor:
                              Colors
                                  .white, //const Color.fromARGB( 226,54,54,57),
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 16,
                            fontFamily: 'MetricHPE',
                          ),
                          underline: Container(),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 38,
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: DropdownButton(
                          items:
                              areaId.map((String item3) {
                                return DropdownMenuItem(
                                  value: item3,
                                  child:
                                      item3 == ''
                                          ? Text('Area ID')
                                          : Text(item3),
                                );
                              }).toList(),
                          onChanged: (String? newAreaValue) {
                            setState(() {
                              areaValue = newAreaValue!;
                              areaAdd = newAreaValue;
                            });
                          },
                          value: areaValue,
                          borderRadius: BorderRadius.circular(8),
                          dropdownColor:
                              Colors
                                  .white, //const Color.fromARGB( 226,54,54,57),
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 16,
                            fontFamily: 'MetricHPE',
                          ),
                          underline: Container(),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 38,
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: DropdownButton(
                          items:
                              IPversion.map((String item4) {
                                return DropdownMenuItem(
                                  value: item4,
                                  child:
                                      item4 == ''
                                          ? Text('IP Version')
                                          : Text(item4),
                                );
                              }).toList(),
                          onChanged: (String? newIPversionalue) {
                            setState(() {
                              IPversionalue = newIPversionalue!;
                              ipAdd = newIPversionalue;
                            });
                          },
                          value: IPversionalue,
                          borderRadius: BorderRadius.circular(8),
                          dropdownColor:
                              Colors
                                  .white, //const Color.fromARGB( 226,54,54,57),
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 16,
                            fontFamily: 'MetricHPE',
                          ),
                          underline: Container(),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          nbrValue = nbrId[0];
                          rtrValue = routerId[0];
                          areaValue = areaId[0];
                          IPversionalue = IPversion[0];
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Clear Filter',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Readex Pro',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  ElevatedButton(
                    onPressed: () {
                      table = 3;
                      setState(() {
                        _loadJSON3;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppColors.primary2,
                      backgroundColor: Colors.white,
                      // minimumSize: Size(128, 40),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 80,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Logs',
                      style: TextStyle(fontSize: 16, fontFamily: 'Readex Pro'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      table = 1;
                      setState(() {
                        _loadJSON;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppColors.primary2,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Stable Neighbours',
                      style: TextStyle(fontSize: 16, fontFamily: 'Readex Pro'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      table = 2;
                      setState(() {
                        _loadJSON2;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppColors.primary2,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Unstable Neighbours',
                      style: TextStyle(fontSize: 16, fontFamily: 'Readex Pro'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 550,
                  width: double.infinity,
                  child: _buildTable(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

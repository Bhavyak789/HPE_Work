import 'package:flutter/material.dart';
import 'package:hpe_work/data/dropdown_vals.dart';
import 'package:hpe_work/data/model.dart';
import 'package:hpe_work/data/model2.dart';
import 'package:hpe_work/widgets.dart/table2.dart';
import 'package:hpe_work/widgets.dart/table.dart';
import 'package:hpe_work/widgets.dart/table3.dart';

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
  List<LogData2> _data2 = [];

  List<LogData2> _filteredData1 = [];
  int table = 3;

  String nbrValue = nbrId[0];
  String rtrValue = routerID[0];
  String areaValue = areaId[0];
  String IPversionalue = IPversion[0];

  String? nbrAdd;
  String? rtrAdd;
  String? areaAdd;
  String? ipAdd;

  Widget _buildTable() {
    if (table == 2) {
      return TableW3(_data);
    } else if (table == 1) {
      return TableW2(_data);
    } else {
      return TableW(
        nbrValue == 'Neighbour Id' &&
                areaValue == 'Area Id' &&
                rtrValue == 'Router Id'
            ? _data2
            : _filteredData1,
      );
    }
  }

  void _loadJSON() async {
    final url = Uri.http(
      // 'techrepublic-seafood-deeply-observation.trycloudflare.com',
      // 'stability',
      'localhost:3000',
      'stability',
    );

    final response = await http.get(url);
    //print('Response status: ${response.statusCode}');
    //print('Response : ${response.body}');
    final List<dynamic> _Tempdata = json.decode(response.body);
    //print(_Tempdata);
    final List<LogData> _Loaddata = [];

    for (final item in _Tempdata) {
      _Loaddata.add(
        LogData(
          routerID: item['routerID'] ?? "-",
          nbrID: item['nbrID'] ?? "-",
          areaID: item['areaID'] ?? "-",
          IPversion: item['IPversion'] ?? "-",
          Down: item['Down'] ?? -1,
          Full: item['Full'] ?? -1,
        ),
      );
      //print(_Loaddata[0].routerID);
    }

    setState(() {
      _data = _Loaddata;
      //_filterData();
    });
  }

  void _loadJSON2() async {
    final url = Uri.http(
      // 'techrepublic-seafood-deeply-observation.trycloudflare.com',
      // 'unstability',
      'localhost:3000',
      'stability',
    );

    final response = await http.get(url);
    //print('Response status: ${response.statusCode}');
    //print('Response : ${response.body}');
    final List<dynamic> _Tempdata = json.decode(response.body);
    //print(_Tempdata);
    final List<LogData> _Loaddata = [];

    for (final item in _Tempdata) {
      _Loaddata.add(
        LogData(
          routerID: item['routerID'] ?? "-",
          nbrID: item['nbrID'] ?? "-",
          areaID: item['areaID'] ?? "-",
          IPversion: item['IPversion'] ?? "-",
          Down: item['Down'] ?? -1,
          Full: item['Full'] ?? -1,
        ),
      );
      //print(_Loaddata[0].routerID);
    }

    setState(() {
      _data = _Loaddata;
      //_filterData();
    });
  }

  void _loadJSON3() async {
    final url = Uri.http(
      // 'techrepublic-seafood-deeply-observation.trycloudflare.com',
      // 'filter',
      'localhost:3000',
      'stability',
    );

    final response = await http.get(url);
    //print('Response status: ${response.statusCode}');
    //print('Response : ${response.body}');
    final List<dynamic> _Tempdata = json.decode(response.body);
    //print(_Tempdata);
    final List<LogData2> _Loaddata = [];

    for (final item in _Tempdata) {
      _Loaddata.add(
        LogData2(
          routerID: item['routerID'] ?? "-",
          nbrID: item['nbrID'] ?? "-",
          areaID: item['areaID'] ?? "-",
          IPversion: item['IPversion'] ?? "-",
          Down: item['Down'] ?? -1,
          Full: item['Full'] ?? -1,
          Attempt: item['Attempt'] ?? -1,
          Init: item['Init'] ?? -1,
          TwoWay: item['TwoWay'] ?? -1,
          Exstart: item['Exstart'] ?? -1,
          Exchange: item['Exchange'] ?? -1,
          Loading: item['Loading'] ?? -1,
        ),
      );
      //print(_Loaddata[0].routerID);
    }

    setState(() {
      _data2 = _Loaddata;
      _filterData;
    });
  }

  void _filterData() {
    setState(() {
      _filteredData1 =
          _data2
              .where(
                (row) =>
                    row.nbrID == nbrValue &&
                    row.routerID == rtrValue &&
                    row.areaID == areaValue &&
                    row.IPversion == IPversionalue,
                // (nbrValue == 'Neighbour Id')
                //     ? row[5] == nbrId
                //     : row[5] == nbrValue && (rtrValue == 'Router Id')
                //     ? row[7] == routerID
                //     : row[7] == rtrValue && (areaValue == 'Area Id')
                //     ? row[8] == areaId
                //     : row[8] == areaValue,
                // (IPversion == 'IP Version ') ? row[9] == IPversion : row[9] == IPversionalue &&
              )
              .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadJSON();
    _loadJSON2();
    _loadJSON3();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        title: const Text(
          'HPE Network Analytics',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'MetricHPE',
          ),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35, left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                ElevatedButton(
                  onPressed: () {
                    table = 3;
                    setState(() {
                      _loadJSON3;
                    });
                    // Handle login action
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 1, 169, 130),
                    backgroundColor: Colors.white,
                    //minimumSize: Size(128, 40),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 80,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Logs',
                    style: TextStyle(fontSize: 16, fontFamily: 'Readex Pro'),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    table = 1;
                    setState(() {
                      _loadJSON2;
                    });
                    // Handle login action
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 1, 169, 130),
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Stable Neighbours',
                    style: TextStyle(fontSize: 16, fontFamily: 'Readex Pro'),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    table = 2;
                    setState(() {
                      _loadJSON;
                    });
                    // Handle login action
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 1, 169, 130),
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Unstable Neighbours',
                    style: TextStyle(fontSize: 16, fontFamily: 'Readex Pro'),
                  ),
                ),
              ],
            ),
          ),
          //const SizedBox(width: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 57,
                    width: 1290,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(8),
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
                              color: Colors.white,
                              fontFamily: 'MetricHPE',
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 38,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton(
                              items:
                                  nbrId.map((String item1) {
                                    return DropdownMenuItem(
                                      value: item1,
                                      child: Text(item1),
                                    );
                                  }).toList(),
                              onChanged: (String? newNbrValue) {
                                setState(() {
                                  nbrValue = newNbrValue!;
                                  nbrAdd = newNbrValue;
                                });
                              }, //scev

                              value: nbrValue,
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
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton(
                              items:
                                  routerID.map((String item2) {
                                    return DropdownMenuItem(
                                      value: item2,
                                      child: Text(item2),
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
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton(
                              items:
                                  areaId.map((String item3) {
                                    return DropdownMenuItem(
                                      value: item3,
                                      child: Text(item3),
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
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton(
                              items:
                                  IPversion.map((String item4) {
                                    return DropdownMenuItem(
                                      value: item4,
                                      child: Text(item4),
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
                            onPressed: _loadJSON,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.secondary,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Filter',
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
                ),
                SizedBox(height: 15),

                //CustomScrollView
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 551,
                      width: 1290,
                      child: _buildTable(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hpe_work/data/temp_logs.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
//import 'package:hpe_work/data/model/idData.dart';

class Analytics extends StatefulWidget {
  const Analytics({super.key});

  @override
  State<Analytics> createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  List<List<dynamic>> _data = [];

  String nbrValue = nbrId[0];
  String rtrValue = rtrId[0];
  String areaValue = areaId[0];
  String ipValue = ipV[0];

  void _loadCSV() async {
    final _rawData = await rootBundle.loadString('assets/logs.csv');
    List<List<dynamic>> _listData = const CsvToListConverter().convert(
      _rawData,
    );
    setState(() {
      _data = _listData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(226, 54, 54, 57),
      appBar: AppBar(
        title: const Text(
          'HPE Network Analytics',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'MetricHPE',
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 1, 169, 130),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Network\nAnalysis",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'MetricHPE',
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  "Enter your query here",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: 'MetricHPE',
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: 288,
                  height: 144,
                  child: TextField(
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'MetricHPE',
                    ),
                    cursorHeight: 16,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  "Query results",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'MetricHPE',
                  ),
                ),
                const SizedBox(height: 10),
                //ListViewBuilder for scrollable results
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Container(
                    height: 57,
                    width: 1170,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 1, 169, 130),
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
                                });
                              }, //scev
                              value: nbrValue,
                              borderRadius: BorderRadius.circular(8),
                              dropdownColor:
                                  Colors
                                      .white, //const Color.fromARGB( 226,54,54,57),
                              style: TextStyle(
                                color: Color.fromARGB(255, 1, 169, 130),
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
                                  rtrId.map((String item2) {
                                    return DropdownMenuItem(
                                      value: item2,
                                      child: Text(item2),
                                    );
                                  }).toList(),
                              onChanged: (String? newRtrValue) {
                                setState(() {
                                  rtrValue = newRtrValue!;
                                });
                              },
                              value: rtrValue,
                              borderRadius: BorderRadius.circular(8),
                              dropdownColor:
                                  Colors
                                      .white, //const Color.fromARGB( 226,54,54,57),
                              style: TextStyle(
                                color: Color.fromARGB(255, 1, 169, 130),
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
                                });
                              },
                              value: areaValue,
                              borderRadius: BorderRadius.circular(8),
                              dropdownColor:
                                  Colors
                                      .white, //const Color.fromARGB( 226,54,54,57),
                              style: TextStyle(
                                color: Color.fromARGB(255, 1, 169, 130),
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
                                  ipV.map((String item4) {
                                    return DropdownMenuItem(
                                      value: item4,
                                      child: Text(item4),
                                    );
                                  }).toList(),
                              onChanged: (String? newIpValue) {
                                setState(() {
                                  ipValue = newIpValue!;
                                });
                              },
                              value: ipValue,
                              borderRadius: BorderRadius.circular(8),
                              dropdownColor:
                                  Colors
                                      .white, //const Color.fromARGB( 226,54,54,57),
                              style: TextStyle(
                                color: Color.fromARGB(255, 1, 169, 130),
                                fontSize: 16,
                                fontFamily: 'MetricHPE',
                              ),
                              underline: Container(),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: _loadCSV,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                226,
                                54,
                                54,
                                57,
                              ),
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
                SingleChildScrollView(
                  //scrollDirection: Axis.horizontal,
                  //scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 1, 169, 130),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 551,
                      width: 1168,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: ListView.builder(
                          itemCount: _data.length,
                          itemBuilder: (ctx, index) {
                            return Card(
                              margin: const EdgeInsets.all(5),
                              color:
                                  index == 0
                                      ? const Color.fromARGB(226, 54, 54, 57)
                                      : const Color.fromARGB(
                                        255,
                                        243,
                                        243,
                                        243,
                                      ),
                              // Table(
                              //   border: TableBorder.all(
                              //     borderRadius: BorderRadius.circular(8),
                              //     color: Colors.white,
                              //     width: 1.5,
                              //   ),
                              //   defaultVerticalAlignment:
                              //       TableCellVerticalAlignment.middle,
                              //   children: [
                              //     TableRow(
                              //       decoration: BoxDecoration(
                              //         color: index ==0 ?const Color.fromARGB(
                              //           226,
                              //           54,
                              //           54,
                              //           57,
                              //         ) : Colors.white,
                              //         borderRadius: BorderRadius.circular(8),
                              //       ),
                              //       children: [
                              //         TableCell(
                              //           child: Padding(
                              //             padding: const EdgeInsets.all(8.0),
                              //             child: Text(
                              //               'SNo. /n$index',
                              //               style: TextStyle(
                              //                 fontFamily: 'MetricHPE',
                              //                 fontSize: 16,
                              //                 color: Colors.white,
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //         TableCell(
                              //           child: Padding(
                              //             padding: const EdgeInsets.all(8.0),
                              //             child: Text(
                              //               'Neighbour Id /n${[index][5]}',
                              //               style: TextStyle(
                              //                 fontFamily: 'MetricHPE',
                              //                 fontSize: 16,
                              //                 color: Colors.white,
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //         TableCell(
                              //           child: Padding(
                              //             padding: const EdgeInsets.all(8.0),
                              //             child: Text(
                              //               'IP version /n${[index][6]}',
                              //               style: TextStyle(
                              //                 fontFamily: 'MetricHPE',
                              //                 fontSize: 16,
                              //                 color: Colors.white,
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //         TableCell(
                              //           child: Padding(
                              //             padding: const EdgeInsets.all(8.0),
                              //             child: Text(
                              //               'Area Id /n${[index][7]}',
                              //               style: TextStyle(
                              //                 fontFamily: 'MetricHPE',
                              //                 fontSize: 16,
                              //                 color: Colors.white,
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //         TableCell(
                              //           child: Padding(
                              //             padding: const EdgeInsets.all(8.0),
                              //             child: Text(
                              //               'Router Id /n${[index][8]}',
                              //               style: TextStyle(
                              //                 fontFamily: 'MetricHPE',
                              //                 fontSize: 16,
                              //                 color: Colors.white,
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //         TableCell(
                              //           child: Padding(
                              //             padding: const EdgeInsets.all(8.0),
                              //             child: Text(
                              //               'Initial State /n${[index][9]}',
                              //               style: TextStyle(
                              //                 fontFamily: 'MetricHPE',
                              //                 fontSize: 16,
                              //                 color: Colors.white,
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //         TableCell(
                              //           child: Padding(
                              //             padding: const EdgeInsets.all(8.0),
                              //             child: Text(
                              //               'Final State /n${[index][10]}',
                              //               style: TextStyle(
                              //                 fontFamily: 'MetricHPE',
                              //                 fontSize: 16,
                              //                 color: Colors.white,
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ],
                              // );
                              child: ListTile(
                                title:
                                    index == 0
                                        ? Text(
                                          'SNo.   Neighbour Id    IP Version    Area Id    Router Id    Initial State     Final State ',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'MetricHPE',
                                            color:
                                                index == 0
                                                    ? Colors.white
                                                    : Colors.black,
                                          ),
                                        )
                                        : Text(
                                          ' $index          ${_data[index][5]}           ${_data[index][6]}         ${_data[index][7]}      ${_data[index][8]}      ${_data[index][9]}              ${_data[index][10]}',
                                        ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

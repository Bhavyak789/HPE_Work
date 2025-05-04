import 'package:flutter/material.dart';
import 'package:hpe_work/data/dropdown_vals.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:hpe_work/widgets.dart/table.dart';
import 'package:hpe_work/widgets.dart/ui_colors.dart';

class Analytics extends StatefulWidget {
  const Analytics({super.key});

  @override
  State<Analytics> createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  List<List<dynamic>> _data = [];
  List<List<dynamic>> _filteredData1 = [];

  String nbrValue = nbrId[0];
  String rtrValue = routerID[0];
  String areaValue = areaId[0];
  String ipValue = IPversion[0];

  String? nbrAdd;
  String? rtrAdd;
  String? areaAdd;
  String? ipAdd;

  void _loadCSV() async {
    final _rawData = await rootBundle.loadString('assets/logs.csv');
    List<List<dynamic>> _listData = const CsvToListConverter().convert(
      _rawData,
    );
    setState(() {
      _data = _listData;
      _filterData(); // Initialize filtered data with all data
    });
  }

  void _filterData() {
    // Example filter: select rows where the second column (index 1) is "value"
    setState(() {
      _filteredData1 =
          _data
              .where(
                (row) =>
                    row[5] == nbrValue &&
                    row[8] == rtrValue &&
                    row[7] == areaValue,
                // (nbrValue == 'Neighbour Id')
                //     ? row[5] == nbrId
                //     : row[5] == nbrValue && (rtrValue == 'Router Id')
                //     ? row[7] == rtrId
                //     : row[7] == rtrValue && (areaValue == 'Area Id')
                //     ? row[8] == areaId
                //     : row[8] == areaValue,
                // (ipV == 'IP Version ') ? row[9] == ipV : row[9] == ipValue &&
              )
              .toList();
    });
  }

  @override
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
                          // const SizedBox(width: 10),
                          // Container(
                          //   height: 38,
                          //   decoration: BoxDecoration(
                          //     color: Colors.white,
                          //     borderRadius: BorderRadius.circular(8),
                          //   ),
                          //   padding: const EdgeInsets.symmetric(horizontal: 10),
                          //   child: DropdownButton(
                          //     items:
                          //         ipV.map((String item4) {
                          //           return DropdownMenuItem(
                          //             value: item4,
                          //             child: Text(item4),
                          //           );
                          //         }).toList(),
                          //     onChanged: (String? newIpValue) {
                          //       setState(() {
                          //         ipValue = newIpValue!;
                          //         ipAdd = newIpValue;
                          //       });
                          //     },
                          //     value: ipValue,
                          //     borderRadius: BorderRadius.circular(8),
                          //     dropdownColor:
                          //         Colors
                          //             .white, //const Color.fromARGB( 226,54,54,57),
                          //     style: TextStyle(
                          //       color: AppColors.primary,
                          //       fontSize: 16,
                          //       fontFamily: 'MetricHPE',
                          //     ),
                          //     underline: Container(),
                          //   ),
                          // ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: _loadCSV,
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
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 551,
                      width: 1168,
                      // child: TableW(
                      //   nbrValue == 'Neighbour Id' &&
                      //           areaValue == 'Area Id' &&
                      //           rtrValue == 'Router Id'
                      //       ? _data
                      //       : _filteredData1,
                      //   areaValue,
                      //   nbrValue,
                      //   rtrValue,
                      // ),
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

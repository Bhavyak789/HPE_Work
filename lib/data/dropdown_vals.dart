import 'package:flutter/material.dart';
import 'package:hpe_work/data/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:ui';

// Future<void> _fetchBooks() async {
//   final response = await http.get(
//     Uri.parse('http://localhost:3000/api/books'),
//   );
//   final List<dynamic> json = jsonDecode(response.body);
//   setState(() {
//     _books = json.map((item) => Book.fromJson(item)).toList();
//   });
// }
// List<LogData> _logs = [];
//final url  = Uri.https('https://hpe-work-b4838-default-rtdb.firebaseio.com/demo_js.json', 'demo_js.json');

// class temp {
//   Future<void> _gerData() async {
//     final response = await http.get(Uri.parse('hpe-work-b4838-default-rtdb.firebaseio.com'));

//     final List<dynamic> json = jsonDecode(response.body);
//     _logs = json.map((item) => LogData.fromJson(item)).toList();

//     for (var i = 0; i < 3; i++) {
//       print(_logs[i].nbrID);
//     }
//   }
// }

final nbrId = ['Neighbour Id', '10.10.10.1', '10.10.10.2', '10.10.10.3'];

final routerID = ['Router Id', '1.1.1.1', '2.2.2.2', '3.3.3.3'];
// final rtrId = [
//   'Router Id ',
//   '2.2.2.2',
//   '22.2.2.2',
//   '10.10.10.2',
//   '1.1.1.1',
//   '11.1.1.1',
//   '3.3.3.3',
//   '192.168.100.2',
//   '10.10.10.1',
//   '192.168.100.1',
// ];

final areaId = ['Area Id', '0.0.0.0', '0.0.0.1'];

final IPversion = ['IP Version', 'IPv4', 'IPv6'];

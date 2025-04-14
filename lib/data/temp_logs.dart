final nbrId = [
  'Neighbour Id ',
  '10.10.10.1',
  '10.10.10.2',
  '10.10.10.3',
  '10.10.10.4',
];

final rtrId = ['Router Id ', '1.1.1.1', '2.2.2.2', '3.3.3.3', '4.4.4.4'];

final areaId = ['Area Id ', '0.0.0.0', '0.0.0.1'];

final ipV = ['IP Version ', 'IPv4', 'IPv6'];

class TempLogs {
  var logs = [
    [
      '2.2.2.2',
      '10.0.0.1',
      '',
      '0 min 40 sec 288 ms 0 μs',
      '0 min 0 sec 1 ms 0 μs',
    ],
    [
      '2.2.2.2',
      '10.0.0.1',
      '',
      '0 min 29 sec 424 ms 0 μs',
      '0 min 0 sec 1 ms 0 μs',
    ],
  ];

  // List getNbrId() {
  //   return nbrId; //logs.length;
  // }

  // int getLength() {
  //   return logs.length;
  // }

  // List getLog(int index) {
  //   return logs[index];
  // } //logs.length;
}

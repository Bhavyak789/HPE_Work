import 'dart:developer';
import 'package:hpe_work/data/conn_details.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Conn {
  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    //var collection = db.collection(COLLECTION_NAME);
  }
}

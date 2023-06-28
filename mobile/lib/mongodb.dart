import 'package:mongo_dart/mongo_dart.dart';

class MongoDataBase {
  static connect() async {
    var db = await Db.create(
        'mongodb+srv://gabrielhjalberto:gabriel123@cluster0.t8961c5.mongodb.net/?Market_Scraper_Mobile?retryWrites=true&w=majority');
    await db.open();
    var status = db.serverStatus();
    print(status);
    print("Conectou");
    final collection = db.collection('produtos');
  }
}

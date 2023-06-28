import 'package:mongo_dart/mongo_dart.dart';

class MongoDataBase {
  Future<List<Map<String, dynamic>>> fetchData() async {
    Db db = await Db.create(
        'mongodb+srv://gabrielhjalberto:gabriel123@cluster0.t8961c5.mongodb.net/Market_Scraper_Mobile?retryWrites=true&w=majority');
    await db.open();

    final collection = db.collection('produtos');
    final data = await collection.find().toList();

    await db.close();

    return data;
  }
}

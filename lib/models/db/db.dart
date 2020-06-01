
import 'dart:io';
import 'package:covidapp/models/dao/news_dao.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart'as p;
part 'db.g.dart';

class ArticleRecords extends Table{
  TextColumn get title=>text()();
  TextColumn get description=>text()();
  TextColumn get url=>text()();
  TextColumn get urlToImage=>text()();
  TextColumn get publishedDate=>text()();
  TextColumn get content=>text()();

@override
  // implement primaryKey
  Set<Column> get primaryKey => {url};
}

@UseMoor(tables:[ArticleRecords],daos: [NewsDao])
class NewsDatabase extends _$NewsDatabase{
  NewsDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;
}
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'news_db'));
    return VmDatabase(file);
  });
}


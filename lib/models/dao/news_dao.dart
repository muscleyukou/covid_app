import 'package:covidapp/models/db/db.dart';
import 'package:moor/moor.dart';
part 'news_dao.g.dart';

@UseDao(tables: [ArticleRecords])
class NewsDao extends DatabaseAccessor<NewsDatabase> with _$NewsDaoMixin {
  NewsDao(NewsDatabase db) : super(db);
  Future clearDB()=>delete(articleRecords).go();
  Future insertDB(List<ArticleRecord>articles)async{
    await batch((batch){
      batch.insertAll(articleRecords, articles);
    });
  }
  Future <List<ArticleRecord>>get articlesFromDB=>select(articleRecords).get();
  Future <List<ArticleRecord>>insertAndNewsFromDB(List<ArticleRecord>articles)=>transaction(()async{
    await clearDB();
    await insertDB(articles);
    return await articlesFromDB;
  });
}

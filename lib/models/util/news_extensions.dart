import 'package:covidapp/models/db/db.dart';
import 'package:covidapp/models/models/virus_model.dart';
//Dartのモデルクラスからテーブルクラスに
extension ConvertToArticleRecord on List<Article>{
  List<ArticleRecord>toArticleRecord(List<Article>articles){
    final articleRecords=List<ArticleRecord>();
  articles.forEach((article) {
    articleRecords.add(
      ArticleRecord(title: article.title??"",
          description: article.description??"",
          url: article.url,
          urlToImage: article.urlToImage??"",
          publishedDate:article.publishDate??"",
          content: article.content??""),
    );
  });
  return articleRecords;
  }
}

//テーブルクラスからモデルクラスに
extension ConvertToArticle on List<ArticleRecord>{
  List<Article>toArticle(List<ArticleRecord>articleRecords){
    final articles=List<Article>();
    articleRecords.forEach((articleRecord) {
      articles.add(
        Article(title: articleRecord.title??"",
            description: articleRecord.description??"",
            url: articleRecord.url,
            urlToImage: articleRecord.urlToImage??"",
            publishDate:articleRecord.publishedDate??"",
            content: articleRecord.content??""),
      );
    });
    return articles;
  }
}


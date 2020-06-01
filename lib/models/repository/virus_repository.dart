
import 'package:covidapp/main.dart';
import 'package:covidapp/models/models/virus_model.dart';
import 'package:covidapp/models/service/virus_api.dart';
import 'package:covidapp/view/data/search_type.dart';
import 'package:flutter/material.dart';
import 'package:chopper/chopper.dart';
import 'package:covidapp/models/util/news_extensions.dart';

class NewsRepository {
  final ApiService _apiService = ApiService.create();
  List<Article> result;

  Future<List<Article>> getNews({@required SearchType searchType}) async {
    Response response;
    try {
      switch (searchType) {
        case SearchType.HEAD_LINE:
          response = await _apiService.getHeadLines();
          break;
      }
      if (response.isSuccessful) {
        final responseBody = response.body;
        result =await insertAndFromDB(responseBody);
        print('$responseBody');
      } else {
        final errorCode = response.statusCode;
        final error = response.error;
        print('response is not sucessful $errorCode,$error');
      }
    } on Exception catch (error) {
      print('error:$error');
    }
    return result;
  }

  void dispose() {
    _apiService.dispose();
  }

 Future<List<Article>> insertAndFromDB(responseBody)async {
  final dao=newsDatabase.newsDao;
  final articles=News.fromJson(responseBody).articles;
 final articleRecords= await dao.insertAndNewsFromDB(
    articles.toArticleRecord(articles)
  );
  return articleRecords.toArticle(articleRecords);
 }
}
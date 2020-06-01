import 'package:covidapp/models/models/virus_model.dart';
import 'package:covidapp/models/repository/virus_repository.dart';
import 'package:covidapp/view/data/search_type.dart';
import 'package:flutter/material.dart';


class NewsViewModel extends ChangeNotifier{
 SearchType _searchType=SearchType.HEAD_LINE;
 SearchType get searchType=>_searchType;

 bool _isLoading=false;
 bool get isLoading=>_isLoading;
 List<Article>_articles=List();
 List<Article> get articles=>_articles;

 final NewsRepository _repository = NewsRepository();

Future<void>getHeadLine({@required SearchType searchtype})async{
  _searchType=searchtype;
  _isLoading=true;
  notifyListeners();
  _articles= await _repository.getNews(
      searchType: _searchType,
      );
  _isLoading=false;
  notifyListeners();
}
 @override
 void dispose() {
   _repository.dispose();
   super.dispose();
 }
}
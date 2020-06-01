import 'package:covidapp/models/repository/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class VirusViewModel extends ChangeNotifier{
  bool _isLoading=false;
  bool get isLoading=>_isLoading;
 List<VirusModel>_virus;
 List<VirusModel>get virus=>_virus;
  Future<void>GetVirusData()async{
  _isLoading=true;
notifyListeners();
_virus= await fetchVirus(http.Client());
 _isLoading=false;
 notifyListeners();
  }
}

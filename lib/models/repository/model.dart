import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
Future<List<VirusModel>>fetchVirus(http.Client client)async{
  final response=await client.get('https://covid19-japan-web-api.now.sh/api/v1/prefectures');
  return compute(parseModels, response.body);
}
List<VirusModel>parseModels(String responseBody){
  final parsed=jsonDecode(responseBody).cast<Map<String,dynamic>>();
  return parsed.map<VirusModel>((json)=>VirusModel.fromJson(json)).toList();
}

class VirusModel{
  final int id;
  final String name_ja;
  final int pcr;
  final int cases;
  final int deaths;
VirusModel({this.name_ja,this.cases,this.deaths,this.id,this.pcr});
factory VirusModel.fromJson(Map<String,dynamic>json){
  return VirusModel(
    id: json['id'] as int,
    name_ja: json['name_ja']as String,
    cases: json['cases']as int,
    deaths: json['deaths']as int,
    pcr: json['pcr']as int,
  );
}
}

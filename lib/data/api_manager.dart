import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami_project/data/model/RadioModel.dart';

class ApiManager{

static Future<List<Radios>?> getRadios()async{
    try{
      Uri uri=Uri.https("mp3quran.net","/api/v3/radios");
      http.Response response=await http.get(uri);
      RadioModel radioModel=RadioModel.fromJson(jsonDecode(response.body));
      return radioModel.radios;
    }catch(e){
      print(e);
    }
  }
}
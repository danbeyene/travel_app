import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:travel_app/models/data_model.dart';
class DataServices{
  String baseUrl= 'http://mark.bslmeiyu.com/api';
  Future<List<DataModel>> getPlaceData() async {
    http.Response response= await http.get(Uri.parse('$baseUrl/getplaces'),headers: {
    });
    try{
      if(response.statusCode == 200){
        List<dynamic> responseList = json.decode(response.body);
        List<DataModel> dataModelList = [];
        dataModelList = responseList.map((e) => DataModel.fromJson(e)).toList();
        debugPrint(' data ===================== ${dataModelList.toString()}');
        return dataModelList;
      }else{
        debugPrint(' get data error========${response.statusCode.toString()}');
        return <DataModel>[];
      }
    }catch(e){
     debugPrint('get data error===================== ${e.toString()}');
     return <DataModel>[];
    }
  }
}
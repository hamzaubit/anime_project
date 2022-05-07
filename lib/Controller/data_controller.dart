import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../Model/data_model.dart';
import '../Notifier/app_state.dart';
import 'package:provider/provider.dart';

class DataController {
  Future<List<DataModel>> getData() async {
    List<DataModel> listData = [];
    try {
      var request = http.Request(
          'GET', Uri.parse('https://animechan.vercel.app/api/quotes'));
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var result = await response.stream.bytesToString();
        List<dynamic> data = jsonDecode(result);
        data.forEach((element) {
          DataModel model = DataModel.fromJson(element);
          listData.add(model);
        });
        return listData;
      } else {
        print(response.reasonPhrase);
        return [];
      }
    } catch (e) {
      print("Exception $e");
      throw e;
    }
  }
}

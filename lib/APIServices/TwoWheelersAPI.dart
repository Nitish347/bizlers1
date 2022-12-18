import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../providers/vehicalProviders.dart';

class TwoWheelerAPI {
  static void NameAPI(BuildContext context) async {
    var provider = Provider.of<VehicalProvider>(context, listen: false);
    var request = http.Request('GET',
        Uri.parse('https://test.turbocare.app/turbo/care/v1/makes?class=2w'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var rawData = await response.stream.bytesToString();
      List<dynamic> data = jsonDecode(rawData);
      provider.updateVehicalNameList(data);

      // for (int i = 0; i < data.length; i++) {
      //   print(data[i]);
      // }
    } else {
      print(response.reasonPhrase);
    }
  }

  static void ModelAPI(BuildContext context, String vehical) async {
    var provider = Provider.of<VehicalProvider>(context, listen: false);
    provider.modelNameLoading = true;
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://test.turbocare.app/turbo/care/v1/models?class=2w&make=$vehical'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var rawData = await response.stream.bytesToString();
      List<dynamic> data = jsonDecode(rawData);
      provider.updateVehicalModelList(data);
      provider.modelNameLoading = false;
      // for (int i = 0; i < data.length; i++) {
      //   print(data[i]);
      // }
    } else {
      print(response.reasonPhrase);
    }
  }
}

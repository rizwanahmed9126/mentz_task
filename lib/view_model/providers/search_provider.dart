import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:mentz_task/model/models/places_model.dart';
import '../../model/services/http_service.dart';
import '../../model/services/util_service.dart';
import '../../model/utils/service_locator.dart';
import 'Repository/repository_pattern.dart';


class SearchProvider with ChangeNotifier {


  final Repository? _http = HttpService();
  final UtilService _utilsService = locator<UtilService>();
  List<PlacesApiModel> data=[];
  bool loader=false;




  Future<dynamic> callAdvert(String value) async {
    try {
      showLoader(true);
      var response = await _http!.placesApi(value);

      if (response.statusCode == 200) {
        clear();

        var body=json.decode(response.body);
        for (var abc in body["locations"]) {
          setData(PlacesApiModel.fromJson(abc));
        }
        showLoader(false);


        return data;
      } else {
        return _utilsService.showToast('Fail fetch data');
      }
    } catch (e) {
      return _utilsService.showToast(e.toString());
    }
  }

  setData(PlacesApiModel value){
    data.add(value);
    notifyListeners();
  }
  clear(){
    data.clear();
    notifyListeners();
  }
  showLoader(bool value){

    loader=value;
    notifyListeners();
  }




}

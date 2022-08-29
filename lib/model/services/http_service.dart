import 'dart:async';
import 'package:http/http.dart' as http;
import '../../view_model/providers/Repository/repository_pattern.dart';

class HttpService extends Repository {

   final baseUrl = "https://mvvvip1.defas-fgi.de";


   @override
  Future<dynamic> placesApi(String value) async {
    return await http.get(Uri.parse('$baseUrl/mvv/XML_STOPFINDER_REQUEST?outputFormat=RapidJSON&type_sf=any&name_sf=$value&language=en'),);
  }

}

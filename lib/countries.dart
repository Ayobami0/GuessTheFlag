import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:collection/collection.dart';

Future getCountry() async {
  var apiEndpoint = Uri.http('restcountries.com','v3.1/all'); 
  var response = await http.get(apiEndpoint);
  var jsonResponse = convert.jsonDecode(response.body);

  List getList(int n, List source) => source.sample(n);
  
  return getList(4, jsonResponse);
} 

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:collection/collection.dart';


var apiEndpoint = Uri.http('restcountries.com','v3.1/all'); 



Future getCountry() async {
  var response = await http.get(apiEndpoint);
  var jsonResponse = convert.jsonDecode(response.body);
  List getList(int n, List source) => source.sample(n);
  return getList(4, jsonResponse);
} 

void main() async {
  print(await getCountry());
}

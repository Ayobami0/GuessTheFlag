import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


Future getCountry() async {
  var apiEndpoint = Uri.http('restcountries.com','v3.1/all'); 
  var response = await http.get(apiEndpoint);
  var jsonResponse = convert.jsonDecode(response.body);

  print('found');
  return jsonResponse;
} 

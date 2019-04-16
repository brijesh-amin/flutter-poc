
import 'dart:async';
import 'Constants.dart';
import 'package:http/http.dart' as http;


class ApiProvider {
 
  Future<String>fetchDetail(String envelope) async {
    final response = await http.post(
      BASE_URL,
      headers: {
        "SOAPAction": "urn:IMobileService/ValidateStaff",
        "Content-Type": "text/xml;charset=UTF-8",
        "Authorization": AUTHORIZATION
      },
      body:envelope,
    );
    if(response.statusCode == 200){
      print("Response body: ${response.body}");
      return response.body;
    } else{
      throw Exception('Failed to load user detail');
    }
  }
}
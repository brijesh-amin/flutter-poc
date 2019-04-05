import 'dart:async';
import 'ApiProvider.dart';
import 'Request.dart';
import 'package:xml/xml.dart' as xml;

class ApiBloc {

  final apiController = StreamController();
  final apiProvider = ApiProvider();
  final request = Request();
  
  
  Stream get getUser => apiController.stream;
  Stream get validateUser => apiController.stream;

  fetchUserDetail (String imei, String accessToken, String dateTime) async {
    String apiName = 'GetUserDetails';
    
    String envelope = request.apiRequest(apiName, accessToken, imei, dateTime);
    var userDetail = await apiProvider.fetchDetail(envelope);
    
    var user =xml.parse(userDetail);
    apiController.sink.add(user.findAllElements('a:Firstname'));
  }

  validateStaff (String imei, String deviceToken, String dateTime, String emailAddress, String pwd) async{
    String apiName = 'ValidateStaff';

    String envelope =request.validateStaffRequest(apiName, imei, deviceToken, dateTime, emailAddress, pwd);
    var validateUser = await apiProvider.fetchDetail(envelope);

    var user = xml.parse(validateUser);
    apiController.sink.add(user.findAllElements('ValidateStaffResult'));

  }

  void dispose() {
    apiController.close();
  }
}

final bloc = ApiBloc();

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:milkmanagement/model/login_model.dart';
import 'package:milkmanagement/model/register_model.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    var url = Uri.parse("http://api.erp9i.com/api/auth/login");
    //http://optsfa.in:83/springapi/testCheck
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    final response = await http.post(url,
        body: jsonEncode(requestModel.toJson()), headers: requestHeaders);

  //  print('Response status: ${response.statusCode}');
    //print('Response body: ${requestModel.toJson()}');
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    }else if(response.statusCode==401){
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    }
    else {
      throw Exception('Failed to load data!');
    }
    
  }

  Future<RegisterResponseModel> register(RegisterRequestModel requestModel) async {
    var url = Uri.parse("https://reqres.in/api/register");
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
     //print('Register Response body: ${requestModel.toJson()}');
    final response = await http.post(url,
        body: jsonEncode(requestModel.toJson()), headers: requestHeaders);

    //print('Response status: ${response.statusCode}');
    //print('Response body: ${requestModel.toJson()}');
    if (response.statusCode == 200 || response.statusCode == 400) {
      return RegisterResponseModel.fromJson(
        json.decode(response.body),
      );
    }else if(response.statusCode==401){
      return RegisterResponseModel.fromJson(
        json.decode(response.body),
      );
    }
    else {
      throw Exception('Failed to load data!');
    }
    
  }


}

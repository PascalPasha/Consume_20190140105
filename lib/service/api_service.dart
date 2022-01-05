import 'dart:convert';

import 'package:consumeapi/datamahasiswa.dart';
import 'package:consumeapi/model/mahasiswamodel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final baseUrl = "http://10.0.2.2:8085/datamhs/getallmhs";

  Future<List<Mahasiswa>> getPosts() async {
    try {
      var response =
          await http.get(Uri.parse("http://10.0.2.2:8085/datamhs/getallmhs"));
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error !");
      }
    } catch (SocketException) {
      return Future.error("Error Fetching Data !");
    }
  }

  static Future<String> createPost(Map<String, dynamic> data) async {
    try {
      var response = await http.post(
        Uri.parse("http://10.0.2.2:8085/datamhs/addnewmhs"),
        body: jsonEncode(data),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },
      );
      if (response.statusCode == 200) {
        return "success";
      } else {
        print(response.body);
        // server error
        return "err";
      }
    } catch (SocketException) {
      // fetching error
      return "err";
    }
  }

  static Future<String> updatePost(Map<String, dynamic> data) async {
    try {
      var response = await http.put(
        Uri.parse("http://10.0.2.2:8085/datamhs/updatemhs"),
        body: jsonEncode(data),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },
      );
      if (response.statusCode == 200) {
        return "success";
      } else {
        print(response.body);
        // server error
        return "err";
      }
    } catch (SocketException) {
      // fetching error
      return "err";
    }
  }

  static Future<String> deletePost(Map<String, dynamic> data) async {
    try {
      var response = await http.delete(
        Uri.parse("http://10.0.2.2:8085/datamhs/deletemhs"),
        body: jsonEncode(data),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },
      );
      //
      if (response.statusCode == 200) {
        return "success";
      } else {
        print(response.body);
        // server error
        return "err";
      }
    } catch (SocketException) {
      // fetching error
      return "err";
    }
  }
}

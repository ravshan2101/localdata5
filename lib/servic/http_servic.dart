import 'dart:convert';

import 'package:http/http.dart';

import '../model/post.dart';

class Network {
  static String BASE = "jsonplaceholder.typicode.com";
  static Map<String, String> headrs = {
    'Content-type': 'application/json; charset=UTF-8'
  };

  // Http Apis

  static String API_LIST = "/posts";

  static String API_CREATE = "/posts";

  static String API_UPDATE = "/posts/1"; //{id}

  static String API_DELETE = "/posts/"; //{id}

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await get(uri, headers: headrs);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api);
    var response = await post(uri, headers: headrs, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api);
    var response = await put(uri, headers: headrs, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await delete(uri, headers: headrs);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }
  // Http Params

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = {};
    params.addAll({
      "title": post.title!,
      "body": post.body!,
      "userId": post.userId.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> params = {};
    params.addAll({
      'id': post.id.toString(),
      "title": post.title!,
      "body": post.body!,
      "userId": post.userId.toString(),
    });
    return params;
  }
}

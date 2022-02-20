
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'dart:convert';
import 'package:http/http.dart';
import 'package:mangue/mangue.dart';

/// Network manager.
class NetworkManager extends AddOn implements INetworkManager {

  /// Tag.
  static const String TAG = "HttpManager";

  /// Methods.
  static const String METHOD_GET = "GET";
  static const String METHOD_POST = "POST";
  static const String METHOD_PUT = "PUT";
  static const String METHOD_PATCH = "PATCH";
  static const String METHOD_DELETE = "DELETE";

  // Status code.
  static const int STATUS_CODE_OK = 200;
  static const int STATUS_CODE_BAD_REQUEST = 400;
  static const int STATUS_CODE_UNAUTHORIZED = 401;
  static const int STATUS_CODE_NOT_FOUND = 404;
  static const int STATUS_CODE_TIMEOUT = -123;
  static const int STATUS_CODE_NO_CONNECTIVITY = -123;

  // Http client.
  final _mClient = Client();

  // Base url.
  String? _mBaseUrl;

  NetworkManager({String? baseUrl}) : super() {
    // Base url.
    _mBaseUrl = baseUrl;
  }

  @override
  Future<void> request(String method, String url, Map<String, String>? headers, dynamic body, NetworkCallback? callback) async {

    // Response.
    Response response;

    // Uri.
    Uri uri = Uri.parse((_mBaseUrl ?? "") + url);

    bool isOnline = await ConnectivityUtils.isOnline();

    if (isOnline) {
      try {
        // Request.
        if (method == METHOD_POST) { // Post.
          response = await _mClient.post(uri, headers: headers, body: body, encoding: utf8);
        } else if (method == METHOD_PUT) { // Put.
          response = await _mClient.put(uri, headers: headers, body: body, encoding: utf8);
        } else if (method == METHOD_PATCH) { // Patch.
          response =
          await _mClient.patch(uri, headers: headers, body: body, encoding: utf8);
        } else if (method == METHOD_DELETE) { // Delete.
          response = await _mClient.delete(uri, headers: headers);
        } else { // Get.
          response = await _mClient.get(uri, headers: headers);
        }
      } catch(e) {
        response = Response("Server communication failed.", STATUS_CODE_NOT_FOUND);
      }
    } else {
      response = Response("Connectivity is not available.", STATUS_CODE_NO_CONNECTIVITY);
    }

    // Callback.
    callback?.call(response);
  }

  @override
  Future<void> requestMultipart(String method, String url, Map<String, String>? headers, Map<String, String>? fields, List<MultipartFile>? files, NetworkCallback? callback) async {

    // Response.
    Response response;

    // Uri.
    Uri uri = Uri.parse(_mBaseUrl ?? "" + url);
    
    bool isOnline = await ConnectivityUtils.isOnline();
    
    if (isOnline) {
      try {
        
        // Request.
        var request = MultipartRequest(method,uri);

        // Headers.
        if (headers?.isNotEmpty ?? false) {
          request.headers.addAll(headers!);
        }

        // Fields.
        if (fields?.isNotEmpty ?? false) {
          request.fields.addAll(fields!);
        }

        // Files.
        if (files?.isNotEmpty ?? false) {
          request.files.addAll(files!);
        }

        StreamedResponse streamedResponse = await request.send();
        response = await Response.fromStream(streamedResponse);

      } catch(e) {
        response = Response("Server communication failed.", STATUS_CODE_NOT_FOUND);
      }
    } else {
      response = Response("Connectivity is not available.", STATUS_CODE_NO_CONNECTIVITY);
    }
    
    callback?.call(response);
  }
}
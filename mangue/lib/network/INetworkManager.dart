
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:http/http.dart';
import 'package:mangue/mangue.dart';

/// Network manager interface.
abstract class INetworkManager extends IAddOn {

  /// Request at uri with headers and body.
  Future<void> request(String method, String url, Map<String, String>? headers, dynamic body, NetworkCallback? callback);

  /// Request multipart at uri with headers, fields and files.
  Future<void> requestMultipart(String method, String url, Map<String, String>? headers, Map<String, String>? fields, List<MultipartFile>? files, NetworkCallback? callback);
}
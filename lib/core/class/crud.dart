import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:generate_image/core/class/statusrequest.dart';
import 'package:generate_image/core/functions/checkinterner.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class Crud {
  Future postData(String linkUrl, Map<String, dynamic> data,
      {String? apiKey}) async {
    final response = await http.post(
      Uri.parse(linkUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode(data),
    );

    if (await checkInternet()) {
      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return data;
      } else {
        log('Failed to load image: ${response.statusCode}, ${response.body}');
        return StatusRequest.loading;
      }
    }
  }

  Future<Either<StatusRequest, Map>> getData(String linkUrl, Map data,
      {String? apiKey}) async {
    try {
      if (await checkInternet()) {
        var response = await http.get(Uri.parse(linkUrl), headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        });
        log(response.statusCode.toString());
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          log(responseBody.toString());
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, Map>> patchData(String linkUrl, Map data,
      {String? token}) async {
    try {
      if (await checkInternet()) {
        var response = await http.patch(Uri.parse(linkUrl),
            headers: {"Authorization": "Bearer $token"});
        log(response.statusCode.toString());
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          log(responseBody.toString());
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverFailure);
    }
  }

  postRequestWithFiles(String url, Map data, File file, String filename,
      {String? token}) async {
    Map<String, String> headers = {"Authorization": "Bearer $token"};

    var request = http.MultipartRequest("PATCH", Uri.parse(url));
    var length = await file.length();
    var stream = http.ByteStream(file.openRead());
    var multipartFile = http.MultipartFile(filename, stream, length,
        filename: basename(file.path));
    request.files.add(multipartFile);
    request.headers.addAll(headers);
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    var myRequest = await request.send();

    var response = await http.Response.fromStream(myRequest);
    if (myRequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      log("Error${myRequest.statusCode}");
    }
  }
}

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkUrl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkUrl), body: data);
        print('Response Status Code: ${response.statusCode}');

        if (response.statusCode == 200 || response.statusCode == 201) {
          try {
            // إزالة أي بيانات غير صالحة إذا كانت موجودة في الاستجابة
            String responseBody = response.body;

            // إذا كانت الاستجابة تحتوي على جزئين مدمجين، فصلهم
            int separatorIndex = responseBody.indexOf('}{');
            if (separatorIndex != -1) {
              responseBody = responseBody.substring(0, separatorIndex + 1);
            }

            // فك تشفير الـ JSON
            var decodedResponse = jsonDecode(responseBody);

            if (decodedResponse is Map<String, dynamic>) {
              return Right(decodedResponse); // إرجاع الاستجابة إذا كانت صحيحة
            } else {
              print('Error: responseBody is not a valid Map');
              return const Left(StatusRequest.serverFailure);
            }
          } catch (e) {
            print('JSON decoding error: $e');
            return const Left(StatusRequest.serverException);
          }
        } else {
          print('Server returned error status: ${response.statusCode}');
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        print('No internet connection');
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      print('Error in postData: $e');
      return const Left(StatusRequest.serverException);
    }
  }
}

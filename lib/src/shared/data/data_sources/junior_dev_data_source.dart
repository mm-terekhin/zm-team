import 'dart:convert';
import 'package:dio/dio.dart';
import '../data.dart';

class JuniorDevDataSource {
  const JuniorDevDataSource();

  Future<GetLinkResponseDto> getLink({
    required Map<String, dynamic> request,
  }) async {
    final baseRequest = _toBase64(request);

    final response = await Dio().get<Map<String, dynamic>>(
      'https://jun1.juniordev.top/',
      options: Options(
        responseType: ResponseType.json,
        validateStatus: (status) => true,
      ),
      queryParameters: {
        'data': baseRequest,
      },
    );

    final jsonData = response.data;
    final statusCode = response.statusCode;

    if (jsonData == null || (statusCode ?? 400) >= 400) {
      //Вообще можно было добавить interceptor в Dio для обработки ошибок но в тз нет об этом речи, поэтому оставляю так
      return const GetLinkResponseDto.empty();
    }

    final dto = GetLinkResponseDto.fromJson(
      jsonData,
    );

    return dto;
  }

  String _toBase64(Map<String, dynamic> json) {
    final jsonString =
        'uid=${json['uid']}&osVersion=${json['osVersion']}&devModel=${json['devModel']}&battery_level=${json['battery_level']}&battery_status=${json['battery_status']}&tz=${json['tz']}';

    return base64Encode(utf8.encode(jsonString));
  }
}

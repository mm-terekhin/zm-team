import 'dart:convert';
import 'package:flutter/services.dart';

class DeviceInfoService {
  static const MethodChannel _channel = MethodChannel('device_info');

  static Future<Map<String, dynamic>> getDeviceInfo() async {
    try {
      final result = await _channel.invokeMethod('getDeviceInfo');
      final jsonData = jsonDecode(result);

      return jsonData;
    } on Exception {
      return {
        'uid': 'Unknown',
        'osVersion': 'Unknown',
        'devModel': 'Unknown',
        'battery_level': 'Unknown',
        'battery_status': false,
        'tz': 'Unknown',
      };
    }
  }
}

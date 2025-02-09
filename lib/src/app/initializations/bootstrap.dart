import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zm_test_task/src/app/app.dart';
import 'package:zm_test_task/src/core/core.dart';
import '../../shared/shared.dart';

const _dataSource = JuniorDevDataSource();

Future<void> bootstrap() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      final deviceInfo = await DeviceInfoService.getDeviceInfo();
      final data = await _dataSource.getLink(request: deviceInfo);

      runApp(
        ZmTestTask(
          home: SplashScreen(
            dto: data,
          ),
        ),
      );
    },
    (exception, stackTrace) => FlutterError.presentError(
      FlutterErrorDetails(
        exception: exception,
        stack: stackTrace,
      ),
    ),
  );
}

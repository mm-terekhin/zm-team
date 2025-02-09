import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
            let deviceInfoChannel = FlutterMethodChannel(name: "device_info", binaryMessenger: controller.binaryMessenger)

            deviceInfoChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
              if call.method == "getDeviceInfo" {
                result(self.getDeviceInfo())
              } else {
                result(FlutterMethodNotImplemented)
              }
            }

        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func getDeviceInfo() -> String {
        let device = UIDevice.current;
        device.isBatteryMonitoringEnabled = true // Включаем мониторинг батареи
        
        let uuid = device.identifierForVendor?.uuidString ?? "";
        let osVersion = device.systemVersion;
        let devModel = device.model;
        let batteryLevel = Int(device.batteryLevel * 100);
        let batteryStatus = device.batteryState == .charging || device.batteryState == .full;
        let timeZone = TimeZone.current.identifier;
        
        let deviceInfo: [String: Any] = [
            "uid" :uuid,
            "osVersion": osVersion,
            "devModel": devModel,
            "battery_level": batteryLevel,
            "battery_status": batteryStatus,
            "tz": timeZone
        ]
        
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: deviceInfo, options: []),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            return jsonString
        }
        
        return "{}"
    }
}

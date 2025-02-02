import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoManager {
  //creating object from Device Info Plugin Packe which will be used ,
  //creating two string to store device model and os version in it.
  static DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  static String deviceModel = '';
  static String osVersion = '';
  static String os = '';

  //function to check if current device is android or ios and use appropriate object to extracy informations.
  static getDeviceInfo() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      deviceModel = androidDeviceInfo.model;
      osVersion = androidDeviceInfo.version.release;
      os = "Android";
    } else {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      deviceModel = iosDeviceInfo.model;
      osVersion = iosDeviceInfo.systemVersion;
      os = "IOS";
    }
  }
}

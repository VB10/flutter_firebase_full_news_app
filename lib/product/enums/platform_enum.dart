import 'dart:io';

enum PlatformEnum {
  android,
  ios;

  static String get versionName {
    if (Platform.isIOS) {
      return PlatformEnum.ios.name;
    }
    if (Platform.isAndroid) {
      return PlatformEnum.android.name;
    }

    throw Exception('Platform unused please check!');
  }
}

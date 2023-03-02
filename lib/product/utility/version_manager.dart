// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_firebase_full_news_app/product/utility/exception/custom_exception.dart';

class VersionManager {
  VersionManager({
    required this.deviceValue,
    required this.databaseValue,
  });

  final String deviceValue;
  final String databaseValue;

  bool isNeedUpdate() {
    final deviceNumberSplit = deviceValue.split('.').join();
    final databaseNumberSplit = databaseValue.split('.').join();

    final deviceNumber = int.tryParse(deviceNumberSplit);
    final databaseNumber = int.tryParse(databaseNumberSplit);

    if (deviceNumber == null || databaseNumber == null) {
      throw VersionCustomException(
        '$deviceValue or $databaseValue is not valid for parse',
      );
    }

    return deviceNumber < databaseNumber;
  }
}

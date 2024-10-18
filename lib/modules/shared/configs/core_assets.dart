import 'dart:io';

class CoreAssets {
  static String image(String fileName, {bool isPlatformSpecific = false}) {
    return '${_assetFolderPath('images', isPlatformSpecific)}/$fileName';
  }

  static String vector(String fileName, {bool isPlatformSpecific = false}) {
    return '${_assetFolderPath('vectors', isPlatformSpecific)}/$fileName';
  }

  static String _assetFolderPath(String name, bool isPlatformSpecific) {
    var path = 'assets/$name';

    if (isPlatformSpecific) {
      path += '/${CoreAssets.platformName()}';
    }

    return path;
  }

  static String platformName() {
    if (Platform.isAndroid) {
      return 'android';
    } else {
      return 'ios';
    }
  }
}

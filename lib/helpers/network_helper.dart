import 'dart:io';

class NetworkHelper {
  static final NetworkHelper shared = NetworkHelper._internal();

  NetworkHelper._internal();

  factory NetworkHelper() {
    return shared;
  }

  Future<bool> isConnected() async {
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }
}

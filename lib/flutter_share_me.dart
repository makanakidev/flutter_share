import 'package:flutter/services.dart';

class FlutterShareMe {
  final MethodChannel _channel = const MethodChannel('flutter_share_me');

  ///share to facebook
  Future<String?> shareToFacebook({String msg = '', String url = ''}) async {
    final Map<String, dynamic> arguments = Map<String, dynamic>();
    arguments.putIfAbsent('msg', () => msg);
    arguments.putIfAbsent('url', () => url);
    dynamic result;
    try {
      result = await _channel.invokeMethod('shareFacebook', arguments);
    } catch (e) {
      return "false";
    }
    return result;
  }

  ///share to twitter
  Future<String?> shareToTwitter({String msg = '', String url = ''}) async {
    final Map<String, dynamic> arguments = Map<String, dynamic>();
    arguments.putIfAbsent('msg', () => msg);
    arguments.putIfAbsent('url', () => url);
    dynamic result;
    try {
      result = await _channel.invokeMethod('shareTwitter', arguments);
    } catch (e) {
      return "false";
    }
    return result;
  }

  ///share to WhatsApp
  /// [imagePath] is local image
  /// [phoneNumber] enter phone number with counry code
  /// For ios
  /// If include image then text params will be ingored as there is no current way in IOS share both at the same.
  Future<String?> shareToWhatsApp({String msg = '', String imagePath = '',String phoneNumber=''}) async {
    final Map<String, dynamic> arguments = Map<String, dynamic>();
    arguments.putIfAbsent('msg', () => msg);
    arguments.putIfAbsent('url', () => imagePath);
    arguments.putIfAbsent('phoneNumber', () => phoneNumber);
    dynamic result;
    try {
      result = await _channel.invokeMethod('shareWhatsApp', arguments);
    } catch (e) {
      return "false";
    }

    return result;
  }

  ///share to WhatsApp4Biz
  ///[imagePath] is local image
  /// For ios
  /// If include image then text params will be ingored as there is no current way in IOS share both at the same.
  Future<String?> shareToWhatsApp4Biz({String msg = '', String imagePath = ''}) async {
    final Map<String, dynamic> arguments = Map<String, dynamic>();
    arguments.putIfAbsent('msg', () => msg);
    arguments.putIfAbsent('url', () => imagePath);
    dynamic result;
    try {
      result = await _channel.invokeMethod('shareWhatsApp4Biz', arguments);
    } catch (e) {
      return "false";
    }

    return result;
  }

  ///use system share ui
  Future<String?> shareToSystem({required String msg}) async {
    Map<String, dynamic> arguments = Map<String, dynamic>();
    arguments.putIfAbsent('msg', () => msg);
    dynamic result;
    try {
      result = await _channel.invokeMethod('system', {'msg': msg});
    } catch (e) {
      return "false";
    }
    return result;
  }
}

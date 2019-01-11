import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart';

class FlutterMmkv {
  static const MethodChannel _channel = const MethodChannel('flutter_mmkv');

  //Get Root Directory
  static Future<String> getRootDir() async {
    final String rootDir = await _channel.invokeMethod('getRootDir');
    return rootDir;
  }

  //Encoders
  static Future<bool> encodeBool(String key, bool aBool) async {
    final Map<String, dynamic> params = <String, dynamic>{
      'key': key,
      'aBool': aBool
    };
    final bool didEncode = await _channel.invokeMethod('encodeBool', params);
    return didEncode;
  }

  static Future<bool> encodeInt(String key, int aInt) async {
    final Map<String, dynamic> params = <String, dynamic>{
      'key': key,
      'aInt': aInt
    };
    final bool didEncode = await _channel.invokeMethod('encodeInt', params);
    return didEncode;
  }

  static Future<bool> encodeLong(String key, int aLong) async {
    final Map<String, dynamic> params = <String, dynamic>{
      'key': key,
      'aLong': aLong
    };
    final bool didEncode = await _channel.invokeMethod('encodeLong', params);
    return didEncode;
  }

  static Future<bool> encodeDouble(String key, double aDouble) async {
    final Map<String, dynamic> params = <String, dynamic>{
      'key': key,
      'aDouble': aDouble
    };
    final bool didEncode = await _channel.invokeMethod('encodeDouble', params);
    return didEncode;
  }

  static Future<bool> encodeString(String key, String aString) async {
    final Map<String, dynamic> params = <String, dynamic>{
      'key': key,
      'aString': aString
    };
    final bool didEncode = await _channel.invokeMethod('encodeString', params);
    return didEncode;
  }

  static Future<bool> encodeUint8List(String key, Uint8List aBytes) async {
    final Map<String, dynamic> params = <String, dynamic>{
      'key': key,
      'aBytes': aBytes
    };
    final bool didEncode =
        await _channel.invokeMethod('encodeUint8List', params);
    return didEncode;
  }

  //Decoders

  static Future<bool> decodeBool(String key) async {
    final Map<String, dynamic> params = <String, dynamic>{'key': key};
    final bool rBool = await _channel.invokeMethod('decodeBool', params);
    return rBool;
  }

  static Future<int> decodeInt(String key) async {
    final Map<String, dynamic> params = <String, dynamic>{'key': key};
    final int rInt = await _channel.invokeMethod('decodeInt', params);
    return rInt;
  }

  static Future<int> decodeLong(String key) async {
    final Map<String, dynamic> params = <String, dynamic>{'key': key};
    final int rLong = await _channel.invokeMethod('decodeLong', params);
    return rLong;
  }

  static Future<double> decodeDouble(String key) async {
    final Map<String, dynamic> params = <String, dynamic>{'key': key};
    final double rDouble = await _channel.invokeMethod('decodeDouble', params);
    return rDouble;
  }

  static Future<String> decodeString(String key) async {
    final Map<String, dynamic> params = <String, dynamic>{'key': key};
    final String rString = await _channel.invokeMethod('decodeString', params);
    return rString;
  }

  static Future<Uint8List> decodeUint8List(String key) async {
    final Map<String, dynamic> params = <String, dynamic>{'key': key};
    final Uint8List rBytes = await _channel.invokeMethod('decodeUint8List', params);
    return rBytes;
  }

  static Future removeValueForKey(String key) async {
    final Map<String, dynamic> params = <String, dynamic>{'key': key};
    _channel.invokeMethod('removeValueForKey', params);
  }

  static Future<bool> containsKey(String key) async {
    final Map<String, dynamic> params = <String, dynamic>{'key': key};
    final bool mBool = await _channel.invokeMethod('containsKey', params);
    return mBool;
  }

  static Future removeAll() async {
    _channel.invokeMethod('removeAll');
  }
}

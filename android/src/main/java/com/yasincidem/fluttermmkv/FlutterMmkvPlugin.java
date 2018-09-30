package com.yasincidem.fluttermmkv;

import android.content.Context;

import com.tencent.mmkv.MMKV;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlutterMmkvPlugin */
public class FlutterMmkvPlugin implements MethodCallHandler {

  private final MethodChannel channel;
  private MMKV kv;
  private String rootDir;

  private FlutterMmkvPlugin(Context context, MethodChannel channel) {
    this.channel = channel;
    this.channel.setMethodCallHandler(this);
    rootDir = MMKV.initialize(context);
    kv = MMKV.defaultMMKV();

  }

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_mmkv");
    channel.setMethodCallHandler(new FlutterMmkvPlugin(registrar.context(), channel));
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if ("getPlatformVersion".equals(call.method)) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);

    } else if ("getRootDir".equals(call.method)) {
      result.success(rootDir);

    } else if ("encodeBool".equals(call.method)) {
      String key =  call.argument("key");
      boolean aBool =  call.argument("aBool");
      result.success(kv.encode(key, aBool));

    } else if ("decodeBool".equals(call.method)) {
      String key = call.argument("key");
      result.success(kv.decodeBool(key));

    } else if ("encodeInt".equals(call.method)) {
      String key =  call.argument("key");
      int aInt =  call.argument("aInt");
      result.success(kv.encode(key, aInt));

    } else if ("decodeInt".equals(call.method)) {
      String key = call.argument("key");
      result.success(kv.decodeInt(key));

    } else if ("encodeLong".equals(call.method)) {
      String key =  call.argument("key");
      Long aLong =  call.argument("aLong");
      result.success(kv.encode(key, aLong));

    } else if ("decodeLong".equals(call.method)) {
      String key = call.argument("key");
      result.success(kv.decodeLong(key));

    } else if ("encodeDouble".equals(call.method)) {
      String key =  call.argument("key");
      Double aDouble =  call.argument("aDouble");
      result.success(kv.encode(key, aDouble));

    } else if ("decodeDouble".equals(call.method)) {
      String key = call.argument("key");
      result.success(kv.decodeDouble(key));

    } else if ("encodeString".equals(call.method)) {
      String key = call.argument("key");
      String  aString =  call.argument("aString");
      result.success(kv.encode(key, aString));

    } else if ("decodeString".equals(call.method)) {
      String key = call.argument("key");
      result.success(kv.decodeString(key));

    } else if ("encodeUint8List".equals(call.method)) {
      String key = call.argument("key");
      byte[] aBytes =  call.argument("aBytes");
      result.success(kv.encode(key, aBytes));

    } else if ("decodeUint8List".equals(call.method)) {
      String key = call.argument("key");
      result.success(kv.decodeBytes(key));

    } else if ("removeValueForKey".equals(call.method)) {
      String key = call.argument("key");
      kv.removeValueForKey(key);

    } else if ("removeAll".equals(call.method)) {
      kv.clearAll();

    } else if ("containsKey".equals(call.method)) {
      String key = call.argument("key");
      result.success(kv.containsKey(key));

    } else {
      result.notImplemented();

    }
  }
}

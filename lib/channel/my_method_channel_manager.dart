import 'dart:async';

import 'package:flutter/services.dart';

class MyMethodChannelManager {
  MyMethodChannelManager._internal();
  static final MyMethodChannelManager _INSTANCW = MyMethodChannelManager._internal();
  factory MyMethodChannelManager() => _INSTANCW;

  static const _methodChannel = MethodChannel("com.anypwx.myandroidapp/route");

  Future<String> initEventChannel() {
    final cp = Completer<String>();
    _methodChannel.setMethodCallHandler((MethodCall call) async {
      if (call.method == 'initRoute') {
        final data = call.arguments as String;
        print('anypwx --> Received data from Android: $data');
        cp.complete(data);
        return;
      }
      cp.complete('');
    });
    return cp.future;
  }

}
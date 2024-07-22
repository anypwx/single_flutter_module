import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pkg_1/pack_1_home.dart';
import 'package:pkg_2/pack_2_home.dart';
import 'package:pwx_flutter_app/pages/page_test1.dart';
import 'package:pwx_flutter_app/pages/page_test2.dart';
import 'package:showcase_lib/flutter_intro.dart';

import 'channel/my_method_channel_manager.dart';

GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool? fromFlutter = const bool.fromEnvironment('fromFlutter');
  if(fromFlutter) {
    runApp(const MyApp('/'));
    return;
  }
  final initRoute = await MyMethodChannelManager().initEventChannel();
 runApp(MyApp(initRoute));
}

class MyApp extends StatelessWidget {
  final String initRoute;
  const MyApp(this.initRoute, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Intro(
      padding: const EdgeInsets.all(8),
      borderRadius: const BorderRadius.all(Radius.circular(6)),
      maskColor: const Color.fromRGBO(0, 0, 0, .6),
      noAnimation: false,
      maskClosable: false,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: initRoute.isEmpty ? '/' : initRoute,
        routes: {
          '/': (context) => Pack1Home(),
          '/pageTest1': (context) => PageTest1(),
          '/pageTest2': (context) => PageTest2(),
          '/pkg_1': (context) => Pack1Home(),
          '/pkg_2': (context) => Pack2Home()
        },
      ),
    );
  }
}

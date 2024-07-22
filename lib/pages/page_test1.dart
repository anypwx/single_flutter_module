import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:showcase_lib/flutter_intro.dart';

class PageTest1 extends StatefulWidget {
  const PageTest1({super.key});

  @override
  State<StatefulWidget> createState() => PageTest1State();

}

class PageTest1State extends State<PageTest1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: IntroStepBuilder(
                order: 1,
                offset: const Offset(0,0),
                overlayBuilder: (params) {
                  return _overlayWidget(context, params);
                },
                builder: (c, k) => InkWell(
                  onTap: () {
                    Intro.of(context).start();
                  },
                  child: Text(
                    key: k,
                    "PageTest1",
                    style: TextStyle(color: Colors.blue),
                  ),
                ))));
  }

  Widget _overlayWidget(BuildContext context, StepWidgetParams params) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _contentWidget(),
        ElevatedButton(child: Text('我知道了'), onPressed: () {
          Intro.of(context).dispose();
        })
      ],
    );
  }

  Widget _contentWidget() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [Icon(Icons.access_alarms_outlined), Text('我是一个测试的浮层哦')],
    );
  }
}

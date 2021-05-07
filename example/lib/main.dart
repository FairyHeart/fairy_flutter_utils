import 'package:fairy_flutter_utils/fairy_flutter_utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.setPortrait();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    XLog.init(true);
    XLog.print('message');

    XLog.print(
        '${ScreenUtil.getScreenHeight()} / ${ScreenUtil.getScreenWidth()} / ${ScreenUtil.getScreenDensity()} / ${ScreenUtil.getAppBarHeight()} '
        '/ ${ScreenUtil.getStatusBarHeight()} / ${ScreenUtil.getBottomBarHeight()} / ${ScreenUtil.getOrientation()} / ${ScreenUtil.isLandscape()} '
        '/ ${ScreenUtil.isPortrait()}');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
        automaticallyImplyLeading: true,
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}

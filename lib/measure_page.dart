import 'package:flutter/material.dart';
import 'package:myinitialflutter/main.dart';

// Statefullを継承 & 状態を作成？　するためだけのクラス
class MeasurePage extends StatefulWidget {
  const MeasurePage({Key? key}) : super(key: key);

  @override
  _MeasurePageState createState() => _MeasurePageState();
}

// このページの実体 of Statefull
class _MeasurePageState extends State<MeasurePage>{
  // Global Variables Here
  // 特定メソッド以外でも使うならここ．
  int _counter = 0;
  var times = "Please Update by Push Button";
  var bef_now; // DateTime型はnon_nullableなのでvarで初期化
  var diff = -10000;

  @override
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;

      final now = DateTime.now(); // finalはconstの弱い版．代入できない値になる．
      diff = now.difference(bef_now).inSeconds;
      // times = DateFormat('hh:mm:ss').format(diff);
      times = diff.toString();
      bef_now = now;

    });
  }

  //初期化
  @override
  void initState(){
    //アプリ起動時に一度だけ実行される
    bef_now = DateTime.now(); // finalはconstの弱い版．代入できない値になる．

  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("widget.title daze"),
      ),

      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'Diff - ${diff} [s]',
              style: Theme.of(context).textTheme.headline4,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onPrimary: Colors.white,
                elevation: 16,
              ),
              child: Text('back'),
            ),

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}

/*


 */
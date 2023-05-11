import 'package:flutter/material.dart';
import 'dart:js';

class TestPage extends StatefulWidget {
  TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final TextEditingController con1 = TextEditingController();
  final TextEditingController con2 = TextEditingController();

  String res = "";
  String res2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: con1,
          ),
          TextField(
            controller: con2,
          ),
          MaterialButton(
              child: Text("SUBMIT"),
              onPressed: () {
                Helper().doSpeedtest();
                // Helper().doThing(
                //   int.parse(con1.text),
                //   int.parse(con2.text),
                //   (val) {
                //     setState(() {
                //       res = val.toString();
                //     });
                //   },
                //   (val) {
                //     setState(() {
                //       res2 = val.toString();
                //     });
                //   },
                // );
              }),
          Text("Result sum : $res"),
          Text("Result multiple : $res2"),
        ],
      ),
    );
  }
}

typedef OnCallback = Function(dynamic);

class Helper {
  void doThing(int a, int b, OnCallback callback, OnCallback callback2) {
    // ScriptElement script = ScriptElement();
    // script.src = 'sample.js';
    // document.body?.append(script);
    // Define a callback function
    // var callback = allowInterop((result) {
    //   print('The result is $result');
    // });

    var callbacks = allowInterop(callback);
    var callbacks2 = allowInterop(callback2);

    // Call the JavaScript function and pass the callback function as an argument
    context.callMethod('addNumbers', [
      a,
      b,
      callbacks,
      callbacks2,
    ]);
  }

  void doSpeedtest(){
    try{
      // context['Speedtest'].callMethod();
      // var speedtestObject = JsObject.fromBrowserObject(context['Speedtest']);
      var speedtestObject = context['Speedtest'];
      var state = speedtestObject.callMethod(context['getState']);
      debugPrint("STATE = ${speedtestObject.runtimeType}");
      debugPrint("STATE = ${state}");
    }catch(e){
      debugPrint("${e}");
    }
  }
}

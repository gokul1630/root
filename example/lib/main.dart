import 'package:flutter/material.dart';
import 'package:root/root.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _result = " ";
  bool _status = false;
  bool _statusAvailability = false;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkRoot();
    checkRootAvailability();
  }

  //Check Root status
  Future<void> checkRoot() async {
    bool result = await Root.isRooted();
    setState(() {
      _status = result;
    });
  }

  //Check Root availability
  Future<void> checkRootAvailability() async {
    bool result = await Root.isRootAvailable();
    setState(() {
      _statusAvailability = result;
    });
  }

  //Execute shell Commands
  Future<void> setCommand() async {
    String res;
    res = await Root.exec(cmd: controller.text);
    setState(() {
      _result = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('root plugin'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Text('Device Root Status: $_status',
                style: TextStyle(fontSize: 20.0)),
            SizedBox(
              height: 20.0,
            ),
            Text('Device Root Availability: $_statusAvailability',
                style: TextStyle(fontSize: 20.0)),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.black,
                height: 400,
                width: width,
                child: Center(
                  child: ListView(children: [
                    Text(
                      _result,
                      style: TextStyle(color: Colors.white),
                    )
                  ]),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                    controller: controller,
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  child: ElevatedButton(
                    child: Text("Run Command"),
                    onPressed: () {
                      _result = null; //To clear Terminal when click the button
                      setCommand();
                      controller.clear();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

# root plugin

[![CodeFactor](https://www.codefactor.io/repository/github/gokul1630/root/badge)](https://www.codefactor.io/repository/github/gokul1630/root)

### A Flutter Plugin to check Android device Root status and Run shell commands in android(only).

#### This plugin is based on Topjohnwu [libsu](https://github.com/topjohnwu/libsu) and Stericson [Root Tools](https://github.com/Stericson/RootTools).

![](https://media.giphy.com/media/8eTmwU4QUazn9cpPhg/giphy.gif)


## Usage

### To use this plugin, add ```root ``` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages).
```
 root: ^2.0.3
```
### import it
```
import 'package:root/root.dart';
```

### Declare a async method to check root status
```
bool _status = false;

 Future<void> checkRoot() async {
    bool result = await Root.isRooted();
    setState(() {
      _status = result;
    });
  }
  
 later you can use _status in your code to let app know the root status. 
 
```
### Declare a async method to run shell commands
##### use this function only for short period of processes, don't use for long processes else app may crash
```
String _result;

 Future<void> setCommand() async {
    String res = await Root.exec(cmd: "cat /proc/version");
    setState(() {
      _result = res;
    });
  }
  
  later you can use the _result in your code to let know the output of the given shell command.
 
```
### issues
* Please file the [issues](https://github.com/gokul1630/root/issues/new) you found. Thank you.

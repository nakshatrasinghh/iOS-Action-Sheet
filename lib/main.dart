import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Action Sheet',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Center(
            child: CupertinoButton.filled(
                child: Text('Show Action Sheet'),
                onPressed: () async {
                  final int? number = await showCupertinoModalPopup(
                      context: context, builder: buildActionSheet);

                  switch (number) {
                    case 1:
                      print('A');
                      break;
                    case 2:
                      print('B');
                      break;
                    case 3:
                      print('C');
                      break;
                    default:
                      print('Cancel');
                  }

                  print("You clicked on the number $number");
                })));
  }

  Widget buildActionSheet(BuildContext context) {
    return CupertinoActionSheet(
      title: Text('Title'),
      message: Text('Message'),
      actions: [
        CupertinoActionSheetAction(
            isDefaultAction: true,
            child: Text('Add'),
            onPressed: () => Navigator.pop(context, 1)),
        CupertinoActionSheetAction(
            isDefaultAction: true,
            child: Text('Edit'),
            onPressed: () => Navigator.pop(context, 2)),
        CupertinoActionSheetAction(
            isDestructiveAction: true,
            child: Text('Delete'),
            onPressed: () => Navigator.pop(context, 3))
      ],
      cancelButton: CupertinoActionSheetAction(
          child: Text('Cancel'), onPressed: () => Navigator.pop(context)),
    );
  }
}

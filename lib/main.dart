import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Notifier/app_state.dart';
import 'View/homePage.dart';
import 'View/showAPIData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ListOfData(),
      ),
    );
  }
}

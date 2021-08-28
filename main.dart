import 'package:bmi_calculator/providers/DataStore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataStore>(
      create: (context) => DataStore(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        theme: ThemeData.dark().copyWith(
            primaryColor: Color(0XFF0A0D22),
            scaffoldBackgroundColor: Color(0XFF0A0D22),
            appBarTheme: AppBarTheme(elevation: 10)),
      ),
    );
  }
}

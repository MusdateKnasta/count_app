import 'package:count_app/screens/create_screen.dart';
import 'package:count_app/screens/details_screen.dart';
import 'package:count_app/screens/history_screen.dart';
import 'package:count_app/screens/home_screen.dart';
import 'package:count_app/screens/match_screen.dart';
import 'package:count_app/screens/name_template_screen.dart';
import 'package:count_app/screens/results_screen.dart';
import 'package:count_app/screens/select_template_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'details': (_) => DetailScreen(),
        'create': (_) => CreateScreen(),
        'selectTemplate': (_) => SelectTemplate(),
        'history': (_) => History(),
        'nameTemplate': (_) => NameTempalte(),
        'matchScreen': (_) => StateMatch(),
        'results': (_) => Results(),
      },
      theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(color: Color.fromRGBO(52, 207, 191, 1))),
    );
  }
}

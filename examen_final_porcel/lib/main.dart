import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart';

void main() {
  runApp( MyApp());
}

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      // ChangeNotifierProvider(
      //   create: ( _ ) => PlatsServices(), // creamos un productServices
      // ),
    ],
    child: MyApp()
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'examen_final_porcel',
      initialRoute: 'login',
      routes: {
        'login': (_) => LoginScreen(),
        //'home': (_) => HomeScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
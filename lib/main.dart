import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/contact_detail_screen.dart';
import 'package:flutter_application_1/screens/contact_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
   debugShowCheckedModeBanner: false,
      home: ContactListScreen(),
      routes: {
        ContactListScreen.routeName: (context) => ContactListScreen(),
        ContactDetailScreen.routeName: (context) => ContactDetailScreen()
      },
   
    );
  }
}


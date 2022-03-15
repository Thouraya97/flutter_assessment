import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:flutter_application_1/models/contact.dart';
import 'package:flutter_application_1/screens/contact_detail_screen.dart';
import 'package:flutter_application_1/services/timeAgo.dart';
import 'package:flutter_application_1/widgets/appBar_gradiant.dart';
import 'package:intl/intl.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({Key key}) : super(key: key);

  static const String routeName = '/contact-list';

  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  List<Contact> contacts = [];
  bool formatChange = false;
   ScrollController _controller = ScrollController();
String message = "";

  

  Future<List<Contact>> readJsonFile() async {
    final String response = await rootBundle.loadString('assets/contacts.json');
    final contactData = await json.decode(response);

    var list = contactData["items"] as List<dynamic>;

    
      contacts = list.map((e) => Contact.fromJson(e)).toList();
          
        contacts.sort((a, b){ 
    return DateFormat("yyyy-MM-dd HH:mm:ss").parse(a.check_in).compareTo(DateFormat("yyyy-MM-dd HH:mm:ss").parse(b.check_in));
});


return contacts ; 
  }
  _scrollListener() {
  if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        message = "reach the bottom";
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        message = "reach the top";
      });
    }
 }

  @override
  void initState() {
    super.initState();
    readJsonFile();
_controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff000137),
        onPressed: () {
          setState(() {
            formatChange = !formatChange;
          });
        },
        child: Icon(Icons.timer),
      ),
     
      
      body: Column(
        children: [
                  GradientAppBar("Users List"),

         Container(
            child: Center(
              child: Text(message),
            ),
          ),
          if (contacts.length > 0)
          
            Expanded(
              child: ListView.builder(
                controller: _controller,
                itemCount: contacts.length,
                itemBuilder: (BuildContext context, index) {
                  return Card(
                      margin: EdgeInsets.all(15.0),
                      color: Color(0xff8cd3ff),
                      child: ListTile(
                        title: Row(
                          children: [
                            Icon(Icons.person),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(contacts[index].user),
                            ),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.phone),
                                  Text(
                                    contacts[index].phone.toString(),
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_today),
                                      formatChange == false
                                          ? Text(
                                              TimeAgo.timeAgoSinceDate(
                                                  contacts[index].check_in),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )
                                          : Text(contacts[index].check_in),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              ContactDetailScreen.routeName,
                              arguments: jsonEncode(contacts[index]));
                        },
                      ));
                },
              ),
            )
          else
            Center(child: CircularProgressIndicator())
        ],
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/contact.dart';
import 'package:share/share.dart';

class ContactDetailScreen extends StatefulWidget {
  const ContactDetailScreen({ Key key }) : super(key: key);

  static const String routeName = '/contact-detail';

  @override
  _ContactDetailScreenState createState() => _ContactDetailScreenState();
}

class _ContactDetailScreenState extends State<ContactDetailScreen> {
  
  var contactName = "";
  Contact contact;

  @override
  void initState(){
    super.initState();
  }

  @override
  void didChangeDependencies() {

    var contactString = ModalRoute.of(context)?.settings.arguments as String;
    
    var contactJson = jsonDecode(contactString);
   

    setState(() {
      
      contact = Contact.fromJson(contactJson);
      contactName = contact.user;

    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(contactName),),
      body: Center(
        child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 25,),
                  Center(
            child: CircleAvatar(
              
              radius: 50,
              backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2QmG_KIxY4qfwzPGq8J6NaRzbc9g9HZDO9AMjT5ftaBGHptA9_Sjcty9vqttdG4_9E_o&usqp=CAU"),
            ),
          ),
          SizedBox(height: 60,),
          Container(
            width: 500,
             height: 550,
                  decoration: BoxDecoration(
                    color: Color(0xff8cd3ff),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Center(
                    child: Column(children: [
                      SizedBox(height: 60),
 Container(
                      margin: EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Icon(Icons.person),
                          Text("Name : " + (contact.user) ,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0)),
                        ],
                      ),
                    ),
                    SizedBox(height: 25,),
                    Container(
                        margin: EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Icon(Icons.phone),
                            Text("Phone : " + (contact.phone),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0)),
                          ],
                        )
                    ),
                    SizedBox(height: 25,),
                    Container(
                        margin: EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Icon(Icons.calendar_today),
                            Text("Check-in : " + (contact.check_in),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0)),
                          ],
                        )
                    ),
                    SizedBox(height: 50,),
                    //the share button 
                     Builder(
                          builder: (BuildContext context) {
                            return RaisedButton(
                              color: Colors.orangeAccent[100],
                              child: const Text('Share'),
                              onPressed: () => _onShareData(context),
                            );
                          },
                        ),
                    ],),
                  ),
          ),
                 
            
                ],
              ),

          ),
      ),
    );
  }
  //this methode will allows us to share user info on more installed applications
  _onShareData(BuildContext context) async {

    final RenderBox box = context.findRenderObject();

    
     
      await Share.share(contact.user,
          subject: contact.check_in,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    
  }
}
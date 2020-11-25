import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(home: MyApp()));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String email,password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("registration"),
      ),
      body:Container(

        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                hintText: ("enter email"),


              ),
              onChanged: (String value){
                this.email=value;
              },

            ),
            SizedBox(height:15),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                hintText: ("enter password"),



              ),

              onChanged: (String value){

                this.password=value;
              },
            ),
                SizedBox(height:MediaQuery.of(context).size.height*0.1),
            GestureDetector(
              onTap: ()=> singup(email,password),
              child: Container(
                color:Colors.blue,
                child: Text("singup"),
                height:30,
                width:80,
              ),
            ),
            Container(


                   child: Icon(Icons.email ,),
            ),

          ],

        ),
      ),

    );
  }
}
Future singup(String email,String password) async{
  print(email);
  var url = "http://10.0.2.2:3000/createuser";

  Map body={"email": email, "password": password};
  print(email);
  var res =await http.post(url,
  body: body,
  );
  print(res.body);

  if (res.statusCode == 200) {
    print(res.body);
  } else {
    print('A network error occurred');
  }
}
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  String userName = '';
  String password = '';
  bool loggedin = false;
  final loginUrl = 'https://fakestoreapi.com/auth/login';

  @override
  Widget build(BuildContext context) {
    var myHeight = MediaQuery.of(context).size.height;
    var myWidth = MediaQuery.of(context).size.width;

    Future<void> handleLoginPressed() async {
      final response = await http.post(
        Uri.parse(loginUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{
          'username': userName,
          'password': password,
        }),
      );
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Succesfully logged in'),
        ));
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Invalid Username or password'),
        ));
      }
    }

    return Scaffold(
      body: Center(
        child: Container(
          height: myHeight * 0.6,
          width: myWidth * 0.25,
          decoration: myBoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Login',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: myWidth * 0.175,
                height: myHeight * 0.06,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      userName = value;
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      labelText: 'userName/email'),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              SizedBox(
                width: myWidth * 0.175,
                height: myHeight * 0.06,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      labelText: 'password'),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              SizedBox(
                width: myWidth * 0.175,
                child: ElevatedButton(
                  onPressed: () {
                    handleLoginPressed();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.pinkAccent),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 5,
          //offset: Offset(0, 2),
        ),
      ],
    );
  }
}

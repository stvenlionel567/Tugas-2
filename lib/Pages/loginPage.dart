// ignore_for_file: prefer_const_constructors, avoid_print, non_constant_identifier_names, avoid_unnecessary_containers, file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";

  String password = "";
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Halaman Login"),
      ),
      body: Column(
        children: [usernameField(), passwordField(), LoginButton(context)],
      ),
    ));
  }

  Widget usernameField() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: TextFormField(
          enabled: true,
          onChanged: (value) {
            username = value;
          },
          decoration: InputDecoration(
            hintText: 'Masukan Username',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(width: 3, color: Colors.blue),
            ),
          ),
        ),
      ),
    );
  }

  Widget passwordField() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: TextFormField(
          enabled: true,
          obscureText: true,
          onChanged: (value) {
            password = (value);
          },
          decoration: InputDecoration(
            suffix: IconButton(
              onPressed: () {},
              icon: Icon(Icons.remove_red_eye),
            ),
            hintText: 'Masukan Password',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(width: 3, color: Colors.blue),
            ),
          ),
        ),
      ),
    );
  }

  Widget LoginButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: isClicked == true
                  ? WidgetStateProperty.all(Colors.cyan)
                  : WidgetStateProperty.all(
                      const Color.fromARGB(255, 143, 1, 112))),
          onPressed: () {
            if (username == 'flutter' && password == 'mobile') {
              print('login berhasil');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Login Berhasil'),
                ),
              );
              setState(() {
                isClicked = true;
              });
            } else {
              print('Gagal Login');
            }
          },
          child: const Text("Login")),
    );
  }
}

import "package:flutter/material.dart";

import '../../../core/constants/const_color.dart';
import '../../widgets/drawer_widget/drawer_widget.dart';
import '../information_screen/information_screen.dart';
import '../listing_screen/listing_screen.dart';
import '../settings_screen/settings_screen.dart';

//ekrana görsellik katma amacıyla olusturulmus header widgeti,iki adet TextField widgeti ve bir butondan olusur.
//changeTextFıeldValue metodu kullanıcının gırdıgı degerlerı ilgili değişkenlere atamakla sorumludur.
//setUserOrAdmın metodu kullanıcının gırdıgı degerın admın mı user mı  oldugunu kontrol eder.

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String userName = '';
  String password = '';
  bool isAdmin = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppbar(),
      drawer: const DrawerScreen(),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            CustomHeader(
                size: size,
                title: 'Log in',
                icon: const Icon(Icons.login),
                color: forestGreen),
            buildTextFields()
          ],
        )),
      ),
    );
  }

  void changeTextFieldValue(String value, String type) {
    if (type == 'userName') {
      setState(() {
        userName = value;
      });
    } else if (type == 'password') {
      setState(() {
        password = value;
      });
    }
  }

  Column buildTextFields() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                  label: Text('User name'), border: OutlineInputBorder()),
              onChanged: (value) => changeTextFieldValue(value, 'userName'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              decoration: const InputDecoration(
                  label: Text('password'), border: OutlineInputBorder()),
              onChanged: (value) => changeTextFieldValue(value, 'password'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: green),
                onPressed: setUserOrAdmin,
                child: const Text('Login')),
          ),
        ],
      );
  AppBar buildAppbar() => AppBar(elevation: 0, backgroundColor: forestGreen);

  void setUserOrAdmin() {
    if (userName == 'admin' && password == 'admin') {
      isAdmin = true;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const InformationScreen()));
    } else if (userName == 'user' && password == 'user') {
      isAdmin = false;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ListingScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Incorrect user name or password')));
    }
  }
}

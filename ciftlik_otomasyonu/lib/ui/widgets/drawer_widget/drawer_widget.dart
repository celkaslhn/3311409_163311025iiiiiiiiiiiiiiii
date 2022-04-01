import 'package:ciftlik_otomasyonu/core/constants/const_color.dart';
import 'package:ciftlik_otomasyonu/core/constants/const_images.dart';
import 'package:ciftlik_otomasyonu/ui/screens/home_screen/home_screen.dart';
import 'package:ciftlik_otomasyonu/ui/screens/information_screen/information_screen.dart';
import 'package:ciftlik_otomasyonu/ui/screens/listing_screen/listing_screen.dart';
import 'package:ciftlik_otomasyonu/ui/screens/settings_screen/settings_screen.dart';
import "package:flutter/material.dart";

//Uygulamada sol taraftaki menünün tanımlandığı kısım bunun sayesınde ıstenılen sayfaya ulasılabılıyor.
//liste içerinde sayfaların adları ve ıkonları bulunuyor tıklanılarak gıdılebılır.
//bir sayfadan dıger sayfaya gecmek ıcın Navigator.push metodu kullanılır.parametre olarak context ve MaterialPageRoute alan bu method
// MaterialPageRoute içinde verilen sayfaya yönlendirilir.


class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: homeImage,
            decoration: const BoxDecoration(
              color: forestGreen,
            ),
          ),
          ListTile(
            title: const Text('Home Screen'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          ListTile(
            title: const Text('Listing Screen'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ListingScreen()));
            },
          ),
          ListTile(
            title: const Text('Information Screen'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InformationScreen()));
            },
          ),
          ListTile(
            title: const Text('Settings Screen'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen()));
            },
          ),
        ],
      ),
    );
  }
}

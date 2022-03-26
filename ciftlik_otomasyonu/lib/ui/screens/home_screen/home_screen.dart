import "package:flutter/material.dart";

import '../../../core/constants/const_color.dart';
import '../../../core/constants/const_images.dart';
import '../../widgets/drawer_widget/drawer_widget.dart';
import '../listing_screen/listing_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        drawer: const DrawerScreen(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const HomeScreenHeaderWithImage(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        color: seafoamGreen,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Hayvanları Görüntüle",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const ListingScreen();
                    }));
                  },
                ),
              )
            ],
          ),
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: forestGreen,
      title: const Text("Home"),
    );
  }
}

class HomeScreenHeaderWithImage extends StatelessWidget {
  const HomeScreenHeaderWithImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(image: homeImage.image, fit: BoxFit.fill),
      ),
    );
  }
}

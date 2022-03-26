import "package:flutter/material.dart";

import '../../../core/constants/const_color.dart';
import '../../widgets/drawer_widget/drawer_widget.dart';
import 'components/delete_all_button.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: buildAppBar(),
        drawer: const DrawerScreen(),
        body: Column(children: [
          CustomHeader(
              size: size,
              title: 'Settings',
              icon: const Icon(Icons.settings),
              color: forestGreen),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: DeleteAllDataButton(),
            ),
          ),
          CustomButton(
            buttonText: 'Show Developer Information',
            onPressed: () => showDeveloperInformation(context),
          ),
        ]));
  }

  Future<dynamic> showDeveloperInformation(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => const Dialog(
              backgroundColor: Colors.transparent,
              //insetPadding: EdgeInsets.all(0.0),
              child: SizedBox(
                  width: 400, height: 200, child: DeveloperInformation()),
            ));
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: forestGreen,
      elevation: 0,
    );
  }
}

class CustomHeader extends StatelessWidget {
  final String title;
  final Icon icon;
  final Color color;
  final Size size;

  const CustomHeader(
      {Key? key,
      required this.size,
      required this.title,
      required this.icon,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Icon(icon.icon, color: Colors.white, size: size.width / 10),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Text(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w300)),
            )
          ],
        ),
        width: size.width,
        height: size.height * 0.2,
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))));
  }
}

class DeveloperInformation extends StatelessWidget {
  const DeveloperInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: seafoamGreen, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: const [
              Text('12/15/2021', style: TextStyle(fontSize: 24)),
              Text('Aslıhan Çelik', style: TextStyle(fontSize: 24)),
              Text('163311025', style: TextStyle(fontSize: 24))
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const CustomButton(
      {Key? key, required this.onPressed, required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: green),
      child: Text(buttonText),
      onPressed: onPressed,
    );
  }
}

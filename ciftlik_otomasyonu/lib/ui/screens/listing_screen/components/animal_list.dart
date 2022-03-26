import 'package:ciftlik_otomasyonu/ui/screens/animal_details_screen/animal_details_screen.dart';
import "package:flutter/material.dart";

import '../../../../core/constants/const_images.dart';

// ignore: must_be_immutable
class AnimalList extends StatelessWidget {
  final List<dynamic> animals;
  AnimalList({Key? key, required this.animals, required this.animalType})
      : super(key: key);
  final String animalType;
  Image image = cowImage;

  setImage() {
    if (animalType == 'cow') {
      image = cowImage;
    } else if (animalType == 'sheep') {
      image = sheepImage;
    } else if (animalType == 'chicken') {
      image = chickenImage;
    } else if (animalType == 'other') {
      image = otherImage;
    }
  }

  @override
  Widget build(BuildContext context) {
    setImage();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: animals.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: image,
              title: Text('Barkod: ' + animals[index].barkod.toString()),
              subtitle: Text('Yas: ' + animals[index].yas.toString()),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AnimalDetailsScreen(
                    animal: animals[index],
                  );
                }));
              },
            );
          }),
    );
  }
}

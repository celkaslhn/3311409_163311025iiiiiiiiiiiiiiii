import 'package:ciftlik_otomasyonu/core/models/other_animal_model.dart';
import "package:flutter/material.dart";

import '../../../core/constants/const_color.dart';
import '../../../core/constants/const_images.dart';
import '../../../core/models/chicken_model.dart';
import '../../../core/models/cow_model.dart';
import '../../../core/models/sheep_model.dart';
import 'components/label_information_row.dart';

// Bu sayfa listıngscreen sayfasındakı hayvanların herhangı bırıne tıklanarak gelınen sayfadır.
//tıklanılan hayvanın cınsıne gore verıtabanında tutulan bılgııler gozukur.
//sayfaya parametre olarak gırılen hayvan modelının hangıhayvana aıt oldugu ıle ılgılı kontroller( anımal ıs cowModel) gibi sayfa
//içersinde belirli yerlerde yapılır.

class AnimalDetailsScreen extends StatefulWidget {
  const AnimalDetailsScreen({Key? key, this.animal}) : super(key: key);
  final dynamic animal;
  @override
  _AnimalDetailsScreenState createState() => _AnimalDetailsScreenState();
}

class _AnimalDetailsScreenState extends State<AnimalDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final animal = widget.animal;
    Image image;
    image = (animal is CowModel)
        ? cowImage
        : (animal is SheepModel)
            ? sheepImage
            : (animal is OtherAnimalModel)
                ? otherImage
                : chickenImage;

    return Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              children: [
                Center(
                  child: Image(
                    image: image.image,
                    width: 200,
                    height: 200,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                LabelInformationRow(
                    label: 'Barkod No: ', information: animal.barkod!),
                LabelInformationRow(label: 'Yas: ', information: animal.yas!),
                LabelInformationRow(label: 'Yem: ', information: animal.yem!),
                LabelInformationRow(
                  label: (animal is CowModel)
                      ? 'Sut Miktari: '
                      : (animal is ChickenModel)
                          ? 'Yumurta: '
                          : (animal is OtherAnimalModel)
                              ? 'Aylık Urun: '
                              : 'Aylık Yun: ',
                  information: (animal is CowModel)
                      ? animal.sutMiktari!
                      : (animal is ChickenModel)
                          ? animal.yumurta!
                          : (animal is OtherAnimalModel)
                              ? animal.urunMiktari
                              : animal.aylikYun!,
                ),
                LabelInformationRow(
                  label: (animal is CowModel)
                      ? 'Gubre: '
                      : (animal is ChickenModel)
                          ? 'Kulucka Saati:'
                          : (animal is OtherAnimalModel)
                              ? 'Yan Urun: '
                              : 'Gubre: ',
                  information: (animal is CowModel)
                      ? animal.gubre!
                      : (animal is ChickenModel)
                          ? animal.kuluckaSaati!
                          : (animal is OtherAnimalModel)
                              ? animal.yanUrun
                              : animal.gubre,
                ),
                LabelInformationRow(label: 'Asi', information: animal.asi!),
              ],
            ),
          ),
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text("Animal Details"),
      backgroundColor: forestGreen,
    );
  }
}

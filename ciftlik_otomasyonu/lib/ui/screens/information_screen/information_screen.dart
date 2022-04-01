import 'package:ciftlik_otomasyonu/core/models/other_animal_model.dart';
import "package:flutter/material.dart";

import '../../../core/constants/const_color.dart';
import '../../../core/constants/const_images.dart';
import '../../../core/database/database_helper.dart';
import '../../../core/models/chicken_model.dart';
import '../../../core/models/cow_model.dart';
import '../../../core/models/sheep_model.dart';
import '../../widgets/drawer_widget/drawer_widget.dart';
import 'components/product_pie_chart.dart';
import 'components/total_animals_chart.dart';

//getData() metodu totalEgg,totalMılk,totalWool ve totalOther değişkenlerine veritabanından gelen verileri atamakla sorumludur.
//


class InformationScreen extends StatefulWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  String totalEgg = '0';
  String totalMilk = '0';
  String totalWool = '0';
  String totalOtherProduct = '0';
  int countChicken = 0;
  int countCow = 0;
  int countSheep = 0;
  int countOther = 0;

  bool isLoading = false;

  getData() async {
    setState(() {
      isLoading = true;
    });

    totalEgg = await AnimalDatabase.instance.totalProduct(ChickenModel.empty());
    totalMilk = await AnimalDatabase.instance.totalProduct(CowModel.empty());
    totalWool = await AnimalDatabase.instance.totalProduct(SheepModel.empty());
    totalOtherProduct =
        await AnimalDatabase.instance.totalProduct(OtherAnimalModel.empty());
    countChicken = await AnimalDatabase.instance.chickenCount();
    countCow = await AnimalDatabase.instance.cowCount();
    countSheep = await AnimalDatabase.instance.sheepCount();
    countOther = await AnimalDatabase.instance.otherAnimalCount();

    setState(() {
      isLoading = false;
    });
  }

  @override
  initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        drawer: const DrawerScreen(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  const TabBar(tabs: [
                    Tab(
                      child:
                          Text('Animal', style: TextStyle(color: Colors.black)),
                    ),
                    Tab(
                        child: Text('Product',
                            style: TextStyle(color: Colors.black))),
                  ]),
                  isLoading
                      ? Container()
                      : SizedBox(
                          height: 400,
                          width: 400,
                          child: TabBarView(children: [
                            NumberOfAnimalsPieChart(
                                countOther: countOther,
                                countChicken: countChicken,
                                countCow: countCow,
                                countSheep: countSheep),
                            ProductPieChart(
                                totalOther: totalOtherProduct,
                                totalEgg: totalEgg,
                                totalMilk: totalMilk,
                                totalWool: totalWool),
                          ]),
                        ),
                  InformationExpansionList(
                    totalEgg: totalEgg,
                    countChicken: countChicken,
                    totalMilk: totalMilk,
                    countCow: countCow,
                    totalWool: totalWool,
                    countSheep: countSheep,
                    countOther: countOther,
                    totalOther: totalOtherProduct,
                  )
                ],
              ),
            ),
          ),
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text("Information"),
      backgroundColor: forestGreen,
    );
  }
}

class InformationExpansionList extends StatelessWidget {
  const InformationExpansionList(
      {Key? key,
      required this.totalEgg,
      required this.countChicken,
      required this.totalMilk,
      required this.totalOther,
      required this.countCow,
      required this.totalWool,
      required this.countSheep,
      required this.countOther})
      : super(key: key);

  final String totalEgg;
  final int countChicken;
  final String totalMilk;
  final int countCow;
  final String totalWool;
  final int countSheep;
  final String totalOther;
  final int countOther;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InformationExpansionTile(
            title: 'Chickens',
            image: chickenImage,
            totalProduct: totalEgg,
            countAnimal: countChicken),
        InformationExpansionTile(
            title: 'Cows',
            image: cowImage,
            totalProduct: totalMilk,
            countAnimal: countCow),
        InformationExpansionTile(
            title: 'Sheeps',
            image: sheepImage,
            totalProduct: totalWool,
            countAnimal: countSheep),
        InformationExpansionTile(
            totalProduct: totalOther,
            countAnimal: countOther,
            title: 'Other',
            image: otherImage),
      ],
    );
  }
}

class InformationExpansionTile extends StatelessWidget {
  const InformationExpansionTile({
    Key? key,
    required this.totalProduct,
    required this.countAnimal,
    required this.title,
    required this.image,
  }) : super(key: key);

  final String totalProduct;
  final int countAnimal;
  final String title;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: Text(title),
        leading: Image(image: image.image, height: 65, width: 65),
        children: [
          ListTile(
              title: Text(
                'Total Product: $totalProduct',
              ),
              subtitle: Text('Count: $countAnimal'))
        ],
      ),
    );
  }
}

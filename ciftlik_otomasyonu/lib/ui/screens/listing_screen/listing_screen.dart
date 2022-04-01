import 'package:ciftlik_otomasyonu/core/models/other_animal_model.dart';
import "package:flutter/material.dart";

import '../../../core/constants/const_color.dart';
import '../../../core/database/database_helper.dart';
import '../../../core/models/chicken_model.dart';
import '../../../core/models/cow_model.dart';
import '../../../core/models/sheep_model.dart';
import '../../widgets/drawer_widget/drawer_widget.dart';
import '../adding_animal_screen/adding_animal_screen.dart';
import 'components/animal_list.dart';

//sol altta bulunan FloatıngActıonButton wıdgetı yenı bır hayvan eklemek ıcın kulllanılır.
//bu tona tıklayınca hayvan ekleme sayfasına gonderılır.
// getData() metodu veritabanından gelen verılerı ilgili değişkenlere atar.


class ListingScreen extends StatefulWidget {
  const ListingScreen({Key? key}) : super(key: key);

  @override
  _ListingScreenState createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
  List<ChickenModel> chickens = [];
  List<CowModel> cows = [];
  List<SheepModel> sheeps = [];
  List<OtherAnimalModel> others = [];
  bool isLoading = false;

  getData() async {
    setState(() {
      isLoading = true;
    });

    chickens = await AnimalDatabase.instance.getChickens();
    cows = await AnimalDatabase.instance.getCows();
    sheeps = await AnimalDatabase.instance.getSheeps();
    others = await AnimalDatabase.instance.getOthers();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: buildAppBar(),
            floatingActionButton: buildFloaringActionButton(context),
            drawer: const DrawerScreen(),
            body: isLoading
                ? const Center(child: CircularProgressIndicator())
                : TabBarView(children: [
                    AnimalList(
                      animals: cows,
                      animalType: 'cow',
                    ),
                    AnimalList(
                      animals: sheeps,
                      animalType: 'sheep',
                    ),
                    AnimalList(
                      animals: chickens,
                      animalType: 'chicken',
                    ),
                    AnimalList(animals: others, animalType: 'other')
                  ])));
  }

  FloatingActionButton buildFloaringActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: forestGreen,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddingAnimalScreen(),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text('Animal List'),
      backgroundColor: forestGreen,
      bottom: const TabBar(isScrollable: true, tabs: [
        Tab(text: 'Cows'),
        Tab(text: 'Sheeps'),
        Tab(text: 'Chickens'),
        Tab(text: 'Others')
      ]),
    );
  }
}

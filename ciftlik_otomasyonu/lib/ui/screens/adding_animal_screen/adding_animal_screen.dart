import 'package:ciftlik_otomasyonu/core/models/other_animal_model.dart';
import "package:flutter/material.dart";

import '../../../core/constants/const_color.dart';
import '../../../core/database/database_helper.dart';
import '../../../core/models/chicken_model.dart';
import '../../../core/models/cow_model.dart';
import '../../../core/models/sheep_model.dart';
import '../../widgets/drawer_widget/drawer_widget.dart';

//bu sayfa Listingscreen de sol altta bulunan butona tıklayarak erişilen sayfadır.veri tabanına yenı bır haycan eklenebılır.
//sayfanın en uzerınde DropdownButton wıdgetı bulunur, tıklandıgında bır menu acılır ve burdan eklemek ıstedıgımız hayvanın turunu secebılırız.
//butonun hemen altında 6 adet TextFıeld bulunur.ve bunlara eklenmek ıstenılen hayvanların bılgılerı gırılır. id, yas,ası vb. gibi.
//bilgiler girildikten sonra alttakı butona tıklayarak veritabanına kaydedılır.

class AddingAnimalScreen extends StatefulWidget {
  const AddingAnimalScreen({Key? key}) : super(key: key);

  @override
  AddingAnimalScreenState createState() => AddingAnimalScreenState();
}

class AddingAnimalScreenState extends State<AddingAnimalScreen> {
  var _selectedAnimal = "Hayvan Seciniz";
  var items = ['Hayvan Seciniz', 'Tavuk', 'Inek', 'Koyun', 'Diger'];
  final _formKey = GlobalKey<FormState>();
  List<String> inputTags = ChickenFields.values;
  List<String> inputs = ['', '', '', '', '', ''];

  void changeValue(String value, int index) {
    inputs[index] = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: const DrawerScreen(),
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(children: [
                //const Text('Hayvan cinsi:'),
                DropdownButton(
                  items: items.map((item) {
                    return DropdownMenuItem(
                      child: Text(item),
                      value: item,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedAnimal = value.toString();
                      if (value.toString() == 'Tavuk') {
                        inputTags = ChickenFields.values;
                      } else if (value.toString() == "Koyun") {
                        inputTags = SheepFields.values;
                      } else if (value.toString() == 'Inek') {
                        inputTags = CowFields.values;
                      } else if (value.toString() == 'Diger') {
                        inputTags = OtherAnimalFields.values;
                      }
                    });
                  },
                  value: _selectedAnimal,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: inputTags[1].toString(),
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      changeValue(value, 0);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: inputTags[2].toString(),
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      changeValue(value, 1);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: inputTags[3].toString(),
                    ),
                    onChanged: (value) {
                      changeValue(value, 2);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: inputTags[4].toString(),
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      changeValue(value, 3);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: inputTags[5].toString(),
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      changeValue(value, 4);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: inputTags[6].toString(),
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      changeValue(value, 5);
                    },
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: green,
                    ),
                    child: const Text('Kaydet'),
                    onPressed: () {
                      if (_selectedAnimal == 'Tavuk') {
                        AnimalDatabase.instance.addChicken(ChickenModel(
                            barkod: inputs[0],
                            yas: inputs[1],
                            yem: inputs[2],
                            kuluckaSaati: inputs[3],
                            yumurta: inputs[4],
                            asi: inputs[5]));
                      } else if (_selectedAnimal == 'Inek') {
                        AnimalDatabase.instance.addCow(CowModel(
                            barkod: inputs[0],
                            yas: inputs[1],
                            yem: inputs[2],
                            asi: inputs[3],
                            gubre: inputs[4],
                            sutMiktari: inputs[5]));
                      } else if (_selectedAnimal == 'Koyun') {
                        AnimalDatabase.instance.addSheep(SheepModel(
                            barkod: inputs[0],
                            yas: inputs[1],
                            yem: inputs[2],
                            asi: inputs[3],
                            gubre: inputs[4],
                            aylikYun: inputs[5]));
                      } else if (_selectedAnimal == 'Diger') {
                        AnimalDatabase.instance.addOther(OtherAnimalModel(
                            barkod: inputs[0],
                            yas: inputs[1],
                            yem: inputs[2],
                            asi: inputs[3],
                            yanUrun: inputs[4],
                            urunMiktari: inputs[5]));
                      }
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Kaydedildi'),
                      ));
                    }),
              ]),
            ),
          ),
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text('Adding Animal'),
      centerTitle: true,
      backgroundColor: forestGreen,
    );
  }
}

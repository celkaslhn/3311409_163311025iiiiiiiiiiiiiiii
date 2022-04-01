//veritabanına veri eklerken model sınıflarından yaralanırız.
//bu sınıflar,kaydedılecek bılgılerı temsıl eden degıskenler,veritabanına dosyayı kaydederken kullanılacak toJson() ve
//veritabanından veri çekerken kullanılan fromJson() meethodları içerir.
//veri tabanında veriyi Json() denılen formatta tutarız ve olusturulan modelin içerdiği bilgileri Json()a cevırerek verı tabanına kaydedıyoruz.
//toJson metodu bu yuzden mevcuttur.
//fromJson metodu ıse, veritabanından json ıle gelen verıyı kullanacagımız modele cevırıp veriyi kullanmamızı saglar.
//veri tabanında verılerı tablolarda tutuyoruz. bu ornekte de adını tablesheeps değişkenınde tutuyoruz.
//Sheepfıeld ıse tablo ıcerısındekı tutulacak verılerı temsil etmektedır.yem, yas, barkod...

import 'animal_model.dart';

//veritabanında koyunların tutulacağı tablonun adı
const String tableSheeps = 'sheeps';

//veritabanında koyunların tutulacağı tablonun sütunlarının adları
class SheepFields {
  static const String id = '_id';
  static const String barkod = 'Barkod';
  static const String
  static const String yem = 'Yem';
  static const String aylikYun = 'AylikYun';
  static const String gubre = 'Gubre';
  static const String asi = 'Asi';

  static final List<String> values = [
    id,
    barkod,
    yas,
    yem,
    aylikYun,
    gubre,
    asi,
  ];
}

//koyunların özelliklerini tutacak olan model
class SheepModel extends AnimalModel {
  int? id;
  String? barkod;
  String? yas;
  String? yem;
  String? aylikYun;
  String? gubre;
  String? asi;

  SheepModel.empty();

  SheepModel({
    this.id,
    required this.barkod,
    required this.yas,
    required this.yem,
    required this.aylikYun,
    required this.gubre,
    required this.asi,
  });

  SheepModel copyWith({
    int? id,
    String? barkod,
    String? yas,
    String? yem,
    String? aylikYun,
    String? gubre,
    String? asi,
  }) =>
      SheepModel(
        id: id ?? this.id!,
        barkod: barkod ?? this.barkod!,
        yas: yas ?? this.yas!,
        yem: yem ?? this.yem!,
        aylikYun: aylikYun ?? this.aylikYun!,
        gubre: gubre ?? this.gubre!,
        asi: asi ?? this.asi!,
      );

  static SheepModel fromJson(Map<String, dynamic> json) => SheepModel(
        id: json['_id'] as int?,
        barkod: json['Barkod'] as String,
        yas: json['Yas'] as String,
        yem: json['Yem'] as String,
        aylikYun: json['AylikYun'] as String,
        gubre: json['Gubre'] as String,
        asi: json['Asi'] as String,
      );

  Map<String, dynamic> toJson() => {
        SheepFields.id: id,
        SheepFields.barkod: barkod,
        SheepFields.yas: yas,
        SheepFields.yem: yem,
        SheepFields.aylikYun: aylikYun,
        SheepFields.gubre: gubre,
        SheepFields.asi: asi,
      };
}

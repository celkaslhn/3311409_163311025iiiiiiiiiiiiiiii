//veritabanında tavuklar,inekler,koyunlar ıcın birer tablo acıldı.fakat kullanıcı bunlar dısında hayvan eklemek ısteyebilir.
//bunun ıcın othermodel yazılmıstır.
//bu model ıle verıtabanına çeşitli hayvanlar eklenebilir.

import 'package:ciftlik_otomasyonu/core/models/animal_model.dart';

const String tableOthers = 'others';

class OtherAnimalFields {
  static const String id = '_id';
  static const String barkod = 'Barkod';
  static const String yas = 'Yas';
  static const String yem = 'Yem';
  static const String yanUrun = 'YanUrun';
  static const String urunMiktari = 'UrunMiktari';
  static const String asi = 'Asi';

  static final List<String> values = [
    id,
    barkod,
    yas,
    yem,
    yanUrun,
    urunMiktari,
    asi,
  ];
}

class OtherAnimalModel extends AnimalModel {
  int? id;
  String? barkod;
  String? yas;
  String? yem;
  String? yanUrun;
  String? urunMiktari;
  String? asi;

  OtherAnimalModel.empty();
  OtherAnimalModel({
    this.id,
    required this.barkod,
    required this.yas,
    required this.yem,
    required this.yanUrun,
    required this.urunMiktari,
    required this.asi,
  });

  OtherAnimalModel copyWith({
    int? id,
    String? barkod,
    String? yas,
    String? yem,
    String? yanUrun,
    String? urunMiktari,
    String? asi,
  }) =>
      OtherAnimalModel(
        id: id ?? this.id!,
        barkod: barkod ?? this.barkod!,
        yas: yas ?? this.yas!,
        yem: yem ?? this.yem!,
        yanUrun: yanUrun ?? this.yanUrun!,
        urunMiktari: urunMiktari ?? this.urunMiktari!,
        asi: asi ?? this.asi!,
      );

  static OtherAnimalModel fromJson(Map<String, dynamic> json) =>
      OtherAnimalModel(
        id: json['_id'] as int?,
        barkod: json['Barkod'] as String,
        yas: json['Yas'] as String,
        yem: json['Yem'] as String,
        yanUrun: json['YanUrun'] as String,
        urunMiktari: json['UrunMiktari'] as String,
        asi: json['Asi'] as String,
      );

  Map<String, dynamic> toJson() => {
        OtherAnimalFields.id: id,
        OtherAnimalFields.barkod: barkod,
        OtherAnimalFields.yas: yas,
        OtherAnimalFields.yem: yem,
        OtherAnimalFields.yanUrun: yanUrun,
        OtherAnimalFields.urunMiktari: urunMiktari,
        OtherAnimalFields.asi: asi,
      };
}

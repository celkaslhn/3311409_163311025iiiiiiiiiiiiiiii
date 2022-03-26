import 'package:ciftlik_otomasyonu/core/models/animal_model.dart';

//veri tabanında inekleri tutacak olan tablonun adı
const String tableCows = 'cows';

//veritabanında ineklerin özelliklerini tutacak olan sutünların tanımlanması
class CowFields {
  static const String id = '_id';
  static const String barkod = 'Barkod';
  static const String yas = 'Yas';
  static const String yem = 'Yem';
  static const String sutMiktari = 'SutMiktari';
  static const String gubre = 'Gubre';
  static const String asi = 'Asi';

  static final List<String> values = [
    id,
    barkod,
    yas,
    yem,
    sutMiktari,
    gubre,
    asi,
  ];
}

//ineklerle ilgili özelliklerin tutulduğu model
class CowModel extends AnimalModel {
  int? id;
  String? barkod;
  String? yas;
  String? yem;
  String? sutMiktari;
  String? gubre;
  String? asi;

  CowModel.empty();
  CowModel({
    this.id,
    required this.barkod,
    required this.yas,
    required this.yem,
    required this.sutMiktari,
    required this.gubre,
    required this.asi,
  });

  CowModel copyWith({
    int? id,
    String? barkod,
    String? yas,
    String? yem,
    String? sutMiktari,
    String? gubre,
    String? asi,
  }) =>
      CowModel(
        id: id ?? this.id!,
        barkod: barkod ?? this.barkod!,
        yas: yas ?? this.yas!,
        yem: yem ?? this.yem!,
        sutMiktari: sutMiktari ?? this.sutMiktari!,
        gubre: gubre ?? this.gubre!,
        asi: asi ?? this.asi!,
      );

  static CowModel fromJson(Map<String, dynamic> json) => CowModel(
        id: json['_id'] as int?,
        barkod: json['Barkod'] as String,
        yas: json['Yas'] as String,
        yem: json['Yem'] as String,
        sutMiktari: json['SutMiktari'] as String,
        gubre: json['Gubre'] as String,
        asi: json['Asi'] as String,
      );

  Map<String, dynamic> toJson() => {
        CowFields.id: id,
        CowFields.barkod: barkod,
        CowFields.yas: yas,
        CowFields.yem: yem,
        CowFields.sutMiktari: sutMiktari,
        CowFields.gubre: gubre,
        CowFields.asi: asi,
      };
}

/*
int inek_barkod;
	int inek_yas;
	int inek_yem;
	int inek_sut_miktari;
	int inek_gubre;
	int inek_asi;
*/
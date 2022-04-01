import 'package:ciftlik_otomasyonu/core/models/animal_model.dart';

//databaseye tavuk eklemek ıcın chıckenmodelden nesne olusturup id barkod gıbı ozellıklerını verıyoruz.
//toJson ıle Jsondan bir ture cevırıp dataabseye kaydedıyoruz. 
//veriyi databaseden alırken  Json olarak alıyoruz bunu nesneye cevırmek gerekıyor.
//fromJson metodu Jsondan gelen chıcken model nesnesı olusturmayı saglıyor.
//veritabanında tavukların tutulacağı tablo için sabit bir tablo adı tanımı.
const String tableChickens = 'chickens';

//veritabanında tavukların özelliklerini tutacak olan sutünlar ve bunların veritabanındaki adları
class ChickenFields {
  static const String id = '_id';
  static const String barkod = 'Barkod';
  static const String yas = 'Yas';
  static const String yem = 'Yem';
  static const String kuluckaSaati = 'KuluckaSaati';
  static const String yumurta = 'Yumurta';
  static const String asi = 'Asi';

  static final List<String> values = [
    id,
    barkod,
    yas,
    yem,
    kuluckaSaati,
    yumurta,
    asi,
  ];
}

//tavukların özelliklerini tutan model
class ChickenModel extends AnimalModel {
  int? id;
  String? barkod;
  String? yas;
  String? yem;
  String? kuluckaSaati;
  String? yumurta;
  String? asi;

  ChickenModel.empty();

  ChickenModel({
    this.id,
    required this.barkod,
    required this.yas,
    required this.yem,
    required this.kuluckaSaati,
    required this.yumurta,
    required this.asi,
  });

  ChickenModel copyWith({
    int? id,
    String? barkod,
    String? yas,
    String? yem,
    String? kuluckaSaati,
    String? yumurta,
    String? asi,
  }) =>
      ChickenModel(
        id: id ?? this.id!,
        barkod: barkod ?? this.barkod!,
        yas: yas ?? this.yas!,
        yem: yem ?? this.yem!,
        kuluckaSaati: kuluckaSaati ?? this.kuluckaSaati!,
        yumurta: yumurta ?? this.yumurta!,
        asi: asi ?? this.asi!,
      );

  static ChickenModel fromJson(Map<String, dynamic> json) => ChickenModel(
        id: json['_id'] as int?,
        barkod: json['Barkod'],
        yas: json['Yas'],
        yem: json['Yem'],
        kuluckaSaati: json['KuluckaSaati'],
        yumurta: json['Yumurta'],
        asi: json['Asi'],
      );

  Map<String, dynamic> toJson() => {
        ChickenFields.id: id,
        ChickenFields.barkod: barkod,
        ChickenFields.yas: yas,
        ChickenFields.yem: yem,
        ChickenFields.kuluckaSaati: kuluckaSaati,
        ChickenFields.yumurta: yumurta,
        ChickenFields.asi: asi,
      };
}

/*
int tavuk_barkod;
	int tavuk_yas;
	int tavuk_yem;
	int tavuk_kulucka_saati;
	int tavuk_yumurta;
	int tavuk_asi;
  */

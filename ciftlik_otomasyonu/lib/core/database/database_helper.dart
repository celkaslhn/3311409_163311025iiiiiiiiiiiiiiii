// ignore_for_file: unnecessary_string_interpolations
//onCreate metodu ile veritabanı oluşturulurken veri tabanında bulunması gereken tabloları olusturur.
//getAnimals metodu veri tabanında kayıtlı olan hayvanları getırır.
//getChıcken,getCow gıbı metodlar ıse veritaabanından id si verilen hayvanları getiriyor.  
//addChıcken,addCow gıbı metodlar ıse veritabanına hayvan ekleme işlemi yapar.
//ChıckenCount,CowCount gıbı methodlar çiftlikte bulunan toplam tavuk veya ınek sayısını getırır.
//getTotalProduct metodu çiftlikte uretilen urunlerın mıktarını getırıyor.
//delete bir hayvanı silmeye deleteAll butun hayvanları sılmeye yarar.


import 'package:ciftlik_otomasyonu/core/models/other_animal_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:ciftlik_otomasyonu/core/models/chicken_model.dart';
import 'package:ciftlik_otomasyonu/core/models/cow_model.dart';
import 'package:ciftlik_otomasyonu/core/models/sheep_model.dart';

//Uygulamanın veritabanı için oluşturulan sınıf, bu sınıf içerisindeki işlemler ile veritabanına ekleme, çıkarma, güncelleme işlemleri
//yapılabılabilir.
//Veritabanından veri çekmek için de bu sınıf kullanılacak
//Bu sınıf  bir singleton sınıfıdır. Bu sayede sınıfın kendi içerisinde sınıfın kendi türünden bir nesne bulunacak ve
//sınıfın yükümlü olduğu tüm işlemlerde bu nesne çağırılacak.
//singleton sınıfından bır tane nesne uretırlıyor.
class AnimalDatabase {
  static final AnimalDatabase instance = AnimalDatabase._init();
  static Database? _database;

  AnimalDatabase._init();

  //dönüş değeri olarak veritabanını döndürür.
  //eğer veritabanı henüz oluşturulmamışsa _initDatabase çağırılacak (nesne olusturlacak) ve böylece veritabanı oluşturulacak.
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase('animalssss.db');
    return _database!;
  }

  //Veritabanı oluşturma. Veritabanının ismi 'animals.db' olarak belirlendi.
  Future<Database> _initDatabase(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  //Database oluşturulurken çalışır.
  //Burada veritabanında oluşturulmasını istediğimiz tabloları oluşturuyoruz.
  //Tavuklar, inekler ve koyunlar için birer tablo oluşturuldu.
  //yukarıdakı getdatabase metodu ıcerısınde cagrılır
 
  Future _onCreate(Database db, int version) async {
    await db.execute(''' 
      CREATE TABLE $tableChickens(
        ${ChickenFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,  
        ${ChickenFields.barkod} TEXT NOT NULL,
        ${ChickenFields.yas} TEXT NOT NULL,
        ${ChickenFields.yem} TEXT NOT NULL,
        ${ChickenFields.kuluckaSaati} TEXT NOT NULL,
        ${ChickenFields.yumurta} TEXT NOT NULL,
        ${ChickenFields.asi} TEXT NOT NULL
      )
      ''');

    await db.execute('''   
      CREATE TABLE $tableCows(
        ${CowFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${CowFields.barkod} TEXT NOT NULL,
        ${CowFields.yas} TEXT NOT NULL,
        ${CowFields.yem} TEXT NOT NULL,
        ${CowFields.sutMiktari} TEXT NOT NULL,
        ${CowFields.gubre} TEXT NOT NULL,
        ${CowFields.asi} TEXT NOT NULL
      ) 
      ''');

    await db.execute('''  
      CREATE TABLE $tableSheeps(
        ${SheepFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${SheepFields.barkod} TEXT NOT NULL,
        ${SheepFields.yas} TEXT NOT NULL,
        ${SheepFields.yem} TEXT NOT NULL,
        ${SheepFields.aylikYun} TEXT NOT NULL,
        ${SheepFields.gubre} TEXT NOT NULL,
        ${SheepFields.asi} TEXT NOT NULL
      )      
      ''');

    await db.execute(''' 
    CREATE TABLE $tableOthers(
      ${OtherAnimalFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${OtherAnimalFields.barkod} TEXT NOT NULL,
      ${OtherAnimalFields.yas} TEXT NOT NULL,
      ${OtherAnimalFields.yem} TEXT NOT NULL,
      ${OtherAnimalFields.yanUrun} TEXT NOT NULL,
      ${OtherAnimalFields.urunMiktari} TEXT NOT NULL,
      ${OtherAnimalFields.asi} TEXT NOT NULL
    )''');
  }

  //database'i kapatır.
  Future close() async {
    final dbClient = await instance.database;
    return dbClient.close();
  }

  //tavukların tamamnını liste olarak getirir.
  Future<List<ChickenModel>> getChickens() async {
    final dbClient = await instance.database;
    //dbClıent ıcıne ddatabaseın ılk ornegı atanır.

    const orderBy = '${ChickenFields.id} DESC';
    //orderBY sıralama ıcın dgerler girilir.(tavuklar id sine gore Azalarak gıder)
    final chickens = await dbClient.query(tableChickens, orderBy: orderBy);
    //bir sorgu olusturulup istenılen degeger getırılır mesela tavuk gelmıs.
    return chickens.map((c) => ChickenModel.fromJson(c)).toList();
    //chıckenmodel tarafından her bırı ıcın nesne turetılır ve nesnenın ıcıne fromJson ıle ozellıkler atanır.(ıd barkod...).
  }

  //ineklerin tamamnını liste olarak getirir.
  Future<List<CowModel>> getCows() async {
    final dbClient = await instance.database;

    const orderBy = '${CowFields.id} DESC';
    final cows = await dbClient.query(tableCows, orderBy: orderBy);
    return cows.map((c) => CowModel.fromJson(c)).toList();
  }

  //koyunların tamamını liste olarak getirir.
  Future<List<SheepModel>> getSheeps() async {
    final dbClient = await instance.database;

    const orderBy = '${SheepFields.id} DESC';
    final sheeps = await dbClient.query(tableSheeps, orderBy: orderBy);
    return sheeps.map((s) => SheepModel.fromJson(s)).toList();
  }

  Future<List<OtherAnimalModel>> getOthers() async {
    final dbClient = await instance.database;

    const orderBy = '${OtherAnimalFields.id} DESC';
    final others = await dbClient.query(tableOthers, orderBy: orderBy);
    return others.map((c) => OtherAnimalModel.fromJson(c)).toList();
  }

  //tüm hayvanları getirir.
  Future<List<dynamic>> getAnimals() async {
    final dbClient = await instance.database;

    const orderBy = '${ChickenFields.id} DESC';
    final chickens = await dbClient.query(tableChickens, orderBy: orderBy);
    final cows = await dbClient.query(tableCows, orderBy: orderBy);
    final sheeps = await dbClient.query(tableSheeps, orderBy: orderBy);

    return [chickens, cows, sheeps];
  }

  Future<OtherAnimalModel?> getOther(int id) async {
    final dbClient = await instance.database;
    final other = await dbClient.query(tableOthers,
        where: '${OtherAnimalFields.id} = ?', whereArgs: [id]);
    return other.isNotEmpty ? OtherAnimalModel.fromJson(other.first) : null;
  }

  //null değer dönebilir, id'si verilen tavuğun verilerini getirir.
  Future<ChickenModel?> getChicken(int id) async {
    final dbClient = await instance.database;
    final chicken = await dbClient.query(tableChickens,
        where: '${ChickenFields.id} = ?', whereArgs: [id]);
    return chicken.isNotEmpty ? ChickenModel.fromJson(chicken.first) : null;
  }

  //null değer dönebilir, id'si verilen ineğin verilini getirir.
  Future<CowModel?> getCow(int id) async {
    final dbClient = await instance.database;
    final cow = await dbClient
        .query(tableCows, where: '${CowFields.id} = ?', whereArgs: [id]);
    return cow.isNotEmpty ? CowModel.fromJson(cow.first) : null;
  }

  //null değer dönebilir, id'si verilen koyunun verilerini getirir.
  Future<SheepModel?> getSheep(int id) async {
    final dbClient = await instance.database;
    final sheep = await dbClient
        .query(tableSheeps, where: '${SheepFields.id} = ?', whereArgs: [id]);
    return sheep.isNotEmpty ? SheepModel.fromJson(sheep.first) : null;
  }

  //tavuk ekleme
  //tavugun bılgılerını chıckenmodele dondurur.bu işi toJson modelı ıle yapar.
  //dbClıent.query dekı kısım bır sorgu calıstırır ve id ye ait tavugu bulur.
  Future<ChickenModel> addChicken(ChickenModel chicken) async {
    final dbClient = await database;
    final id = await dbClient.insert(tableChickens, chicken.toJson());
    return chicken.copyWith(id: id);
  }

  //inek ekleme
  Future<CowModel> addCow(CowModel cow) async {
    final dbClient = await instance.database;
    final id = await dbClient.insert(tableCows, cow.toJson());
    return cow.copyWith(id: id);
  }

  //koyun ekleme
  Future<SheepModel> addSheep(SheepModel sheep) async {
    final dbClient = await instance.database;
    final id = await dbClient.insert(tableSheeps, sheep.toJson());
    return sheep.copyWith(id: id);
  }

  Future<OtherAnimalModel> addOther(OtherAnimalModel other) async {
    final dbClient = await instance.database;
    final id = await dbClient.insert(tableOthers, other.toJson());
    return other.copyWith(id: id);
  }

  //veritabanında kayıtlı olan toplam tavuk sayısını getirir.
  Future<int> chickenCount() async {
    final dbClient = await instance.database;
    int? count = Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableChickens'));
    return count!;
  }

  //veritabanında kayıtlı olan toplam inek sayısını getirir.
  Future<int> cowCount() async {
    final dbClient = await instance.database;
    int? count = Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableSheeps'));
    return count!;
  }

  //veritabanında kayıtlı olan toplam koyun sayısını getirir.
  Future<int> sheepCount() async {
    final dbClient = await instance.database;
    int? count = Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableCows'));
    return count!;
  }

  Future<int> otherAnimalCount() async {
    final dbClient = await instance.database;
    int? count = Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableOthers'));
    return count!;
  }

  //parametre olarak bir hayvan modeli alır(ChickenModel, CowModel vs.),
  //parametre olarak aldığı hayvanın toplam ürün bilgisini getirir.
  Future<String> totalProduct(dynamic animal) async {
    final dbClient = await instance.database;
    final type = (animal is ChickenModel)
        ? '${ChickenFields.yumurta}'
        : (animal is CowModel)
            ? '${CowFields.sutMiktari}'
            : (animal is OtherAnimalModel)
                ? '${OtherAnimalFields.urunMiktari}'
                : '${SheepFields.aylikYun}';
    final table = (animal is ChickenModel)
        ? tableChickens
        : (animal is CowModel)
            ? tableCows
            : (animal is OtherAnimalModel)
                ? tableOthers
                : tableSheeps;
    final total = await dbClient.rawQuery('SELECT SUM($type) FROM $table');
    int value =
        total[0]['SUM($type)'] != null ? total[0]['SUM($type)'] as int : 0;
    return value.toString();
  }

  //belirtilen id'ye sahip hayvanı siler. parametre olarak tablo ismi, fields ve id alır.
  Future<int> delete(String table, dynamic fields, int id) async {
    final dbClient = await instance.database;
    return dbClient.delete(table, where: '${fields.id} = ?', whereArgs: [id]);
  }

  //tüm verileri siler
  Future<void> deleteAll() async {
    final dbClient = await instance.database;
    dbClient.delete(tableChickens);
    dbClient.delete(tableCows);
    dbClient.delete(tableSheeps);
  }

  Future<void> deleteDb() async {
    final dbClient = await instance.database;
    dbClient.delete('table');
  }
}

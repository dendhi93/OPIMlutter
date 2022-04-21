import 'dart:ffi';

class ResponseMasterData{
  Data data;
  String timestamps;
  String message;
  String status;

  ResponseMasterData.dart({this.data, this.timestamps, this.message, this.status});

  ResponseMasterData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    timestamps = json['timestamps'];
    message = json['message'];
    status = json['status'];
  }
}

class Data{
  List<Jalan> jalan;
  // List<Kendaraan> kendaraan;
  // List<Mandor> mandor;
  // List<Tipealatberat> tipealatberat;
  // List<Ancak> ancak;
  // List<Checkerperawatan> checkerperawatan;
  // List<Divisi> divisi;
  // List<Tph> tph;
  // List<Pop> pop;
  // List<Alatberat> alatberat;
  // List<Mandorperawatan> mandorperawatan;
  // List<Weightbridge> weightbridge;
  // List<Company> company;
  // List<Block> block;
  // List<Ketuateam> ketuateam;
  // List<ActivityList> activityList;
  // List<Tenagakerja> tenagakerja;

  // Data({this.jalan, this.kendaraan, this.mandor, this.tipealatberat, this.ancak, this.checkerperawatan, this.divisi, this.tph, this.pop, this.alatberat, this.mandorperawatan, this.weightbridge, this.company, this.block, this.ketuateam, this.activityList, this.tenagakerja});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['jalan'] != null) {
      jalan = <Jalan>[];
      json['jalan'].forEach((v) { jalan.add(new Jalan.fromJson(v)); });
    }
    // if (json['kendaraan'] != null) {
    //   kendaraan = <Kendaraan>[];
    //   json['kendaraan'].forEach((v) { kendaraan!.add(new Kendaraan.fromJson(v)); });
    // }
    // if (json['mandor'] != null) {
    //   mandor = <Mandor>[];
    //   json['mandor'].forEach((v) { mandor!.add(new Mandor.fromJson(v)); });
    // }
    // if (json['tipealatberat'] != null) {
    //   tipealatberat = <Tipealatberat>[];
    //   json['tipealatberat'].forEach((v) { tipealatberat!.add(new Tipealatberat.fromJson(v)); });
    // }
    // if (json['ancak'] != null) {
    //   ancak = <Ancak>[];
    //   json['ancak'].forEach((v) { ancak!.add(new Ancak.fromJson(v)); });
    // }
    // if (json['checkerperawatan'] != null) {
    //   checkerperawatan = <Checkerperawatan>[];
    //   json['checkerperawatan'].forEach((v) { checkerperawatan!.add(new Checkerperawatan.fromJson(v)); });
    // }
    // if (json['divisi'] != null) {
    //   divisi = <Divisi>[];
    //   json['divisi'].forEach((v) { divisi!.add(new Divisi.fromJson(v)); });
    // }
    // if (json['tph'] != null) {
    //   tph = <Tph>[];
    //   json['tph'].forEach((v) { tph!.add(new Tph.fromJson(v)); });
    // }
    // if (json['pop'] != null) {
    //   pop = <Pop>[];
    //   json['pop'].forEach((v) { pop!.add(new Pop.fromJson(v)); });
    // }
    // if (json['alatberat'] != null) {
    //   alatberat = <Alatberat>[];
    //   json['alatberat'].forEach((v) { alatberat!.add(new Alatberat.fromJson(v)); });
    // }
    // if (json['mandorperawatan'] != null) {
    //   mandorperawatan = <Mandorperawatan>[];
    //   json['mandorperawatan'].forEach((v) { mandorperawatan!.add(new Mandorperawatan.fromJson(v)); });
    // }
    // if (json['weightbridge'] != null) {
    //   weightbridge = <Weightbridge>[];
    //   json['weightbridge'].forEach((v) { weightbridge!.add(new Weightbridge.fromJson(v)); });
    // }
    // if (json['company'] != null) {
    //   company = <Company>[];
    //   json['company'].forEach((v) { company!.add(new Company.fromJson(v)); });
    // }
    // if (json['block'] != null) {
    //   block = <Block>[];
    //   json['block'].forEach((v) { block!.add(new Block.fromJson(v)); });
    // }
    // if (json['ketuateam'] != null) {
    //   ketuateam = <Ketuateam>[];
    //   json['ketuateam'].forEach((v) { ketuateam!.add(new Ketuateam.fromJson(v)); });
    // }
    // if (json['activityList'] != null) {
    //   activityList = <ActivityList>[];
    //   json['activityList'].forEach((v) { activityList!.add(new ActivityList.fromJson(v)); });
    // }
    // if (json['tenagakerja'] != null) {
    //   tenagakerja = <Tenagakerja>[];
    //   json['tenagakerja'].forEach((v) { tenagakerja!.add(new Tenagakerja.fromJson(v)); });
    // }
  }
}

class Jalan {
  String insertByDevicecode;
  String updateByDevicecode;
  int jalanId;
  String jalancode;
  String refBlockid;
  String jalanDesc;
  String gisAreatype;
  String gisAreajson;
  String jalanIntegrityCode;
  String grade;
  String popcode;
  String divisicode;
  String blockcode;
  KondisiJalanItem trcLaporJalan;

  Jalan({this.insertByDevicecode, this.updateByDevicecode, this.jalanId, this.jalancode, this.refBlockid, this.jalanDesc, this.gisAreatype, this.gisAreajson, this.jalanIntegrityCode, this.grade, this.popcode, this.divisicode, this.blockcode, this.trcLaporJalan});

  Jalan.fromJson(Map<String, dynamic> json) {
    insertByDevicecode = json['insertByDevicecode'];
    updateByDevicecode = json['updateByDevicecode'];
    jalanId = json['jalanId'];
    jalancode = json['jalancode'];
    refBlockid = json['refBlockid'];
    jalanDesc = json['jalanDesc'];
    gisAreatype = json['gisAreatype'];
    gisAreajson = json['gisAreajson'];
    jalanIntegrityCode = json['jalanIntegrityCode'];
    grade = json['grade'];
    popcode = json['popcode'];
    divisicode = json['divisicode'];
    blockcode = json['blockcode'];
    trcLaporJalan = json['trcLaporJalan'];
  }
}

class KondisiJalanItem{
  int id;
  int jalanId;
  String jalanCode;
  String blockCode;
  String grade;
  String divisiCode;
  String laporDate;
  String jalanNotes;
  String perbaikanJalan;
  String perbaikanJembatan;
  Double latitudeAction;
  Double longitudeAction;
  String userActLapor;
  String userActLaporName;
  String userActLaporJabatan;
  String foto1;
  String foto2;
  String foto3;

  KondisiJalanItem({this.id, this.jalanId, this.jalanCode, this.blockCode, this.grade, this.divisiCode,
  this.laporDate, this.jalanNotes, this.perbaikanJalan, this.perbaikanJembatan, this.latitudeAction, this.longitudeAction
  ,this.userActLapor, this.userActLaporName, this.userActLaporJabatan, this.foto1, this.foto2, this.foto3
  });

  KondisiJalanItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jalanId = json['jalanId'];
    jalanCode = json['jalanCode'];
    blockCode = json['blockcode'];
    grade = json['grade'];
    divisiCode = json['divisicode'];
    laporDate = json['laporDate'];
    jalanNotes = json['jalanNotes'];
    perbaikanJalan = json['perbaikanJalan'];
    perbaikanJembatan = json['perbaikanJembatan'];
    latitudeAction = json['latitudeAction'];
    longitudeAction = json['longitudeAction'];
    userActLapor = json['userActLapor'];
    userActLaporName = json['userActLaporName'];
    userActLaporJabatan = json['userActLaporJabatan'];
    foto1 = json['foto1'];
    foto2 = json['foto2'];
    foto3 = json['foto3'];
  }
}


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
  List<Kendaraan> kendaraan;
  List<Mandor> mandor;
  List<Tipealatberat> tipealatberat;
  List<Ancak> ancak;
  List<Checkerperawatan> checkerperawatan;
  List<Divisi> divisi;
  List<Tph> tph;
  List<Pop> pop;
  List<Alatberat> alatberat;
  List<Mandorperawatan> mandorperawatan;
  List<Weightbridge> weightbridge;
  List<Company> company;
  List<Block> block;
  List<Ketuateam> ketuateam;
  // List<ActivityList> activityList;
  List<Tenagakerja> tenagakerja;

  Data({this.jalan, this.kendaraan, this.mandor, this.tipealatberat, this.ancak, this.checkerperawatan, this.divisi, this.tph, this.pop, this.alatberat, this.mandorperawatan, this.weightbridge, this.company, this.block, this.ketuateam, this.tenagakerja});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['jalan'] != null) {
      jalan = <Jalan>[];
      json['jalan'].forEach((v) { jalan.add(new Jalan.fromJson(v)); });
    }
    if (json['kendaraan'] != null) {
      kendaraan = <Kendaraan>[];
      json['kendaraan'].forEach((v) { kendaraan.add(new Kendaraan.fromJson(v)); });
    }
    if (json['mandor'] != null) {
      mandor = <Mandor>[];
      json['mandor'].forEach((v) { mandor.add(new Mandor.fromJson(v)); });
    }
    if (json['tipealatberat'] != null) {
      tipealatberat = <Tipealatberat>[];
      json['tipealatberat'].forEach((v) { tipealatberat.add(new Tipealatberat.fromJson(v)); });
    }
    if (json['ancak'] != null) {
      ancak = <Ancak>[];
      json['ancak'].forEach((v) { ancak.add(new Ancak.fromJson(v)); });
    }
    if (json['checkerperawatan'] != null) {
      checkerperawatan = <Checkerperawatan>[];
      json['checkerperawatan'].forEach((v) { checkerperawatan.add(new Checkerperawatan.fromJson(v)); });
    }
    if (json['divisi'] != null) {
      divisi = <Divisi>[];
      json['divisi'].forEach((v) { divisi.add(new Divisi.fromJson(v)); });
    }
    if (json['tph'] != null) {
      tph = <Tph>[];
      json['tph'].forEach((v) { tph.add(new Tph.fromJson(v)); });
    }
    if (json['pop'] != null) {
      pop = <Pop>[];
      json['pop'].forEach((v) { pop.add(new Pop.fromJson(v)); });
    }
    if (json['alatberat'] != null) {
      alatberat = <Alatberat>[];
      json['alatberat'].forEach((v) { alatberat.add(new Alatberat.fromJson(v)); });
    }
    if (json['mandorperawatan'] != null) {
      mandorperawatan = <Mandorperawatan>[];
      json['mandorperawatan'].forEach((v) { mandorperawatan.add(new Mandorperawatan.fromJson(v)); });
    }
    if (json['weightbridge'] != null) {
      weightbridge = <Weightbridge>[];
      json['weightbridge'].forEach((v) { weightbridge.add(new Weightbridge.fromJson(v)); });
    }
    if (json['company'] != null) {
      company = <Company>[];
      json['company'].forEach((v) { company.add(new Company.fromJson(v)); });
    }
    if (json['block'] != null) {
      block = <Block>[];
      json['block'].forEach((v) { block.add(new Block.fromJson(v)); });
    }
    if (json['ketuateam'] != null) {
      ketuateam = <Ketuateam>[];
      json['ketuateam'].forEach((v) { ketuateam.add(new Ketuateam.fromJson(v)); });
    }
    // if (json['activityList'] != null) {
    //   activityList = <ActivityList>[];
    //   json['activityList'].forEach((v) { activityList!.add(new ActivityList.fromJson(v)); });
    // }
    if (json['tenagakerja'] != null) {
      tenagakerja = <Tenagakerja>[];
      json['tenagakerja'].forEach((v) { tenagakerja.add(new Tenagakerja.fromJson(v)); });
    }
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

class Kendaraan{
  String insertByDevicecode;
  String updateByDevicecode;
  int kendaraanId;
  String kendaraanCode;
  String getdateFromSap;
  bool isActive;
  String refPopcode;
  String equnr258;

  Kendaraan(
      {this.insertByDevicecode,
        this.updateByDevicecode,
        this.kendaraanId,
        this.kendaraanCode,
        this.getdateFromSap,
        this.isActive,
        this.refPopcode,
        this.equnr258});

  Kendaraan.fromJson(Map<String, dynamic> json) {
    insertByDevicecode = json['insertByDevicecode'];
    updateByDevicecode = json['updateByDevicecode'];
    kendaraanId = json['kendaraanId'];
    kendaraanCode = json['kendaraanCode'];
    getdateFromSap = json['getdateFromSap'];
    isActive = json['isActive'];
    refPopcode = json['refPopcode'];
    equnr258 = json['equnr258'];
  }
}

class Mandor{
  String registrationDate;
  String imei;
  String usercode;
  String firstname;
  String lastname;
  String refGrouprolecode;
  String refCompanycode;
  String refDevicecode;
  String gradeKPI;
  int id;
  String companyname;
  String roledescname;
  String popname;
  String rolecode;
  String popcode;
  String roleLevel;
  String divisicode;

  Mandor(
      {this.registrationDate,
        this.imei,
        this.usercode,
        this.firstname,
        this.lastname,
        this.refGrouprolecode,
        this.refCompanycode,
        this.refDevicecode,
        this.gradeKPI,
        this.id,
        this.companyname,
        this.roledescname,
        this.popname,
        this.rolecode,
        this.popcode,
        this.roleLevel,
        this.divisicode});

  Mandor.fromJson(Map<String, dynamic> json) {
    registrationDate = json['registrationDate'];
    imei = json['imei'];
    usercode = json['usercode'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    refGrouprolecode = json['ref_grouprolecode'];
    refCompanycode = json['ref_companycode'];
    refDevicecode = json['ref_devicecode'];
    gradeKPI = json['gradeKPI'];
    id = json['id'];
    companyname = json['companyname'];
    roledescname = json['roledescname'];
    popname = json['popname'];
    rolecode = json['rolecode'];
    popcode = json['popcode'];
    roleLevel = json['roleLevel'];
    divisicode = json['divisicode'];
  }
}

class Tipealatberat{
  String alatBeratType;

  Tipealatberat({this.alatBeratType});

  Tipealatberat.fromJson(Map<String, dynamic> json) {
    alatBeratType = json['alatBeratType'];
  }
}

class Ancak{
  String insertByDevicecode;
  String updateByDevicecode;
  int ancakid;
  String ancakcode;
  int refBlockid;
  String popcode;
  String divisicode;
  String blockcode;
  String ancakDescname;
  String ancakIntegrityCode;
  String grade;
  String gisAreatype;
  String gisAreajson;

  Ancak(
      {this.insertByDevicecode,
        this.updateByDevicecode,
        this.ancakid,
        this.ancakcode,
        this.refBlockid,
        this.popcode,
        this.divisicode,
        this.blockcode,
        this.ancakDescname,
        this.ancakIntegrityCode,
        this.grade,
        this.gisAreatype,
        this.gisAreajson});

  Ancak.fromJson(Map<String, dynamic> json) {
    insertByDevicecode = json['insertByDevicecode'];
    updateByDevicecode = json['updateByDevicecode'];
    ancakid = json['ancakid'];
    ancakcode = json['ancakcode'];
    refBlockid = json['refBlockid'];
    popcode = json['popcode'];
    divisicode = json['divisicode'];
    blockcode = json['blockcode'];
    ancakDescname = json['ancakDescname'];
    ancakIntegrityCode = json['ancakIntegrityCode'];
    grade = json['grade'];
    gisAreatype = json['gisAreatype'];
    gisAreajson = json['gisAreajson'];
  }
}

class Checkerperawatan{
  int userid;
  String usercode;
  String userFullname;
  String refGroupRolecode;
  String roleDescname;
  String companycode;
  String popcode;
  String divisicode;

  Checkerperawatan(
      {this.userid,
        this.usercode,
        this.userFullname,
        this.refGroupRolecode,
        this.roleDescname,
        this.companycode,
        this.popcode,
        this.divisicode});

  Checkerperawatan.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    usercode = json['usercode'];
    userFullname = json['userFullname'];
    refGroupRolecode = json['refGroupRolecode'];
    roleDescname = json['roleDescname'];
    companycode = json['companycode'];
    popcode = json['popcode'];
    divisicode = json['divisicode'];
  }
}

class Divisi {
  String insertByDevicecode;
  String updateByDevicecode;
  int divisiId;
  String divisicode;
  String divisiDescname;
  String refPopcode;
  String gisAreatype;
  String divisiIntegrityCode;

  Divisi({this.insertByDevicecode,
    this.updateByDevicecode,
    this.divisiId,
    this.divisicode,
    this.divisiDescname,
    this.refPopcode,
    this.gisAreatype,
    this.divisiIntegrityCode});

  Divisi.fromJson(Map<String, dynamic> json) {
    insertByDevicecode = json['insertByDevicecode'];
    updateByDevicecode = json['updateByDevicecode'];
    divisiId = json['divisi_id'];
    divisicode = json['divisicode'];
    divisiDescname = json['divisi_descname'];
    refPopcode = json['ref_popcode'];
    gisAreatype = json['gisAreatype'];
    divisiIntegrityCode = json['divisiIntegrityCode'];
  }
}

class Tph {
  String insertByDevicecode;
  String updateByDevicecode;
  int tphId;
  String tphcode;
  int refAncakid;
  String tphDescname;
  String popcode;
  String divisicode;
  String blockcode;
  String ancakcode;
  String longitude;
  String latitude;
  String tphIntegrityCode;

  Tph(
      {this.insertByDevicecode,
        this.updateByDevicecode,
        this.tphId,
        this.tphcode,
        this.refAncakid,
        this.tphDescname,
        this.popcode,
        this.divisicode,
        this.blockcode,
        this.ancakcode,
        this.longitude,
        this.latitude,
        this.tphIntegrityCode});

  Tph.fromJson(Map<String, dynamic> json) {
    insertByDevicecode = json['insertByDevicecode'];
    updateByDevicecode = json['updateByDevicecode'];
    tphId = json['tphId'];
    tphcode = json['tphcode'];
    refAncakid = json['refAncakid'];
    tphDescname = json['tphDescname'];
    popcode = json['popcode'];
    divisicode = json['divisicode'];
    blockcode = json['blockcode'];
    ancakcode = json['ancakcode'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    tphIntegrityCode = json['tphIntegrityCode'];
  }
}

class Pop{
  String insertByDevicecode;
  String updateByDevicecode;
  int popId;
  String popcode;
  String popname;
  String popDescname;
  String gisAreatype;
  String gisAreajson;
  String refCompanycode;

  Pop(
      {this.insertByDevicecode,
        this.updateByDevicecode,
        this.popId,
        this.popcode,
        this.popname,
        this.popDescname,
        this.gisAreatype,
        this.gisAreajson,
        this.refCompanycode});

  Pop.fromJson(Map<String, dynamic> json) {
    insertByDevicecode = json['insertByDevicecode'];
    updateByDevicecode = json['updateByDevicecode'];
    popId = json['popId'];
    popcode = json['popcode'];
    popname = json['popname'];
    popDescname = json['popDescname'];
    gisAreatype = json['gisAreatype'];
    gisAreajson = json['gisAreajson'];
    refCompanycode = json['refCompanycode'];
  }
}

class Alatberat {
  String insertByDevicecode;
  String updateByDevicecode;
  AlatberatUnionFieldCode alatberatUnionFieldCode;
  String alatBeratName;
  String alatBeratDesc;
  String isactive;
  String typeAlatBerat;

  Alatberat({this.insertByDevicecode,
    this.updateByDevicecode,
    this.alatberatUnionFieldCode,
    this.alatBeratName,
    this.alatBeratDesc,
    this.isactive,
    this.typeAlatBerat});

  Alatberat.fromJson(Map<String, dynamic> json) {
    insertByDevicecode = json['insertByDevicecode'];
    updateByDevicecode = json['updateByDevicecode'];
    alatberatUnionFieldCode = json['alatberatUnionFieldCode'] != null
        ? new AlatberatUnionFieldCode.fromJson(json['alatberatUnionFieldCode'])
        : null;
    alatBeratName = json['alatBeratName'];
    alatBeratDesc = json['alatBeratDesc'];
    isactive = json['isactive'];
    typeAlatBerat = json['typeAlatBerat'];
  }
}

class AlatberatUnionFieldCode {
  String refCompanycode;
  String refPopCode;
  String alatBeratCode;

  AlatberatUnionFieldCode(
      {this.refCompanycode, this.refPopCode, this.alatBeratCode});

  AlatberatUnionFieldCode.fromJson(Map<String, dynamic> json) {
    refCompanycode = json['refCompanycode'];
    refPopCode = json['refPopCode'];
    alatBeratCode = json['alatBeratCode'];
  }
}

class Mandorperawatan{
  int userid;
  String usercode;
  String userFullname;
  String refGroupRolecode;
  String roleDescname;
  String companycode;
  String popcode;
  String divisicode;

  Mandorperawatan({this.userid,
    this.usercode,
    this.userFullname,
    this.refGroupRolecode,
    this.roleDescname,
    this.companycode,
    this.popcode,
    this.divisicode});

  Mandorperawatan.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    usercode = json['usercode'];
    userFullname = json['userFullname'];
    refGroupRolecode = json['refGroupRolecode'];
    roleDescname = json['roleDescname'];
    companycode = json['companycode'];
    popcode = json['popcode'];
    divisicode = json['divisicode'];
  }
}

class Block{
  String insertByDevicecode;
  String updateByDevicecode;
  int blockid;
  String blockcode;
  String blokdescname;
  int refDivisiId;
  String majorPlantYear;
  String planted;
  String totalTrees;
  String jenisBibit;
  String topography;
  String radius;
  String companycode;
  String popcode;
  String divisicode;
  String grade;
  String gisAreatype;
  String luasArea;
  String gisAreajson;
  String blockIntegrityCode;

  Block(
      {this.insertByDevicecode,
        this.updateByDevicecode,
        this.blockid,
        this.blockcode,
        this.blokdescname,
        this.refDivisiId,
        this.majorPlantYear,
        this.planted,
        this.totalTrees,
        this.jenisBibit,
        this.topography,
        this.radius,
        this.companycode,
        this.popcode,
        this.divisicode,
        this.grade,
        this.gisAreatype,
        this.luasArea,
        this.gisAreajson,
        this.blockIntegrityCode});

  Block.fromJson(Map<String, dynamic> json) {
    insertByDevicecode = json['insertByDevicecode'];
    updateByDevicecode = json['updateByDevicecode'];
    blockid = json['blockid'];
    blockcode = json['blockcode'];
    blokdescname = json['blokdescname'];
    refDivisiId = json['ref_divisi_id'];
    majorPlantYear = json['major_plant_year'];
    planted = json['planted'];
    totalTrees = json['total_trees'];
    jenisBibit = json['jenis_bibit'];
    topography = json['topography'];
    radius = json['radius'];
    companycode = json['companycode'];
    popcode = json['popcode'];
    divisicode = json['divisicode'];
    grade = json['grade'];
    gisAreatype = json['gis_areatype'];
    luasArea = json['luasArea'];
    gisAreajson = json['gis_areajson'];
    blockIntegrityCode = json['block_integrity_code'];
  }
}
class Ketuateam{
  String insertByDevicecode;
  String updateByDevicecode;
  int ketuaTeamId;
  String kodeTeam;
  String ketuaTeamCode;
  String namaKetuateam;
  String companycode;
  String refPopcode;
  String divisicode;
  String isActive;

  Ketuateam(
      {this.insertByDevicecode,
        this.updateByDevicecode,
        this.ketuaTeamId,
        this.kodeTeam,
        this.ketuaTeamCode,
        this.namaKetuateam,
        this.companycode,
        this.refPopcode,
        this.divisicode,
        this.isActive});

  Ketuateam.fromJson(Map<String, dynamic> json) {
    insertByDevicecode = json['insertByDevicecode'];
    updateByDevicecode = json['updateByDevicecode'];
    ketuaTeamId = json['ketuaTeamId'];
    kodeTeam = json['kodeTeam'];
    ketuaTeamCode = json['ketuaTeamCode'];
    namaKetuateam = json['namaKetuateam'];
    companycode = json['companycode'];
    refPopcode = json['refPopcode'];
    divisicode = json['divisicode'];
    isActive = json['isActive'];
  }
}

class Weightbridge{
  int weightbridgeId;
  String weightbridgeCode;
  String refFactorycode;
  String popcode;
  int isActive;

  Weightbridge(
      {this.weightbridgeId,
        this.weightbridgeCode,
        this.refFactorycode,
        this.popcode,
        this.isActive});

  Weightbridge.fromJson(Map<String, dynamic> json) {
    weightbridgeId = json['weightbridgeId'];
    weightbridgeCode = json['weightbridgeCode'];
    refFactorycode = json['refFactorycode'];
    popcode = json['popcode'];
    isActive = json['isActive'];
  }
}

class Company{
  String insertByDevicecode;
  String updateByDevicecode;
  int rcIdx;
  String companycode;
  String companyname;
  String companydesc;

  Company(
      {this.insertByDevicecode,
        this.updateByDevicecode,
        this.rcIdx,
        this.companycode,
        this.companyname,
        this.companydesc});

  Company.fromJson(Map<String, dynamic> json) {
    insertByDevicecode = json['insertByDevicecode'];
    updateByDevicecode = json['updateByDevicecode'];
    rcIdx = json['rcIdx'];
    companycode = json['companycode'];
    companyname = json['companyname'];
    companydesc = json['companydesc'];
  }
}

class Tenagakerja {
  String insertByDevicecode;
  String updateByDevicecode;
  int tenagakerjaId;
  String tenagakerjaCode;
  String namaTenagakerja;
  int refKetuaTeamId;
  String ketuaTeamCode;
  String isActive;
  String companycode;
  String popcode;
  String divisicode;

  Tenagakerja({this.insertByDevicecode,
    this.updateByDevicecode,
    this.tenagakerjaId,
    this.tenagakerjaCode,
    this.namaTenagakerja,
    this.refKetuaTeamId,
    this.ketuaTeamCode,
    this.isActive,
    this.companycode,
    this.popcode,
    this.divisicode});

  Tenagakerja.fromJson(Map<String, dynamic> json) {
    insertByDevicecode = json['insertByDevicecode'];
    updateByDevicecode = json['updateByDevicecode'];
    tenagakerjaId = json['tenagakerjaId'];
    tenagakerjaCode = json['tenagakerjaCode'];
    namaTenagakerja = json['namaTenagakerja'];
    refKetuaTeamId = json['refKetuaTeamId'];
    ketuaTeamCode = json['ketuaTeamCode'];
    isActive = json['isActive'];
    companycode = json['companycode'];
    popcode = json['popcode'];
    divisicode = json['divisicode'];
  }
}















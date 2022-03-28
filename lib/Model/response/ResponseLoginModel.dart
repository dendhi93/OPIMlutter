
class ResponseLoginModel{
  Data data;
  String timestamps;
  String message;
  String status;

  ResponseLoginModel({this.data, this.timestamps, this.message, this.status});

  ResponseLoginModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    timestamps = json['timestamps'];
    message = json['message'];
    status = json['status'];
  }
}

class Data {
  // List<Null> menu;
  UserProfile userProfile;
  String token;

  Data({this.userProfile, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    // if (json['menu'] != null) {
    //   menu = <Null>[];
    //   json['menu'].forEach((v) {
    //     menu.add(new Null.fromJson(v));
    //   });
    // }
    userProfile = json['userProfile'] != null
        ? new UserProfile.fromJson(json['userProfile'])
        : null;
    token = json['token'];
  }
}

class UserProfile {
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

  UserProfile(
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

  UserProfile.fromJson(Map<String, dynamic> json) {
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
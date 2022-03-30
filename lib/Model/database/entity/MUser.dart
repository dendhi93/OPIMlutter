
import 'package:floor/floor.dart';


@entity
class MUser{
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String firstName;
  final String lastName;
  final String roleName;
  final String roleCode;
  final String lastLoggedIn;
  final String registrationDate;
  final String popid;
  final String pop;
  final String division;
  final String imei;
  final String lastUpload;
  final String lastSync;
  @ignore
  bool isLoggedIn = false;
  final String userToken;
  final String companyCode;
  final String passwordUser;


  MUser(this.id,
       this.firstName,
        this.lastName,
        this.roleName,
        this.roleCode,
        this.lastLoggedIn,
        this.registrationDate,
        this.popid,
        this.pop,
        this.division,
        this.imei,
        this.lastUpload,
        this.lastSync,
        this.isLoggedIn,
        this.userToken,
        this.companyCode,
        this.passwordUser
      );
}
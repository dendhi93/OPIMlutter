
import 'package:floor/floor.dart';

@entity
class MTph{
  @PrimaryKey(autoGenerate: true)
  int tphId;
  String ancakId;
  String tphName;
  String longitude;
  String latitude;
  String ancakCode;
  String popCode;
  String divisionCode;
  String tphCode;
  String blockCode;
  String tphIntegrityCode;

  MTph(this.tphId, this.ancakId, this.tphName, this.longitude, this.latitude,
      this.ancakCode, this.popCode, this.divisionCode, this.tphCode, this.blockCode, this.tphIntegrityCode);

}
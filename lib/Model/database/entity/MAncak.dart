
import 'package:floor/floor.dart';

@entity
class MAncak{
  @PrimaryKey(autoGenerate: true)
  int ancakId;
  String blockId;
  String ancakName;
  String blockCode;
  String popCode;
  String divisionCode;
  String ancakCode;

  MAncak(this.ancakId, this.blockId, this.ancakName, this.blockCode, this.popCode, this.divisionCode, this.ancakCode);
}

import 'package:floor/floor.dart';

@entity
class MDivisi{
  @PrimaryKey(autoGenerate: true)
  int divisionId;
  String divisionName;
  String popCode;
  String divisionCode;

  MDivisi(this.divisionId, this.divisionName, this.divisionCode, this.popCode);
}
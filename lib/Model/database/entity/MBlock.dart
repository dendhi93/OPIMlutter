
import 'package:floor/floor.dart';

@entity
class MBlock{
  @PrimaryKey(autoGenerate: true)
  final int blockId;
  final String divisionId;
  final String blockName;
  final String divisionCode;
  final String companyCode;
  final String popCode;
  final String blockCode;

  MBlock(
    this.blockId,
    this.divisionId,
    this.blockName,
    this.divisionCode,
    this.companyCode,
    this.popCode,
    this.blockCode
  );



}
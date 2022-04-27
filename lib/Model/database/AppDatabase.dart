
import 'dart:async';
import 'dart:ffi';

import 'package:floor/floor.dart';
import 'package:opim_flutter/Model/database/dao/MBlockDao.dart';
import 'package:opim_flutter/Model/database/dao/MDivisiDao.dart';
import 'package:opim_flutter/Model/database/dao/MUserDao.dart';
import 'package:opim_flutter/Model/database/entity/Mdivisi.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';
import 'entity/MBlock.dart';
import 'entity/MUser.dart';

part "AppDatabase.g.dart";

@Database(version: 1,
    entities: [MUser, MBlock, MDivisi]
)
abstract class AppDatabase extends FloorDatabase{
    MUserDao get userDAO;
    MBlockDao get blockDAO;
    MDivisiDao get divisiDAO;
}
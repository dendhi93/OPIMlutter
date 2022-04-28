
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:opim_flutter/Model/database/dao/MAncakDao.dart';
import 'package:opim_flutter/Model/database/dao/MBlockDao.dart';
import 'package:opim_flutter/Model/database/dao/MDivisiDao.dart';
import 'package:opim_flutter/Model/database/dao/MTphDao.dart';
import 'package:opim_flutter/Model/database/dao/MUserDao.dart';
import 'package:opim_flutter/Model/database/entity/Mdivisi.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';
import 'entity/MAncak.dart';
import 'entity/MBlock.dart';
import 'entity/MTph.dart';
import 'entity/MUser.dart';

part "AppDatabase.g.dart";

@Database(version: 1,
    entities: [MUser, MBlock, MDivisi, MAncak, MTph]
)
abstract class AppDatabase extends FloorDatabase{
    MUserDao get userDAO;
    MBlockDao get blockDAO;
    MDivisiDao get divisiDAO;
    MAncakDao get ancakDAO;
    MTphDao get tphDAO;
}
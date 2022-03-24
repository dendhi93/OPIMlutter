
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:opim_flutter/Model/MUserDao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';
import 'entity/MUser.dart';

part "AppDatabase.g.dart";

@Database(version: 1, entities: [MUser])
abstract class AppDatabase extends FloorDatabase{
    MUserDao get userDAO;
}
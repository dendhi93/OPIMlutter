
import 'package:opim_flutter/Model/database/entity/MBlock.dart';
import 'package:opim_flutter/Model/database/entity/MTph.dart';
import 'package:opim_flutter/Model/database/entity/Mdivisi.dart';

import '../Model/database/AppDatabase.dart';
import '../Model/database/entity/MAncak.dart';

class MasterRepo{
  final database = $FloorAppDatabase.databaseBuilder('opim_database.db').build();
  AppDatabase _appDatabase;

  void initMasterRepo(){
    database.then((onValueDb) {
      _appDatabase = onValueDb;
    });
  }

  void insertBlock(MBlock block) async{
    if(_appDatabase != null){
      await _appDatabase.blockDAO.insertBlock(block);
    }
  }

  void insertDivision(MDivisi division) async{
    if(_appDatabase != null){
      await _appDatabase.divisiDAO.insertDivisi(division);
    }
  }

  void insertAncak(MAncak ancak) async{
    if(_appDatabase != null){
      await _appDatabase.ancakDAO.insertAncak(ancak);
    }
  }

  void insertTph(MTph tph) async {
    if(_appDatabase != null){
      await _appDatabase.tphDAO.insertTph(tph);
    }
  }
}
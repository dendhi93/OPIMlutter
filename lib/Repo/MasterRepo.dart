
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

  void insertBlock(MBlock block){
    if(_appDatabase != null){
      _appDatabase.blockDAO.insertBlock(block);
    }
  }

  void insertDivision(MDivisi division){
    if(_appDatabase != null){
      _appDatabase.divisiDAO.insertDivisi(division);
    }
  }

  void insertAncak(MAncak ancak){
    if(_appDatabase != null){
      _appDatabase.ancakDAO.insertAncak(ancak);
    }
  }

  void insertTph(MTph tph){
    if(_appDatabase != null){
      _appDatabase.tphDAO.insertTph(tph);
    }
  }
}
import 'package:flutter/material.dart';
import 'package:opim_flutter/Model/model_util/GridModel.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../Utils/OpimUtils.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History>{
  OpimUtils _opimUtils = OpimUtils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Text("Riwayat", textAlign: TextAlign.center),
      ),
      body: _initViewHistory(context),);
  }

  Widget _initViewHistory(BuildContext context){
    return Form(
      child: new Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 10.0, top: 10.0),
              child: Text('Pilih Menu ', style:TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 10.0, top: 3.0),
              child: Text("Pilih menu yang akan dikerjakan", style:TextStyle(fontSize: 13, color: Colors.grey)),
            ),
            Expanded(child: Container(
              padding: const EdgeInsets.only(top: 12),
              child:
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 4.0, mainAxisSpacing: 6.0, crossAxisCount: 2),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _gridItem.length,
                itemBuilder: (context, index) {
                  return new GestureDetector(
                    onTap: () {
                      _opimUtils.toastMessage("tekan " +_gridItem[index].name);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => RouteTwo(
                      //         image: _items[index].image,
                      //         name: _items[index].name),
                      //   ),
                      // );
                    },
                    child: Card(
                      color: _gridItem[index].name == "Riwayat Hasil Panen"
                          ? HexColor("#2F80ED") : _gridItem[index].name == "Riwayat Restan"?
                      HexColor("#8BF59C") : HexColor("#A9A9A9"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))
                      ),
                      elevation: 5,
                      margin: EdgeInsets.only(left: 5, right: 5, bottom: 10),
                      child: Center(child: Column(
                        children: <Widget>[
                          Expanded(child: Image.asset(_gridItem[index].image, height: 50,width: 50,)),
                          Text(_gridItem[index].name, style:TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold)),
                          Padding(padding: EdgeInsets.only(bottom: 15.0)),
                        ],
                      ),
                      ),
                    )
                  );
                },
              ),
              )
            )
          ],
        ),
      ),
    );
  }

  final List<GridModel> _gridItem = [
    GridModel("assets/images/ic_panen.png", "Riwayat Hasil Panen"),
    GridModel("assets/images/ic_restan.png", "Riwayat Restan"),
    GridModel("assets/images/ic_street.png", "Riwayat Lapor Jalan"),
    GridModel("assets/images/ic_street.png", "Riwayat Lapor Blok"),
  ];
}
import 'package:anime_project/Controller/data_controller.dart';
import 'package:anime_project/Notifier/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/data_model.dart';
import 'detailPage.dart';

class ListOfData extends StatelessWidget {
  const ListOfData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    AppState providerValue = Provider.of<AppState>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          child: providerValue.loader
              ? CircularProgressIndicator(
                  color: Colors.white,
                )
              : Icon(CupertinoIcons.refresh),
          onPressed: () async {
            providerValue.startLoader(true);
            List<DataModel> list = await DataController().getData();
            providerValue.updataModelData(list);
          },
        ),
        body: Container(
            height: size.height - CupertinoNavigationBar().preferredSize.height,
            width: size.width,
            child: providerValue.dataList.isEmpty
                ? Center(
                    child: Text(
                    "There is no Data!",
                    style: TextStyle(fontSize: 18),
                  ))
                : ListView.builder(
                    itemCount: providerValue.dataList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                        providerValue
                                            .dataList[index].character!,
                                        providerValue.dataList[index].quote!)));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color: Colors.deepPurple.withOpacity(0.5)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: ListTile(
                              title: Text(
                                  providerValue.dataList[index].character!,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.deepPurple)),
                              subtitle: Text(
                                  providerValue.dataList[index].quote
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.indigo)),
                            ),
                          ),
                        ),
                      );
                    })));
  }
}

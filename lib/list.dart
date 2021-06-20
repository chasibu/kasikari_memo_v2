import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'input_form.dart';

class List extends StatefulWidget {
  @override
  _MyList createState() => _MyList();
}

class _MyList extends State<List> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("かしかりメモ"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('promises').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
              if (!snapshot.hasData) return
                Center(child: CircularProgressIndicator());
              if (snapshot.data?.docs.length == 0) return
                Center(child: Text("データが登録されていません"));
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                padding: const EdgeInsets.only(top: 10.0),
                itemBuilder: (context, index) =>
                    _buildListItem(context, snapshot.data!.docs[index]),
              );
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          print("新規作成ボタンを押しました");
          Navigator.push(
            context,
            MaterialPageRoute(
              settings: const RouteSettings(name: "/new"),
              builder: (BuildContext context) => InputForm(null)
            ),
          );
        }
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document){
    String borrowOrLend;
    String limitDate = document['date'].toDate().toString().substring(0,10);
    if (document['borrowOrLend'] == "lend") {
      borrowOrLend = "貸";
    } else {
      borrowOrLend = "借";
    }

    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.android),
            title: Text("【$borrowOrLend】：${document['stuff']}"),
            subtitle: Text(" 期限：$limitDate\n 相手：${document['user']}"),
          ),
          ButtonBarTheme(
            data: ButtonBarThemeData(buttonTextTheme: ButtonTextTheme.accent),
            child: ButtonBar(
              children: <Widget>[
                TextButton(
                  child: const Text("へんしゅう"),
                  onPressed: () {
                    print("編集ボタンを押しました");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        settings: const RouteSettings(name: "/edit"),
                        builder: (BuildContext context) => InputForm(document)
                      ),
                    );
                  }
                ),
              ],
            )
          ),
        ]
      ),
    );
  }
}

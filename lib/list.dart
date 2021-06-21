import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'user_auth.dart';
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              print("ログインボタンを押しました。");
              showBasicDialog(context);
            },
          )
        ]
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

  void showBasicDialog(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String email = "";
    String password = "";
    if(userAuth.currentUser!.isAnonymous) {
      showDialog(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(
              title: Text("ログイン/登録ダイアログ"),
              content: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.mail),
                        labelText: 'Email',
                      ),
                      onSaved: (String? value) {
                        email = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Emailは必須入力項目です';
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.vpn_key),
                        labelText: 'Password',
                      ),
                      onSaved: (String? value) {
                        password = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Passwordは必須入力項目です';
                        } else if (value.length<6) {
                          return 'Passwordは6桁以上です';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
              // ボタンの配置
              actions: <Widget>[
                TextButton(
                    child: Text('キャンセル'),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                ),
                TextButton(
                    child: Text('登録'),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        await _createUser(context, email, password);
                      }
                      Navigator.
                      pushNamedAndRemoveUntil(context, "/list", (_) => false);
                    }
                ),
                TextButton(
                    child: Text('ログイン'),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        await _signIn(context, email, password);
                      }
                      Navigator.
                      pushNamedAndRemoveUntil(context, "/list", (_) => false);
                    }
                ),
              ],
            ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(
              title: Text("確認ダイアログ"),
              content:
              Text(userAuth.currentUser!.email! + " でログインしています。"),
              actions: <Widget>[
                TextButton(
                    child: Text('キャンセル'),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                ),
                TextButton(
                    child: Text('ログアウト'),
                    onPressed: () async {
                      await _signOut();
                      Navigator.
                      pushNamedAndRemoveUntil(context, "/list", (_) => false);
                    }
                ),
              ],
            ),
      );
    }
  }

  Future<void> _signOut() async {
    try {
      await userAuth.signOut();
      await userAuth.signInAnonymously();
    } catch(e) {
      print(e);
      Fluttertoast.showToast(msg: "Firebaseのログインに失敗しました。");
    }
  }


  Future<void> _signIn(BuildContext context,String email, String password) async {
    try {
      await userAuth.signInWithEmailAndPassword(email: email, password: password);
    } catch(e) {
      print(e);
      Fluttertoast.showToast(msg: "Firebaseのログインに失敗しました。");
    }
  }

  Future<void> _createUser(BuildContext context,String email, String password) async {
    try {
      await userAuth.
      createUserWithEmailAndPassword(email: email, password: password);
    } catch(e) {
      print(e);
      Fluttertoast.showToast(msg: "Firebaseの登録に失敗しました。");
    }
  }
}

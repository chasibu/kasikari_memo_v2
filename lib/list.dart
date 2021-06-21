import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'generated/l10n.dart';
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
        title: Text(S.of(context).title),
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
            stream: FirebaseFirestore.instance.collection('users').
                    doc(userAuth.currentUser!.uid).
                    collection("promises").snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
              if (!snapshot.hasData) return
                Center(child: CircularProgressIndicator());
              if (snapshot.data?.docs.length == 0) return
                Center(child: Text(S.of(context).list_no_data));
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
      borrowOrLend = S.of(context).lend;
    } else {
      borrowOrLend = S.of(context).borrow;
    }

    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.android),
            title: Text("【$borrowOrLend】：${document['stuff']}"),
            subtitle: Text("${S.of(context).deadline(limitDate)}\n ${S.of(context).who(document['user'])}"),
          ),
          ButtonBarTheme(
            data: ButtonBarThemeData(buttonTextTheme: ButtonTextTheme.accent),
            child: ButtonBar(
              children: <Widget>[
                TextButton(
                  child: Text(S.of(context).edit),
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
              title: Text(S.of(context).login_register),
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
                          return S.of(context).validate_mail;
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
                          return S.of(context).validate_password_present;
                        } else if (value.length<6) {
                          return S.of(context).validate_password_minimum_length;
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
                    child: Text(S.of(context).cancel),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                ),
                TextButton(
                    child: Text(S.of(context).registration),
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
                    child: Text(S.of(context).login),
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
              title: Text(S.of(context).dialog),
              content: Text(S.of(context).login_user("${userAuth.currentUser!.email}")),
              actions: <Widget>[
                TextButton(
                    child: Text(S.of(context).cancel),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                ),
                TextButton(
                    child: Text(S.of(context).logout),
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
      Fluttertoast.showToast(msg: S.of(context).fail_logout_firebase);
    }
  }


  Future<void> _signIn(BuildContext context,String email, String password) async {
    try {
      await userAuth.signInWithEmailAndPassword(email: email, password: password);
    } catch(e) {
      print(e);
      Fluttertoast.showToast(msg: S.of(context).fail_login_firebase);
    }
  }

  Future<void> _createUser(BuildContext context,String email, String password) async {
    try {
      await userAuth.
      createUserWithEmailAndPassword(email: email, password: password);
    } catch(e) {
      print(e);
      Fluttertoast.showToast(msg: S.of(context).fail_registration_firebase);
    }
  }
}

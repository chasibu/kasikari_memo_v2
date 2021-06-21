import 'package:flutter/material.dart';

import 'list.dart';
import 'splash.dart';
import 'user_auth.dart';

class Initialize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _mailLoginCheck(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Text("接続に失敗しました");
              }
              else if (snapshot.connectionState == ConnectionState.done) {
                return List();
              }
              else {
                return Splash();
              }
            }
        )
    );
  }

  Future _mailLoginCheck() async {
    // メール/パスワードによるログイン状態でない場合は匿名ユーザーでログインする
    if (userAuth.currentUser == null) {
      await userAuth.signInAnonymously();
    }
  }
}

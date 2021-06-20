import 'package:flutter/material.dart';
import 'promise_model.dart';

class InputForm extends StatefulWidget {
  @override
  _MyInputFormState createState() => _MyInputFormState();
}

class _MyInputFormState extends State<InputForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PromiseModel _promise = PromiseModel("borrow", "", "", DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('かしかり入力'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                print("保存ボタンを押しました");
              }
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              print("削除ボタンを押しました");
            },
          ),
        ],
      ),
      body: SafeArea(
        child:
        Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(20.0),
            children: <Widget>[

              RadioListTile(
                value: "borrow",
                groupValue: _promise.borrowOrLend,
                title: Text("借りた"),
                onChanged: (String? value){
                  print("借りたをタッチしました");
                },
              ),
              RadioListTile(
                  value: "lend",
                  groupValue: _promise.borrowOrLend,
                  title: Text("貸した"),
                  onChanged: (String? value) {
                    print("貸したをタッチしました");
                  }
              ),

              TextFormField(
                decoration: InputDecoration(
                  icon: const Icon(Icons.person),
                  hintText: (_promise.borrowOrLend == "lend" ? "貸した人" : "借りた人"),
                  labelText: 'Name',
                ),
                onSaved: (String? value) {
                  _promise.user = value!;
                },
              ),

              TextFormField(
                decoration: InputDecoration(
                  icon: const Icon(Icons.business_center),
                  hintText: (_promise.borrowOrLend == "lend" ? "貸したもの" : "借りたもの"),
                  labelText: 'loan',
                ),
                onSaved: (String? value) {
                  _promise.stuff = value!;
                },
              ),

              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Text(
                    "締め切り日：${_promise.date.toString().substring(0,10)}"
                ),
              ),

              ElevatedButton(
                child: const Text("締め切り日変更"),
                onPressed: (){
                  print("締め切り日変更をタッチしました");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

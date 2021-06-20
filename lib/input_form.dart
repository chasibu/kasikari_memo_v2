import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'promise_model.dart';

class InputForm extends StatefulWidget {
  @override
  _MyInputFormState createState() => _MyInputFormState();
}

class _MyInputFormState extends State<InputForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PromiseModel _promise = PromiseModel("borrow", "", "", DateTime.now());

  void _setLendOrRent(String value){
    setState(() {
      _promise.borrowOrLend = value;
    });
  }

  Future <DateTime?> _selectTime(BuildContext context) {
    return showDatePicker(
        context: context,
        initialDate: _promise.date,
        firstDate: DateTime(_promise.date.year - 2),
        lastDate: DateTime(_promise.date.year + 2)
    );
  }

  @override
  Widget build(BuildContext context) {
    DocumentReference _mainReference =
      FirebaseFirestore.instance.collection('promises').doc();
    return Scaffold(
      appBar: AppBar(
        title: const Text('かしかり入力'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                print("保存ボタンを押しました");
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _mainReference.set(
                    {
                      'borrowOrLend': _promise.borrowOrLend,
                      'user': _promise.user,
                      'stuff': _promise.stuff,
                      'date': _promise.date
                    }
                  );
                  Navigator.pop(context);
                }
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
                  _setLendOrRent(value!);
                },
              ),
              RadioListTile(
                  value: "lend",
                  groupValue: _promise.borrowOrLend,
                  title: Text("貸した"),
                  onChanged: (String? value) {
                    print("貸したをタッチしました");
                    _setLendOrRent(value!);
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
                validator: (value) {
                  if(value!.isEmpty) {
                    return '名前は必須入力です';
                  } else {
                    return null;
                  }
                },
                initialValue: _promise.user,
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
                validator: (value) {
                  if(value!.isEmpty) {
                    return '借りたもの、貸したものは必須入力です';
                  } else {
                    return null;
                  }
                },
                initialValue: _promise.stuff,
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
                  _selectTime(context).then((time){
                    if(time != null && time != _promise.date){
                      setState(() {
                        _promise.date = time;
                      });
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

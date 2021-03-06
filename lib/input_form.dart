import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share/share.dart';

import 'generated/l10n.dart';
import 'promise_model.dart';
import 'user_auth.dart';

class InputForm extends StatefulWidget {
  final DocumentSnapshot? document;
  InputForm(this.document);

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
      FirebaseFirestore.instance.
      collection('users').doc(userAuth.currentUser!.uid).
      collection('promises').doc();
    bool isDeleteDocument = false;
    if(widget.document != null) {
      // 日付・貸し借り情報更新時に、再buildされるため、値が更新されるのを防ぐ
      if(_promise.user == "" && _promise.stuff == "") {
        _promise.borrowOrLend = widget.document!['borrowOrLend'];
        _promise.user = widget.document!['user'];
        _promise.stuff = widget.document!['stuff'];
        _promise.date = widget.document!['date'].toDate();
      }
      _mainReference = FirebaseFirestore.instance.
        collection('users').doc(userAuth.currentUser!.uid).
        collection('promises').doc(widget.document!.id);
      isDeleteDocument = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).input_form),
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
              if (isDeleteDocument) {
                print("削除ボタンを押しました");
                _mainReference.delete();
                Navigator.pop(context);
              } else {
                return null;
              }
            }
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                String _borrowOrLend =
                _promise.borrowOrLend  == "lend" ? S.of(context).lend : S.of(context).borrow;
                Share.share(
                  "【 $_borrowOrLend 】${_promise.stuff}\n"
                  + S.of(context).limit + "：${_promise.date.toString().substring(0,10)}\n"
                  + S.of(context).who(_promise.user)+ "\n"
                  + S.of(context).hash_tag
                );
              }
            },
          )
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
                title: Text(S.of(context).registration_borrow),
                onChanged: (String? value){
                  print("借りたをタッチしました");
                  _setLendOrRent(value!);
                },
              ),
              RadioListTile(
                  value: "lend",
                  groupValue: _promise.borrowOrLend,
                  title: Text(S.of(context).registration_lend),
                  onChanged: (String? value) {
                    print("貸したをタッチしました");
                    _setLendOrRent(value!);
                  }
              ),

              TextFormField(
                decoration: InputDecoration(
                  icon: const Icon(Icons.person),
                  hintText: ( _promise.borrowOrLend == "lend" ? S.of(context).registration_name_lend : S.of(context).registration_name_borrow),
                  labelText: 'Name',
                ),
                onSaved: (String? value) {
                  _promise.user = value!;
                },
                validator: (value) {
                  if(value!.isEmpty) {
                    return S.of(context).validate_name;
                  } else {
                    return null;
                  }
                },
                initialValue: _promise.user,
              ),

              TextFormField(
                decoration: InputDecoration(
                  icon: const Icon(Icons.business_center),
                  hintText: ( _promise.borrowOrLend == "lend" ? S.of(context).registration_loan_lend : S.of(context).registration_loan_borrow),
                  labelText: 'loan',
                ),
                onSaved: (String? value) {
                  _promise.stuff = value!;
                },
                validator: (value) {
                  if(value!.isEmpty) {
                    return S.of(context).validate_loan;
                  } else {
                    return null;
                  }
                },
                initialValue: _promise.stuff,
              ),

              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Text(S.of(context).deadline(_promise.date.toString().substring(0,10))),
              ),

              ElevatedButton(
                child: Text(S.of(context).change_deadline),
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

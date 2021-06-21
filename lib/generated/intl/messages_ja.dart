// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ja locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ja';

  static String m0(time) => "締め切り日:${time}";

  static String m1(user) => "ログイン名：${user}";

  static String m2(name) => "相手：${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "borrow": MessageLookupByLibrary.simpleMessage("借"),
        "cancel": MessageLookupByLibrary.simpleMessage("キャンセル"),
        "change_deadline": MessageLookupByLibrary.simpleMessage("締め切り日変更"),
        "connection_failed": MessageLookupByLibrary.simpleMessage("接続に失敗しました。"),
        "deadline": m0,
        "dialog": MessageLookupByLibrary.simpleMessage("ユーザ情報"),
        "edit": MessageLookupByLibrary.simpleMessage("へんしゅう"),
        "fail_login_firebase":
            MessageLookupByLibrary.simpleMessage("ログインに失敗しました。"),
        "fail_logout_firebase":
            MessageLookupByLibrary.simpleMessage("ログアウトに失敗しました。"),
        "fail_registration_firebase":
            MessageLookupByLibrary.simpleMessage("Firebaseの登録に失敗しました。"),
        "hash_tag": MessageLookupByLibrary.simpleMessage("#かしかりメモ"),
        "input_form": MessageLookupByLibrary.simpleMessage("かしかり入力"),
        "lend": MessageLookupByLibrary.simpleMessage("貸"),
        "limit": MessageLookupByLibrary.simpleMessage("期限"),
        "list_no_data":
            MessageLookupByLibrary.simpleMessage("「＋」から貸し借りをメモしてみましょう！"),
        "login": MessageLookupByLibrary.simpleMessage("ログイン"),
        "login_register": MessageLookupByLibrary.simpleMessage("ログイン/登録ダイアログ"),
        "login_user": m1,
        "logout": MessageLookupByLibrary.simpleMessage("ログアウト"),
        "registration": MessageLookupByLibrary.simpleMessage("登録"),
        "registration_borrow": MessageLookupByLibrary.simpleMessage("借りた"),
        "registration_lend": MessageLookupByLibrary.simpleMessage("貸した"),
        "registration_loan_borrow":
            MessageLookupByLibrary.simpleMessage("借りたもの"),
        "registration_loan_lend": MessageLookupByLibrary.simpleMessage("貸したもの"),
        "registration_name_borrow":
            MessageLookupByLibrary.simpleMessage("借りた人"),
        "registration_name_lend": MessageLookupByLibrary.simpleMessage("貸した人"),
        "title": MessageLookupByLibrary.simpleMessage("かしかりメモ"),
        "validate_loan":
            MessageLookupByLibrary.simpleMessage("借りたもの、貸したものは必須入力項目です。"),
        "validate_mail":
            MessageLookupByLibrary.simpleMessage("Emailは必須入力項目です。"),
        "validate_name": MessageLookupByLibrary.simpleMessage("名前の入力は必須です。"),
        "validate_password_minimum_length":
            MessageLookupByLibrary.simpleMessage("Passwordは6桁以上です。"),
        "validate_password_present":
            MessageLookupByLibrary.simpleMessage("Passwordは必須入力項目です。"),
        "who": m2
      };
}

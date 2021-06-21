// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(time) => "deadline:${time}";

  static String m1(user) => "login user : ${user}";

  static String m2(name) => "Who: ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "borrow": MessageLookupByLibrary.simpleMessage("borrow"),
        "cancel": MessageLookupByLibrary.simpleMessage("cancel"),
        "change_deadline":
            MessageLookupByLibrary.simpleMessage("change_deadline"),
        "connection_failed":
            MessageLookupByLibrary.simpleMessage("Connection failed"),
        "deadline": m0,
        "dialog": MessageLookupByLibrary.simpleMessage("user information"),
        "edit": MessageLookupByLibrary.simpleMessage("edit"),
        "fail_login_firebase":
            MessageLookupByLibrary.simpleMessage("Fail login"),
        "fail_logout_firebase":
            MessageLookupByLibrary.simpleMessage("Fail logout"),
        "fail_registration_firebase":
            MessageLookupByLibrary.simpleMessage("Fail registration"),
        "hash_tag": MessageLookupByLibrary.simpleMessage("#kasikari-memo"),
        "input_form": MessageLookupByLibrary.simpleMessage("input_form"),
        "lend": MessageLookupByLibrary.simpleMessage("lend"),
        "limit": MessageLookupByLibrary.simpleMessage("limit"),
        "list_no_data": MessageLookupByLibrary.simpleMessage(
            "Let`s tap the add button to take a note of your lending and borrowing!"),
        "login": MessageLookupByLibrary.simpleMessage("login"),
        "login_register":
            MessageLookupByLibrary.simpleMessage("login_register"),
        "login_user": m1,
        "logout": MessageLookupByLibrary.simpleMessage("logout"),
        "registration": MessageLookupByLibrary.simpleMessage("Borrow"),
        "registration_borrow": MessageLookupByLibrary.simpleMessage("Lend"),
        "registration_lend":
            MessageLookupByLibrary.simpleMessage("Things I lend"),
        "registration_loan_borrow":
            MessageLookupByLibrary.simpleMessage("Things I borrow"),
        "registration_loan_lend":
            MessageLookupByLibrary.simpleMessage("Things I lend"),
        "registration_name_borrow":
            MessageLookupByLibrary.simpleMessage("From whom"),
        "registration_name_lend":
            MessageLookupByLibrary.simpleMessage("To whom"),
        "title": MessageLookupByLibrary.simpleMessage("kasikari-memo"),
        "validate_loan":
            MessageLookupByLibrary.simpleMessage("Please enter your loan"),
        "validate_mail":
            MessageLookupByLibrary.simpleMessage("Please enter your email"),
        "validate_name":
            MessageLookupByLibrary.simpleMessage("Please enter your name"),
        "validate_password_minimum_length":
            MessageLookupByLibrary.simpleMessage(
                "Password requires 6 digit or more"),
        "validate_password_present":
            MessageLookupByLibrary.simpleMessage("Please enter password"),
        "who": m2
      };
}

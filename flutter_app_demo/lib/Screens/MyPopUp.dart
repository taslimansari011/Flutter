import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showPopup(BuildContext context) {
  var popup = AlertDialog(
    title: Text('Login Alert'),
    content: Text('Login is successful'),
  );

  // ignore: non_constant_identifier_names
  showDialog(context: context, builder: (BuildContext) => popup);
}

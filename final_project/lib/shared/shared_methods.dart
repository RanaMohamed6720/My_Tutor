import 'package:flutter/material.dart';

void goto({required BuildContext context, required Widget screen}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
}

void goback({required BuildContext context}) {
  Navigator.of(context).pop();
}

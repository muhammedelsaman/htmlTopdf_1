import 'package:flutter/material.dart';

void navigateTo(BuildContext context,Widget widget) =>  Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) =>  widget,
  ),
);
void navigateAndFinish(BuildContext context,Widget widget) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>  widget,
      ),
          (Route<dynamic> route) => false,
    );

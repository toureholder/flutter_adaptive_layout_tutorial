import 'package:flutter/material.dart';

Widget makeTestableWidget({
  Widget? subject,
}) {
  return MaterialApp(
    home: subject,
  );
}

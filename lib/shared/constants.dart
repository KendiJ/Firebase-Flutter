import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  hintText: 'Enter email',
  fillColor: Colors.white10,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black12, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 2.0)
  )
);
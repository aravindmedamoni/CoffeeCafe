
import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  prefixIcon: Icon(Icons.person),
  hintText: 'Enter Your Name',
  fillColor: Colors.white,
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(18.0)),
  ),
//  enabledBorder: OutlineInputBorder(
//    borderRadius: BorderRadius.all(Radius.circular(18.0)),
//    borderSide: BorderSide(
//      color: Colors.deepOrange,
//      width: 2.0,
//      style: BorderStyle.solid,
//    ),
//  ),
  focusedBorder:OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(18.0)),
    borderSide: BorderSide(
      color: Colors.deepOrange,
      width: 2.0,
      style: BorderStyle.solid,
    ),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(18.0)),
    borderSide: BorderSide(
      color: Colors.grey,
      width: 2.0,
      style: BorderStyle.solid,
    ),
  ),
);

const kTextStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500
);

const kContainerDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  color: Colors.white,
);
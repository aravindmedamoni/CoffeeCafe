import 'package:flutter/material.dart';

extension WidgetPaddix on Widget {
  Widget paddingAll({double padding}) =>
      Padding(padding: EdgeInsets.all(padding??0.0), child: this);

  Widget paddingOnly({double left, double right, double bottom, double top}) {
    return Padding(
      padding:
      EdgeInsets.only(left: left??0.0, right: right??0.0, bottom: bottom??0.0, top: top??0.0),
      child: this,
    );
  }

  Widget paddingSymmetric({double horizontal, double vertical}){
    return Padding(padding: EdgeInsets.symmetric(vertical: vertical??0.0,horizontal: horizontal??0.0), child: this,);
  }

  Widget paddingFromLRTB({double left, double right, double top, double bottom}){
    return Padding(padding: EdgeInsets.fromLTRB(left??0.0, top??0.0, right??0.0, bottom??0.0), child: this,);
  }
}




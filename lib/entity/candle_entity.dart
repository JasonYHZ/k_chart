import 'dart:ui' as ui;
import 'dart:ui';
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import,camel_case_types
mixin CandleEntity {
  late double open;
  late double high;
  late double low;
  late double close;
  late ui.Image? image;
  Color? borderColor;
  String? nick;
  String? userId;


  List<double>? maValueList;

//  上轨线
  double? up;

//  中轨线
  double? mb;

//  下轨线
  double? dn;

  double? BOLLMA;


}

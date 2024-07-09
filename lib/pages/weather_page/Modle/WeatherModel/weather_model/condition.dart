import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Condition {
String? text;
String icon='sunny';
int? code;

Condition({this.text,  this.icon='sunny', this.code});

Condition.fromJson(Map<String, dynamic> json) {
text = json['text'] as String;
icon = json['icon'] as String;
code = json['code'] as int?;
}
}
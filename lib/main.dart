// Flutter Hive 本地数据库
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

void main() async {
  var box = await Hive.openBox('myBox');
  await box.put('name', 'Alice');
  print(box.get('name'));
}

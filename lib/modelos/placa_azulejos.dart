import 'package:flutter/material.dart';

class PlacaAzulejos {
  final int id;
  String symbol;
  Color color;
  bool enable;

  PlacaAzulejos(
    this.id, {
    this.symbol = '',
    this.color = Colors.black26,
    this.enable = true,
  });
}

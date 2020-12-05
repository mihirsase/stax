import 'package:flutter/material.dart';
import 'package:stax/services/themer.dart';

class Plan {
  final double amount;
  final int duration;
  final Color color;
  final Icon icon;

  Plan(this.amount, this.duration, this.icon, this.color);
}

List<Plan> plans = [
  Plan(
      4247,
      12,
      Icon(
        Icons.check_circle_outline_sharp,
        size: 36,
        color: Colors.white,
      ),
      Themer.instance.palette.onDarkAccent1),
  Plan(
      5580,
      9,
      Icon(
        Icons.radio_button_off_sharp,
        size: 36,
        color: Colors.white,
      ),
      Themer.instance.palette.onDarkAccent2),
  Plan(
      8250,
      6,
      Icon(
        Icons.radio_button_off_sharp,
        size: 36,
        color: Colors.white,
      ),
      Themer.instance.palette.onDarkAccent3),
];

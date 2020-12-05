import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:stax/extentions/double_extention.dart';
import 'package:stax/services/themer.dart';

class CircularSliderAtom extends StatelessWidget {
  final double min;
  final double max;
  final double initialValue;
  final Function(double) onChange;

  const CircularSliderAtom(
      {this.min, this.max, this.initialValue, this.onChange});

  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      min: min,
      max: max,
      initialValue: initialValue,
      appearance: CircularSliderAppearance(
        angleRange: 360,
        startAngle: 270,
        size: 250,
        infoProperties: InfoProperties(
            topLabelText: 'credit amount',
            topLabelStyle: TextStyle(
                fontSize: Themer.instance.font1,
                color: Themer.instance.palette.onLightSecondary),
            mainLabelStyle: TextStyle(
                fontSize: Themer.instance.font6,
                color: Colors.black,
                fontWeight: FontWeight.bold),
            modifier: (double value) {
              return value.toCurrency();
            }),
        customWidths: CustomSliderWidths(progressBarWidth: 15, trackWidth: 15),
        customColors: CustomSliderColors(
            progressBarColor: Themer.instance.palette.onLightAccentDark,
            trackColor: Themer.instance.palette.onLightAccentLight,
            shadowColor: Themer.instance.palette.onLightAccentLight),
      ),
      onChange: onChange,
    );
  }
}

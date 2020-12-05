import 'package:flutter/material.dart';
import 'package:stax/services/themer.dart';

class LayerAtom extends StatelessWidget {
  final double height;
  final int step;
  final int currentStep;
  final Widget title;
  final Widget content;
  final Widget value;
  final void Function(int step) manageClick;

  const LayerAtom({
    this.height,
    this.step,
    this.manageClick,
    this.currentStep,
    this.title,
    this.content,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      height: Themer.instance.height * height,
      width: Themer.instance.width,
      child: Container(
        child: Opacity(
          opacity: step < currentStep ? 0.3 : 1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Themer.instance.radius2),
                  topRight: Radius.circular(Themer.instance.radius2)),
            ),
            color: step > currentStep
                ? Themer.instance.palette.secondary
                : Themer.instance.palette.darkCardColor,
            child: InkWell(
              splashColor: Themer.instance.palette.secondary.withAlpha(30),
              onTap:step == currentStep ? null : () {
                manageClick(step);
              },
              child: Container(
                child: step == currentStep
                    ? content
                    : step < currentStep ? value : title,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:stax/models/plans.dart';
import 'package:stax/extentions/double_extention.dart';
import 'package:stax/services/themer.dart';

class PlanCardMolecule extends StatelessWidget {
  final Plan plan;

  const PlanCardMolecule({this.plan});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(Themer.instance.radius))),
      color: plan.color,
      child: Container(
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(Themer.instance.padding1),
              child: plan.icon,
            ),
            ListTile(
              title: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: plan.amount.toCurrency(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: Themer.instance.font7),
                  ),
                  TextSpan(
                    text: ' /mo',
                    style: TextStyle(
                      color: Colors.white38,
                      fontWeight: FontWeight.bold,
                      fontSize: Themer.instance.font3,
                    ),
                  )
                ]),
              ),
              subtitle: Text(
                'for ${plan.duration} months',
                style: TextStyle(
                  color: Colors.white38,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Themer.instance.padding1, top: Themer.instance.padding),
              child: Text(
                'See calculations',
                style: TextStyle(
                  color: Colors.white24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

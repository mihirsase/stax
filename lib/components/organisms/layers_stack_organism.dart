import 'package:flutter/material.dart';
import 'package:stax/components/atoms/circular_slider_atom.dart';
import 'package:stax/components/atoms/rounded_button_atom.dart';
import 'package:stax/components/molecules/plan_card_molecule.dart';
import 'package:stax/models/plans.dart';
import 'package:stax/components/atoms/layer_atom.dart';
import 'package:stax/extentions/double_extention.dart';
import 'package:stax/services/themer.dart';

class LayersStackOrganism extends StatefulWidget {
  @override
  _LayersStackOrganismState createState() => _LayersStackOrganismState();
}

class _LayersStackOrganismState extends State<LayersStackOrganism> {
  int currentStep;
  double creditAmount;

  @override
  void initState() {
    super.initState();
    currentStep = 1;
    creditAmount = 500000.00;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Stack(
        fit: StackFit.loose,
        children: [
          LayerAtom(
            height: calculateHeight(1),
            step: 1,
            currentStep: currentStep,
            content: firstLayerContent,
            title: null,
            value: firstLayerValue,
            manageClick: manageClick,
          ),
          LayerAtom(
            height: calculateHeight(2),
            step: 2,
            currentStep: currentStep,
            title: secondLayerTitle,
            content: secondLayerContent,
            value: secondLayerValue,
            manageClick: manageClick,
          ),
          LayerAtom(
            height: calculateHeight(3),
            step: 3,
            currentStep: currentStep,
            title: thirdLayerTitle,
            content: thirdLayerContent,
            value: thirdLayerValue,
            manageClick: manageClick,
          ),
          LayerAtom(
            height: calculateHeight(4),
            step: 4,
            currentStep: currentStep,
            title: fourthLayerTitle,
            content: fourthLayerContent,
            value: null,
            manageClick: manageClick,
          ),
        ],
      ),
    );
  }

  void decrementStep() {
    if (currentStep != 1)
      setState(() {
        currentStep = currentStep - 1;
      });
  }

  void manageClick(int step) {
    setState(() {
      currentStep = step;
    });
  }

  Future<bool> _onBackPressed() {
    if (currentStep == 1) {
      decrementStep();
      return Future.value(true);
    } else {
      decrementStep();
      return Future.value(false);
    }
  }

  double calculateHeight(int step) {
    if (step == 1) {
      return Themer.instance.stepHeight5;
    } else if (step == 2) {
      if (step - 1 == currentStep) {
        return Themer.instance.stepHeight1;
      } else if (step <= currentStep) {
        return Themer.instance.stepHeight4;
      } else {
        return Themer.instance.stepHeight0;
      }
    } else if (step == 3) {
      if (step - 1 == currentStep) {
        return Themer.instance.stepHeight1;
      } else if (step <= currentStep) {
        return Themer.instance.stepHeight3;
      } else {
        return Themer.instance.stepHeight0;
      }
    } else {
      if (step - 1 == currentStep) {
        return Themer.instance.stepHeight1;
      } else if (step == currentStep) {
        return Themer.instance.stepHeight2;
      } else {
        return Themer.instance.stepHeight0;
      }
    }
  }

  Widget get firstLayerContent {
    return Column(
      children: [
        ListTile(
          title: Text(
            'mihir, how much do you need?',
            style: TextStyle(
              color: Themer.instance.palette.onDarkCardPrimary,
              fontSize: Themer.instance.font4,
            ),
          ),
          subtitle: Text(
            'move the dial and set any amount you need',
            style: TextStyle(
              color: Themer.instance.palette.onDarkCardSecondary,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(Themer.instance.margin1),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(Themer.instance.radius3)),
            ),
            child: Container(
                padding: EdgeInsets.all(Themer.instance.padding2),
                child: Column(
                  children: [
                    CircularSliderAtom(
                      min: 100000,
                      max: 1000000,
                      initialValue: creditAmount,
                      onChange: (double value) {
                        creditAmount = value;
                      },
                    ),
                    SizedBox(
                      height: Themer.instance.font5,
                    ),
                    Text(
                      'stash is instant. money will be credited within seconds.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: Themer.instance.font2,
                          color: Themer.instance.palette.onLightSecondary),
                    )
                  ],
                )),
          ),
        ),
      ],
    );
  }

  Widget get firstLayerValue {
    return ListTile(
      title: Text(
        'credit amount',
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        creditAmount.toCurrency(),
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget get secondLayerTitle {
    return Align(
      alignment: Alignment.center,
      child: Text(
        'Proceed to EMI section',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget get secondLayerContent {
    return Padding(
      padding: EdgeInsets.only(top: Themer.instance.padding1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              'how do you wish to repay?',
              style: TextStyle(
                color: Themer.instance.palette.onDarkCardPrimary,
                fontSize: Themer.instance.font4,
              ),
            ),
            subtitle: Text(
              'choose one of our recommended plans or make your own',
              style: TextStyle(
                color: Themer.instance.palette.onDarkCardSecondary,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(Themer.instance.padding1),
            child: SizedBox(
              height: 180,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: plans.length,
                itemBuilder: (final BuildContext _, final int index) {
                  return PlanCardMolecule(
                    plan: plans[index],
                  );
                },
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.all(Themer.instance.padding1),
              alignment: Alignment.centerLeft,
              child: RoundedButtonAtom(
                title: 'Create your own plan',
                onPressed: () {},
              ))
        ],
      ),
    );
  }

  Widget get secondLayerValue {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
              child: ListTile(
                title: Text(
                  'EMI',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  '${plans[0].amount.toCurrency()} /mo',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Flexible(
              child: ListTile(
                title: Text(
                  'duration',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  '${plans[0].duration} months',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget get thirdLayerTitle {
    return Align(
      alignment: Alignment.center,
      child: Text(
        'Select your bank account',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget get thirdLayerContent {
    return Padding(
      padding: EdgeInsets.only(top: Themer.instance.padding1),
      child: Column(
        children: [
          ListTile(
            title: Text(
              'where should we send the money?',
              style: TextStyle(
                color: Themer.instance.palette.onDarkCardPrimary,
                fontSize: Themer.instance.font4,
              ),
            ),
            subtitle: Text(
              'amount will be credited to this bank account, EMI will also be debited from this bank account',
              style: TextStyle(
                color: Themer.instance.palette.onDarkCardSecondary,
              ),
            ),
          ),
          SizedBox(
            height: Themer.instance.font5,
          ),
          ListTile(
            title: Text(
              'HDFC Bank',
              style: TextStyle(
                color: Colors.white,
                fontSize: Themer.instance.font3,
              ),
            ),
            subtitle: Text(
              '50100117009192',
              style: TextStyle(
                color: Colors.white38,
              ),
            ),
            trailing: Icon(
              Icons.check_circle,
              color: Colors.white38,
            ),
            leading: Image.asset('lib/assets/hdfc.png')
          ),
          SizedBox(
            height: Themer.instance.font5,
          ),
          Container(
              padding: EdgeInsets.all(Themer.instance.padding1),
              alignment: Alignment.centerLeft,
              child: RoundedButtonAtom(
                title: 'Change account',
                onPressed: () {},
              ))
        ],
      ),
    );
  }

  Widget get thirdLayerValue {
    return ListTile(
      title: Text(
        'bank account',
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        'HDFC Bank',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget get fourthLayerTitle {
    return Align(
      alignment: Alignment.center,
      child: Text(
        'Tap for 1-click KYC',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget get fourthLayerContent {
    return Center(
      child: Text(
        'All done!',
        style: TextStyle(
            color: Themer.instance.palette.onDarkCardPrimary,
            fontSize: Themer.instance.font6),
      ),
    );
  }
}

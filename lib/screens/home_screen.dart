import 'package:flutter/material.dart';
import 'package:stax/components/organisms/layers_stack_organism.dart';
import 'package:stax/services/themer.dart';

class HomeScreen extends StatefulWidget {

  final GlobalKey<NavigatorState> navigatorKey;

  HomeScreen({
    @required final this.navigatorKey,
  });
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Themer.instance.navigatorKey = widget.navigatorKey;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themer.instance.palette.primary,
      body: SafeArea(
        child: LayersStackOrganism(),
      ),
    );
  }

}

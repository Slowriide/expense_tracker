import 'package:control_gastos/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ChartsView extends StatefulWidget {
  const ChartsView({super.key});

  @override
  State<ChartsView> createState() => _ChartsViewState();
}

class _ChartsViewState extends State<ChartsView> {
  @override
  Widget build(BuildContext context) {
    var sizedBox10 = SizedBox(height: 12);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ChartDropdownButton(),
                      sizedBox10,
                      ChartSwitchButton(),
                    ],
                  ),
                ),
                sizedBox10,
                ChartViewContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meal/product/util/constans.dart';
import 'package:shared_preferences/shared_preferences.dart'; // import package

import '../product/color/project_color.dart';

class CustomCounter extends StatefulWidget {
  const CustomCounter({super.key});

  @override
  State<CustomCounter> createState() => _CustomCounterState();
}

class _CustomCounterState extends State<CustomCounter> {
  int _countValue_1 = 0;

  // add this method to load the saved count value when the widget is created
  @override
  void initState() {
    super.initState();
    _loadCountValue();
  }

  // load the saved count value from shared preferences
  void _loadCountValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _countValue_1 = prefs.getInt('countValue') ?? 0;
    });
  }

  // save the current count value to shared preferences
  void _saveCountValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('countValue', _countValue_1);
  }

  void _counterUpdate(bool isIncrement) {
    if (isIncrement) {
      setState(() {
        _countValue_1 += 1;
        _saveCountValue(); // save the count value when it changes
      });
    } else {
      setState(() {
        _countValue_1 = 0;
        _saveCountValue(); // save the count value when it changes
      });
      if (_countValue_1 < 0) {
        _countValue_1 = 0;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [_leftCounter()],
    );
  }

  Row _leftCounter() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            _counterUpdate(false);
          },
          child: const _CounterUpdateContainer("SIFIRLA"),
        ),
        _counterText(),
        InkWell(
          onTap: () {
            _counterUpdate(true);
          },
          child: const _CounterUpdateContainer(
            "ARTTIR",
          ),
        ),
      ],
    );
  }

  Padding _counterText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        _countValue_1.toString(),
        style: TextStyle(
          color: ProjectColor().ddddddColor,
          fontSize: ProjectNum().blurRadius * 5,
        ),
      ),
    );
  }
}

class _CounterUpdateContainer extends StatelessWidget {
  const _CounterUpdateContainer(this.minusPlus);

  final String minusPlus;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: ProjectNum().blurRadius * 8,
        decoration: BoxDecoration(
          borderRadius: Decarations().circular5,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ProjectColor().ddddddColor,
              ProjectColor().ddddddColor,
            ],
          ),
        ),
        child: RepaintBoundary(
          child: Padding(
            padding: ProjectEdgeInsets().def,
            child: Text(
              minusPlus,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ProjectColor().indicatorBG,
                fontSize: ProjectNum().titleMedium * 1,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

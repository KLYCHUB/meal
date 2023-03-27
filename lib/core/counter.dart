import 'package:flutter/material.dart';
import 'package:meal/product/util/constans.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../product/color/project_color.dart';

class CustomCounter extends StatefulWidget {
  const CustomCounter({super.key});

  @override
  State<CustomCounter> createState() => _CustomCounterState();
}

class _CustomCounterState extends State<CustomCounter> {
  int _countValue_1 = 0;

  @override
  void initState() {
    super.initState();
    _loadCountValue();
  }

  void _loadCountValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _countValue_1 = prefs.getInt('countValue') ?? 0;
    });
  }

  void _saveCountValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('countValue', _countValue_1);
  }

  void _counterUpdate(bool isIncrement) {
    if (isIncrement) {
      setState(() {
        _countValue_1 += 1;
        _saveCountValue();
      });
    } else {
      setState(() {
        _countValue_1 = 0;
        _saveCountValue();
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
          child: const _CounterUpdateContainer(icon: Icons.delete),
        ),
        _counterText(),
        InkWell(
          onTap: () {
            _counterUpdate(true);
          },
          child: const _CounterUpdateContainer(icon: Icons.add_circle_outlined),
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
  const _CounterUpdateContainer({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: ProjectNum().blurRadius * 8,
      width: MediaQuery.of(context).size.width / 2.35,
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
          child: Icon(icon),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal/core/bottom_nav_bar.dart';
import 'package:meal/product/color/project_color.dart';
import 'package:meal/product/lang/karma.dart';
import '../core/app_bar_button_link.dart';
import '../product/util/constans.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColor().leylak,
      appBar: AppBar(
        centerTitle: true,
        elevation: ProjectNum().zero,
        automaticallyImplyLeading: false,
        backgroundColor: ProjectColor().leylak,
        title: Text(Karma().yelbegen),
        leading: Padding(
          padding: ProjectEdgeInsets().def,
          child: const ProfileArrowLeft(),
        ),
        actions: [
          Padding(
            padding: ProjectEdgeInsets().def,
            child: AppBarButtonLink(
              linkUrl: Karma().web,
              // ignore: deprecated_member_use
              icon: FontAwesomeIcons.earth,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: ProjectEdgeInsets().h60v30 / 1.5,
        child: Column(
          children: [
            Expanded(
              child: Image(
                image: AssetImage(Karma().logo),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const ProjectBottomNavBar(),
    );
  }
}

class AboutText extends StatelessWidget {
  const AboutText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: ProjectColor().ddddddColor,
                fontWeight: FontWeight.w800,
              ),
        ),
      ),
    );
  }
}

class ProfileArrowLeft extends StatelessWidget {
  const ProfileArrowLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_circle_left_rounded,
        size: ProjectNum().blurRadius * 6,
        shadows: [
          BoxShadow(
            blurRadius: ProjectNum().blurRadius * 2,
            color: ProjectColor().black2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal/core/bottom_nav_bar.dart';
import 'package:meal/product/color/project_color.dart';
import 'package:meal/product/lang/karma.dart';
import '../core/app_bar_buttons.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            HeadlineText(),
            SubjectText(),
            SizedBox(height: 16.0),
            HeadlineText(),
            SubjectText(),
            SizedBox(height: 16.0),
            HeadlineText(),
            SubjectText(),
          ],
        ),
      ),
      bottomNavigationBar: const ProjectBottomNavBar(),
    );
  }
}

class SubjectText extends StatelessWidget {
  const SubjectText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'List of resources goes here',
      style: TextStyle(
        fontSize: 16.0,
        color: Colors.white,
      ),
    );
  }
}

class HeadlineText extends StatelessWidget {
  const HeadlineText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Resources:',
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}

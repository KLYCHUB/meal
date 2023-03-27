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
          children: [
            const HeadlineText(
              headlineText: 'KAYNAKLAR',
            ),
            const SubjectText(
              subjectText: 'kuran.diyanet.gov.tr',
            ),
            height45(),
            const HeadlineText(
              headlineText: 'İLETİŞİM',
            ),
            const SubjectText(
              subjectText: 'klychub.github.io',
            ),
            Padding(
              padding: ProjectEdgeInsets().def / 2,
              child: const SubjectText(
                subjectText: 'yelbegensoftware@gmail.com',
              ),
            ),
            height45(),
            const HeadlineText(
              headlineText: 'ÖNEMLİ',
            ),
            const SubjectText(
              subjectText:
                  'Bu uygulama hiç bir kâr amacı gütmeyen bir uygulamadır. Bu uygulama için de ki ayetlerde herhangi bir hata görürseniz bize bildirin. Bu uygulamadaki verileri kuran.diyanet.gov.tr sitesinden almaktayız...',
            ),
          ],
        ),
      ),
      bottomNavigationBar: const ProjectBottomNavBar(),
    );
  }

  SizedBox height45() => SizedBox(height: ProjectNum().height45);
}

class SubjectText extends StatelessWidget {
  const SubjectText({
    super.key,
    required this.subjectText,
  });

  final String subjectText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ProjectNum().blurRadius * 4),
      child: Text(
        subjectText,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: ProjectColor().ddddddColor,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}

class HeadlineText extends StatelessWidget {
  const HeadlineText({
    super.key,
    required this.headlineText,
  });

  final String headlineText;

  @override
  Widget build(BuildContext context) {
    return Text(
      headlineText,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: ProjectColor().ddddddColor,
            fontWeight: FontWeight.w900,
          ),
    );
  }
}

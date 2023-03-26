import 'dart:math';
import 'package:flutter/material.dart';
import '../core/custom_button.dart';
import '../core/custom_text.dart';
import 'sure_select_screen.dart';
import '../product/color/project_color.dart';
import '../product/lang/random_image_assets.dart';
import '../product/lang/random_sure_ayet_texts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../product/util/constans.dart';

class NextPageRandomText extends StatelessWidget {
  const NextPageRandomText({super.key});

  @override
  Widget build(BuildContext context) {
    SureAyet ayetler = SureAyet();
    Random random = Random();

    List<List<String>> allLists = [
      ayetler.fatiha,
      ayetler.bakara,
      ayetler.aliimran,
    ];

    int randomListIndex = random.nextInt(allLists.length);
    List<String> randomList = allLists[randomListIndex];

    while (randomList.isEmpty) {
      randomListIndex = random.nextInt(allLists.length);
      randomList = allLists[randomListIndex];
    }

    String randomElement = randomList[random.nextInt(randomList.length)];
    int randomElementIndex = randomList.indexOf(randomElement);
    String listName = '';

    switch (randomListIndex) {
      case 0:
        listName = 'Fâtiha';
        break;
      case 1:
        listName = 'Bakara';
        break;
      case 2:
        listName = 'Âl-i İmrân';
        break;

      default:
        break;
    }

    final double mediaQueryWith = MediaQuery.of(context).size.width;
    final double mediaQueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ProjectColor().transparent,
      body: Stack(
        children: [
          Image.asset(
            RandomResimEkrani().randomResimler[RandomInt().rastgeleSayi],
            height: mediaQueryHeight,
            width: mediaQueryWith,
            fit: BoxFit.fill,
          ),
          Container(
            height: mediaQueryHeight,
            color: ProjectColor().overlayColor,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              NextScreenHeadlineText(
                nextScreenText:
                    "$listName Suresi ${randomElementIndex + 1}.Ayet",
                letterSpacing: ProjectNum().letterSpacing,
                fontSize: ProjectNum().titleLarge,
                fontWeight: FontWeight.w900,
              ),
              height100(),
              NextScreenHeadlineText(
                nextScreenText: '"$randomElement"',
                fontSize: ProjectNum().titleMedium,
                letterSpacing: ProjectNum().zero,
                fontWeight: FontWeight.w400,
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: mediaQueryWith / 6,
                  top: mediaQueryWith / 4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrpjectElevatedButton(
                      mediaQueryWith: mediaQueryWith,
                      icon: FaIcon(
                        FontAwesomeIcons.bookQuran,
                        color: ProjectColor().indicatorBG,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            pageBuilder: (_, __, ___) => const SureListesi(),
                            transitionsBuilder: (_, animation, __, child) {
                              return FadeTransition(
                                opacity: Tween(begin: 0.0, end: 1.0).animate(
                                    CurvedAnimation(
                                        parent: animation,
                                        curve: Curves.easeOut)),
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                    ),
                    PrpjectElevatedButton(
                      mediaQueryWith: mediaQueryWith,
                      icon: FaIcon(
                        // ignore: deprecated_member_use
                        FontAwesomeIcons.refresh,
                        color: ProjectColor().indicatorBG,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            pageBuilder: (_, __, ___) =>
                                const NextPageRandomText(),
                            transitionsBuilder: (_, animation, __, child) {
                              return FadeTransition(
                                opacity: Tween(begin: 0.0, end: 1.0).animate(
                                    CurvedAnimation(
                                        parent: animation,
                                        curve: Curves.easeOut)),
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  SizedBox height100() => const SizedBox(height: 100);
}

class RandomInt {
  int rastgeleSayi = Random().nextInt(RandomResimEkrani().randomResimler.length);
}

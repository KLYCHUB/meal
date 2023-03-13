import 'dart:math';
import 'package:flutter/material.dart';
import 'package:meal/page/sure_secim_ekrani.dart';
import '../core/custom_button.dart';
import '../core/custom_circular_indicator.dart';
import '../core/custom_text.dart';
import '../product/color/project_color.dart';
import '../product/lang/next_page_image.dart';
import '../product/lang/sure_ayet_tefsir.dart';
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
      ayetler.nisa,
      ayetler.aliimran,
    ];

    int randomListIndex = random.nextInt(allLists.length);
    List<String> randomList = allLists[randomListIndex];

    // Check if the list is empty
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
      case 3:
        listName = 'Nisâ';
        break;
      case 4:
        listName = 'Mâide';
        break;
      case 5:
        listName = 'En\'âm';
        break;
      case 6:
        listName = 'Araf';
        break;
      case 7:
        listName = 'Enfâl';
        break;
      case 8:
        listName = 'Tevbe';
        break;
      case 9:
        listName = 'Yunus';
        break;
      case 10:
        listName = 'Hud';
        break;
      case 11:
        listName = 'Yusuf';
        break;
      case 12:
        listName = 'Rad';
        break;
      case 13:
        listName = 'İbrahim';
        break;
      case 14:
        listName = 'Hicr';
        break;
      case 15:
        listName = 'Nahl';
        break;
      case 16:
        listName = 'İsrâ';
        break;
      case 17:
        listName = 'Kehf';
        break;
      case 18:
        listName = 'Meryem';
        break;
      case 19:
        listName = 'Tâhâ';
        break;
      case 20:
        listName = 'Enbiyâ';
        break;
      case 21:
        listName = 'Hac';
        break;
      case 22:
        listName = 'Muminun';
        break;
      case 23:
        listName = 'Nûr';
        break;
      case 24:
        listName = 'Furkan';
        break;
      case 25:
        listName = 'Şuarâ';
        break;
      case 26:
        listName = 'Neml';
        break;
      case 27:
        listName = 'Kasas';
        break;
      case 28:
        listName = 'Ankebut';
        break;
      case 29:
        listName = 'Rum';
        break;
      case 30:
        listName = 'Lokman';
        break;
      case 31:
        listName = 'Secde';
        break;
      case 32:
        listName = 'Ahzab';
        break;
      case 33:
        listName = 'Sebe';
        break;
      case 34:
        listName = 'Fâtır';
        break;
      case 35:
        listName = 'Yâsin';
        break;
      case 36:
        listName = 'Sâffât';
        break;
      case 37:
        listName = 'Sâd';
        break;
      case 38:
        listName = 'Zümer';
        break;
      case 39:
        listName = 'Mümin';
        break;
      case 40:
        listName = 'Fussilet';
        break;
      case 41:
        listName = 'Şûrâ';
        break;
      case 42:
        listName = 'Zuhruf';
        break;
      case 43:
        listName = 'Duhân';
        break;
      case 44:
        listName = 'Câsiye';
        break;
      case 45:
        listName = 'Ahkaf';
        break;
      case 46:
        listName = 'Muhammed';
        break;
      case 47:
        listName = 'Fetih';
        break;
      case 48:
        listName = 'Hucurât';
        break;
      case 49:
        listName = 'Kaf';
        break;
      case 50:
        listName = 'Zâriyât';
        break;
      case 51:
        listName = 'Tur';
        break;
      case 52:
        listName = 'Necm';
        break;
      case 53:
        listName = 'Kamer';
        break;
      case 54:
        listName = 'Rahmân';
        break;
      case 55:
        listName = 'Vâkıa';
        break;
      case 56:
        listName = 'Hadid';
        break;
      case 57:
        listName = 'Mücadele';
        break;
      case 58:
        listName = 'Haşr';
        break;
      case 59:
        listName = 'Mümtehine';
        break;
      case 60:
        listName = 'Saff';
        break;
      case 61:
        listName = 'Cuma';
        break;
      case 62:
        listName = 'Münafikun';
        break;
      case 63:
        listName = 'Tegabun';
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
            NextPageImage().nextPageImage[RandomInt().rastgeleSayi],
            height: mediaQueryHeight,
            width: mediaQueryWith,
            fit: BoxFit.fill,
          ),
          Container(
            height: mediaQueryHeight,
            color: ProjectColor().overlayColor,
          ),
          FutureBuilder(
            future: Future.delayed(const Duration(milliseconds: 500)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Center(
                  child: Column(
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
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const SureSecim(),
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
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const NextPageRandomText(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return ProjectCircularProgressIndicator(
                  mediaQueryWith: mediaQueryWith,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  SizedBox height100() => const SizedBox(height: 100);
}

class RandomInt {
  int rastgeleSayi = Random().nextInt(NextPageImage().nextPageImage.length);
}

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:meal/unused/ayet_ekran%C4%B1.dart';
import 'package:meal/page/next_page_random_sure_ayet.dart';
import 'package:meal/product/color/project_color.dart';
import 'package:meal/product/lang/karma.dart';
import 'package:meal/product/lang/next_page_image.dart';
import 'package:meal/product/lang/sure_bilgileri.dart';
import 'package:meal/product/util/constans.dart';

import 'core/bottom_nav_bar.dart';
import 'core/sure_text.dart';

class SurahListPage extends StatefulWidget {
  const SurahListPage({Key? key}) : super(key: key);

  @override
  State<SurahListPage> createState() => _SurahListPageState();
}

class _SurahListPageState extends State<SurahListPage> {
  final TextEditingController _searchController = TextEditingController();

  void _filterSureBilgileri(String query) {
    setState(() {});
  }

  List<Surah> surahs = [
    Surah(name: "Al-Fatiha", url: "https://www.mealikerim.com/1/fatiha"),
    Surah(name: "Al-Baqarah", url: "https://www.mealikerim.com/2/bakara"),
    Surah(name: "Ali 'Imran", url: "https://www.mealikerim.com/3/ali-imran"),
    Surah(name: "An-Nisa'", url: "https://www.mealikerim.com/4/nisa"),
    Surah(name: "Al-Ma'idah", url: "https://www.mealikerim.com/5/maide"),
    Surah(name: "Al-An'am", url: "https://www.mealikerim.com/6/enam"),
    Surah(name: "Al-A'raf", url: "https://www.mealikerim.com/7/araf"),
    Surah(name: "Al-Anfal", url: "https://www.mealikerim.com/8/anfal"),
    Surah(name: "At-Tawbah", url: "https://www.mealikerim.com/9/tawba"),
    Surah(name: "Yunus", url: "https://www.mealikerim.com/10/yunus"),
    Surah(name: "Hud", url: "https://www.mealikerim.com/11/hud"),
    Surah(name: "Yusuf", url: "https://www.mealikerim.com/12/yusuf"),
    Surah(name: "Ar-Ra'd", url: "https://www.mealikerim.com/13/rad"),
    Surah(name: "Ibrahim", url: "https://www.mealikerim.com/14/ibrahim"),
    Surah(name: "Al-Hijr", url: "https://www.mealikerim.com/15/hicr"),
    Surah(name: "An-Nahl", url: "https://www.mealikerim.com/16/nahl"),
    Surah(name: "Al-Isra'", url: "https://www.mealikerim.com/17/isra"),
    Surah(name: "Al-Kahf", url: "https://www.mealikerim.com/18/kehf"),
    Surah(name: "Maryam", url: "https://www.mealikerim.com/19/maryam"),
    Surah(name: "Taha", url: "https://www.mealikerim.com/20/taha"),
    Surah(name: "Al-Anbiya'", url: "https://www.mealikerim.com/21/enbiya"),
    Surah(name: "Al-Hajj", url: "https://www.mealikerim.com/22/hac"),
    Surah(name: "Al-Mu'minun", url: "https://www.mealikerim.com/23/muminun"),
    Surah(name: "An-Nur", url: "https://www.mealikerim.com/24/nur"),
    Surah(name: "Al-Furqan", url: "https://www.mealikerim.com/25/furkan"),
    Surah(name: "Ash-Shu'ara", url: "https://www.mealikerim.com/26/suara"),
    Surah(name: "An-Naml", url: "https://www.mealikerim.com/27/neml"),
    Surah(name: "Al-Qasas", url: "https://www.mealikerim.com/28/kasas"),
    Surah(name: "Al-Ankabut", url: "https://www.mealikerim.com/29/ankabut"),
    Surah(name: "Al-Rum", url: "https://www.mealikerim.com/30/rum"),
    Surah(name: "Luqman", url: "https://www.mealikerim.com/31/luhuf"),
    Surah(name: "Al-Sajdah", url: "https://www.mealikerim.com/32/sac"),
    Surah(name: "Al-Ahzab", url: "https://www.mealikerim.com/33/ahzab"),
    Surah(name: "Saba", url: "https://www.mealikerim.com/34/saba"),
    Surah(name: "Al-Fatir", url: "https://www.mealikerim.com/35/fatir"),
    Surah(name: "Yasin", url: "https://www.mealikerim.com/36/yasin"),
    Surah(name: "As-Saffat", url: "https://www.mealikerim.com/37/saffat"),
    Surah(name: "Sad", url: "https://www.mealikerim.com/38/sad"),
    Surah(name: "Az-Zumar", url: "https://www.mealikerim.com/39/zumer"),
    Surah(name: "Ghafir", url: "https://www.mealikerim.com/40/ghafir"),
    Surah(name: "Fussilat", url: "https://www.mealikerim.com/41/fussilet"),
    Surah(name: "Ash-Shura", url: "https://www.mealikerim.com/42/sura"),
    Surah(name: "Az-Zukhruf", url: "https://www.mealikerim.com/43/zuhruf"),
    Surah(name: "Ad-Dukhan", url: "https://www.mealikerim.com/44/dukhan"),
    Surah(name: "Al-Jathiya", url: "https://www.mealikerim.com/45/jasiye"),
    Surah(name: "Al-Ahqaf", url: "https://www.mealikerim.com/46/ahkaf"),
    Surah(name: "Muhammad", url: "https://www.mealikerim.com/47/muhammed"),
    Surah(name: "Al-Fath", url: "https://www.mealikerim.com/48/fetih"),
    Surah(name: "Al-Hujurat", url: "https://www.mealikerim.com/49/hucurat"),
    Surah(name: "Qaf", url: "https://www.mealikerim.com/50/qaf"),
    Surah(name: "Adh-Dhariyat", url: "https://www.mealikerim.com/51/zariyat"),
    Surah(name: "At-Tur", url: "https://www.mealikerim.com/52/tur"),
    Surah(name: "An-Najm", url: "https://www.mealikerim.com/53/necm"),
    Surah(name: "Al-Qamar", url: "https://www.mealikerim.com/54/kamer"),
    Surah(name: "Ar-Rahman", url: "https://www.mealikerim.com/55/rahman"),
    Surah(name: "Al-Waqi'a", url: "https://www.mealikerim.com/56/vakia"),
    Surah(name: "Al-Hadid", url: "https://www.mealikerim.com/57/hadid"),
    Surah(name: "Al-Mujadila", url: "https://www.mealikerim.com/58/mucadile"),
    Surah(name: "Al-Hashr", url: "https://www.mealikerim.com/59/hashr"),
    Surah(
        name: "Al-Mumtahanah", url: "https://www.mealikerim.com/60/mumtehine"),
    Surah(name: "As-Saff", url: "https://www.mealikerim.com/61/saff"),
    Surah(name: "Al-Jumu'ah", url: "https://www.mealikerim.com/62/cuma"),
    Surah(name: "Al-Munafiqun", url: "https://www.mealikerim.com/63/munafikun"),
    Surah(name: "At-Taghabun", url: "https://www.mealikerim.com/64/tagabun"),
    Surah(name: "At-Talaq", url: "https://www.mealikerim.com/65/talaq"),
    Surah(name: "At-Tahrim", url: "https://www.mealikerim.com/66/tahrim"),
    Surah(name: "Al-Mulk", url: "https://www.mealikerim.com/67/mulk"),
    Surah(name: "Al-Qalam", url: "https://www.mealikerim.com/68/kalem"),
    Surah(name: "Al-Haaqqah", url: "https://www.mealikerim.com/69/hakka"),
    Surah(name: "Al-Ma'arij", url: "https://www.mealikerim.com/70/maarij"),
    Surah(name: "Nuh", url: "https://www.mealikerim.com/71/nuh"),
    Surah(name: "Al-Jinn", url: "https://www.mealikerim.com/72/cin"),
    Surah(name: "Al-Muzzammil", url: "https://www.mealikerim.com/73/muzzammil"),
    Surah(
        name: "Al-Muddaththir", url: "https://www.mealikerim.com/74/muddassir"),
    Surah(name: "Al-Qiyamah", url: "https://www.mealikerim.com/75/kıyamet"),
    Surah(name: "Al-Insan", url: "https://www.mealikerim.com/76/insan"),
    Surah(name: "Al-Mursalat", url: "https://www.mealikerim.com/77/mursalat"),
    Surah(name: "An-Naba'", url: "https://www.mealikerim.com/78/nebe"),
    Surah(name: "An-Nazi'at", url: "https://www.mealikerim.com/79/nazi-at"),
    Surah(name: "'Abasa", url: "https://www.mealikerim.com/80/abese"),
    Surah(name: "At-Takwir", url: "https://www.mealikerim.com/81/takvir"),
    Surah(name: "Al-Infitar", url: "https://www.mealikerim.com/82/infitar"),
    Surah(
        name: "Al-Mutaffifin", url: "https://www.mealikerim.com/83/mutaffifin"),
    Surah(name: "Al-Inshiqaq", url: "https://www.mealikerim.com/84/inşikak"),
    Surah(name: "Al-Buruj", url: "https://www.mealikerim.com/85/buruc"),
    Surah(name: "At-Tariq", url: "https://www.mealikerim.com/86/tariq"),
    Surah(name: "Al-A'la", url: "https://www.mealikerim.com/87/a-la"),
    Surah(name: "Al-Ghashiya", url: "https://www.mealikerim.com/88/ghasiye"),
    Surah(name: "Al-Fajr", url: "https://www.mealikerim.com/89/fecr"),
    Surah(name: "Al-Balad", url: "https://www.mealikerim.com/90/belad"),
    Surah(name: "Ash-Shams", url: "https://www.mealikerim.com/91/semse"),
    Surah(name: "Al-Layl", url: "https://www.mealikerim.com/92/leyl"),
    Surah(name: "Ad-Dhuha", url: "https://www.mealikerim.com/93/duha"),
    Surah(name: "Ash-Sharh", url: "https://www.mealikerim.com/94/insirah"),
    Surah(name: "At-Tin", url: "https://www.mealikerim.com/95/tin"),
    Surah(name: "Al-Alaq", url: "https://www.mealikerim.com/96/alaq"),
    Surah(name: "Al-Qadr", url: "https://www.mealikerim.com/97/kadir"),
    Surah(name: "Al-Bayyina", url: "https://www.mealikerim.com/98/beyyine"),
    Surah(name: "Az-Zalzala", url: "https://www.mealikerim.com/99/zilzal"),
    Surah(name: "Al-'Adiyat", url: "https://www.mealikerim.com/100/adiyat"),
    Surah(name: "Al-Qaria", url: "https://www.mealikerim.com/101/karia"),
    Surah(name: "At-Takathur", url: "https://www.mealikerim.com/102/takasur"),
    Surah(name: "Al-Asr", url: "https://www.mealikerim.com/103/asr"),
    Surah(name: "Al-Humaza", url: "https://www.mealikerim.com/104/humaze"),
    Surah(name: "Al-Fil", url: "https://www.mealikerim.com/105/fil"),
    Surah(name: "Quraish", url: "https://www.mealikerim.com/106/kureyş"),
    Surah(name: "Al-Ma'un", url: "https://www.mealikerim.com/107/maun"),
    Surah(name: "Al-Kawthar", url: "https://www.mealikerim.com/108/kevser"),
    Surah(name: "Al-Kafirun", url: "https://www.mealikerim.com/109/kafirun"),
    Surah(name: "An-Nasr", url: "https://www.mealikerim.com/110/nasr"),
    Surah(name: "Al-Masad", url: "https://www.mealikerim.com/111/mesed"),
    Surah(name: "Al-Ikhlas", url: "https://www.mealikerim.com/112/ihlas"),
    Surah(name: "Al-Falaq", url: "https://www.mealikerim.com/113/felak"),
    Surah(name: "An-Nas", url: "https://www.mealikerim.com/114/nas"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColor().leylak,
      appBar: AppBar(
        elevation: ProjectNum().zero,
        automaticallyImplyLeading: false,
        backgroundColor: ProjectColor().leylak,
        leading: Padding(
          padding: ProjectEdgeInsets().def,
          child: const ArrowLeft(),
        ),
        actions: [
          Padding(
            padding: ProjectEdgeInsets().def,
            child: const PersonButton(),
          )
        ],
        title: SizedBox(
          height: ProjectNum().height45,
          child: _TextField(),
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          final sureText = Sure().sureBilgileri[index];

          // Arama metni varsa ve aranılan metin bulunamazsa null döndürür
          if (_searchController.text.isNotEmpty &&
              !sureText
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase())) {
            return const SizedBox.shrink();
          }

          return ListTile(
            title: Container(
              alignment: Alignment.center,
              height: ProjectNum().height45 * 2.5,
              decoration: BoxDecoration(
                color: ProjectColor().ddddddColor,
                borderRadius: Decarations().circular5,
                boxShadow: [
                  BoxShadow(
                    blurRadius: ProjectNum().blurRadius,
                    color: ProjectColor().black2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: SureText(
                nextScreenText: sureText,
                fontWeight: FontWeight.w900,
                letterSpacing: ProjectNum().zero,
                fontSize: ProjectNum().titleMedium,
                maxLines: 100,
                overflow: TextOverflow.visible,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 500),
                  pageBuilder: (_, __, ___) => SurahPage(surah: surahs[index]),
                  transitionsBuilder: (_, animation, __, child) {
                    return FadeTransition(
                      opacity: Tween(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeOut,
                        ),
                      ),
                      child: child,
                    );
                  },
                ),
              );
            },
          );
        },
        itemCount: surahs.length,
      ),
      bottomNavigationBar: const ProjectBottomNavBar(),
    );
  }

  // ignore: non_constant_identifier_names
  TextFormField _TextField() {
    return TextFormField(
      controller: _searchController,
      onChanged: _filterSureBilgileri,
      cursorColor: ProjectColor().indicatorBG,
      style: TextStyle(
        color: ProjectColor().indicatorBG,
        fontSize: ProjectNum().titleMedium,
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ProjectColor().black,
          ),
        ),
        hintStyle: TextStyle(
          color: ProjectColor().indicatorBG,
        ),
        border: const OutlineInputBorder(),
        prefixIcon: Icon(
          Icons.search,
          color: ProjectColor().indicatorBG,
        ),
        isDense: true,
        filled: true,
        hintText: Karma().textFieldText,
        fillColor: ProjectColor().ddddddColor,
        contentPadding: ProjectEdgeInsets().horizontal20,
        labelStyle: TextStyle(
          color: ProjectColor().indicatorBG,
        ),
      ),
    );
  }
}

//------------------------------------------------------------------------------

class SurahPage extends StatefulWidget {
  final Surah surah;

  const SurahPage({Key? key, required this.surah}) : super(key: key);

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  List<Ayet> ayetler = [];
  bool isLoading = false;

  Future<void> getData() async {
    setState(() {
      isLoading = true;
    });
    var res = await http.get(Uri.parse(widget.surah.url));
    final body = res.body;
    final document = parser.parse(body);
    var ayetElements = document
        .getElementsByClassName(
            "ayah-item list-group bg-white list-group-lg no-bg auto animated fadeInUp")[0]
        .getElementsByClassName("list-group-item ayah-item clearfix onhover");
    for (var element in ayetElements) {
      var ayetText = element.children[3].children[0].text.toString();
      setState(() {
        ayetler.add(Ayet(text: ayetText));
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  final TextEditingController _searchController = TextEditingController();

  void _filterSureBilgileri(String query) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColor().leylak,
      appBar: AppBar(
        leading: Padding(
          padding: ProjectEdgeInsets().def,
          child: const ArrowLeft2(),
        ),
        actions: [
          Padding(
            padding: ProjectEdgeInsets().def,
            child: const PersonButton(),
          )
        ],
        elevation: ProjectNum().zero,
        automaticallyImplyLeading: false,
        backgroundColor: ProjectColor().leylak,
        title: SizedBox(
          height: ProjectNum().height45,
          child: TextFormField(
            controller: _searchController,
            onChanged: _filterSureBilgileri,
            cursorColor: ProjectColor().indicatorBG,
            style: TextStyle(
              color: ProjectColor().indicatorBG,
              fontSize: ProjectNum().titleMedium,
            ),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ProjectColor().ddddddColor,
                ),
              ),
              hintStyle: TextStyle(
                color: ProjectColor().indicatorBG,
              ),
              border: const OutlineInputBorder(),
              prefixIcon: Icon(Icons.search, color: ProjectColor().indicatorBG),
              isDense: true,
              filled: true,
              hintText: Karma().textFieldText2,
              fillColor: ProjectColor().ddddddColor,
              contentPadding: ProjectEdgeInsets().horizontal20,
              labelStyle: TextStyle(color: ProjectColor().indicatorBG),
            ),
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: ProjectEdgeInsets().top20,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  final sureText = "${index + 1}";

                  // Arama metni varsa ve aranılan metin bulunamazsa null döndürür
                  if (_searchController.text.isNotEmpty &&
                      !sureText
                          .toLowerCase()
                          .contains(_searchController.text.toLowerCase())) {
                    return const SizedBox.shrink();
                  }
                  return GestureDetector(
                    child: Row(
                      children: [
                        Padding(
                          padding: ProjectEdgeInsets().horizontal20,
                          child: Padding(
                            padding: ProjectEdgeInsets().vertical20,
                            child: FlipCard(
                              alignment: Alignment.center,
                              front: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: ProjectColor().ddddddColor,
                                        borderRadius: Decarations().circular25,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius:
                                                ProjectNum().blurRadius * 2,
                                            color: ProjectColor().black2,
                                            offset: const Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                      width: MediaQuery.of(context).size.width /
                                          1.1,
                                      child: Padding(
                                        padding: ProjectEdgeInsets().def * 2,
                                        child: SingleChildScrollView(
                                          child: SureText(
                                            nextScreenText: ayetler[index].text,
                                            fontSize: ProjectNum().titleMedium,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: ProjectNum().zero,
                                            maxLines: 100,
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: ProjectEdgeInsets().top20,
                                    child: Text(
                                      "${index + 1}. Ayet",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            color: ProjectColor().ddddddColor,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              back: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: ProjectColor().ddddddColor,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: ProjectNum().blurRadius * 2,
                                      color: ProjectColor().black2,
                                      offset: const Offset(0, 0),
                                    ),
                                  ],
                                ),
                                width: MediaQuery.of(context).size.width / 1.1,
                                child: Image.asset(
                                  NextPageImage()
                                      .nextPageImage[RandomInt().rastgeleSayi],
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              direction: FlipDirection.VERTICAL,
                              speed: 500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: ayetler.length,
              ),
            ),
      bottomNavigationBar: const ProjectBottomNavBar(),
    );
  }
}

class ArrowLeft extends StatelessWidget {
  const ArrowLeft({super.key});

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
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (_, __, ___) => const NextPageRandomText(),
            transitionsBuilder: (_, animation, __, child) {
              return FadeTransition(
                opacity: Tween(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(parent: animation, curve: Curves.easeOut)),
                child: child,
              );
            },
          ),
        );
      },
    );
  }
}

class ArrowLeft2 extends StatelessWidget {
  const ArrowLeft2({
    super.key,
  });

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
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (_, __, ___) => const SurahListPage(),
            transitionsBuilder: (_, animation, __, child) {
              return FadeTransition(
                opacity: Tween(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(parent: animation, curve: Curves.easeOut)),
                child: child,
              );
            },
          ),
        );
      },
    );
  }
}

class Surah {
  String name;
  String url;

  Surah({required this.name, required this.url});
}

class Ayet {
  String text;

  Ayet({required this.text});
}

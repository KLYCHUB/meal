// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:meal/product/lang/random_image_assets.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:flip_card/flip_card.dart';
import '../core/app_bar_buttons.dart';
import '../core/bottom_nav_bar.dart';
import '../core/sure_text.dart';
import 'sure_select_screen.dart';
import '../product/color/project_color.dart';
import '../product/lang/karma.dart';
import '../product/util/constans.dart';
import 'random_sure_image.dart';

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
                                  RandomResimEkrani()
                                      .randomResimler[RandomInt().rastgeleSayi],
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

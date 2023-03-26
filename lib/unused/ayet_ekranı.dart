// ignore_for_file: file_names
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:meal/page/profile.dart';
import '../core/bottom_nav_bar.dart';
import '../core/sure_text.dart';
import '../product/color/project_color.dart';
import '../product/lang/karma.dart';
import '../product/lang/next_page_image.dart';
import 'sure_ayet_tefsir.dart';
import '../product/util/constans.dart';
import '../page/next_page_random_sure_ayet.dart';

class AyetOkumaEkrani extends StatefulWidget {
  final int pageIndex;

  const AyetOkumaEkrani({Key? key, required this.pageIndex}) : super(key: key);

  @override
  State<AyetOkumaEkrani> createState() => _AyetOkumaEkraniState();
}

class _AyetOkumaEkraniState extends State<AyetOkumaEkrani> {
  final TextEditingController _searchController = TextEditingController();

  void _filterSureBilgileri(String query) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: ProjectEdgeInsets().def,
          //child: const ArrowLeft2(),
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
      backgroundColor: ProjectColor().leylak,
      body: SizedBox(
        height: MediaQuery.of(context).size.height / 1.4,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
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
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ProjectColor().ddddddColor,
                                borderRadius: Decarations().circular25,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: ProjectNum().blurRadius * 2,
                                    color: ProjectColor().black2,
                                    offset: const Offset(0, 0),
                                  ),
                                ],
                              ),
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: Padding(
                                padding: ProjectEdgeInsets().def * 2,
                                child: SingleChildScrollView(
                                  child: SureText(
                                    nextScreenText: SureAyet().getListItem(
                                      widget.pageIndex,
                                      index,
                                    ),
                                    fontSize: ProjectNum().titleMedium,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: ProjectNum().zero,
                                    maxLines: 100,
                                    overflow: TextOverflow.visible,
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
          itemCount: SureAyet().itemCount(widget.pageIndex),
        ),
      ),
      bottomNavigationBar: const ProjectBottomNavBar(),
    );
  }
}

class PersonButton extends StatelessWidget {
  const PersonButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (_, __, ___) => const Profile(),
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
      icon: Icon(
        Icons.person,
        size: ProjectNum().blurRadius * 6,
        shadows: [
          BoxShadow(
            blurRadius: ProjectNum().blurRadius * 2,
            color: ProjectColor().black2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
    );
  }
}



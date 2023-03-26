import 'package:flutter/material.dart';
import 'package:meal/page/next_page_random_sure_ayet.dart';
import '../core/bottom_nav_bar.dart';
import '../core/sure_text.dart';
import '../product/color/project_color.dart';
import '../product/lang/karma.dart';
import '../product/lang/sure_bilgileri.dart';
import '../product/util/constans.dart';
import 'ayet_ekranı.dart';

class SureSecim extends StatefulWidget {
  const SureSecim({super.key});

  @override
  State<SureSecim> createState() => _SureSecimState();
}

class _SureSecimState extends State<SureSecim> {
  final TextEditingController _searchController = TextEditingController();

  void _filterSureBilgileri(String query) {
    setState(() {});
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: ProjectColor().leylak,
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: Sure().sureBilgileri.length,
        itemBuilder: (BuildContext context, int index) {
          final sureText = Sure().sureBilgileri[index];

          // Arama metni varsa ve aranılan metin bulunamazsa null döndürür
          if (_searchController.text.isNotEmpty &&
              !sureText
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase())) {
            return const SizedBox.shrink();
          }

          return Row(
            children: [
              Expanded(
                child: Padding(
                  padding: ProjectEdgeInsets().listSymetric,
                  child: InkWell(
                    onTap: () {
                      currentIndex = index;
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 500),
                          pageBuilder: (_, __, ___) =>
                              AyetOkumaEkrani(pageIndex: index),
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
                    child: Container(
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
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: const ProjectBottomNavBar(),
    );
  }

  //----------------------------------------------------------------------------

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
//
                          
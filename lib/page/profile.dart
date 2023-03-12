import 'package:flutter/material.dart';
import 'package:meal/core/bottom_nav_bar.dart';
import 'package:meal/page/ayet_ekran%C4%B1.dart';
import 'package:meal/product/color/project_color.dart';
import 'package:meal/product/lang/karma.dart';
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
      backgroundColor: ProjectColor().indicatorBG,
      appBar: AppBar(
        centerTitle: true,
        elevation: ProjectNum().zero,
        automaticallyImplyLeading: false,
        backgroundColor: ProjectColor().indicatorBG,
        title: Text(Karma().bismillah),
        leading: const ArrowLeft(),
        actions: [
          Padding(
            padding: ProjectEdgeInsets().def,
            child: CircleAvatar(
              radius: 14,
              backgroundColor: ProjectColor().ddddddColor,
            ),
          )
        ],
      ),
      body: Padding(
        padding: ProjectEdgeInsets().h60v30,
        child: Column(
          children: [
            const Spacer(),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Alt gezinme Çubuğundaki 1. Buton 'Cami' sizin önünüze rastgele ayetler getirir. Yenileme tuşuna bastığınız da ise farklı ayaetler gösterir. ",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ProjectColor().ddddddColor,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "2. Buton 'Kalem' size not defteri sayfasını açıyor. Bu sayfa da istediğiniz notu alabilirsiniz. Notları silmek içinse notu sağa ya da sola kkaydırabilirsiniz",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ProjectColor().ddddddColor,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "3. Buton 'Report' Sureler de veya ayetlerde yanlışlık görürseniz bize e psota aracılığı ile bize bildirmeniz. Buna çok dikkat edin bu bizim için büyük bir sorumluluk ve yanlış yapmak istemiyoruz",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: ProjectColor().ddddddColor,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
            ),
            const Spacer()
          ],
        ),
      ),
      bottomNavigationBar: const ProjectBottomNavBar(),
    );
  }
}

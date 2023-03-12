import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal/core/bottom_nav_bar.dart';
import 'package:meal/page/ayet_ekran%C4%B1.dart';
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
      backgroundColor: ProjectColor().indicatorBG,
      appBar: AppBar(
        centerTitle: true,
        elevation: ProjectNum().zero,
        automaticallyImplyLeading: false,
        backgroundColor: ProjectColor().indicatorBG,
        title: Text(Karma().yelbegen),
        leading: const ArrowLeft(),
        actions: [
          Padding(
            padding: ProjectEdgeInsets().def,
            child: const AppBarButtonLink(
              linkUrl: 'https://flutter.dev',
              // ignore: deprecated_member_use
              icon: FontAwesomeIcons.earth,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: ProjectEdgeInsets().h60v30 / 2,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Sağ üst butondan daha fazla bilgiye ve bize ulaşabilirsiniz",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ProjectColor().ddddddColor,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Açılış ekranından sonra aşılan sayfada kitap işareti bulunan buton surelerin olduğu sayfayı açar diğer buton ise karşınıza rastgele ayetler getirir",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: ProjectColor().ddddddColor,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "1. Buton 'Cami' sizin önünüze rastgele ayetler getirir. Yenileme tuşuna bastığınız da ise farklı ayaetler gösterir",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ProjectColor().ddddddColor,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "2. Buton 'Kalem' size not defteri sayfasını açıyor. Bu sayfa da istediğiniz notu alabilirsiniz. Notları silmek içinse notu sağa ya da sola kkaydırabilirsiniz",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ProjectColor().ddddddColor,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "3. Buton 'Report' Sureler de veya ayetlerde yanlışlık görürseniz bize e psota aracılığı ile bize bildirmeniz. Buna çok dikkat edin bu bizim için büyük bir sorumluluk ve yanlış yapmak istemiyoruz",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: ProjectColor().ddddddColor,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Ayet okurken üsteki arama çubuğundan ayet numarasını aratmanız yeterlidir. Sure ararken ise surenin adını yazmalısınız",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: ProjectColor().ddddddColor,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const ProjectBottomNavBar(),
    );
  }
}

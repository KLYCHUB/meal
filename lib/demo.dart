import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:meal/core/ayetler.dart';

class Ayetler extends StatefulWidget {
  const Ayetler({super.key});

  @override
  State<Ayetler> createState() => _AyetlerState();
}

class _AyetlerState extends State<Ayetler> {
  List<AyetlerFull> ayetler = [];
  bool isLoading = false;
  var url = Uri.parse("https://www.mealikerim.com/4/nisa");
  var data = "NULL";

  Future getData() async {
    setState(() {
      isLoading = true;
    });
    var res = await http.get(url);
    final body = res.body;
    final document = parser.parse(body);
    // ignore: unused_local_variable
    var response = document
        .getElementsByClassName(
            "ayah-item list-group bg-white list-group-lg no-bg auto animated fadeInUp")[0]
        .getElementsByClassName("list-group-item ayah-item clearfix onhover")
        .forEach(
      (element) {
        setState(() {
          ayetler.add(
            AyetlerFull(ayet: element.children[3].children[0].text.toString()),
          );
        });
      },
    );
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DEMO"),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 500,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text(
                                  "${index + 1}.Ayet  ${ayetler[index].ayet}"),
                            )
                          ],
                        );
                      },
                      itemCount: ayetler.length,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

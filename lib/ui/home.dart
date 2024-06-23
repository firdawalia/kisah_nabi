import 'dart:convert';

import 'package:kisah_nabi/ui/detail_home.dart';
import 'package:kisah_nabi/model/home.dart';
import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //method get data assets
  Future<List<Home>> readJsonData() async {
    final jsonData = await rootBundle.rootBundle.loadString('assets/data/kisah_nabi.json');
    final listJson = json.decode(jsonData) as List<dynamic>;
    return listJson.map((e) => Home.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: readJsonData(),
              builder: (context, data) {
                if (data.hasError) {
                  return Center(
                      child: Text('${data.error}')
                  );
                } else if (data.hasData) {
                  var items = data.data as List<Home>;
                  return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            String strNo = items[index].number.toString();
                            String strTmp = items[index].tmp.toString();
                            String strName = items[index].name.toString();
                            String strThn_kelahiran = items[index].thnKelahiran.toString();
                            String strDescription = items[index].description.toString();
                            String strUsia = items[index].usia.toString();
                            String strIcon_url = items[index].iconUrl.toString();

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailHome(
                                    strNo: strNo,
                                    strDescription: strDescription,
                                    strName: strName,
                                    strThn_kelahiran: strThn_kelahiran,
                                    strUsia: strUsia,
                                    strIcon_url: strIcon_url,
                                    strTmp: strTmp
                                ),
                              ),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            elevation: 5,
                            margin: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(100),
                                        child: SvgPicture.asset(
                                          'assets/images/no.svg',
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        child: Text(
                                          items[index].number.toString(),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text(
                                          items[index].name.toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        subtitle: Text(
                                          items[index].thnKelahiran.toString(),
                                          style: const TextStyle(
                                              fontSize: 12
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xffffb6b9)),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

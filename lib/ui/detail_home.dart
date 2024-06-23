// ignore_for_file: use_build_context_synchronously
import 'dart:async';

import 'package:kisah_nabi/model/bookmark.dart';
import 'package:kisah_nabi/ui/bookmark.dart';
import 'package:kisah_nabi/database/database_helper.dart';
import 'package:kisah_nabi/main.dart';
import 'package:flutter/material.dart';


class DetailHome extends StatefulWidget {
  final String strNo, strUsia, strName, strThn_kelahiran, strDescription, strTmp, strIcon_url;

  const DetailHome(
      {super.key, required this.strNo, required this.strUsia,
        required this.strName, required this.strThn_kelahiran, required this.strDescription,
        required this.strTmp, required this.strIcon_url});

  @override
  State<DetailHome> createState() => _DetailHomeState();
}

class _DetailHomeState extends State<DetailHome> {
  List<Bookmark> listBookmark = [];
  DatabaseHelper databaseHelper = DatabaseHelper();
  String? strNo, strUsia, strName, strThn_kelahiran, strDescription, strTmp, strIcon_url;

  @override
  initState() {
    super.initState();
    strNo = widget.strNo;
    strUsia = widget.strUsia;
    strName = widget.strName;
    strThn_kelahiran = widget.strThn_kelahiran;
    strDescription = widget.strDescription;
    strTmp = widget.strTmp;
    strIcon_url = widget.strIcon_url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const SliverAppBar(
              backgroundColor: Color(0xd0c431ff)
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    strName!,
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    strTmp!,
                    style: const TextStyle(
                        fontSize: 16, color: Colors.black
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    strUsia!,
                    style: const TextStyle(
                        fontSize: 16, color: Colors.black
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    strThn_kelahiran!,
                    style: const TextStyle(
                        fontSize: 16, color: Colors.black
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Text(
                  strDescription!,
                  style: const TextStyle(
                      fontSize: 15, color: Colors.black
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bool isTapped = false;
          setState(() async {
            if (!isTapped) {
              isTapped = false;
              await Future.delayed(const Duration(milliseconds: 3000));

              databaseHelper.saveData(Bookmark(
                number: strNo,
                name: strName,
                thnKelahiran: strThn_kelahiran,
                description: strDescription,
                usia: strUsia,
                tmp: strTmp,
                iconUrl: strIcon_url,
              ));

              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));

              isTapped = true;
            }
          });
        },
        child: const Icon(
          Icons.favorite,
          color: Colors.white,
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'solarSystemModel.dart';

class solarSystemPage extends StatefulWidget {
  const solarSystemPage({super.key});

  @override
  State<solarSystemPage> createState() => _solarSystemPageState();
}

class _solarSystemPageState extends State<solarSystemPage> {
  solarSystemModel? _solarSystemModel;
  bool isloaded = false;

  void getSolar() async {
    setState(() {
      isloaded = false;
    });
    final res = await http.get(
      Uri.parse(
          "https://api.le-systeme-solaire.net/rest/bodies/"),
    );
    print("status code " + res.statusCode.toString());
    _solarSystemModel =
        solarSystemModel.fromJson(json.decode(res.body.toString()));
    setState(() {
      isloaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    getSolar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: isloaded == true 
          ? ListView.builder(
            itemCount: _solarSystemModel!.bodies!.length.round(),
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(_solarSystemModel!.bodies![index].englishName!),
                  subtitle: Text(_solarSystemModel!.bodies![index].bodyType!.toString()),
                ),
              );
            },
          ) : CircularProgressIndicator()
        ),
      ),      
    );
  }
}


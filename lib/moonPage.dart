import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'SolarSystem/solarSystemModel.dart';

class moonPage extends StatefulWidget {
  const moonPage({super.key});

  @override
  State<moonPage> createState() => _moonPageState();
}

class _moonPageState extends State<moonPage> {
  solarSystemModel? _solarSystemModel;
  bool isloaded = false;

  void getSolar() async {
    setState(() {
      isloaded = false;
    });
    final res = await http.get(
      Uri.parse(
          "https://api.le-systeme-solaire.net/rest/bodies/?filter[]=bodyType,eq,Moon"),
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
                  title: Text(_solarSystemModel!.bodies![index].englishName.toString()),
                  subtitle: Text(_solarSystemModel!.bodies![index].discoveryDate!.toString()),
                ),
              );
            },
          ) : CircularProgressIndicator()
        ),
      ),      
    );
  }
}
import 'package:flutter/material.dart';
import 'package:news_shots_app/app/helper/ad_helper.dart';

class Adview extends StatefulWidget {
  const Adview({super.key});

  @override
  State<Adview> createState() => _AdviewState();
}

class _AdviewState extends State<Adview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: AdHelper.nativeBannerAd(),
      appBar: AppBar(title:Text('Adview',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
      body: Container(
       child:  AdHelper.nativeAd(),
      ),
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mcglynns_food2go/CustomCard.dart';
import 'package:mcglynns_food2go/menu/DeliDaily.dart';
import 'package:mcglynns_food2go/menu/GrabAndGo.dart';
import 'package:mcglynns_food2go/menu/GrillDaily.dart';

import './Beverages.dart';
import './DailyBakery.dart';

class MenuHome extends StatefulWidget {
  @override
  _MenuHomeState createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(FontAwesomeIcons.gulp)),
                Tab(icon: Icon(FontAwesomeIcons.cookieBite)),
                Tab(icon: Icon(FontAwesomeIcons.breadSlice)),
                Tab(icon: Icon(FontAwesomeIcons.tachometerAlt)),
                Tab(icon: Icon(FontAwesomeIcons.hamburger)),
              ],
            ),
            title: Text('McGlynns Food2Go'),
          ),
          body: TabBarView(
            children: [
              Beverages(),
              DailyBakery(),
              DeliDaily(),
              GrabAndGo(),
              GrillDaily()
            ],
          ),
        ),
      ),
    );
  }
}

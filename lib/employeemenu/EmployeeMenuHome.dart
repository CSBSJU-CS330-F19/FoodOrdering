import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mcglynns_food2go/CustomCard.dart';
import 'package:mcglynns_food2go/employeemenu/EmployeeDeliDaily.dart';
import 'package:mcglynns_food2go/employeemenu/EmployeeGrabAndGo.dart';
import 'package:mcglynns_food2go/employeemenu/EmployeeGrillDaily.dart';

import './EmployeeBeverages.dart';
import './EmployeeDailyBakery.dart';

class EmployeeMenuHome extends StatefulWidget {
  @override
  _EmployeeMenuHomeState createState() => _EmployeeMenuHomeState();
}

class _EmployeeMenuHomeState extends State<EmployeeMenuHome> {
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
            title: Text('Edit Menu'),
          ),
          body: TabBarView(
            children: [
              EmployeeBeverages(),
              EmployeeDailyBakery(),
              EmployeeDeliDaily(),
              EmployeeGrabAndGo(),
              EmployeeGrillDaily()
            ],
          ),
        ),
      ),
    );
  }
}

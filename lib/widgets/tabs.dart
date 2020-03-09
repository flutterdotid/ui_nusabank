import 'package:flutter/material.dart';

class AppTabs extends StatelessWidget {
  final List<AppTabsItem> items;

  AppTabs({this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      margin: EdgeInsets.only(top: 20),
      child: ListView(
        padding: EdgeInsets.only(left: 10, right: 20),
        scrollDirection: Axis.horizontal,
        children: items,
      ),
    );
  }
}

class AppTabsItem extends StatelessWidget {
  final String text;
  final IconData icon;

  AppTabsItem({this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          height: 100.0,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Color(0x33ffffff),
              borderRadius: BorderRadius.all(Radius.circular(3.0))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                icon,
                color: Colors.white,
                size: 24.0,
              ),
              Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 13),
              )
            ],
          ),
        ),
      ),
    );
  }
}

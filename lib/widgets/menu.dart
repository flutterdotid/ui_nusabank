import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AppMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 30),
            child: QrImage(
              data: "https://nubank.com.br",
              version: QrVersions.auto,
              size: 80.0,
              foregroundColor: Colors.white,
              backgroundColor: Color(0xff8B10AE),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.white.withOpacity(.8)))),
              child: Column(
                children: <Widget>[
                  AppMenuItem(text: 'Me ajuda', icon: Icons.help_outline),
                  AppMenuItem(text: 'Perfil', icon: Icons.person_outline),
                  AppMenuItem(
                      text: 'Configurar cartão', icon: Icons.credit_card),
                  AppMenuItem(
                      text: 'Configurações do app', icon: Icons.smartphone),
                  AppSignOutButton()
                ],
              )),
        ],
      ),
    );
  }
}

class AppSignOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.white.withOpacity(.8))),
                child: Text(
                  'SAIR DO APP',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AppMenuItem extends StatelessWidget {
  final String text;
  final IconData icon;

  AppMenuItem({this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.white.withOpacity(.8)))),
              child: Row(
                children: <Widget>[
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  SizedBox(width: 20),
                  Text(
                    text,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

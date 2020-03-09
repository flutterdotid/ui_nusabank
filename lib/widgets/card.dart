import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 400),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.attach_money, size: 28, color: Color(0xff666666)),
                  Icon(Icons.visibility_off,
                      size: 28, color: Color(0xff666666)),
                ],
              )),
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Saldo disponível',
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff666666)),
                        ),
                        Text(
                          'R\$ 2.611,65',
                          style:
                              TextStyle(fontSize: 32, color: Color(0xff333333)),
                        ),
                      ],
                    )
                  ],
                )),
          ),
          Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Color(0xffeeeeee),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(4))),
            child: Text(
                'Transferência de R\$ 150,00 recebida de José da Silva hoje às 14:30h',
                style: TextStyle(fontSize: 12, color: Color(0xff333333))),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nubank_clone/widgets/card.dart';

import 'package:nubank_clone/widgets/header.dart';
import 'package:nubank_clone/widgets/menu.dart';
import 'package:nubank_clone/widgets/tabs.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

const Offset start = Offset(0, 160);
const Offset end = Offset(0, 570);

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  Offset _offset = start;
  AnimationController animationCtrl;

  @override
  void initState() {
    super.initState();

    animationCtrl = AnimationController(
        vsync: this,
        lowerBound: start.dy,
        upperBound: end.dy,
        duration: Duration(milliseconds: 300));

    animationCtrl.addListener(() {
      setState(() {
        _offset = Offset(0, animationCtrl.value);
      });
    });
  }

  @override
  void dispose() {
    animationCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nubank Clone',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        backgroundColor: Color(0xff8A05BE),
        body: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                AppHeader(),
                Expanded(
                    child: Opacity(
                  opacity: _getOpacity(),
                  child: AppMenu(),
                )),
                Opacity(
                  opacity: 1 - _getOpacity() * 0.8,
                  child: AppTabs(items: <AppTabsItem>[
                    AppTabsItem(text: 'Indicar Amigo', icon: Icons.person_add),
                    AppTabsItem(
                        text: 'Cobrar', icon: Icons.chat_bubble_outline),
                    AppTabsItem(text: 'Depositar', icon: Icons.arrow_downward),
                    AppTabsItem(text: 'Transferir', icon: Icons.arrow_upward),
                    AppTabsItem(text: 'Bloquear cartão', icon: Icons.lock),
                  ]),
                )
              ],
            ),
            Container(
              child: Transform.translate(
                  offset: _offset,
                  child: GestureDetector(
                    onPanUpdate: (DragUpdateDetails details) {
                      if (_offset.dy >= start.dy && _offset.dy <= end.dy) {
                        setState(() => _offset += Offset(0, details.delta.dy));
                      } else {
                        setState(
                            () => _offset += Offset(0, details.delta.dy * 0.1));
                      }
                    },
                    onPanEnd: (DragEndDetails details) {
                      if ((_offset.dy - start.dy) > (end.dy - start.dy) / 2) {
                        animationCtrl.forward(from: _offset.dy);
                      } else {
                        animationCtrl.reverse(from: _offset.dy);
                      }
                    },
                    child: AppCard(),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  double _getOpacity() {
    double offset = (end.dy - start.dy);
    double opacity =
        offset == 0 ? 0 : (_offset.dy - start.dy) / (end.dy - start.dy);

    if (opacity < 0) {
      opacity = 0;
    }
    if (opacity > 1) {
      opacity = 1;
    }

    return opacity;
  }
}

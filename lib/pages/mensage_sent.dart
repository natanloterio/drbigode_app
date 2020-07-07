import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/components/CustomButton.dart';
import 'package:myapp/main.dart';

import 'day_schedule.dart';

class MessageSent extends StatefulWidget {
  @override
  _MessageSent createState() => new _MessageSent();
}

class _MessageSent extends State<MessageSent> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Padding(
      padding: EdgeInsets.all(8),
      child: Center(
        child: buildDetails(),
      ),
    ));
  }

  buildDetails() {
    final lowPrice = MoneyMaskedTextController(
        decimalSeparator: '.', thousandSeparator: ','); //after
    return Stack(
      children: [
        Form(
          key: _formKey,
          child: Center(
            child: Container(
                height: 440,
                child: Column(
                  children: [
                    Stack(alignment: Alignment.center, children: [
                      Image.asset(
                        'assets/images/bg_mountains.png',
                      ),
                      Positioned(
                        top: 80,
                        child: Text(
                          "Mensagem enviada!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ]),
                  ],
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(45.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: CustomButton(
                    title: 'Voltar para início',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    openDaySchedule() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MessageSent()),
      );
    }
  }
}

class DetailLine extends StatelessWidget {
  final IconData icon;
  final String text;

  const DetailLine({
    this.icon,
    this.text,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Container(
              width: 40,
              child: Icon(
                icon,
                color: Color(0xffc2c2c2),
              ),
            ),
          ),
          Container(
              width: 300,
              child: Text(
                text,
                style: TextStyle(color: Color(0xffc2c2c2)),
              ))
        ],
      ),
    );
  }
}

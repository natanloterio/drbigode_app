import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:myapp/components/CustomButton.dart';
import 'package:myapp/pages/mensage_sent.dart';

import 'day_schedule.dart';

class SchedulePendingDetails extends StatefulWidget {
  @override
  _SchedulePendingDetails createState() => new _SchedulePendingDetails();
}

class _SchedulePendingDetails extends State<SchedulePendingDetails> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: Container(
            width: 300,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text('Detalhes',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                ),
              ],
            ),
          ),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 80,
                  ),
                  Container(
                      width: 280,
                      child: Title(
                          color: Color(0xff000000),
                          child: Text("Cássio Sperry")))
                ],
              ),
              //Phone
              DetailLine(
                icon: Icons.phone_android,
                text: "(11) 99606-6060",
              ),
              //Address
              DetailLine(
                icon: Icons.location_on,
                text: "Rua Dep. Eduardo Vieira 1988, Pantanal, Florianópolis",
              ),
              //Notes
              DetailLine(
                icon: Icons.note,
                text:
                    "Aqui é uma anotação que eu fiz para lembrar de alguma coisa",
              ),
              //Price
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Container(
                      width: 40,
                      child: Icon(
                        Icons.attach_money,
                        color: Color(0xffc2c2c2),
                      ),
                    ),
                  ),
                  Container(
                      width: 280,
                      child: TextFormField(
                        controller: lowPrice,
                        decoration: const InputDecoration(hintText: "0,00"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Por favor informe um valor';
                          }
                          return null;
                        },
                      ))
                ],
              ),
            ],
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
                    title: 'Enviar confirmação',
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MessageSent()),
                      )
                    },
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () => {},
                  child: Text(
                    "Não realizado",
                    style: TextStyle(
                      color: Color(0xff0191AE),
                    ),
                  ))
            ],
          ),
        ),
      ],
    );

    openDaySchedule() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SchedulePendingDetails()),
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

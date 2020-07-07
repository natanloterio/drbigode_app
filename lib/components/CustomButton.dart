import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const CustomButton({
    this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      textColor: Color(0xffffffff),
      color: Color(0xff0191AE),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(8.0),
      ),
      onPressed: () {
        onTap();
      },
      child: Container(
        width: 300,
        height: 40,
        decoration: const BoxDecoration(
          color: Color(0x0191AE),
        ),
        child: Center(
            child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}

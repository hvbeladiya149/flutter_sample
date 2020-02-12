import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_for_desktop_test/value/AppColor.dart';


class RaisedBtn extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String text;
  final double elevation;
  final Color textColor;


  RaisedBtn({@required this.onPressed, @required this.text, this.elevation,this.textColor});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: elevation==null?8.0:elevation,
      padding: EdgeInsets.all(12.0),
      color: AppColor.primaryColor,
      textColor: textColor != null?textColor:AppColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class FlatBtn extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String text;
  final Color color;

  FlatBtn({@required this.onPressed, @required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    if (color != null) {
      return FlatButton(
        textColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Text(text),
        onPressed: onPressed,
      );
    }
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      child: Text(text),
      onPressed: onPressed,
    );
  }
}

class BorderBtn extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String text;

  BorderBtn({@required this.onPressed, @required this.text});

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      onPressed: onPressed,
      borderSide: BorderSide(color: AppColor.primaryColor),
      textColor: AppColor.primaryColor,
      child: Text(text),
    );
  }
}

class BorderedBtn extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String text;
  final double elevation;
  final Color textColor;


  BorderedBtn({@required this.onPressed, @required this.text, this.elevation,this.textColor});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: elevation==null?8.0:elevation,
      padding: EdgeInsets.all(12.0),
      color: AppColor.white,
      textColor: textColor != null?textColor:AppColor.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: textColor),
        borderRadius: BorderRadius.circular(10.0)
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class MaterialBtn extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String text;
  final Color color;
  final Color textColor;
  final double padding;

  MaterialBtn({@required this.onPressed, @required this.text, @required this.color,this.padding, this.textColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      textColor: textColor,
      child: Padding(
        padding: padding!=null? EdgeInsets.all(padding):EdgeInsets.all(0.0),
        child: Text(text),
      ),
      color: color,
    );
  }
}

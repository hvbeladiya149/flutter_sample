import 'package:flutter/material.dart';
import 'package:flutter_app_for_desktop_test/value/Images.dart';
import 'package:flutter_app_for_desktop_test/value/Strings.dart';
import 'package:flutter_app_for_desktop_test/widgets/Buttons.dart';
import 'package:flutter_app_for_desktop_test/widgets/TextUtils.dart';
import 'package:flutter_svg/flutter_svg.dart';


class NoInternetScreen extends StatefulWidget {
  final GestureTapCallback onPressRetry;

  NoInternetScreen({this.onPressRetry});

  @override
  _NoInternetScreenState createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {

  Images images = new Images();
  Strings strings = new Strings();

  @override
  void dispose() {
    images = null;
    strings = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              images.noInternetImage,
              height: 100.0,
              width: 100.0,
            ),
            SizedBox(height: 20.0),
            HeadlineText(text: strings.noInternet),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(right:36.0,left: 36.0),
              child: TitleText(text: strings.enableInternet,maxLine: 4,align: TextAlign.center,),
            ),
            SizedBox(height: 30.0),
            RaisedBtn(text: strings.retry.toUpperCase(), onPressed: widget.onPressRetry)
          ],
        ),
      ),
    );
  }
}

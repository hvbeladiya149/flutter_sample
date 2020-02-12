import 'package:flutter/material.dart';
import 'package:flutter_app_for_desktop_test/parsers/SignInParser.dart';
import 'package:flutter_app_for_desktop_test/screens/LoadingScreen.dart';
import 'package:flutter_app_for_desktop_test/screens/NoInternetScreen.dart';
import 'package:flutter_app_for_desktop_test/utils/Constants.dart';
import 'package:flutter_app_for_desktop_test/value/AppColor.dart';
import 'package:flutter_app_for_desktop_test/value/Strings.dart';
import 'package:flutter_app_for_desktop_test/widgets/Buttons.dart';
import 'package:flutter_app_for_desktop_test/widgets/TextUtils.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  bool isInternet;
  bool isLoading;
  bool isErrorInGetMessage = false;

  Strings strings = new Strings();

  @override
  void initState() {
    checkInternet();
    super.initState();
  }

  @override
  void dispose() {
    strings = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(strings.appName),
      ),
      body: layoutMain(),
    );
  }

  Widget layoutMain(){
    if(isInternet != null && isInternet){
      if(isLoading){
        callApi();
        return LoadingScreen();
      }
      return dataLayout();
    }else if(isInternet != null && !isInternet){
      return NoInternetScreen(
        onPressRetry: (){
          checkInternet();
        },
      );
    }

    return LoadingScreen();
  }

  Widget dataLayout(){
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedBtn(
                  onPressed: (){},
                  text: strings.btnTitle.toUpperCase(),
                ),
                SizedBox(height: 20.0),
                FlatBtn(
                  color: AppColor.primaryColor,
                  onPressed: (){},
                  text: strings.btnTitle.toUpperCase(),
                ),
                SizedBox(height: 20.0),
                BorderedBtn(
                  textColor: AppColor.primaryColor,
                  onPressed: (){},
                  text: strings.btnTitle.toUpperCase(),
                ),
                SizedBox(height: 20.0),
                MaterialBtn(
                  onPressed: (){},
                  text: strings.btnTitle.toUpperCase(),
                  color: AppColor.primaryColor,
                  textColor: AppColor.white,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Display1Text(text: strings.displayOne),
                SizedBox(height: 20.0),
                HeadlineText(text: strings.headline),
                SizedBox(height: 20.0),
                SubHeadText(text: strings.subHeadline),
                SizedBox(height: 20.0),
                TitleText(text: strings.title),
                SizedBox(height: 20.0),
                SubTitleText(text: strings.subTitle),
                SizedBox(height: 20.0),
                Body2Text(text: strings.body2),
                SizedBox(height: 20.0),
                Body1Text(text: strings.body1),
                SizedBox(height: 20.0),
                SmallText(text: strings.small),
                SizedBox(height: 20.0),
                CaptionText(text: strings.caption),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> callApi()async{
    final Map result = await new SignInParser().callApi("", "");
    if(!result["isError"]){
      print(result["value"]);
    }else{
      isErrorInGetMessage = true;
    }

    isLoading = false;
    setState(() {});
  }

  checkInternet()async{
    isInternet = await Constants.isInternetAvailable();
    isLoading = isInternet;
    setState(() {});
  }
}

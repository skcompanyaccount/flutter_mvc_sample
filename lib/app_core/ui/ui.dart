import 'package:flutter/material.dart';

abstract class Ui extends StatelessWidget{
  const Ui({Key key}) : super(key: key);

  Scaffold getPage({Widget body, String title})=>Scaffold(
    appBar: getAppBar(title: title),
    body: body,
  );

  Widget get topAndBottomPadder=>SizedBox(height: 20.0);
  Widget getPageElementsWidget({List<Widget> pageElements})=>Container(
      child: ScrollConfiguration(
        child: SingleChildScrollView(
          child: Column(
            children: [topAndBottomPadder]..addAll(pageElements)..add(topAndBottomPadder),
          ),
        ),
        behavior: ScrollBehavior(),
      ),
      width: double.infinity,
      height: double.infinity
  );

  Color get textColor=>Colors.blueGrey[700];
  TextStyle get appBarTitleTextStyle=>TextStyle(fontSize: 19.0, letterSpacing: 0.5, fontWeight: FontWeight.w500, color: textColor);
  AppBar getAppBar({String title})=>AppBar(
      title: Text(title, style: appBarTitleTextStyle,),
      centerTitle: true,
      backgroundColor: Colors.grey[200]
  );

  Widget getLoadingScreen({String loadingMessage})=>Container(
      child: Container(
        child: Column(
          children: [
            circularProgressIndicator,
            SizedBox(height: 10.0),
            getLoadingScreenText(loadingMessage: loadingMessage)
          ],
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,

        ),
      ),
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity
  );

  Widget get circularProgressIndicator=>Container(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(textColor),
      ),
      width: 30.0,
      height: 30.0
  );

  TextStyle get loadingScreenTextStyle=>TextStyle(fontSize:16.0, fontWeight: FontWeight.w500, color: textColor);

  Widget getLoadingScreenText({String loadingMessage})=>Container(
      child: Text(loadingMessage, style: loadingScreenTextStyle, textAlign: TextAlign.center),
      width: double.infinity
  );

  TextStyle get errorTitleTextStyle=>TextStyle(color: textColor, fontSize: 20.0, fontWeight: FontWeight.w600);
  TextStyle get errorDescriptionTextStyle=>errorTitleTextStyle.copyWith(fontSize: 15.0);
  Widget getErrorScreen({String errorTitle, String errorMessage})=>Container(
      child:Column(
          children: [
            Icon(Icons.person_pin, size: 55.0, color: textColor,),
            Container(
              child: Text(errorTitle, style: errorTitleTextStyle, textAlign: TextAlign.center),
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
            ),
            Container(
              child: Text(errorMessage, style: errorDescriptionTextStyle, textAlign: TextAlign.center),
              width: double.infinity,
            ),
          ],
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center
      ),
      width: double.infinity,
      height: double.infinity
  );

}
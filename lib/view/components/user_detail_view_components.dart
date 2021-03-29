import 'package:flutter/material.dart';
import '../../app_core/data_models/user_model.dart';

abstract class UserDetailViewComponents{

  Icon userIcon({Color color})=>Icon(Icons.person_pin, size: 45, color: color);
  TextStyle get userNameTextStyle=>TextStyle(fontSize:22.0, fontWeight:FontWeight.w600);
  TextStyle get usernameTextStyle=>TextStyle(fontSize:16.0, fontWeight:FontWeight.w600);
  Icon smallIcon({IconData icon, Color color})=>Icon(icon, color: color, size: 35.0);
  TextStyle get subInfoTitleTextStyle=>TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600);
  TextStyle get subInfoTextStyle=>TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600);


  Container textContainer({String text, TextStyle style})=>Container(
    child: Text(text, style: style, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,),
    width: double.infinity,
  );

  Widget get infoGroupDivider=>SizedBox(height: 20.0);

  List<Widget> getPageElements({UserModel user, Color uiTextColor, double screenWidth})=>[
    personTagContainer(user: user, uiTextColor: uiTextColor),
    infoGroupDivider,
    personContactContainer(user: user, screenWidth: screenWidth, uiTextColor: uiTextColor),
    infoGroupContainer(
        groupElements: [
          smallIcon(icon: Icons.location_on, color: uiTextColor),
          textContainer(text: "Address", style: subInfoTitleTextStyle.copyWith(color: uiTextColor)),
          textContainer(text: user.address.city, style: subInfoTextStyle.copyWith(color: uiTextColor)),
          textContainer(text: user.address.street, style: subInfoTextStyle.copyWith(color: uiTextColor)),
          textContainer(text: user.address.suite, style: subInfoTextStyle.copyWith(color: uiTextColor)),
        ],
        width: double.infinity
    )
  ];

  Container personTagContainer({Color uiTextColor, UserModel user})=>Container(
    child: Column(
      children: [
        userIcon(color: uiTextColor),
        textContainer(text: user.name, style: userNameTextStyle.copyWith(color: uiTextColor)),
        textContainer(text: user.address.city, style: usernameTextStyle.copyWith(color: uiTextColor)),
        textContainer(text: user.username, style: usernameTextStyle.copyWith(color: uiTextColor)),
      ],
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
    ),
    color: Colors.grey[200],
    height: 170.0,
  );

  Widget personContactContainer({UserModel user, double screenWidth, Color uiTextColor})=>Row(
    children: [
      infoGroupContainer(
          groupElements: [
            smallIcon(icon: Icons.phone, color: uiTextColor),
            textContainer(text: "Phone Number", style: subInfoTitleTextStyle.copyWith(color: uiTextColor)),
            textContainer(text: user.phone, style: subInfoTextStyle.copyWith(color: uiTextColor)),
          ],
          width: (screenWidth*0.5)-1.0
      ),
      infoGroupContainer(
          groupElements: [
            smallIcon(icon: Icons.mail, color: uiTextColor),
            textContainer(text: "Mail Address", style: subInfoTitleTextStyle.copyWith(color: uiTextColor)),
            textContainer(text: user.email, style: subInfoTextStyle.copyWith(color: uiTextColor)),
          ],
          width: (screenWidth*0.5)-1.0
      )
    ],
  );

  Widget infoGroupContainer({List<Widget> groupElements, double width})=>Container(
    child: Column(
        children: groupElements,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max
    ),
    width: width,
    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
  );

}
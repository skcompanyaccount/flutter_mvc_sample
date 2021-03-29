import 'package:flutter/material.dart';
import '../app_core/ui/ui.dart';
import 'components/user_detail_view_components.dart';

class UserDetailView extends Ui with UserDetailViewComponents{
  @override
  Widget build(BuildContext context)=>getPage(
    title: "User Detail Page",
    body: getPageElementsWidget(
      pageElements: getPageElements(
        user: ModalRoute.of(context).settings.arguments,
        uiTextColor: textColor,
        screenWidth: MediaQuery.of(context).size.width
      )
    ),
  );
}
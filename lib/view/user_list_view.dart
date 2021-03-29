import 'package:flutter/material.dart';
import 'components/user_list_view_components.dart';
import '../app_core/ui/ui.dart';
import 'package:get/get.dart';
import '../controller/user_list_controller.dart';


class UserListView extends Ui with UserListViewComponents{
  const UserListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context)=>getPage(
      title: "Flutter MVC Sample",
      body: GetX<UserListController>(
        init: UserListController(),
        builder: (controller)=>controller.isUsersLoaded?(
            controller.isErrorExist?getErrorScreen(errorTitle: "Kullanıcılar Yüklenemedi...", errorMessage: "İnternet bağlantınızı kontrol edin.")
                :
            getPageElementsWidget(
                pageElements: List<Widget>.generate(
                    controller.users.length,
                        (i) => getUserBox(user: controller.users[i],
                        onPressed: ()=>Navigator.pushNamed(context, "userDetailView", arguments: controller.users[i])
                    )
                )
            )
        ):getLoadingScreen(loadingMessage: "Kullanıcılar Yükleniyor\n..."),
      )
  );
}



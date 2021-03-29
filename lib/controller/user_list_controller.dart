import 'package:get/get.dart';
import '../app_core/data_models/user_model.dart';
import '../model/user_list_model.dart';

class UserListController extends GetxController{
  static UserListController get to =>Get.find<UserListController>();

  final _userListModel=UserListModel().obs;

  List<UserModel> get users=>_userListModel.value.users;
  bool get isUsersLoaded=>_userListModel.value.isUsersLoaded.value;
  bool get isErrorExist=>_userListModel.value.isErrorExist.value;

  @override
  void onInit() async{
    await _userListModel.value.onInit();
    update();
    super.onInit();
  }
}
import '../app_core/api/api.dart';
import '../app_core/data_models/user_model.dart';
import 'package:get/get.dart';

class UserListModel{
  final Api api=Api();

  final users=<UserModel>[];
  final isUsersLoaded=false.obs;
  final isErrorExist=false.obs;


  Future<dynamic> get fetchUsers=>api.fetchUsers();

  onInit()async{
    final dynamic result=await api.fetchUsers();
    if(result is List<Map<String, dynamic>>){
      result.forEach((element) {users.add(UserModel.fromJson(element));});
    }else{
      isErrorExist.value=true;
    }

    isUsersLoaded.value=true;
  }

}
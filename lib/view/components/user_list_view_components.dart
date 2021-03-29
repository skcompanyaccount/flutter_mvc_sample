import 'package:flutter/material.dart';
import '../../app_core/data_models/user_model.dart';

abstract class UserListViewComponents{
  Icon get userIcon=>Icon(Icons.person_pin);
  ListTile getUserBox({UserModel user, Function onPressed})=>ListTile(
    leading: userIcon,
    title: Text(user.name),
    subtitle: Text(user.email),
    dense: true,
    onTap: onPressed,
  );
}
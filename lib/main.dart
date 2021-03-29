import 'package:flutter/material.dart';
import 'view/user_list_view.dart';
import 'view/user_detail_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context)=>MaterialApp(
      title: "Flutter MVC Sample",
      initialRoute: '/',
      routes: routes,
      theme: ThemeData(
          primaryColor: Colors.grey[200]
      )
  );

  Map<String, WidgetBuilder> get routes=>{
    '/':(context)=>UserListView(),
    'userDetailView':(context)=>UserDetailView()
  };
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/view/posts_page.dart';
import 'package:untitled2/view_model/posts_viewModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageViewModel()),
      ],
    child: const MaterialApp(


          home: PostsPage(),
        )
    );





  }
}


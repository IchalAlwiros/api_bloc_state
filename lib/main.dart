import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_with_bloc/cubit/resto_cubit.dart';
import 'package:state_with_bloc/cubit/screen_cubit.dart';
import 'package:state_with_bloc/ui/pages/home_page.dart';
import 'package:state_with_bloc/ui/pages/main_pages.dart';
import 'package:state_with_bloc/ui/pages/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ScreenCubit(),
        ),
        BlocProvider(
          create: (context) => RestoCubit(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          routes: {
            '/': (context) => SplashPages(),
            '/main': ((context) => MainScreen())
          }),
    );
  }
}

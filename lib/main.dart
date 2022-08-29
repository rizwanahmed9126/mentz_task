import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentz_task/view_model/providers/search_provider.dart';
import 'package:provider/provider.dart';

import 'model/services/navigation_service.dart';
import 'model/utils/routes.dart';
import 'model/utils/service_locator.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(
    const MyApp(),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            title: 'Mentz Task',
            color: Theme.of(context).backgroundColor,
            debugShowCheckedModeBanner: false,
            navigatorKey: locator<NavigationService>().navigatorKey,


            theme: ThemeData(
              fontFamily: 'Lexend',
              backgroundColor: const Color.fromRGBO(30, 144, 241, 1,
              ),
            ),

            onGenerateRoute: onGenerateRoute,
            initialRoute: searchScreenRoute,


          );
        },

      ),
    );


  }
}




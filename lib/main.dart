import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:unistudents_app/core/local/locals.dart';
import 'package:unistudents_app/providers/local_provider.dart';
import 'package:unistudents_app/providers/news.dart';
import 'package:unistudents_app/providers/notifications.dart';
import 'package:unistudents_app/providers/theme.dart';
import 'package:unistudents_app/screens/folllow_websites_screen.dart';
import 'package:unistudents_app/screens/grade_screen.dart';
import 'package:unistudents_app/screens/login_screen.dart';
import 'package:unistudents_app/screens/registration_screen.dart';
import 'package:unistudents_app/screens/tabs_screen.dart';
import 'package:unistudents_app/screens/welcome_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: News()),
        ChangeNotifierProvider(create: (_) => LocalProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
      ],
      child: Consumer2<LocalProvider, ThemeProvider>(
        builder: (context, localePr, themePr, snapshot) => ScreenUtilInit(
          designSize: const Size(428, 925),
          builder: () => MaterialApp(
              title: 'UniStudents',
              theme: themePr.lightTheme,
              darkTheme: themePr.darkTheme,
              themeMode: themePr.theme,
              locale: localePr.locale,
              debugShowCheckedModeBanner: false,
              supportedLocales: Locals.supportedLocals,
              localizationsDelegates: Locals.localizationsDelegates,
              initialRoute: TabsScreen.id,
              routes: {
                WelcomeScreen.id: (context) => const WelcomeScreen(),
                LoginScreen.id: (context) => LoginScreen(),
                RegistrationScreen.id: (context) => const RegistrationScreen(),
                TabsScreen.id: (context) => const TabsScreen(),
                FollowWebsitesScreen.id: (context) => const FollowWebsitesScreen(),
                GradeScreen.id: (context) => const GradeScreen()
              }),
        )
      ),
    );
  }
}

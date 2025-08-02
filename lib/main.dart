import 'package:mixnmatch/main_layout.dart';
import 'package:mixnmatch/models/auth_model.dart';
import 'package:mixnmatch/screens/UpdateProfileScreen.dart';
import 'package:mixnmatch/screens/appointment_page.dart';
import 'package:mixnmatch/screens/auth_page.dart';
import 'package:mixnmatch/screens/booking_page.dart';
import 'package:mixnmatch/screens/branchSelect_page.dart';
import 'package:mixnmatch/screens/success_booked.dart';
import 'package:mixnmatch/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixnmatch/utils/prefs.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await prefs.init();
  print("prefs.accessToken ${prefs.accessToken}");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final String initialRoute = prefs.accessToken.isNotEmpty ? 'main' : '/';

    return ChangeNotifierProvider<AuthModel>(
      create: (context) => AuthModel(),
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            title: 'Flutter Doctor App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: "Kanit",
              textTheme: Theme.of(context).textTheme.apply(
                    bodyColor: Colors.white,
                    displayColor: Colors.white,
                  ),
              colorScheme: const ColorScheme(
                brightness: Brightness.light,
                primary: Config.primaryColor,
                onPrimary: Colors.white,
                secondary: Colors.white,
                onSecondary: Colors.white,
                background: Colors.white,
                onBackground: Colors.white,
                surface: Colors.white,
                onSurface: Colors.white,
                error: Colors.white,
                onError: Colors.white,
              ),
              inputDecorationTheme: const InputDecorationTheme(
                focusColor: Config.primaryColor,
                border: Config.outlinedBorder,
                focusedBorder: Config.focusBorder,
                errorBorder: Config.errorBorder,
                enabledBorder: Config.outlinedBorder,
                floatingLabelStyle: TextStyle(color: Config.primaryColor),
                prefixIconColor: Colors.white,
              ),
              scaffoldBackgroundColor: const Color(0xff1f1f1f),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: const Color(0xff000000),
                selectedItemColor: Config.primaryColor,
                showSelectedLabels: true,
                showUnselectedLabels: false,
                unselectedItemColor: Colors.grey.shade700,
                elevation: 10,
                type: BottomNavigationBarType.fixed,
              ),
            ),
            initialRoute: initialRoute,
            routes: {
              '/': (context) => const AuthPage(),
              'main': (context) {
                final args = ModalRoute.of(context)!.settings.arguments
                    as Map<String, dynamic>?;
                return MainLayout(
                  initialPage: args?['initialPage'] ?? 0,
                );
              },
              'booking_page': (context) => BookingPage(),
              'success_booking': (context) => const AppointmentBooked(),
              'appointmenthistory': (context) => const AppointmentPage(),
              'updateProfileScreen': (context) => const UpdateProfileScreen(),
              'branchSelectScreen': (context) {
                final args = ModalRoute.of(context)!.settings.arguments
                    as Map<String, dynamic>?;
                return BranchSelectScreen(
                  isFromMain: args?["isFromMain"] ?? true,
                );
              }
            },
          );
        },
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:carpool/providers/app_settings.dart';
import 'package:carpool/providers/auth.dart';
import 'package:carpool/providers/rider.dart';
import 'package:carpool/providers/user_ride.dart';
import 'package:carpool/screens/signin/singin.dart';
import 'package:carpool/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'theme.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Rider>(
          create: (ctx) => Rider('', null, [], []),
          update: (ctx, auth, previousRider) => Rider(
              auth.userToken,
              previousRider?.rider,
              previousRider?.cities ?? [],
              previousRider?.cars ?? []),
        ),
        ChangeNotifierProvider(
          create: (_) => AppSettings(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserRide(),
        )
      ],
      child: OverlaySupport(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Carpool',
          theme: theme(),
          // home: Scaffold(body: Center(child: Text('hello', style: TextStyle(color: Colors.red),))),
          // initialRoute: SearchRide.routeName,
          home: Builder(
            builder: (context) => FutureBuilder(
              future: Provider.of<Auth>(context, listen: false).getCurrentUser(),
              builder: (context, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? const SplashScreen()
                      : snapshot.hasError
                      ? Container()
                      : snapshot.hasData
                          ? HomePage()
                          : const SignIn(),
            ),
          ),
          routes: routes,
          supportedLocales: const [Locale('en', 'US')],
        ),
      ),
    );
  }
}

// TODO: Please continue from here
// Update home to rider notifications
// Test both notifications

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruit_market_app/Features/Splash/presentation/view/splash-view.dart';
import 'package:fruit_market_app/bloc_observe.dart';
import 'package:fruit_market_app/core/consts/theme_data.dart';
import 'package:fruit_market_app/core/providers/Theme_color.dart';
import 'package:fruit_market_app/core/services/Internet_connectivity.dart';
import 'package:fruit_market_app/core/services/dark_theme.dart';
import 'package:fruit_market_app/core/services/inter_connec.dart';
import 'package:fruit_market_app/core/widgets/Custom_SnakBar.dart';
import 'package:fruit_market_app/firebase_options.dart';
import 'package:fruit_market_app/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import 'core/DI/dependency_injection.dart';
import 'core/utils/App-routes.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

void main() async {
  initGetIt();
     Bloc.observer=SimpleBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    // themeChangeProvider.setDarkTheme =
    //     await themeChangeProvider.themeColor.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    // getConnectivity();
    super.initState();
  }

  // getConnectivity() =>
  //     subscription = Connectivity().onConnectivityChanged.listen(
  //       (ConnectivityResult result) async {
  //         isDeviceConnected = await InternetConnectionChecker().hasConnection;
  //         if (!isDeviceConnected && isAlertSet == false) {
  //           showDialogBox();
  //           setState(() => isAlertSet = true);
  //         }
  //       },
  //     );

  @override
  void dispose() {
    // subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => themeChangeProvider),
        StreamProvider(
            initialData: InternetConnectionStatus.connected,
            create: (_) => InternetConnectionChecker().onStatusChange),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, getDarkTheme, child) {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
          return GetMaterialApp(
            locale: Locale("ar"),
            localizationsDelegates: const [
              // to add locatization multi langauge
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: Styles.themeData(getDarkTheme.getDarkTheme, context),
            debugShowCheckedModeBanner: false,
            home: const SplashView(),
          );
        },
      ),
    );
  }

  bool isArabic() {
    // to change direction of padding because if i give the widget the padding in right in english locate that padding will be in the  left in Arabic locate.
    // so we will check the locate when i give the padding or any direction to any widget by use this function
    return Intl.getCurrentLocale() == "ar";
  }

  // showDialogBox() => showCupertinoDialog<String>(
  //       context: context,
  //       builder: (BuildContext context) => CupertinoAlertDialog(
  //         title: const Text('No Connection'),
  //         content: const Text('Please check your internet connectivity'),
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () async {
  //               Navigator.pop(context, 'Cancel');
  //               setState(() => isAlertSet = false);
  //               isDeviceConnected =
  //                   await InternetConnectionChecker().hasConnection;
  //               if (!isDeviceConnected && isAlertSet == false) {
  //                 showDialogBox();
  //                 setState(() => isAlertSet = true);
  //               }
  //             },
  //             child: const Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
}

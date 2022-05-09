import 'package:flutter/material.dart';
import 'package:intern_test_project/AppData.dart';
import 'package:intern_test_project/Pages/Authorization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intern_test_project/Pages/MainPage.dart';
import 'package:intern_test_project/Pages/ProductsList/ProductsListPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppDataWidget(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Intern Test Project',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            backgroundColor: Colors.white,
            disabledColor: Colors.blueGrey,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
              onPrimary: Colors.white,
              primary: const Color.fromARGB(255, 12, 64, 166),
            )),
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color.fromARGB(255, 171, 171, 171)),
                borderRadius: BorderRadius.circular(8))),
            buttonTheme: const ButtonThemeData(disabledColor: Colors.blueGrey)),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English, no country code
          Locale('ru', ''), // Russian, no country code
        ],
        initialRoute: "/",
        routes: {
          "/": (context) {
            return const Authorization();
          },
          "/main-page": (context) => const MainPage(startIndex: 0,),
          "/products-list-page": (context) => const ProductsListPage(),
          "/cart": (context) => const MainPage(startIndex: 1,),
          "/profile": (context) => const MainPage(startIndex: 2)
        },
      ),
    );
  }
}

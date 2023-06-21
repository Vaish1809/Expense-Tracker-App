import 'package:flutter/material.dart';
import 'package:expense_tracker_app/widgets/expenses.dart';
//import 'package:flutter/services.dart';
//use kvarname for global variables
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 211, 236, 249),
);
var kDarkColorScheme = ColorScheme.fromSeed(
 brightness:Brightness.dark ,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
); //this generates scheme based on light mode only so we need to tell dart the the scheme we are using is for dark mode
void main() {
  //how to lock the screen orientation
  //the app only gets started if the 
//   WidgetsFlutterBinding.ensureInitialized();//this ensures tht we lock the orientATION ABD RUN THE APP
//    SystemChrome.setPreferredOrientations([
// DeviceOrientation.portraitUp,
//   ]).then((fn) {
runApp(
    MaterialApp(
      //THEME - flutter provides various themes
      //two approaches either we use just the theme:ThemeData(...) but using this we need to put in all the parameters and make it from scratach
      //approach two create a copy of an exixsting theme and apply only the necessary changes
      //primary container for key components
      //secondary colors for less prominent componemnts of ui
      // teritary for contrasting accents to balance primary and secondary

//we do this because we told dart tht the margin would never be null but here in dark mode it can be due to the colors therefore we add the margin again here
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16, 
            vertical: 8
            ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
            ),
          ),
      ),
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                  titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 14,
              ))),
      //default
      themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
  );
  //});
  
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qoutes/model/quoteModel.dart';
import 'package:qoutes/view/quoteView.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<QuotesProvider>.value(
          value: QuotesProvider(),
        ),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, 
        theme: ThemeData(),
        darkTheme:ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.orange
         ),
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: Text("Welcome to QuteQuotes",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.amberAccent
                  )
            ),
            backgroundColor: Colors.blueGrey.shade800,
            nextScreen: QuoteView()
          )
      ),
    ),
  );
}





import 'package:flutter/material.dart';
import 'package:price_text/currency_type.dart';
import 'package:price_text/price_Text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatelessWidget {
  ExampleScreen({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Example usage of PriceText
            PriceText(
              currencyType:
                  CurrencyType.INR, //for currency type to be displayed
              amount:
                  -2000, //for amount to be displayed on screen 0 value to show grey color
              showFlag: true, //to show flag of the country
              showCurrencyCode: true, //to show currency code
              contryCodeSpacing: 10, //spacing between flag and currency code
              flagSpacing: 20, //spacing between currency code and amount
              flagAlignment:
                  AlignmentOption.left, //flag alignment left or right
              amountColorStyle: (amount) {
                if (amount > 0) {
                  return Colors.green;
                } else if (amount < 0) {
                  return Colors.red;
                } else {
                  return Colors.grey;
                }
              }, //custom color resolver for amount
              hideCurrencySymbol:
                  false, //to hide currency symbol if you want to show only amount
              avoidCurrencyFormat: false, //to avoid currency formatting
              customFlagWidget: Image.asset(
                'assets/india.png',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ), //custom flag widget if you want to show custom flag
              currencyCodeText:
                  'India', //custom currency code text if you want to show custom text
              currencyCodeTextStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ), //custom text style for currency code
            ),
          ],
        ),
      ),
    );
  }
}


[![dashstack_poster](https://github.com/user-attachments/assets/4711330c-d9f5-42f2-ba92-59bdecb384a5)](https://dashstack.notion.site/Ravi-Vithani-e65c362e335d45ef993225687e4aacb8?pvs=143)

#   Price Text – Flutter  
A customizable **Price Text** for Flutter apps.  
Format and display prices in multiple currencies with flags, symbols, and localized formatting.

---

## ✨ Features
✅ Supports multiple currencies (USD, EUR, GBP, INR, JPY, AUD, CAD, CNY, SGD, NZD, MXN, ZAR, TRY).  
✅ Automatically formats numbers with proper separators and decimals.  
✅ Localized currency formatting using [`intl`](https://pub.dev/packages/intl).  
✅ Display currency code, symbol, and even country flag.  
✅ Supports custom text style and color logic (positive/negative/custom).  
✅ Plug & Play → Simply using `PriceText` with any screen.  

---
## How to use it ?

### 1. Add dependency
Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  price_text: <latest_version>
```  

### 2. Install it You can install packages from the command line: 

with pub :
```
$ pub get
```
with Flutter : 
```
$ flutter pub get
```
### 3. Import it

Now in your `Dart` code, you can use :

```
import 'package:price_text/price_Text.dart';
```

### 4. Use it

[Sample](https://github.com/Androidsignal/price_text) app demonstrates how simple the usage of the library actually is.

Using PriceText in your project is super simple.

You just need to add the widget with an amount and currency type, and it will handle formatting for you.

## Basic usage

### Without any customization:

![Screenshot_20250904-094232](https://github.com/user-attachments/assets/55cea8e4-3c4e-4cbb-886a-1c6c9c21b410)

```
 //Example usage of PriceText
  PriceText(
    currencyType: CurrencyType.USD, //for currency type to be displayed
    amount: 1000, //for amount to be displayed on screen using currency format
  ),
```

### show flag :

![Screenshot_20250904-095056](https://github.com/user-attachments/assets/5735a905-d6cb-42f6-80e9-6429cfe8eefa)

```
 PriceText(
   currencyType: CurrencyType.USD, //for currency type to be displayed
    amount: 1000, //for amount to be displayed on screen using currency format
     showFlag: true, //to show flag of the country
  ),
```

### show showCurrencyCode :

![Screenshot_20250904-095515](https://github.com/user-attachments/assets/92ed2052-79a2-4b57-b8a9-4ff9027c35ac)

```
 PriceText(
   currencyType: CurrencyType.USD, //for currency type to be displayed
   amount: 1000, //for amount to be displayed on screen using currency format
   showFlag: true, //to show flag of the country
   showCurrencyCode: true, //to show currency code
 ),
```
### customize with CurrencyCode Text and TextStyle :

![Screenshot_20250904-095939](https://github.com/user-attachments/assets/e63e53fb-b985-4e43-b435-25a1d060178f)

```
PriceText(
  currencyType: CurrencyType.USD, //for currency type to be displayed
  amount: 1000, //for amount to be displayed on screen using currency format
  showFlag: true, //to show flag of the country
  showCurrencyCode: true, //to show currency code
  currencyCodeText: 'Us Dollar', //custom currency code text
  currencyCodeTextStyle: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.w600), //custom style for currency code text
),
```
### customize with flagspacing and alignment(left-right) :

| Flag Left (default) | Flag Right |
|----------------------|------------|
| ![flag_left](https://github.com/user-attachments/assets/646c0d19-b1e2-450a-842e-db98069ff77f) | ![flag_right](https://github.com/user-attachments/assets/2888ea5f-0e72-4887-a7c4-8c56d9bfcde7) |

```
PriceText(
  currencyType: CurrencyType.USD, //for currency type to be displayed
  amount: 1000, //for amount to be displayed on screen using currency format
  showFlag: true, //to show flag of the country
  showCurrencyCode: true, //to show currency code
  flagSpacing: 30,// to space betweenflag and currencyText
  flagAlignment: AlignmentOption.right,//to align flag left-right side
),
```

### customize flag using image assets :

![Screenshot_20250904-103055](https://github.com/user-attachments/assets/c346fedb-6cbb-4743-a1a7-ac2b465b8e14)

```
  PriceText(
    currencyType: CurrencyType.AUD, //for currency type to be displayed
    amount: 1000, //for amount to be displayed on screen using currency format
    showFlag: true, //to show flag of the country
    showCurrencyCode: true, //to show currency code
    /// custom flag widget using image asset
    customFlagWidget: Image.asset(
      'assets/aud.png',
       height: 40, 
       width: 40, 
       fit: BoxFit.cover
    ),
  ),
```
### hide Currency symbol :

![Screenshot_20250904-102604](https://github.com/user-attachments/assets/a2e6c815-5c65-47a8-bdac-ce2833c2fb33)

```
    PriceText(
      currencyType: CurrencyType.AUD, //for currency type to be displayed
      amount: 1000, //for amount to be displayed on screen using currency format
      showFlag: true, //to show flag of the country
      showCurrencyCode: true, //to show currency code
      hideCurrencySymbol: true, //to hide currency symbol like $, ₹ etc
    ),
```
### avoid Currency format :

![Screenshot_20250904-103055](https://github.com/user-attachments/assets/fe01cd71-628e-4e19-99ed-14f41e30d8ab)

```
  PriceText(
    currencyType: CurrencyType.AUD, //for currency type to be displayed
    amount: 1000, //for amount to be displayed on screen using currency format
    showFlag: true, //to show flag of the country
    showCurrencyCode: true, //to show currency code
    avoidCurrencyFormat: true,//to avoid currency format like : 1,000.00 and show 1000 without formatting  
  ),
```
### positive and negative value changes color Bydefault :

| Colors (Positive value) | Colors (Negative value) | Colors (Zero value) |
|-------------------|-------------------|---------------|
| ![positive](https://github.com/user-attachments/assets/fe01cd71-628e-4e19-99ed-14f41e30d8ab) | ![negative](https://github.com/user-attachments/assets/d90302b3-8c84-4187-8f60-13231416f9f3) | ![zero](https://github.com/user-attachments/assets/e04ea1ae-9d11-4908-aded-d9a94a478b14) |

```
/// show nagative red color default 
PriceText(
  currencyType: CurrencyType.AUD, //for currency type to be displayed
  amount: -1000, //for amount to be displayed on screen nagative value to show red color
  showFlag: true, //to show flag of the country
  howCurrencyCode: true, //to show currency code
),

/// show positive value green color default 
PriceText(
  currencyType: CurrencyType.AUD, //for currency type to be displayed
  amount: 1000, //for amount to be displayed on screen positive value to show green color
  showFlag: true, //to show flag of the country
  howCurrencyCode: true, //to show currency code
),

/// show 0 value grey color bydefult 
PriceText(
  currencyType: CurrencyType.AUD, //for currency type to be displayed
  amount: 0, //for amount to be displayed on screen 0 value to show grey color
  showFlag: true, //to show flag of the country
  howCurrencyCode: true, //to show currency code
),
```
### customize positive and negative value changes color according to your choice :

| Colors (Positive value) | Colors (Negative value) | Colors (Zero value) |
|-------------------|-------------------|---------------|
| ![positive](https://github.com/user-attachments/assets/2b369f5a-3c5e-4cc6-a3ac-b1894ddca700) | ![negative](https://github.com/user-attachments/assets/501a9b57-43e1-46fd-8a6b-380d46ee1582) | ![zero](https://github.com/user-attachments/assets/ea2dae6b-ef1f-4428-a8e5-743d01cbe833) |

```
/// changes text color according amountColorStyle
PriceText(
  currencyType: CurrencyType.AUD, //for currency type to be displayed
  amount: 0, //for amount to be displayed on screen 0 value to show black color
  showFlag: true, //to show flag of the country
  showCurrencyCode: true, //to show currency code.
  /// to change color of amount based on value
    amountColorStyle: (num amount) {
      if (amount > 0) {
         return Colors.blue; // for positive value
      } else if (amount < 0) {
         return Colors.purpleAccent; // for nagative value
      } else {
         return Colors.black; // for 0 value
      }
    },
  ),
```
## All Code Customization Options  :

### Basic Options
* currencyType → select currency 
* amount → enter amount (0 = grey)
* showFlag → show/hide country flag
* showCurrencyCode → show/hide currency code

### Layout
* contryCodeSpacing → space between flag & code
* flagSpacing → space between code & amount
* flagAlignment → flag left / right

### Styling
* amountColorStyle → customize color according to your choice
* positive = green
* negative = red
* zero = grey
* hideCurrencySymbol → hide symbol, only show amount
* avoidCurrencyFormat → disable auto-formatting

### Advanced
* customFlagWidget → use your own flag image/widget
* currencyCodeText → replace code with custom text (e.g., US,AUD)
* currencyCodeTextStyle → custom text style

### Supported Currencies:
* USD, EUR, GBP, INR, JPY, AUD, CAD, CNY, SGD, NZD, MXN, ZAR, TRY
   * Example : 
        CurrencyType.AUD, // add according your choice

```
 PriceText(
  /// Supported Currencies: USD, EUR, GBP, INR, JPY, AUD, CAD, CNY, SGD, NZD, MXN, ZAR, TRY
  currencyType: CurrencyType.AUD, //for currency type to be displayed
  amount: 2000, //for amount to be displayed on screen 0 value to show grey color
  showFlag: true, //to show flag of the country
  showCurrencyCode: true, //to show currency code
  ontryCodeSpacing: 10, //spacing between flag and currency code
  flagSpacing: 20, //spacing between currency code and amount
  flagAlignment: AlignmentOption.left, //flag alignment left or right
  amountColorStyle: (amount) {
     if (amount > 0) {
      return Colors.green;
     } else if (amount < 0) {
       return Colors.red;
     } else {
        return Colors.grey;
     }
   }, //custom color resolver for amount
  hideCurrencySymbol: false, //to hide currency symbol if you want to show only amount
  avoidCurrencyFormat: false, //to avoid currency formatting
  customFlagWidget: Image.asset('assets/aud.png', width: 40, height: 40,fit: BoxFit.cover,), //custom flag widget if you want to show custom flag using image
  currencyCodeText: 'australia', //custom currency code text if you want to show custom text
  currencyCodeTextStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500), //custom text style for currency code
),
```
![Screenshot_20250904-103055](https://github.com/user-attachments/assets/c346fedb-6cbb-4743-a1a7-ac2b465b8e14)

# Bugs and Feedback 
We welcome and appreciate any suggestions you may have for improvement.
For bugs, questions, and discussions please use the [GitHub Issues](https://github.com/Androidsignal/price_text/issues).

# Acknowledgments 
It extends Flutter’s foundation to provide a ready-to-use, customizable currency formatter widget.While Flutter and intl provide the base, price_text simplifies the process by combining widgets and formatting logic into a single package you can drop into any app.
 
# Contribution 
The DashStack team enthusiastically welcomes contributions and project participation!
There are a bunch of things you can do if you want to contribute!
The Contributor Guide has all the information you need for everything from reporting bugs to contributing new features.
  
# Credits 
`price_text` is owned and maintained by the `Dashstack Infotech team (SURAT, INDIA)`.
Follow us for updates and new releases 🚀.


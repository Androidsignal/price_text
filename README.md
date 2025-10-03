
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

## 📸 Example
|without Any Customization| Adding with formatterPattern |
|-------------------|-----------------------------|
| ![without formatterPattern](https://github.com/user-attachments/assets/982bcb8c-60d8-4a07-8285-c55159cf528b) | ![formatterPattern](https://github.com/user-attachments/assets/55cea8e4-3c4e-4cbb-886a-1c6c9c21b410)  |

```
 //Example usage of PriceText
  PriceText(
    currencyType: CurrencyType.USD, //for currency type to be displayed
    amount: 1000, //for amount to be displayed on screen using currency format
    formatterPattern:'#,##0.00', //custom pattern for formatting amount(showing like second image)
  ),
```

### show flag :

|without Any Customization| Adding with formatterPattern |
|-------------------|-----------------------------|
| ![without formatterPattern](https://github.com/user-attachments/assets/c256c449-8108-4881-9303-4297fd63a748) | ![Screenshot_20250904-095056](https://github.com/user-attachments/assets/5735a905-d6cb-42f6-80e9-6429cfe8eefa) |

```
 PriceText(
   currencyType: CurrencyType.USD, //for currency type to be displayed
    amount: 1000, //for amount to be displayed on screen using currency format
     showFlag: true, //to show flag of the country
     formatterPattern:'#,##0.00', //custom pattern for formatting amount(showing like second image)
  ),
```

### show showCurrencyCode :

|without Any Customization| Adding with formatterPattern |
|-------------------|-----------------------------|
| ![without formatterPattern](https://github.com/user-attachments/assets/2dd0e90c-6831-4514-84d3-b72d0bc20aad) | ![Screenshot_20250904-095515](https://github.com/user-attachments/assets/92ed2052-79a2-4b57-b8a9-4ff9027c35ac) |

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

| Flag Left (default) | Flag Right |
|----------------------|------------|
| ![flag_right](https://github.com/user-attachments/assets/3f8db4c6-1c0c-4f1c-a958-f59eb7a2466c) | ![flag_left](https://github.com/user-attachments/assets/e5577046-9cd9-4211-946b-484f4c977bce) |

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

| customize flag using image assets  | without currency format |
|----------------------|------------|
| ![Screenshot_20250904-103055](https://github.com/user-attachments/assets/c346fedb-6cbb-4743-a1a7-ac2b465b8e14) | ![flag_left](https://github.com/user-attachments/assets/4ca98547-65d2-4087-88b7-2c6fa12b71bb) |


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

| Hide Currency Symbol | |
|---------------------|---------------------|
| ![Screenshot_20250904-102604](https://github.com/user-attachments/assets/a2e6c815-5c65-47a8-bdac-ce2833c2fb33) | ![flag_left](https://github.com/user-attachments/assets/72bdfc6a-c124-416b-9ae1-b6838a365c63) |

```
    PriceText(
      currencyType: CurrencyType.AUD, //for currency type to be displayed
      amount: 1000, //for amount to be displayed on screen using currency format
      showFlag: true, //to show flag of the country
      showCurrencyCode: true, //to show currency code
      hideCurrencySymbol: true, //to hide currency symbol like $, ₹ etc
    ),
```

### positive and negative value changes color Bydefault :

| Colors (Positive value) | Colors (Negative value) | Colors (Zero value) |
|-------------------|-------------------|---------------|
| ![positive](https://github.com/user-attachments/assets/fe01cd71-628e-4e19-99ed-14f41e30d8ab) | ![negative](https://github.com/user-attachments/assets/d90302b3-8c84-4187-8f60-13231416f9f3) | ![zero](https://github.com/user-attachments/assets/e04ea1ae-9d11-4908-aded-d9a94a478b14) |

| Colors (Positive value) | Colors (Negative value) | Colors (Zero value) |
|-------------------|-------------------|---------------|
| ![positive](https://github.com/user-attachments/assets/d580fc93-f8f6-47e0-b545-01e50f336ff8) | ![negative](https://github.com/user-attachments/assets/247ca60f-a7c2-456d-b150-96af3b3e59be) | ![zero](https://github.com/user-attachments/assets/b90cfe41-99ad-4fef-a6c6-5e8f54232920) |

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

| Colors (Positive value) | Colors (Negative value) | Colors (Zero value) |
|-------------------|-------------------|---------------|
| ![positive](https://github.com/user-attachments/assets/f0145f88-36ed-438b-9f14-9b70d02904a8) | ![negative](https://github.com/user-attachments/assets/5ca016d6-5f76-4922-b1fb-c710fce40b5a) | ![zero](https://github.com/user-attachments/assets/98330a4e-0e2f-483d-beb7-ad3615928d1b) |

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

### Use Currency locale for using formatting 
The locale property allows you to set the regional formatting for your currency display.
Supported locales:`INR → en_IN, USD → en_US, CAD → en_CA, EUR → en_IE, GBP → en_GB, JPY → ja_JP, AUD → en_AU, CNY → zh_CN, SGD → en_SG, NZD → en_NZ, MXN → es_MX, ZAR → en_ZA, TRY → tr_TR `

|Currency locale formatting |  |
|-------------------|-----------------------------|
| ![Screenshot_20250904-103055](https://github.com/user-attachments/assets/6e629c64-0a8c-4bdb-9c77-9121ef549620) | ![Screenshot_20250904-095515](https://github.com/user-attachments/assets/a97e89ef-5b9d-491c-9e8c-fb2136cae399) |

```
PriceText(
  currencyType: CurrencyType.USD, //for currency type to be displayed
  amount: 12345.67, //for amount to be displayed on screen 0 value to show grey color
  locale: "en_US", //locale for formatting
  usePatternWithTextSpan: true, // to use pattern with TextSpan
  formatterPattern: '#,##0.0', //custom pattern for formatting
),
```

### Use Currency formatterPattern 
The formatterPattern property lets you customize the number format of the amount.

|Currency locale formatting |  |
|-------------------|-----------------------------|
| ![Screenshot_20250904-103055](https://github.com/user-attachments/assets/d6177bc4-e260-4d48-8f6d-f641b4dd448e) | ![Screenshot_20251003-162652](https://github.com/user-attachments/assets/8fe00a5b-3002-411a-b565-2054e0ec67f3) |

```
PriceText(
  currencyType: CurrencyType.USD, //for currency type to be displayed
  amount: 12345.67, //for amount to be displayed on screen 0 value to show grey color
  locale: "en_US", //locale for formatting
  formatterPattern: '#,##0.0', //custom pattern for formatting
  usePatternWithTextSpan: true, // to use pattern with TextSpan
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
  locale: "en_AU", //locale for formatting
  formatterPattern: '#,##0.00', //custom pattern for formatting
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

| All Customization | |
|---------------------|---------------------|
| ![Screenshot_20250904-103055](https://github.com/user-attachments/assets/c346fedb-6cbb-4743-a1a7-ac2b465b8e14) | ![flag_left](https://github.com/user-attachments/assets/7b6a94e4-d7b1-4e22-8d8d-2c2c52a82bf2) |


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


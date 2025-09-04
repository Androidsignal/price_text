import 'package:intl/intl.dart';

class CurrencyType {
  final String? currencyCode;
  final String? currencySymbol;
  final String? flag;

  const CurrencyType({this.currencyCode, this.currencySymbol, this.flag});

  /// Format currency
  String formatCurrency(num amount) {
    final localeMap = {
      "INR": "en_IN",
      "USD": "en_US",
      "CAD": "en_CA",
      "EUR": "en_IE",
      "GBP": "en_GB",
      "JPY": "ja_JP",
      "AUD": "en_AU",
      "CNY": "zh_CN",
      "SGD": "en_SG",
      "NZD": "en_NZ",
      "MXN": "es_MX",
      "ZAR": "en_ZA",
      "TRY": "tr_TR",
    };

    final format = NumberFormat.currency(
      locale: localeMap[currencyCode] ?? "en_US",
      symbol: currencySymbol,
    );

    return format.format(amount);
  }

  /// currency types
  static const USD = CurrencyType(
    currencyCode: "USD",
    currencySymbol: "\$",
    flag: "🇺🇸",
  );
  static const EUR = CurrencyType(
    currencyCode: "EUR",
    currencySymbol: "€",
    flag: "🇪🇺",
  );
  static const GBP = CurrencyType(
    currencyCode: "GBP",
    currencySymbol: "£",
    flag: "🇬🇧",
  );
  static const INR = CurrencyType(
    currencyCode: "INR",
    currencySymbol: "₹",
    flag: "🇮🇳",
  );
  static const JPY = CurrencyType(
    currencyCode: "JPY",
    currencySymbol: "¥",
    flag: "🇯🇵",
  );
  static const AUD = CurrencyType(
    currencyCode: "AUD",
    currencySymbol: "A\$",
    flag: "🇦🇺",
  );
  static const CAD = CurrencyType(
    currencyCode: "CAD",
    currencySymbol: "C\$",
    flag: "🇨🇦",
  );
  static const CNY = CurrencyType(
    currencyCode: "CNY",
    currencySymbol: "¥",
    flag: "🇨🇳",
  );
  static const SGD = CurrencyType(
    currencyCode: "SGD",
    currencySymbol: "S\$",
    flag: "🇸🇬",
  );
  static const NZD = CurrencyType(
    currencyCode: "NZD",
    currencySymbol: "NZ\$",
    flag: "🇳🇿",
  );
  static const MXN = CurrencyType(
    currencyCode: "MXN",
    currencySymbol: "\$",
    flag: "🇲🇽",
  );
  static const ZAR = CurrencyType(
    currencyCode: "ZAR",
    currencySymbol: "R",
    flag: "🇿🇦",
  );
  static const TRY = CurrencyType(
    currencyCode: "TRY",
    currencySymbol: "₺",
    flag: "🇹🇷",
  );

  static const all = [
    USD,
    EUR,
    GBP,
    INR,
    JPY,
    AUD,
    CAD,
    CNY,
    SGD,
    NZD,
    MXN,
    ZAR,
    TRY,
  ];
}

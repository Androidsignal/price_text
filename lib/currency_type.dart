import 'package:intl/intl.dart';

/// A model class representing a currency type.
///
/// Provides currency code, symbol, and flag, and can format amounts
/// according to the appropriate locale.
class CurrencyType {
  /// The 3-letter ISO currency code (e.g., "USD", "INR").
  final String? currencyCode;

  /// The currency symbol (e.g., `$`, `₹`, `€`).
  final String? currencySymbol;

  /// A flag emoji or icon representing the country/region.
  final String? flag;

  /// Creates a [CurrencyType] with the given [currencyCode],
  /// [currencySymbol], and [flag].
  const CurrencyType({this.currencyCode, this.currencySymbol, this.flag});

  /// Formats the given [amount] using the currency's locale and symbol.
  ///
  /// Example:
  /// ```dart
  /// CurrencyType.USD.formatCurrency(1234.56); // $1,234.56
  /// ```
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

  /// United States Dollar.
  static const USD = CurrencyType(
    currencyCode: "USD",
    currencySymbol: "\$",
    flag: "🇺🇸",
  );

  /// Euro.
  static const EUR = CurrencyType(
    currencyCode: "EUR",
    currencySymbol: "€",
    flag: "🇪🇺",
  );

  /// British Pound Sterling.
  static const GBP = CurrencyType(
    currencyCode: "GBP",
    currencySymbol: "£",
    flag: "🇬🇧",
  );

  /// Indian Rupee.
  static const INR = CurrencyType(
    currencyCode: "INR",
    currencySymbol: "₹",
    flag: "🇮🇳",
  );

  /// Japanese Yen.
  static const JPY = CurrencyType(
    currencyCode: "JPY",
    currencySymbol: "¥",
    flag: "🇯🇵",
  );

  /// Australian Dollar.
  static const AUD = CurrencyType(
    currencyCode: "AUD",
    currencySymbol: "A\$",
    flag: "🇦🇺",
  );

  /// Canadian Dollar.
  static const CAD = CurrencyType(
    currencyCode: "CAD",
    currencySymbol: "C\$",
    flag: "🇨🇦",
  );

  /// Chinese Yuan.
  static const CNY = CurrencyType(
    currencyCode: "CNY",
    currencySymbol: "¥",
    flag: "🇨🇳",
  );

  /// Singapore Dollar.
  static const SGD = CurrencyType(
    currencyCode: "SGD",
    currencySymbol: "S\$",
    flag: "🇸🇬",
  );

  /// New Zealand Dollar.
  static const NZD = CurrencyType(
    currencyCode: "NZD",
    currencySymbol: "NZ\$",
    flag: "🇳🇿",
  );

  /// Mexican Peso.
  static const MXN = CurrencyType(
    currencyCode: "MXN",
    currencySymbol: "\$",
    flag: "🇲🇽",
  );

  /// South African Rand.
  static const ZAR = CurrencyType(
    currencyCode: "ZAR",
    currencySymbol: "R",
    flag: "🇿🇦",
  );

  /// Turkish Lira.
  static const TRY = CurrencyType(
    currencyCode: "TRY",
    currencySymbol: "₺",
    flag: "🇹🇷",
  );

  /// A list of all supported [CurrencyType]s.
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

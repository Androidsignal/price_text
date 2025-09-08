import 'package:intl/intl.dart';

///  A model class representing a currency type
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

  /// Formats a given [amount] according to locale OR custom options.
  ///
  /// Example:
  /// ```dart
  /// CurrencyType.INR.formatCurrency(1234.56);        // ₹1,234.56
  /// CurrencyType.USD.formatCurrency(1234.56, withSymbol: false); // 1,234.56
  /// ```
  String formatCurrency(
    num amount, {
    bool withSymbol = true,
    bool withGrouping = true,
    int decimalDigits = 2,
    String? customSymbol,
    String? customLocale,
    String? customPattern, // e.g., "#,##0.00"
    String? decimalSeparator,
    String? groupingSeparator,
  }) {
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

    final locale = customLocale ?? localeMap[currencyCode] ?? "en_US";

    NumberFormat format;

    if (customPattern != null) {
      // Use custom pattern, no symbol automatically
      format = NumberFormat(customPattern, locale);
    } else if (!withSymbol) {
      // No symbol → use NumberFormat with simple decimal pattern
      format = NumberFormat.currency(
        locale: locale,
        symbol: '',
        decimalDigits: decimalDigits,
      );
    } else {
      // Default formatting with symbol
      format = NumberFormat.currency(
        locale: locale,
        symbol: customSymbol ?? currencySymbol,
        decimalDigits: decimalDigits,
      );
    }

    // Format the number
    String result = withGrouping
        ? format.format(amount)
        : amount.toStringAsFixed(decimalDigits);

    // Override separators if provided
    if (decimalSeparator != null) {
      result = result.replaceAll(format.symbols.DECIMAL_SEP, decimalSeparator);
    }
    if (groupingSeparator != null) {
      result = result.replaceAll(format.symbols.GROUP_SEP, groupingSeparator);
    }

    // Manually prepend symbol if needed (for custom pattern or withGrouping = false)
    if (withSymbol && (customPattern != null || !withGrouping)) {
      result = "${customSymbol ?? currencySymbol}$result";
    }

    return result;
  }

  /// --- Currency Constants ---

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
    currencySymbol: "\$",
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

  /// All supported currencies
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

import 'package:flutter/material.dart';
import 'package:price_text/currency_type.dart';

/// Alignment options for positioning the flag in [PriceText].
enum AlignmentOption {
  /// Place the flag to the left of the amount and currency code.
  left,

  /// Place the flag to the right of the amount and currency code.
  right
}

/// A widget to display a formatted price with various customization options.
///
/// Supports currency symbols, country flags, currency codes, custom styling,
/// color for positive/negative/zero amounts, locale formatting, and custom patterns.
class PriceText extends StatelessWidget {
  /// The currency type to display (e.g., USD, INR).
  final CurrencyType currencyType;

  /// The numerical amount to display.
  final num amount;

  /// Optional custom text for the currency code.
  final String? currencyCodeText;

  /// Text style for the currency code.
  final TextStyle? currencyCodeTextStyle;

  /// Text style for the amount.
  final TextStyle? amountTextStyle;

  /// Whether to show the country flag.
  final bool showFlag;

  /// Whether to show the currency code.
  final bool showCurrencyCode;

  /// Whether to hide the currency symbol.
  final bool hideCurrencySymbol;

  /// Whether to avoid default currency formatting.
  final bool avoidCurrencyFormat;

  /// Optional custom widget to use as the flag.
  final Widget? customFlagWidget;

  /// Alignment of the flag relative to the amount.
  final AlignmentOption flagAlignment;

  /// Spacing between the flag and the currency code/amount.
  final double flagSpacing;

  /// Spacing between the currency code and amount.
  final double contryCodeSpacing;

  /// Optional locale string for regional number formatting (e.g., "en_US").
  final String? locale;

  /// Optional custom formatter pattern (e.g., "#,##0.00").
  final String? formatterPattern;

  /// Custom function to determine the color of the amount based on its value.
  final Color Function(num amount)? amountColorStyle;

  /// Creates a [PriceText] widget.
  ///
  /// [currencyType] and [amount] are required. Other parameters are optional.
  const PriceText({
    super.key,
    required this.currencyType,
    required this.amount,
    this.currencyCodeText,
    this.currencyCodeTextStyle,
    this.amountTextStyle,
    this.showFlag = false,
    this.showCurrencyCode = false,
    this.hideCurrencySymbol = false,
    this.avoidCurrencyFormat = false,
    this.customFlagWidget,
    this.flagAlignment = AlignmentOption.left,
    this.flagSpacing = 6,
    this.contryCodeSpacing = 6,
    this.amountColorStyle,
    this.locale,
    this.formatterPattern,
  });

  @override
  Widget build(BuildContext context) {
    /// Format amount string
    String formatted;
    if (avoidCurrencyFormat) {
      formatted = amount.toString();
      if (!hideCurrencySymbol && currencyType.currencySymbol != null) {
        formatted = "${currencyType.currencySymbol}$formatted";
      }
    } else {
      formatted = currencyType.formatCurrency(
        amount,
        withSymbol: !hideCurrencySymbol,
        customLocale: locale,
        customPattern: formatterPattern,
      );
    }

    /// Decide color for the amount
    final Color valueColor = amountColorStyle != null
        ? amountColorStyle!(amount)
        : (amount > 0
            ? Colors.green
            : amount < 0
                ? Colors.red
                : Colors.grey);

    /// Build flag widget
    Widget flagWidget = const SizedBox.shrink();
    if (showFlag) {
      if (customFlagWidget != null) {
        flagWidget = customFlagWidget!;
      } else {
        flagWidget = Text(
          currencyType.flag ?? '',
          style: const TextStyle(fontSize: 24),
        );
      }
    }

    /// Currency code widget
    final currencyCodeWidget = Text(
      currencyCodeText ?? (currencyType.currencyCode ?? ''),
      style: currencyCodeTextStyle ??
          const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
    );

    /// Amount widget
    final amountWidget = Text(
      formatted,
      style: amountTextStyle ??
          TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: valueColor,
          ),
    );

    /// Row containing currency code and amount
    final rightSide = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showCurrencyCode) currencyCodeWidget,
        if (showCurrencyCode) SizedBox(width: contryCodeSpacing),
        amountWidget,
      ],
    );

    /// Final layout
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: flagAlignment == AlignmentOption.left
          ? [
              if (showFlag) flagWidget,
              if (showFlag) SizedBox(width: flagSpacing),
              rightSide,
            ]
          : [
              rightSide,
              if (showFlag) SizedBox(width: flagSpacing),
              if (showFlag) flagWidget,
            ],
    );
  }
}

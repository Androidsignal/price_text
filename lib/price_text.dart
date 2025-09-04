import 'package:flutter/material.dart';
import 'package:price_text/currency_type.dart';

enum AlignmentOption { left, right }

class PriceText extends StatelessWidget {
  final CurrencyType currencyType;
  final num amount;

  // Text styles
  final String? currencyCodeText;
  final TextStyle? currencyCodeTextStyle;
  final TextStyle? amountTextStyle;

  // Show/hide options
  final bool showFlag;
  final bool showCurrencyCode;
  final bool hideCurrencySymbol;
  final bool avoidCurrencyFormat;

  // Flag customization
  final Widget? customFlagWidget;

  // Alignment
  final AlignmentOption flagAlignment;

  // Spacing options
  final double flagSpacing;
  final double contryCodeSpacing;

  /// Custom color resolver
  final Color Function(num amount)? amountColorStyle;

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
  });

  @override
  Widget build(BuildContext context) {
    /// Format amount
    String formatted;
    if (avoidCurrencyFormat) {
      formatted = amount.toString();
      if (currencyType.currencySymbol != null && currencyType.currencySymbol!.isNotEmpty) {
        formatted = "${currencyType.currencySymbol}$formatted";
      }
    } else {
      formatted = currencyType.formatCurrency(amount);
    }

    /// Remove symbol if disabled
    if (hideCurrencySymbol && currencyType.currencySymbol != null) {
      formatted = formatted.replaceAll(currencyType.currencySymbol!, "").trim();
    }

    /// Decide color based on amount and custom style
    final Color valueColor = amountColorStyle != null
        ? amountColorStyle!(amount)
        : (amount > 0
              ? Colors.green
              : amount < 0
              ? Colors.red
              : Colors.grey);

    /// Flag assets widget
    Widget flagWidget = const SizedBox.shrink();
    if (showFlag) {
      if (customFlagWidget != null) {
        flagWidget = customFlagWidget!;
      } else if (currencyType.flag != null) {
        flagWidget = Text(currencyType.flag!, style: const TextStyle(fontSize: 24));
      }
    }

    ///  Currency code
    final currencyCodeWidget = Text(
      currencyCodeText ?? (currencyType.currencyCode ?? ''),
      style: (currencyCodeTextStyle ?? const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black)),
    );

    ///  Amount
    final amountWidget = Text(
      formatted,
      style: (amountTextStyle ?? TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: valueColor)),
    );

    /// Right side = code + amount
    final rightSide = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showCurrencyCode) currencyCodeWidget,
        if (showCurrencyCode) SizedBox(width: contryCodeSpacing),
        amountWidget,
      ],
    );

    /// Final layout for alignment
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: flagAlignment == AlignmentOption.left
          ? [if (showFlag) flagWidget, if (showFlag) SizedBox(width: flagSpacing), rightSide]
          : [rightSide, if (showFlag) SizedBox(width: flagSpacing), if (showFlag) flagWidget],
    );
  }
}

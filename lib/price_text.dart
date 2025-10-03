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

  ///  when true, formatterPattern will be parsed into TextSpan style
  final bool usePatternWithTextSpan;

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
    this.usePatternWithTextSpan = false,
    this.customFlagWidget,
    this.flagAlignment = AlignmentOption.left,
    this.flagSpacing = 6,
    this.contryCodeSpacing = 6,
    this.locale,
    this.formatterPattern,
    this.amountColorStyle,
  });

  @override
  Widget build(BuildContext context) {
    final Color valueColor = amountColorStyle != null
        ? amountColorStyle!(amount)
        : (amount > 0
            ? Colors.green
            : amount < 0
                ? Colors.red
                : Colors.grey);

    final String symbol =
        hideCurrencySymbol ? '' : (currencyType.currencySymbol ?? '');

    // --- Custom Pattern ---
    if (formatterPattern != null) {
      final formatted = currencyType.formatCurrency(
        amount,
        withSymbol: !hideCurrencySymbol,
        customLocale: locale,
        customPattern: formatterPattern,
      );

      if (usePatternWithTextSpan) {
        //  split into integer + decimal  default
        final parts = formatted.replaceAll(symbol, '').split('.');
        final intPart = parts[0];
        final decimalPart = parts.length > 1 ? parts[1].padRight(2, '0') : '';

        final amountWidget = RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '$symbol$intPart',
                style: (amountTextStyle ??
                        const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold))
                    .copyWith(color: valueColor),
              ),
              if (decimalPart.isNotEmpty)
                WidgetSpan(
                  alignment: PlaceholderAlignment.aboveBaseline,
                  baseline: TextBaseline.alphabetic,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 1.5),
                    child: Text(
                      decimalPart,
                      style: TextStyle(
                        fontSize: (amountTextStyle?.fontSize ?? 25) * 0.6,
                        fontWeight:
                            amountTextStyle?.fontWeight ?? FontWeight.w500,
                        color: valueColor,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );

        return _buildRow(amountWidget);
      } else {
        // fallback → plain text
        return _buildRow(
          _buildText(formatted, valueColor),
        );
      }
    }

    // --- Default formatting ---
    final intPart = amount.floor();
    final decimalPart =
        ((amount - intPart) * 100).round().toString().padLeft(2, '0');

    final amountWidget = RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$symbol$intPart',
            style: (amountTextStyle ??
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
                .copyWith(color: valueColor),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.aboveBaseline,
            baseline: TextBaseline.alphabetic,
            child: Padding(
              padding: const EdgeInsets.only(left: 1.5),
              child: Text(
                decimalPart,
                style: TextStyle(
                  fontSize: (amountTextStyle?.fontSize ?? 25) * 0.6,
                  fontWeight: amountTextStyle?.fontWeight ?? FontWeight.w500,
                  color: valueColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );

    return _buildRow(amountWidget);
  }

  /// Row wrap
  Widget _buildRow(Widget amountWidget) {
    Widget flagWidget = const SizedBox.shrink();
    if (showFlag) {
      flagWidget = customFlagWidget ??
          Text(currencyType.flag ?? '', style: const TextStyle(fontSize: 24));
    }

    final currencyCodeWidget = Text(
      currencyCodeText ?? (currencyType.currencyCode ?? ''),
      style: currencyCodeTextStyle ??
          const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    );

    final rightSide = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showCurrencyCode) currencyCodeWidget,
        if (showCurrencyCode) SizedBox(width: contryCodeSpacing),
        amountWidget,
      ],
    );

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

  /// fallback plain text
  Widget _buildText(String text, Color valueColor) {
    return Text(
      text,
      style: (amountTextStyle ??
              const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ))
          .copyWith(color: valueColor),
    );
  }
}

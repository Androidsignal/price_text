# Changelog

All notable changes to the **price_text** package will be documented in this file.  
This project follows [Semantic Versioning](https://semver.org/).

---

## [0.0.2] - (2025-Sep-04)

- Improved documentation for `CurrencyType` and `PriceText`.
- Expanded pubspec description (50–180 chars).
- Added support for custom flag alignment (`left` or `right`).
- Added `flagSpacing` and `contryCodeSpacing` customization.
- Formatted all Dart files with `dart format` to pass analyzer.


## [0.0.1] - (2025-Sep-04)

- Initial release of price_text.
- Provides a reusable PriceText widget for displaying currency amounts.
- Provides a customizable PriceText widget for Flutter apps.
- Ready-to-use, reusable widget that can be easily integrated into your screen.  
- Supports :
    * Custom text styles for amount and currency code.
    * Optionally showing currency symbol, code, and flags (emoji or asset).
    * Custom alignment for flags (left/right position set).
    * Custom spacing between flag, currency code, and amount.
    * Dynamic color based on positive/negative values or custom color for your selection.
    * Option to avoid automatic currency formatting.
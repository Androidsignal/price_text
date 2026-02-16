# Changelog

All notable changes to the **price_text** package will be documented in this file.  
This project follows [Semantic Versioning](https://semver.org/).

---
## [0.0.8] - (2026-Feb-16)
- Updated documentation  for `PriceText`.

## [0.0.7] - (2025-Oct-03)
- **New Feature:** Introduced `usePatternWithTextSpan` parameter in `PriceText`.
  - Allows you to render formatted currency amounts using `TextSpan` with custom pattern support.
  - Useful for cases where you want to control integer and decimal styling separately (e.g.,like e-commerce price styles).
- Added support for `formatterPattern` with `TextSpan` rendering.
- `formatterPattern: "#,##0.00"` will respect number grouping while still allowing `TextSpan` styling.


## [0.0.6] - (2025-Sep-08)

- Support for multiple currency locales.
- `locale` property for controlling number formatting regionally.
- Optional `formatterPattern` property to allow custom number formatting.
- Updated documentation for `PriceText` usage and locale support.

## [0.0.5] - (2025-Sep-04)

- Lowered Dart SDK constraint from `>=>=3.9.0 <4.0.0` to `>=3.0.0 <4.0.0` for broader compatibility.
- This update allows projects using Dart 3.8.x to integrate `price_text` without requiring a Flutter/Dart upgrade.

## [0.0.4] - (2025-Sep-04)

- Updated issue tracker link.

## [0.0.3] - (2025-Sep-04)

- Improved documentation for `PriceText`.

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
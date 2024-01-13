import 'package:flutter/material.dart';
import 'package:login/theme/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeGray900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray900,
      );
      static get bodyLargeGray800 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray800,
      );
  static get bodyLargeWhiteA700 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyLarge_1 => theme.textTheme.bodyLarge!;
  static get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900,
      );
  // Title text style
  static get titleSmallDeeppurple500 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.deepPurple500,
      );
      // Label text style
  static get labelLargeGray900 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w600,
      );
  // Title text style
  static get titleSmallGray900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray900,
      );
      static get titleMediumGray90001 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray90001,
      );
      static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
      );
  static get titleSmallDeeporange200 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.deepOrange200,
      );
}

extension on TextStyle {
  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }
}

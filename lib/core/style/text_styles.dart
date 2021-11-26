import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hospital_doctor/core/style/colors.dart';

const _robotoFontName = 'Roboto';

CustomTextStyle get roboto => const Roboto();

class Roboto extends CustomTextStyle {
  const Roboto()
      : super._(
          fontFamily: _robotoFontName,
          fontSize: 14.0,
          color: CustomColors.black,
        );
}

class CustomTextStyle extends TextStyle {
  const CustomTextStyle._({
    bool inherit = true,
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<Shadow>? shadows,
    List<FontFeature>? fontFeatures,
    TextDecoration? decoration,
    Color? decorationColor,
    TextLeadingDistribution? leadingDistribution,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? debugLabel,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    String? package,
  }) : super(
          inherit: inherit,
          color: color,
          backgroundColor: backgroundColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          leadingDistribution: leadingDistribution,
          textBaseline: textBaseline,
          height: height,
          locale: locale,
          foreground: foreground,
          background: background,
          shadows: shadows,
          fontFeatures: fontFeatures,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          decorationThickness: decorationThickness,
          debugLabel: debugLabel,
          fontFamily: fontFamily,
          fontFamilyFallback: fontFamilyFallback,
          package: package,
        );

  // sizes
  CustomTextStyle get s10 => copyWith(fontSize: 10);

  CustomTextStyle get s12 => copyWith(fontSize: 12);

  CustomTextStyle get s14 => copyWith(fontSize: 14);

  CustomTextStyle get s16 => copyWith(fontSize: 16);

  CustomTextStyle get s18 => copyWith(fontSize: 18);

  CustomTextStyle get s20 => copyWith(fontSize: 20);

  CustomTextStyle get s22 => copyWith(fontSize: 22);

  CustomTextStyle get s24 => copyWith(fontSize: 24);

  CustomTextStyle get s26 => copyWith(fontSize: 26);

  CustomTextStyle get s32 => copyWith(fontSize: 32);

  CustomTextStyle get s36 => copyWith(fontSize: 36);

  CustomTextStyle get s52 => copyWith(fontSize: 52);

  // weights
  CustomTextStyle get w100 => copyWith(fontWeight: FontWeight.w100);

  CustomTextStyle get w300 => copyWith(fontWeight: FontWeight.w300);

  CustomTextStyle get w400 => copyWith(fontWeight: FontWeight.w400);

  CustomTextStyle get w500 => copyWith(fontWeight: FontWeight.w500);

  CustomTextStyle get w700 => copyWith(fontWeight: FontWeight.w700);

  CustomTextStyle get w900 => copyWith(fontWeight: FontWeight.w900);

  // style
  CustomTextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  // colors
  CustomTextStyle get whiteColor => copyWith(color: CustomColors.white);

  CustomTextStyle get blackColor => copyWith(color: CustomColors.black);

  // heights
  CustomTextStyle get h15 => copyWith(height: 1.5);

  CustomTextStyle get h35 => copyWith(height: 3.5);

  @override
  CustomTextStyle copyWith({
    Paint? background,
    Color? backgroundColor,
    Color? color,
    String? debugLabel,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    List<FontFeature>? fontFeatures,
    double? fontSize,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    Paint? foreground,
    double? height,
    bool? inherit,
    TextLeadingDistribution? leadingDistribution,
    double? letterSpacing,
    Locale? locale,
    TextOverflow? overflow,
    List<Shadow>? shadows,
    TextBaseline? textBaseline,
    double? wordSpacing,
  }) {
    return CustomTextStyle._(
      inherit: inherit ?? this.inherit,
      color: this.foreground == null && foreground == null ? color ?? this.color : null,
      backgroundColor: this.background == null && background == null ? backgroundColor ?? this.backgroundColor : null,
      fontFamily: fontFamily ?? this.fontFamily,
      fontFamilyFallback: fontFamilyFallback ?? this.fontFamilyFallback,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      wordSpacing: wordSpacing ?? this.wordSpacing,
      textBaseline: textBaseline ?? this.textBaseline,
      height: height ?? this.height,
      locale: locale ?? this.locale,
      foreground: foreground ?? this.foreground,
      background: background ?? this.background,
      shadows: shadows ?? this.shadows,
      fontFeatures: fontFeatures ?? this.fontFeatures,
      decoration: decoration ?? this.decoration,
      decorationColor: decorationColor ?? this.decorationColor,
      decorationStyle: decorationStyle ?? this.decorationStyle,
      decorationThickness: decorationThickness ?? this.decorationThickness,
    );
  }
}

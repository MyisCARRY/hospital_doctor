import 'package:flutter/material.dart';

extension WidgetExt on Widget {
  Widget extPadding({double horizontal = 0.0, double vertical = 0.0}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: this,
      );
}

extension InkWellExt on InkWell{
  InkWell noSplash() => InkWell(
    key: key,
    onTap: onTap,
    onDoubleTap: onDoubleTap,
    onLongPress: onLongPress,
    onTapDown: onTapDown,
    onTapCancel: onTapCancel,
    onHighlightChanged: onHighlightChanged,
    onHover: onHover,
    mouseCursor: mouseCursor,
    focusColor: focusColor,
    hoverColor: hoverColor,
    highlightColor: Colors.transparent,
    overlayColor: overlayColor,
    splashColor: Colors.transparent,
    splashFactory: splashFactory,
    radius: radius,
    borderRadius: borderRadius,
    customBorder: customBorder,
    enableFeedback: enableFeedback,
    excludeFromSemantics: excludeFromSemantics,
    focusNode: focusNode,
    canRequestFocus: canRequestFocus,
    onFocusChange: onFocusChange,
    autofocus: autofocus,
    child: child,
  );
}

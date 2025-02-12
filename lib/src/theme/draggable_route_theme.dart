import 'dart:ui';

import 'package:draggable_route/src/theme/default_draggable_theme.dart';
import 'package:flutter/material.dart';

typedef ImageFilterTransitionBuilder = ImageFilter Function(
  Animation<double> animation,
);

/// {@template draggable_route.DraggableRouteTheme}
/// Theme to control styling of [DraggableRoute]
/// {@endtemplate}
class DraggableRouteTheme extends ThemeExtension<DraggableRouteTheme> {
  final Duration transitionDuration;

// #region Curves

  /// Curve for entering animation
  final Curve transitionCurve;

  /// Curve for exiting animation
  final Curve? transitionCurveOut;

// #endregion

// #region Cancelling dismiss

  /// Curve for cancelled dismiss animation
  final Curve cancelDismissAnimationCurve;

  /// Duration of cancelled dismiss animation
  final Duration cancelDismissAnimationDuration;

// #endregion

// #region Filters

  /// Background filter animation builder
  final ImageFilterTransitionBuilder? backdropFilterBuilder;

  /// Dissolve filter animation builder.
  ///
  /// Used when source was not provided or no longer alive
  final ImageFilterTransitionBuilder? dissolveFilterBuilder;

// #endregion

  // shape

// #region Shape

  /// Border radius of card when dragging around
  final BorderRadius borderRadius;

// #endregion

// #region Dismissing

  /// Minimal velocity to pop route
  final double dismissVelocity;

  /// Minimal distance to pop route
  final double dismissDistance;

// #endregion

// #region Other

  final DraggableRouteSettings settings;

// #endregion

  /// {@macro draggable_route.DraggableRouteTheme}
  const DraggableRouteTheme({
    required this.transitionDuration,
    required this.transitionCurve,
    this.borderRadius = BorderRadius.zero,
    this.settings = kDefaultSettings,
    this.transitionCurveOut,
    this.backdropFilterBuilder,
    this.dissolveFilterBuilder,
    this.cancelDismissAnimationCurve = Curves.easeOutCubic,
    this.cancelDismissAnimationDuration = const Duration(milliseconds: 200),
    this.dismissVelocity = 4,
    this.dismissDistance = 90,
  });

  /// {@macro draggable_route.DraggableRouteTheme}
  ///
  /// Get instance from ancestor [Theme]
  static DraggableRouteTheme of(BuildContext context) {
    return Theme.of(context).extension<DraggableRouteTheme>() ?? kDefaultTheme;
  }

  @override
  ThemeExtension<DraggableRouteTheme> copyWith() {
    return this;
  }

  @override
  ThemeExtension<DraggableRouteTheme> lerp(
    covariant ThemeExtension<DraggableRouteTheme>? other,
    double t,
  ) {
    return other ?? this;
  }
}

class DraggableRouteSettings {
  /// drag slop in the middle of scrollable
  final double slop;

  /// drag slop on the edge on scrollable
  final double edgeSlop;

  /// refer [DraggableRouteTheme.dismissDistance], the value in the runtime setting has the priority.
  final double? dismissDistance;

  /// refer [DraggableRouteTheme.dismissVelocity], the value in the runtime setting has the priority.
  final double? dismissVelocity;

  const DraggableRouteSettings({
    required this.slop,
    required this.edgeSlop,
    this.dismissDistance,
    this.dismissVelocity,
  });

  DraggableRouteSettings copyWith(
      {double? slop,
      double? edgeSlop,
      double? dismissDistance,
      double? dismissVelocity}) {
    return DraggableRouteSettings(
        slop: slop ?? this.slop,
        edgeSlop: edgeSlop ?? this.edgeSlop,
        dismissVelocity: dismissVelocity ?? this.dismissVelocity,
        dismissDistance: dismissDistance ?? this.dismissDistance);
  }
}

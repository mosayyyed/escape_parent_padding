import 'package:flutter/widgets.dart';

/// A widget that allows its [child] to bypass parent styling like padding or margin.
///
/// This is useful when used inside widgets like [EscapablePadding], where you want
/// to opt-out a specific child from the parent constraints.
///
/// {@tool snippet}
/// ### Example
/// ```dart
/// Escaped(
///   child: Text('This text is not affected by parent styling'),
/// )
/// ```
/// {@end-tool}
///
/// The [child] parameter must not be null.
class Escaped extends StatelessWidget {
  /// The widget to render without parent padding or styling.
  final Widget child;

  /// Creates an [Escaped] widget.
  ///
  /// The [child] must not be null.
  const Escaped({super.key, required this.child});

  @override
  Widget build(BuildContext context) => child;
}

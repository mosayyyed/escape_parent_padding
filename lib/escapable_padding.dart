import 'package:escape_parent_padding/escaped.dart';
import 'package:flutter/widgets.dart';

/// A widget that allows its child or children to escape the constraints of a parent padding.
///
/// ## Constructors:
///
/// ### `EscapablePadding`
/// - `padding`: The padding to apply around each child.
/// - `children`: A list of widgets to display. If a child is of type `Escaped`, it will bypass the padding.
/// - `builder`: A function that takes the `BuildContext` and the list of wrapped children, and returns a widget.
///
/// ### `EscapablePadding.lite`
/// - `height`: The height of the widget.
/// - `child`: A single widget to display that overflows the parent padding.
///
/// ## Behavior:
/// - The default constructor wraps children in padding unless they are `Escaped`.
/// - The `lite` constructor allows a single child to escape parent constraints using `OverflowBox`.
class EscapablePadding extends StatelessWidget {
  /// Padding to be applied around each non-escaped child.
  final EdgeInsets? padding;

  /// List of children. Required in default constructor.
  final List<Widget>? children;

  /// Builder function to construct a widget using padded children.
  final Widget Function(BuildContext context, List<Widget> children)? builder;

  /// Height for lite mode (used with OverflowBox).
  final double? height;

  /// Single child used in lite mode.
  final Widget? child;

  /// Default constructor for multiple children and padding.
  const EscapablePadding({
    super.key,
    required this.padding,
    required this.children,
    required this.builder,
  }) : height = null,
       child = null;

  /// Lite constructor for single child that escapes horizontal constraints.
  const EscapablePadding.lite({
    super.key,
    required this.height,
    required this.child,
  }) : padding = null,
       children = null,
       builder = null;

  @override
  Widget build(BuildContext context) {
    // --- Lite version ---
    if (height != null && child != null) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: height,
        child: Row(
          children: [
            Expanded(
              child: OverflowBox(
                // Child can overflow horizontally, e.g. inside a horizontally padded parent
                maxWidth: MediaQuery.of(context).size.width,
                child: child!,
              ),
            ),
          ],
        ),
      );
    }

    // --- Default version with children ---
    assert(
      padding != null && children != null && builder != null,
      'When using default constructor, padding, children, and builder must be provided.',
    );

    final wrappedChildren =
        children!.map((child) {
          // Escape padding if wrapped in Escaped widget
          if (child is Escaped) return child.child;

          // Wrap non-escaped child with padding
          return Padding(padding: padding!, child: child);
        }).toList();

    return builder!(context, wrappedChildren);
  }
}

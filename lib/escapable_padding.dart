import 'package:flutter/widgets.dart';
import 'package:escape_parent_padding/escaped.dart';

/// A widget that allows its child or children to escape the constraints of a parent's padding.
///
/// This widget provides two modes:
///
/// ### Default Constructor:
/// - Used for multiple children.
/// - Applies padding around each child unless it is wrapped in an [Escaped] widget.
/// - Requires `padding`, `children`, and a `builder`.
///
/// ### Lite Constructor:
/// - Used for a single child to escape horizontal constraints.
/// - Requires `height` and `child`.
///
/// ## Example
///
/// ### Default Usage:
/// ```dart
/// EscapablePadding(
///   padding: const EdgeInsets.all(16),
///   children: [
///     const Text('Normal padded child'),
///     Escaped(
///       child: Container(
///         color: Colors.red,
///         child: const Text('No padding here!'),
///       ),
///     ),
///   ],
///   builder: (context, children) => Column(children: children),
/// )
/// ```
///
/// ### Lite Usage:
/// ```dart
/// Padding(
///   padding: const EdgeInsets.symmetric(horizontal: 24),
///   child: EscapablePadding.lite(
///     height: 100,
///     child: Container(
///       width: 500,
///       color: Colors.blue,
///       child: const Text('Escaping horizontal padding!'),
///     ),
///   ),
/// )
/// ```
class EscapablePadding extends StatelessWidget {
  /// Padding to apply around each child in default mode.
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
                maxWidth: MediaQuery.of(context).size.width,
                child: child!,
              ),
            ),
          ],
        ),
      );
    }

    // --- Default version ---
    assert(
      padding != null && children != null && builder != null,
      'When using default constructor, padding, children, and builder must be provided.',
    );

    final wrappedChildren =
        children!.map((child) {
          if (child is Escaped) return child.child;
          return Padding(padding: padding!, child: child);
        }).toList();

    return builder!(context, wrappedChildren);
  }
}

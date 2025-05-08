# escape_parent_padding

A lightweight Flutter widget that allows child widgets to visually escape the padding applied by a parent widget. Useful when you want specific widgets (like a horizontally scrolling `ListView`) to ignore parent padding and span the full screen width.

## ✨ Features

- Escape parent padding without layout hacks.
- Use `EscapablePadding.lite` for simple use cases.
- Use `EscapablePadding` with multiple children and custom layouts.
- Skip padding for specific children using the `Escaped` widget.

## 🚀 Getting started

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  escape_parent_padding: ^0.0.1
```
Then, run:

```sh
flutter pub get
```

##  Usage

Escapable Padding with Multiple Children
Use the EscapablePadding widget to apply padding to children while allowing specific widgets to escape it using the Escaped widget.

```dart 
import 'package:flutter/widgets.dart';
import 'package:escape_parent_padding/escape_parent_padding.dart';

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EscapablePadding(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text('This text is padded.'),
        Escaped(
          child: Text('This text escapes the padding.'),
        ),
      ],
      builder: (context, children) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
```

Lite Mode for Single Child

```dart
import 'package:flutter/widgets.dart';
import 'package:escape_parent_padding/escape_parent_padding.dart';

class LiteExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EscapablePadding.lite(
      height: 100.0,
      child: Text('This text overflows the parent padding.'),
    );
  }
}
```

##  Usage

For a complete example, check the /example folder in the repository.


##  Additional Information

Developed with simplicity and performance in mind.

Contributions and issues are welcome on the GitHub repository.

##  Contributing

Contributions are welcome! If you encounter any issues or have feature requests, please file them on the GitHub issues page.

##  License

This project is licensed under the MIT License. See the LICENSE file for details. 

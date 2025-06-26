# Make Flutter SEO

An internal Flutter package for SEO optimization and accessibility enhancement in Flutter web applications.

## 🚀 Features

- **Platform-Aware SEO**: Conditional imports for web (HTML) and native (IO) platforms
- **Dynamic HTML Injection**: Automatically injects SEO-friendly HTML into web pages
- **Semantics Tree Integration**: Leverages Flutter's semantics system for accessibility and SEO
- **Reactive Updates**: Uses RxDart streams for efficient SEO content updates
- **Type-Safe SEO Tags**: Strongly-typed SEO tag system with Freezed models
- **Multiple Tag Types**: Support for text, images, links, raw HTML, and meta tags

## 📦 Installation

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  make_flutter_seo:
    git:
      url: https://github.com/ovenbits/make-flutter-seo.git
```

## 🛠️ Usage

### Basic Setup

Wrap your app with the `SeoController` widget:

```dart
import 'package:make_flutter_seo/make_flutter_seo.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SeoController(
      enabled: true, // Enable/disable SEO functionality
      child: MaterialApp(
        // Your app content
      ),
    );
  }
}
```

### SEO Tags

The package provides various SEO tag types through the `SeoTag` sealed class:

#### Text Tags
```dart
// Different heading levels and paragraphs
SeoTag.text(text: "Main Heading", style: TextTagStyle.h1)
SeoTag.text(text: "Subheading", style: TextTagStyle.h2)
SeoTag.text(text: "Paragraph content", style: TextTagStyle.p)
```

#### Image Tags
```dart
SeoTag.image(
  alt: "Description of the image",
  src: "https://example.com/image.jpg"
)
```

#### Link Tags
```dart
SeoTag.link(
  anchor: "Link Text",
  href: "https://example.com",
  rel: "noopener" // Optional
)
```

#### Raw HTML Tags
```dart
SeoTag.html(html: "<custom>Custom HTML content</custom>")
```

#### Header Meta Tags
```dart
SeoTag.headers(tags: [
  HeaderTag.meta(
    name: "description",
    content: "Page description for SEO"
  ),
  HeaderTag.meta(
    name: "keywords", 
    content: "flutter, seo, web"
  ),
  HeaderTag.link(
    rel: "canonical",
    href: "https://example.com/page"
  )
])
```

## 🏗️ Architecture

### Platform-Specific Implementation

The package uses conditional imports to provide platform-specific implementations:

```dart
// Web implementation
export 'html/seo_controller.dart' if (dart.library.io) 'io/seo_controller.dart';
```

- **Web (HTML)**: Full SEO functionality with DOM manipulation
- **Native (IO)**: Not supported on native platforms at the moment

### Core Components

#### `SeoController`
- Main widget that manages SEO functionality
- Listens to semantics tree changes
- Debounces updates for performance
- Injects HTML into DOM for web platforms

#### `SemanticsTree`
- Traverses Flutter's semantics system
- Converts semantic information to SEO-friendly HTML
- Provides reactive updates via RxDart streams

#### `SeoTag` Models
- Type-safe representation of SEO elements
- Built with Freezed for immutability and pattern matching
- JSON serializable for data persistence

#### `SeoHtml`
- Container for head and body HTML content
- Supports combination and copying operations
- Used for DOM injection on web platforms

### Web-Specific Features

On web platforms, the package:
- Monitors Flutter's semantics tree for changes
- Converts semantic information to SEO tags
- Dynamically updates HTML `<head>` and `<body>` sections
- Uses `[flt-seo]` attributes to track managed elements
- Debounces updates to prevent excessive DOM manipulation

## 🎯 Performance Considerations

- **Debounced Updates**: 250ms debounce prevents excessive DOM updates
- **Hash-Based Caching**: Only updates DOM when content actually changes
- **Efficient DOM Queries**: Uses targeted selectors for managed elements

## 🔧 Development

### Dependencies

- `flutter`: Core Flutter framework
- `rxdart`: Reactive programming for stream management
- `web`: Web platform APIs
- `freezed`: Code generation for immutable models
- `json_annotation`: JSON serialization support

### Building

```bash
# Generate code
dart run build_runner build

# Run example
cd example && flutter run -d chrome
```

## 📱 Platform Support

- ✅ **Web**: Full SEO functionality with HTML injection
- ✅ **Android**: Basic semantics support
- ✅ **iOS**: Basic semantics support  
- ✅ **macOS**: Basic semantics support
- ✅ **Windows**: Basic semantics support
- ✅ **Linux**: Basic semantics support

## ⚠️ Security Considerations

Avoid using semantics on fields that contain sensitive user data like credit card information or other private details. Use `ExcludeSemantics` to prevent this data from being exposed to the accessibility tree.

## 🤝 Contributing

This is an internal package for the Make organization. For contributions:

1. Follow the existing code style
2. Add tests for new features
3. Update documentation
4. Use conventional commits

## 📄 License

Internal use only - See LICENSE file for details.

## 🔗 Links

- [Repository](https://github.com/ovenbits/make-flutter-seo.git)
- [Make Organization](https://github.com/ovenbits)

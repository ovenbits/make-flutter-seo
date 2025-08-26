## 0.0.2

### 🔧 Maintenance

* Updated SDK constraints and dependencies to align with latest stable tooling
  - Dart: ">=3.9.0 <4.0.0"
  - Flutter: ">=3.35.1 <4.0.0"
  - Bumped package and dev dependencies to compatible versions

### 🎯 Performance

* Increased SEO DOM rebuild debounce to 500ms (from 250ms) to reduce churn
* Retains hash-based short-circuiting to avoid unnecessary DOM mutations

### 🧩 Web behavior

* SEO body container now renders behind app content with `z-index:-1`
  - Inserted at the start of `<body>` and marked `aria-hidden="true"` and `role="presentation"`
  - `pointer-events:none` and `overflow:hidden` to ensure zero interaction/visual impact
* Continues to cleanly replace prior SEO nodes via the `[flt-seo]` selector

### 🏗️ Semantics

* Adopted newer Flutter semantics APIs (3.35)
  - Use `flagsCollection.isLink`/`isImage` for detection
  - Populate `SemanticsConfiguration.identifier` for SEO tags while keeping nodes hidden from a11y

### ⚠️ Breaking

* Minimum Flutter version is now 3.35.1 (Dart 3.9). Pin to 0.0.1 for older SDKs.

## 0.0.1

### ✨ Features

* **Complete SEO Tag System**: Added comprehensive support for all custom SEO tags
  - Text tags with customizable styles (H1-H6, paragraphs)
  - Image tags with alt text and src attributes
  - Link tags with anchor text, href, and optional rel attributes
  - Raw HTML tags for custom content
  - Header meta tags for SEO metadata

* **Platform-Aware Architecture**: Implemented conditional imports for web and native platforms
  - Full HTML DOM manipulation on web platforms
  - Lightweight implementation for native platforms

* **Reactive SEO Updates**: Built-in stream-based updates with RxDart integration
  - 250ms debounced updates for performance optimization
  - Hash-based caching to prevent unnecessary DOM updates

* **Type-Safe Models**: Freezed-based immutable data structures for all SEO elements
  - JSON serialization support for data persistence
  - Pattern matching capabilities for robust error handling

* **Semantics Integration**: Deep integration with Flutter's semantics system
  - Automatic detection of semantic content for SEO optimization
  - Custom semantics tags for explicit SEO content marking

### 🏗️ Architecture

* **SeoController**: Main widget for managing SEO functionality and DOM updates
* **SemanticsTree**: Traverses Flutter's semantics for accessibility and SEO
* **SeoTag Models**: Type-safe representation of SEO elements
* **Platform-Specific Implementations**: Optimized code paths for web vs native

### 🎯 Performance

* Debounced DOM updates to prevent excessive manipulation
* Efficient DOM queries using targeted selectors
* Hash-based change detection for minimal unnecessary updates
* Conditional platform loading for optimal bundle sizes

### 📱 Platform Support

* Web: Full SEO functionality with HTML injection
* Android, iOS, macOS, Windows, Linux: Basic semantics support

### 🔧 Development

* Complete example application demonstrating usage patterns
* Comprehensive documentation and API reference
* Built with modern Flutter practices and null safety

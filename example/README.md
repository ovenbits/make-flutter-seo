# Make Flutter SEO - Example App

This example demonstrates the features and capabilities of the **Make Flutter SEO** package - a Flutter package designed to optimize web applications for search engines and improve accessibility.

## 🎯 What This Example Demonstrates

This example showcases a simple blog-like application with:
- **Post List Page**: Displays a list of blog posts with SEO-optimized metadata
- **Post Details Page**: Shows individual post content with dynamic SEO tags
- **SEO-Friendly Widgets**: Custom widgets that generate proper HTML structure for web crawlers
- **Dynamic Meta Tags**: Automatic generation of title, description, and canonical URL tags
- **Semantic HTML**: Proper heading hierarchy and link structures for accessibility

## 🏗️ Application Structure

### Key Files

```
lib/
├── main.dart                 # App entry point with SeoController setup
├── main_router.dart         # Auto-route configuration
├── main_router.gr.dart      # Generated routes
├── post.dart                # Post model with fake data
├── pages/
│   ├── post_list_page.dart  # Homepage with post listings
│   └── post_details_page.dart # Individual post view
└── widgets/
    ├── app_head.dart        # SEO head management widget
    ├── app_text.dart        # SEO-optimized text widget
    ├── app_link.dart        # SEO-friendly link widget
    └── app_image.dart       # SEO-optimized image widget
```

### Core Components

#### `SeoController` Setup
The app is wrapped with `SeoController` to enable SEO functionality:
```dart
SeoController(
  enabled: true,
  child: MaterialApp.router(...)
)
```

#### `AppHead` Widget
Manages page-level SEO metadata including:
- Page title and description
- Canonical URLs
- Author information
- Application switcher descriptions

#### SEO-Optimized Widgets
- **`AppText`**: Renders text with proper semantic HTML tags (h1, h2, p, etc.)
- **`AppLink`**: Creates SEO-friendly links with anchor text and href attributes
- **`AppImage`**: Generates images with proper alt text for accessibility

## 🚀 Running the Example

### Prerequisites
- Flutter SDK 3.8.1 or higher
- Chrome browser (for web development)

### Installation & Setup

1. **Navigate to the example directory**:
   ```bash
   cd example
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Generate route files** (if needed):
   ```bash
   dart run build_runner build
   ```

4. **Run the app**:
   ```bash
   flutter run -d chrome
   ```

The app will open in Chrome and be accessible at `localhost:port`.

## 🔍 SEO Features Demonstrated

### 1. **Dynamic Page Titles & Descriptions**
Each page automatically sets appropriate meta tags:
- **Homepage**: "Flutter SEO Example" with description
- **Post Pages**: Dynamic titles based on post content

### 2. **Canonical URLs**
Proper canonical URL generation using auto_route:
```dart
canonicalUrl: Uri.base.origin + PostListRoute().match(context)!.fullPath
```

### 3. **Semantic HTML Structure**
- Proper heading hierarchy (H1, H2, H6 tags)
- Structured content with paragraphs and links
- Alt text for all images

### 4. **SEO-Friendly Navigation**
- Real anchor tags with proper href attributes
- Descriptive link text for better accessibility
- Mouse cursor changes for better UX

### 5. **Application Switcher Integration**
Automatic browser tab titles and descriptions using:
```dart
SystemChrome.setApplicationSwitcherDescription(
  ApplicationSwitcherDescription(
    label: widget.title,
    primaryColor: Theme.of(context).colorScheme.primary.toARGB32(),
  ),
);
```

## 🎨 Features Showcase

### Post List Page
- **64 generated posts** using the Faker package
- **SEO-optimized post cards** with images, titles, and metadata
- **Clickable links** that work for both user interaction and web crawlers
- **Responsive design** with proper spacing and layout

### Post Details Page
- **Dynamic content** based on route parameters
- **Individual SEO tags** for each post
- **Structured content** with headings, paragraphs, and images
- **Navigation** back to the post list

### Styling & UX
- **Custom theme** with proper color scheme
- **Typography hierarchy** with appropriate font weights
- **Hover effects** and cursor changes for interactive elements
- **Modern card-based design** with clean spacing

## 🔧 Dependencies

### Main Dependencies
- `flutter`: Core Flutter framework
- `make_flutter_seo`: The SEO package being demonstrated
- `auto_route`: Type-safe route generation
- `faker`: Generate fake data for posts
- `visibility_detector`: Detect when widgets become visible

### Development Dependencies
- `auto_route_generator`: Code generation for routes
- `build_runner`: Build system for code generation
- `flutter_lints`: Linting rules

## 🌐 Web-Specific Features

When running on web, this example demonstrates:
- **HTML head injection**: Meta tags are automatically added to the document head
- **Semantic HTML body**: Flutter widgets generate proper HTML structure
- **SEO-friendly URLs**: Clean, readable URLs using path-based routing
- **Web crawler compatibility**: Search engines can properly index the content

## 📱 Multi-Platform Support

While optimized for web SEO, this example also runs on:
- **Web**: Full SEO functionality with HTML injection
- **Mobile**: Basic UI without SEO features (as intended)
- **Desktop**: Basic UI without SEO features

## 💡 Key Learning Points

1. **SEO Controller Setup**: How to enable SEO functionality app-wide
2. **Widget Wrapping**: Using SEO-aware widgets instead of standard Flutter widgets
3. **Meta Tag Management**: Dynamic generation of page metadata
4. **Semantic HTML**: Creating accessible and SEO-friendly content structure
5. **Route Integration**: Combining SEO with Flutter navigation patterns

## 🔗 Related Documentation

- [Make Flutter SEO Package](../README.md) - Main package documentation
- [Auto Route Documentation](https://pub.dev/packages/auto_route) - Routing package used
- [Flutter Web SEO Guidelines](https://docs.flutter.dev/development/platform-integration/web/renderers#seo-considerations) - Official Flutter SEO guidance

---

This example serves as both a demonstration and a starting point for implementing SEO in your own Flutter web applications using the Make Flutter SEO package.

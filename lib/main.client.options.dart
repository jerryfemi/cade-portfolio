// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/client.dart';

import 'package:cade_portfolio/components/about_section.dart'
    deferred as _about_section;
import 'package:cade_portfolio/components/hero.dart' deferred as _hero;
import 'package:cade_portfolio/components/navbar.dart' deferred as _navbar;
import 'package:cade_portfolio/components/projects_grid.dart'
    deferred as _projects_grid;
import 'package:cade_portfolio/pages/portfolio.dart' deferred as _portfolio;
import 'package:cade_portfolio/app.dart' deferred as _app;

/// Default [ClientOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.client.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultClientOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ClientOptions get defaultClientOptions => ClientOptions(
  clients: {
    'app': ClientLoader((p) => _app.App(), loader: _app.loadLibrary),
    'about_section': ClientLoader(
      (p) => _about_section.AboutSection(),
      loader: _about_section.loadLibrary,
    ),
    'hero': ClientLoader((p) => _hero.HeroSection(), loader: _hero.loadLibrary),
    'navbar': ClientLoader(
      (p) => _navbar.DesignerNavbar(),
      loader: _navbar.loadLibrary,
    ),
    'projects_grid': ClientLoader(
      (p) => _projects_grid.ProjectsGridSection(),
      loader: _projects_grid.loadLibrary,
    ),
    'portfolio': ClientLoader(
      (p) => _portfolio.Portfolio(),
      loader: _portfolio.loadLibrary,
    ),
  },
);

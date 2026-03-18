// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:cade_portfolio/components/about_section.dart' as _about_section;
import 'package:cade_portfolio/components/hero.dart' as _hero;
import 'package:cade_portfolio/components/navbar.dart' as _navbar;
import 'package:cade_portfolio/components/projects_grid.dart' as _projects_grid;
import 'package:cade_portfolio/pages/portfolio.dart' as _portfolio;
import 'package:cade_portfolio/app.dart' as _app;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',
  clients: {
    _app.App: ClientTarget<_app.App>('app'),
    _about_section.AboutSection: ClientTarget<_about_section.AboutSection>(
      'about_section',
    ),
    _hero.HeroSection: ClientTarget<_hero.HeroSection>('hero'),
    _navbar.DesignerNavbar: ClientTarget<_navbar.DesignerNavbar>('navbar'),
    _projects_grid.ProjectsGridSection:
        ClientTarget<_projects_grid.ProjectsGridSection>('projects_grid'),
    _portfolio.Portfolio: ClientTarget<_portfolio.Portfolio>('portfolio'),
  },
  styles: () => [
    ..._about_section.AboutSection.styles,
    ..._hero.HeroSection.styles,
    ..._navbar.DesignerNavbarState.styles,
    ..._projects_grid.ProjectsGridSectionState.styles,
    ..._portfolio.PortfolioState.styles,
    ..._app.AppState.styles,
  ],
);

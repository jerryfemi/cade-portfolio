import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'pages/portfolio.dart';

@client
class App extends StatefulComponent {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  @override
  Component build(BuildContext context) {
    return div(classes: 'app-container', [
      const Portfolio(),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('html, body').styles(
      raw: {
        'background-color': '#0A0A0A',
        'color': '#EDEDED',
        'font-family': '"Inter", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif',
        'margin': '0',
        'padding': '0',
        'scroll-behavior': 'smooth',
      },
    ),
    css('::selection').styles(
      raw: {
        'background-color': '#0070F3',
        'color': '#FFFFFF',
      },
    ),
    css('.app-container').styles(
      raw: {
        'display': 'flex',
        'flex-direction': 'column',
        'min-height': '100vh',
      },
    ),
    css('a').styles(
      raw: {
        'color': '#EDEDED',
        'text-decoration': 'none',
        'transition': 'color 0.2s ease',
      },
    ),
    css('a:hover').styles(
      raw: {
        'color': '#0070F3',
      },
    ),
    css('img').styles(
      raw: {
        'max-width': '100%',
      },
    ),
    css('*').styles(
      raw: {
        'box-sizing': 'border-box',
      },
    ),
  ];
}

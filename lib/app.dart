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
        'background-color': '#05070d',
        'color': '#ffffff',
        'font-family': '"Inter", sans-serif',
        'margin': '0',
        'padding': '0',
        'scroll-behavior': 'smooth',
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
        'color': '#ffffff',
        'text-decoration': 'none',
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

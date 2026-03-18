import 'package:jaspr/server.dart';
import 'package:jaspr/dom.dart';

import 'app.dart';
import 'main.server.options.dart';

void main() {
  Jaspr.initializeApp(options: defaultServerOptions);

  runApp(
    Document(
      title: 'Cade Portfolio',
      meta: {
        'viewport': 'width=device-width, initial-scale=1.0',
        'theme-color': '#05070d',
      },
      head: [
        link(
          href: 'https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap',
          rel: 'stylesheet',
        ),
        RawText(
          '<style>'
          '@media (max-width: 768px) {'
          '  .projects-grid { grid-template-columns: 1fr !important; gap: 1rem !important; }'
          '}'
          '</style>',
        ),
      ],
      body: const App(),
    ),
  );
}
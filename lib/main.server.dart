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
        'theme-color': '#0A0A0A',
        'description': 'Portfolio of CADE Graphics, a Graphic Designer and Brand Specialist.',
        'og:title': 'CADE Graphics Portfolio',
        'og:description': 'Visual identities, UI, and brand experiences.',
        'og:type': 'website',
      },
      head: [
        link(
          href: 'images/photo.jpg',
          rel: 'icon',
          attributes: {'type': 'image/jpeg'},
        ),
        link(
          href: 'https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap',
          rel: 'stylesheet',
        ),
        raw(
          '<style>'
          'html, body { overflow-x: hidden; max-width: 100vw; }'
          '@media (max-width: 768px) {'
          '  .projects-grid { grid-template-columns: 1fr !important; gap: 1rem !important; }'
          '}'
          '</style>',
        ),
        raw(
          '<style>'
          '@media (max-width: 900px) {'
          '  .main-nav { display: none !important; }'
          '  body { overflow-x: hidden !important; }'
          '}'
          '</style>',
        ),
      ],
      body: const App(),
    ),
  );
}

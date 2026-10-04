import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

@client
class HeroSection extends StatelessComponent {
  const HeroSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'top', classes: 'hero-section', [
      div(classes: 'section-shell hero-grid', [
        div(classes: 'hero-left', [
          div(classes: 'status-badge', [
            .text('Available for freelance work'),
          ]),
          h1(classes: 'hero-title', [
            .text('Creative'),
            span(classes: 'accent-line', [.text('Designer')]),
          ]),
          p(classes: 'hero-copy', [
            .text(
              'Crafting beautiful and functional digital experiences through thoughtful design and user-centered solutions.',
            ),
          ]),
          div(classes: 'hero-actions', [
            a(href: '#projects', classes: 'btn-primary', [
              .text('View Projects'),
            ]),
            a(href: '#contact', classes: 'btn-ghost', [
              .text('Contact Me'),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.hero-section').styles(
      raw: {
        'padding': '5.5rem 0 4rem',
        'background': 'radial-gradient(circle at 50% 0%, rgba(0, 112, 243, 0.1) 0%, rgba(10, 10, 10, 0) 50%)',
      },
    ),
    css('.hero-grid').styles(
      raw: {
        'display': 'grid',
        'grid-template-columns': '1fr',
        'gap': '0',
      },
    ),
    css('.hero-left').styles(
      raw: {
        'max-width': '820px',
      },
    ),
    css('.status-badge').styles(
      raw: {
        'display': 'inline-flex',
        'padding': '0.6rem 1rem',
        'border-radius': '999px',
        'background': 'rgba(255, 255, 255, 0.03)',
        'border': '1px solid rgba(255, 255, 255, 0.1)',
        'color': '#888888',
        'font-size': '0.9rem',
        'font-weight': '500',
        'margin-bottom': '1.4rem',
        'backdrop-filter': 'blur(10px)',
      },
    ),
    css('.hero-title').styles(
      raw: {
        'font-size': 'clamp(3rem, 8vw, 5.2rem)',
        'line-height': '0.95',
        'margin': '0',
        'letter-spacing': '-1.5px',
        'display': 'flex',
        'flex-direction': 'column',
        'gap': '0.25rem',
      },
    ),
    css('.accent-line').styles(
      raw: {
        'background': 'linear-gradient(90deg, #FFFFFF, #888888)',
        '-webkit-background-clip': 'text',
        '-webkit-text-fill-color': 'transparent',
      },
    ),
    css('.hero-copy').styles(
      raw: {
        'color': '#888888',
        'font-size': '1.25rem',
        'line-height': '1.6',
        'margin': '1.4rem 0 2rem',
        'max-width': '41rem',
      },
    ),
    css('.hero-actions').styles(
      raw: {
        'display': 'flex',
        'gap': '1rem',
        'flex-wrap': 'wrap',
      },
    ),
    css('.btn-primary').styles(
      raw: {
        'display': 'inline-flex',
        'align-items': 'center',
        'justify-content': 'center',
        'padding': '0.9rem 1.4rem',
        'border-radius': '8px',
        'background-color': '#EDEDED',
        'color': '#0A0A0A',
        'font-size': '1.1rem',
        'font-weight': '600',
        'border': '1px solid #EDEDED',
        'transition': 'all 0.2s ease',
      },
    ),
    css('.btn-primary:hover').styles(
      raw: {
        'background-color': '#FFFFFF',
        'border-color': '#FFFFFF',
      },
    ),
    css('.btn-ghost').styles(
      raw: {
        'display': 'inline-flex',
        'align-items': 'center',
        'justify-content': 'center',
        'padding': '0.9rem 1.4rem',
        'border-radius': '8px',
        'border': '1px solid rgba(255, 255, 255, 0.1)',
        'color': '#EDEDED',
        'font-size': '1.1rem',
        'font-weight': '500',
        'transition': 'all 0.2s ease',
      },
    ),
    css('.btn-ghost:hover').styles(
      raw: {
        'border-color': 'rgba(255, 255, 255, 0.2)',
        'background-color': 'rgba(255, 255, 255, 0.05)',
      },
    ),
    css('@media (max-width: 1080px)', [
      css('.hero-grid').styles(
        raw: {
          'grid-template-columns': '1fr',
        },
      ),
      css('.hero-section').styles(
        raw: {
          'padding-top': '4rem',
        },
      ),
      css('.hero-copy').styles(
        raw: {
          'font-size': '1.2rem',
          'max-width': '100%',
        },
      ),
    ]),
    css('@media (max-width: 900px)', [
      css('.hero-title').styles(
        raw: {
          'font-size': 'clamp(2.35rem, 10vw, 3.8rem)',
        },
      ),
    ]),
    css('@media (max-width: 700px)', [
      css('.hero-copy').styles(
        raw: {
          'font-size': '1rem',
          'margin': '1rem 0 1.4rem',
        },
      ),
      css('.btn-primary, .btn-ghost').styles(
        raw: {
          'font-size': '1rem',
          'padding': '0.8rem 1rem',
        },
      ),
      css('.hero-actions').styles(
        raw: {
          'width': '100%',
        },
      ),
      css('.btn-primary, .btn-ghost').styles(
        raw: {
          'width': '100%',
        },
      ),
    ]),
  ];
}

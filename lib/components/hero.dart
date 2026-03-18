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
            Component.text('Available for freelance work'),
          ]),
          h1(classes: 'hero-title', [
            Component.text('Creative'),
            span(classes: 'accent-line', [Component.text('Designer')]),
          ]),
          p(classes: 'hero-copy', [
            Component.text(
              'Crafting beautiful and functional digital experiences through thoughtful design and user-centered solutions.',
            ),
          ]),
          div(classes: 'hero-actions', [
            a(href: '#projects', classes: 'btn-primary', [
              Component.text('View Projects'),
            ]),
            a(href: '#contact', classes: 'btn-ghost', [
              Component.text('Contact Me'),
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
        'background': 'radial-gradient(circle at 75% 10%, rgba(48,224,196,0.16) 0%, rgba(5,7,13,0) 48%)',
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
        'background': 'rgba(48, 224, 196, 0.12)',
        'border': '1px solid rgba(48, 224, 196, 0.28)',
        'color': '#43e2c8',
        'font-size': '1rem',
        'margin-bottom': '1.4rem',
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
        'color': '#33debf',
      },
    ),
    css('.hero-copy').styles(
      raw: {
        'color': '#a4abbd',
        'font-size': '1.45rem',
        'line-height': '1.5',
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
        'border-radius': '0.8rem',
        'background-color': '#30e0c4',
        'color': '#071015',
        'font-size': '1.2rem',
        'font-weight': '600',
        'border': '1px solid #30e0c4',
        'transition': 'transform 0.2s ease, box-shadow 0.2s ease',
      },
    ),
    css('.btn-primary:hover').styles(
      raw: {
        'transform': 'translateY(-1px)',
        'box-shadow': '0 12px 24px rgba(48, 224, 196, 0.25)',
      },
    ),
    css('.btn-ghost').styles(
      raw: {
        'display': 'inline-flex',
        'align-items': 'center',
        'justify-content': 'center',
        'padding': '0.9rem 1.4rem',
        'border-radius': '0.8rem',
        'border': '1px solid rgba(255, 255, 255, 0.22)',
        'color': '#edf1f8',
        'font-size': '1.2rem',
        'font-weight': '500',
        'transition': 'border-color 0.2s ease, background-color 0.2s ease',
      },
    ),
    css('.btn-ghost:hover').styles(
      raw: {
        'border-color': 'rgba(255, 255, 255, 0.45)',
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

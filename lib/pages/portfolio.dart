import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/about_section.dart';
import '../components/hero.dart';
import '../components/navbar.dart';
import '../components/projects_grid.dart';

@client
class Portfolio extends StatefulComponent {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => PortfolioState();
}

class PortfolioState extends State<Portfolio> {
  @override
  Component build(BuildContext context) {
    return div(classes: 'portfolio-page', [
      const DesignerNavbar(),
      const HeroSection(),
      const ProjectsGridSection(),
      const AboutSection(),
      section(id: 'contact', classes: 'contact-section', [
        div(classes: 'section-shell contact-wrap', [
          h2([Component.text('Let’s Build Something Great')]),
          p([
            Component.text(
              'Need a standout visual identity, campaign assets, or a fresh digital look? Let’s collaborate.',
            ),
          ]),
          a(
            href: 'https://wa.me/2349011085172?text=Hi%20CADE%20Design%2C%20I%20want%20to%20start%20a%20project.',
            classes: 'btn-primary contact-btn',
            [
              Component.text('Start a Project'),
            ],
          ),
          div(classes: 'contact-links', [
            a(href: 'https://wa.me/2349011085172', classes: 'contact-link', [
              Component.text('WhatsApp'),
            ]),
            a(href: 'https://www.instagram.com/cade_gfx/', classes: 'contact-link', [
              Component.text('Instagram'),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.portfolio-page').styles(
      raw: {
        'background-color': '#05070d',
        'color': '#ffffff',
        'min-height': '100vh',
      },
    ),
    css('.section-shell').styles(
      raw: {
        'width': 'min(1160px, calc(100% - 3rem))',
        'margin': '0 auto',
      },
    ),

    css('.contact-section').styles(
      raw: {
        'padding': '3.4rem 0 4.5rem',
        'border-top': '1px solid rgba(255, 255, 255, 0.06)',
      },
    ),
    css('.contact-wrap').styles(
      raw: {
        'text-align': 'center',
      },
    ),
    css('.contact-wrap p').styles(
      raw: {
        'margin': '0.9rem auto 1.5rem',
        'color': '#a4abbd',
        'font-size': '1.16rem',
        'max-width': '45rem',
        'line-height': '1.6',
      },
    ),
    css('.contact-btn').styles(
      raw: {
        'min-width': '220px',
      },
    ),
    css('.contact-links').styles(
      raw: {
        'display': 'flex',
        'justify-content': 'center',
        'gap': '0.8rem',
        'margin-top': '1rem',
        'flex-wrap': 'wrap',
      },
    ),
    css('.contact-link').styles(
      raw: {
        'display': 'inline-flex',
        'align-items': 'center',
        'justify-content': 'center',
        'padding': '0.65rem 1rem',
        'border-radius': '0.65rem',
        'border': '1px solid rgba(255, 255, 255, 0.2)',
        'color': '#dce1ee',
        'background': 'rgba(255, 255, 255, 0.04)',
        'font-size': '0.95rem',
      },
    ),
    css('@media (max-width: 1080px)', []),
    css('@media (max-width: 900px)', []),
    css('@media (max-width: 700px)', [
      css('.section-shell').styles(
        raw: {
          'width': 'min(1160px, calc(100% - 1rem))',
        },
      ),

      css('.projects-section, .about-section, .contact-section').styles(
        raw: {
          'padding-top': '2.6rem',
          'padding-bottom': '2.8rem',
        },
      ),
      css('.contact-wrap p').styles(
        raw: {
          'font-size': '1rem',
        },
      ),
      css('.subheading').styles(
        raw: {
          'font-size': '1.55rem',
        },
      ),

      css('.about-profile-card').styles(
        raw: {
          'align-items': 'flex-start',
          'flex-direction': 'column',
        },
      ),
    ]),
  ];
}

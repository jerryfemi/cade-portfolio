import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

@client
class AboutSection extends StatelessComponent {
  const AboutSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'about', classes: 'about-section', [
      div(classes: 'section-shell about-grid', [
        div(classes: 'about-left', [
          div(classes: 'about-profile-card', [
            img(src: 'images/photo.jpg', alt: 'Cade, graphic designer', classes: 'about-profile-image'),
            div(classes: 'about-profile-meta', [
              h3(classes: 'about-name', [Component.text('CADE Graphics')]),
              p(classes: 'about-role', [Component.text('Graphic Designer • Brand & Social Media Specialist')]),
              span(classes: 'experience-chip', [Component.text('12+ Years Experience')]),
            ]),
          ]),
          h2([Component.text('About Me')]),
          p([
            Component.text(
              'I am a graphic designer focused on creating compelling visual identities, user interfaces, and brand experiences that feel timeless and clear.',
            ),
          ]),
          p([
            Component.text(
              'Every project blends creativity with strategy, helping brands communicate with confidence across print and digital channels.',
            ),
          ]),
        ]),
        div(classes: 'about-right', [
          h3(classes: 'subheading', [Component.text('Skills')]),
          div(classes: 'skills-wrap', [
            for (final skill in [
              'Branding',
              'Illustration',
              'Typography',
              'Figma',
              'Adobe Suite',
            ])
              span(classes: 'skill-pill', [Component.text(skill)]),
          ]),
          h3(classes: 'subheading experience-title', [Component.text('Experience')]),
          p([
            Component.text(
              '12+ years designing for startups, agencies, and growing businesses, with a strong focus on social media and visual marketing assets.',
            ),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.about-section').styles(
      raw: {
        'padding': '4.2rem 0 3.4rem',
      },
    ),
    css('.about-grid').styles(
      raw: {
        'display': 'flex',
        'flex-direction': 'column', 
        'gap': '2.5rem',
      },
    ),
    css('.about-left p, .about-right p').styles(
      raw: {
        'font-size': '1rem',
        'line-height': '1.55',
        'color': '#a7aec1',
        'margin': '1rem 0 0',
      },
    ),
    css('.about-profile-card').styles(
      raw: {
        'display': 'flex',
        'align-items': 'center',
        'gap': '1rem',
        'padding': '1rem',
        'background': 'rgba(255, 255, 255, 0.04)',
        'border': '1px solid rgba(255, 255, 255, 0.1)',
        'border-radius': '1rem',
        'margin-bottom': '1.2rem',
      },
    ),
    css('.about-profile-image').styles(
      raw: {
        'width': '84px',
        'height': '84px',
        'object-fit': 'cover',
        'border-radius': '999px',
        'border': '2px solid rgba(48, 224, 196, 0.5)',
      },
    ),
    css('.about-profile-meta').styles(
      raw: {
        'display': 'flex',
        'flex-direction': 'column',
        'gap': '0.35rem',
      },
    ),
    css('.about-name').styles(
      raw: {
        'margin': '0',
        'font-size': '1.4rem',
      },
    ),
    css('.about-role').styles(
      raw: {
        'margin': '0',
        'color': '#a7aec1',
      },
    ),
    css('.experience-chip').styles(
      raw: {
        'display': 'inline-flex',
        'align-items': 'center',
        'width': 'fit-content',
        'padding': '0.3rem 0.7rem',
        'border-radius': '999px',
        'background': 'rgba(48, 224, 196, 0.14)',
        'border': '1px solid rgba(48, 224, 196, 0.28)',
        'color': '#43e2c8',
        'font-size': '0.9rem',
      },
    ),
    css('.subheading').styles(
      raw: {
        'margin': '0 0 0.8rem',
        'font-size': '1.85rem',
        'color': '#21d0b4',
      },
    ),
    css('.skills-wrap').styles(
      raw: {
        'display': 'flex',
        'flex-wrap': 'wrap',
        'gap': '0.65rem',
        'margin-bottom': '1.4rem',
      },
    ),
    css('.skill-pill').styles(
      raw: {
        'padding': '0.45rem 0.9rem',
        'border-radius': '999px',
        'background-color': 'rgba(255, 255, 255, 0.1)',
        'color': '#f2f5fb',
        'font-size': '1rem',
      },
    ),
    css('.experience-title').styles(
      raw: {
        'margin-top': '1.2rem',
      },
    ),
    css('@media (min-width: 900px)', [
      css('.about-grid').styles(
        raw: {
          'display': 'grid', 
          'grid-template-columns': '1.2fr 1fr',
          'gap': '3rem',
        },
      ),
      css('.about-left p, .about-right p').styles(
        raw: {
          'font-size': '1.12rem',
          'line-height': '1.65',
        },
      ),
    ]),
    css('@media (max-width: 700px)', [
      css('.about-section').styles(
        raw: {
          'padding-top': '2.6rem',
          'padding-bottom': '2.8rem',
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

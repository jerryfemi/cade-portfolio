import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

@client
class DesignerNavbar extends StatefulComponent {
  const DesignerNavbar({super.key});

  @override
  State<DesignerNavbar> createState() => DesignerNavbarState();
}

class DesignerNavbarState extends State<DesignerNavbar> {
  @override
  Component build(BuildContext context) {
    return header(classes: 'site-header', [
      div(classes: 'section-shell nav-shell', [
        a(href: '#top', classes: 'brand-link', [
          Component.text('CADE Design'),
        ]),
        nav(classes: 'main-nav', [
          a(href: '#top', [Component.text('Home')]),
          a(href: '#projects', [Component.text('Projects')]),
          a(href: '#about', [Component.text('About')]),
          a(href: '#contact', [Component.text('Contact')]),
        ]),
        div(classes: 'nav-actions', [
          a(
            href: 'https://wa.me/2349011085172?text=Hi%20CADE%20Design%2C%20I%20want%20to%20hire%20you.',
            classes: 'hire-btn',
            [
              Component.text('Hire Me'),
            ],
          ),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.site-header').styles(
      raw: {
        'position': 'sticky',
        'top': '0',
        'z-index': '100',
        'backdrop-filter': 'blur(8px)',
        'background': 'rgba(5, 7, 13, 0.85)',
        'border-bottom': '1px solid rgba(255, 255, 255, 0.06)',
      },
    ),
    css('.nav-shell').styles(
      raw: {
        'display': 'flex',
        'align-items': 'center',
        'justify-content': 'space-between',
        'padding': '1rem 0',
        'gap': '1.25rem',
      },
    ),
    css('.brand-link').styles(
      raw: {
        'font-size': '1.9rem',
        'font-weight': '700',
        'color': '#30e0c4',
        'letter-spacing': '-0.5px',
        'z-index': '105',
      },
    ),
    css('.main-nav').styles(
      raw: {
        'display': 'flex',
        'gap': '2rem',
        'align-items': 'center',
      },
    ),
    css('.main-nav a').styles(
      raw: {
        'color': '#cfd2db',
        'font-weight': '500',
        'font-size': '1rem',
        'transition': 'color 0.2s ease',
      },
    ),
    css('.main-nav a:hover').styles(
      raw: {
        'color': '#ffffff',
      },
    ),
    css('.nav-actions').styles(
      raw: {
        'display': 'flex',
        'align-items': 'center',
        'gap': '1rem',
        'z-index': '105',
      },
    ),
    css('.hire-btn').styles(
      raw: {
        'background-color': '#30e0c4',
        'color': '#071015',
        'padding': '0.75rem 1.4rem',
        'border-radius': '0.85rem',
        'font-weight': '600',
        'transition': 'transform 0.2s ease, box-shadow 0.2s ease',
      },
    ),
    css('.hire-btn:hover').styles(
      raw: {
        'transform': 'translateY(-1px)',
        'box-shadow': '0 10px 22px rgba(48, 224, 196, 0.25)',
      },
    ),
    // --- Responsive Media Queries ---
    css('@media (max-width: 900px)', [
      css('.main-nav').styles(
        raw: {
          'gap': '1.1rem',
        },
      ),
    ]),
    css('@media (max-width: 768px)', [
      // This completely hides the text links on phones
      css('.main-nav').styles(raw: {'display': 'none !important'}),

      // These shrink the logo and button so they fit side-by-side
      css('.brand-link').styles(raw: {'font-size': '1.3rem'}),
      css('.hire-btn').styles(raw: {'padding': '0.5rem 0.9rem', 'font-size': '0.9rem'}),
      css('.nav-shell').styles(raw: {'gap': '0.5rem'}),
    ]),
  ];
}

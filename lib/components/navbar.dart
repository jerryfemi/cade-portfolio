import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

@client
class DesignerNavbar extends StatefulComponent {
  const DesignerNavbar({super.key});

  @override
  State<DesignerNavbar> createState() => DesignerNavbarState();
}

class DesignerNavbarState extends State<DesignerNavbar> {
  bool isMenuOpen = false;

  void toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  void closeMenu() {
    if (isMenuOpen) {
      setState(() {
        isMenuOpen = false;
      });
    }
  }

  @override
  Component build(BuildContext context) {
    return header(classes: 'site-header', [
      div(classes: 'section-shell nav-shell', [
        a(href: '#top', classes: 'brand-link', [
          .text('CADE Graphics'),
        ]),
        nav(classes: isMenuOpen ? 'main-nav open' : 'main-nav', [
          a(href: '#top', events: {'click': (e) => closeMenu()}, [.text('Home')]),
          a(href: '#projects', events: {'click': (e) => closeMenu()}, [.text('Projects')]),
          a(href: '#about', events: {'click': (e) => closeMenu()}, [.text('About')]),
          a(href: '#contact', events: {'click': (e) => closeMenu()}, [.text('Contact')]),
        ]),
        div(classes: 'nav-actions', [
          button(
            classes: 'menu-toggle-btn',
            events: {'click': (e) => toggleMenu()},
            [
              .text(isMenuOpen ? '✕' : '☰'),
            ],
          ),
          a(
            href: 'https://wa.me/2349011085172?text=Hi%20CADE%20Design%2C%20I%20want%20to%20hire%20you.',
            classes: 'hire-btn',
            [
              .text('Hire Me'),
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
        'backdrop-filter': 'blur(12px)',
        'background': 'rgba(10, 10, 10, 0.8)',
        'border-bottom': '1px solid rgba(255, 255, 255, 0.08)',
        'overflow-x': 'hidden',
      },
    ),
    css('.nav-shell').styles(
      raw: {
        'display': 'flex',
        'align-items': 'center',
        'justify-content': 'space-between',
        'padding': '1rem 1.5rem',
        'gap': '1.25rem',
        'width': 'min(1160px, calc(100% - 3rem))',
        'margin': '0 auto',
      },
    ),
    css('.brand-link').styles(
      raw: {
        'font-size': '1.9rem',
        'font-weight': '700',
        'color': '#EDEDED',
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
    css('.menu-toggle-btn').styles(
      raw: {
        'display': 'none',
        'background': 'none',
        'border': 'none',
        'color': '#fff',
        'font-size': '1.8rem',
        'cursor': 'pointer',
      },
    ),
    css('.hire-btn').styles(
      raw: {
        'background-color': '#0070F3',
        'color': '#FFFFFF',
        'padding': '0.75rem 1.4rem',
        'border-radius': '8px',
        'font-weight': '600',
        'transition': 'all 0.2s ease',
        'white-space': 'nowrap',
        'border': '1px solid transparent',
      },
    ),
    css('.hire-btn:hover').styles(
      raw: {
        'background-color': '#005BD1',
        'box-shadow': '0 4px 14px 0 rgba(0, 112, 243, 0.39)',
      },
    ),
    css('@media (max-width: 900px)', [
      css('.main-nav').styles(raw: {'gap': '1.1rem'}),
    ]),
    css('@media (max-width: 768px)', [
      css('.menu-toggle-btn').styles(raw: {'display': 'block'}),
      css('.main-nav').styles(raw: {
        'display': 'none',
        'position': 'absolute',
        'top': '100%',
        'left': '0',
        'right': '0',
        'background': 'rgba(10, 10, 10, 0.95)',
        'flex-direction': 'column',
        'padding': '1rem 0',
        'border-bottom': '1px solid rgba(255, 255, 255, 0.08)',
      }),
      css('.main-nav.open').styles(raw: {
        'display': 'flex !important',
      }),
      css('.nav-shell').styles(
        raw: {
          'gap': '0.5rem',
          'width': 'min(1160px, calc(100% - 1rem))',
          'padding': '0.75rem 0.5rem',
        },
      ),
      css('.brand-link').styles(raw: {'font-size': '1.3rem'}),
      css('.hire-btn').styles(
        raw: {
          'padding': '0.5rem 0.9rem',
          'font-size': '0.9rem',
          'white-space': 'nowrap',
        },
      ),
    ]),
  ];
}

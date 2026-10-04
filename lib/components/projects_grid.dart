import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../data/projects_data.dart';

@client
class ProjectsGridSection extends StatefulComponent {
  const ProjectsGridSection({super.key});

  @override
  State<ProjectsGridSection> createState() => ProjectsGridSectionState();
}

class ProjectsGridSectionState extends State<ProjectsGridSection> {
  static const int collapsedCount = 6;
  static const List<String> chipCategories = ['All', 'Graphic Design', 'Shirt Mockups'];

  String selectedCategory = 'All';
  bool expanded = false;
  int? lightboxIndex;

  List<ProjectItem> get _mixedAllProjects {
    final byCategory = <String, List<ProjectItem>>{};
    for (final item in allProjects) {
      byCategory.putIfAbsent(item.category, () => <ProjectItem>[]).add(item);
    }

    final queues = [
      List<ProjectItem>.from(byCategory['Graphic Design'] ?? const []),
      List<ProjectItem>.from(byCategory['Shirt Mockups'] ?? const []),
    ];

    final mixed = <ProjectItem>[];
    var added = true;

    while (added) {
      added = false;
      for (final queue in queues) {
        if (queue.isNotEmpty) {
          mixed.add(queue.removeAt(0));
          added = true;
        }
      }
    }

    return mixed;
  }

  Map<String, int> get _chipCounts {
    return {
      'All': allProjects.length,
      'Graphic Design': allProjects.where((item) => item.category == 'Graphic Design').length,
      'Shirt Mockups': allProjects.where((item) => item.category == 'Shirt Mockups').length,
    };
  }

  List<ProjectItem> get _filteredProjects {
    if (selectedCategory == 'All') {
      return _mixedAllProjects;
    }
    return allProjects.where((item) => item.category == selectedCategory).toList();
  }

  List<ProjectItem> get _visibleProjects {
    final filtered = _filteredProjects;
    if (expanded || filtered.length <= collapsedCount) {
      return filtered;
    }
    return filtered.take(collapsedCount).toList();
  }

  void _selectCategory(String category) {
    setState(() {
      selectedCategory = category;
      expanded = false;
      lightboxIndex = null;
    });
  }

  void _toggleExpand() {
    setState(() {
      expanded = !expanded;
    });
  }

  void _openLightbox(int index) {
    setState(() {
      lightboxIndex = index;
    });
  }

  void _closeLightbox() {
    setState(() {
      lightboxIndex = null;
    });
  }

  void _goToPrevious() {
    final filtered = _filteredProjects;
    if (filtered.isEmpty || lightboxIndex == null) return;
    setState(() {
      lightboxIndex = (lightboxIndex! - 1 + filtered.length) % filtered.length;
    });
  }

  void _goToNext() {
    final filtered = _filteredProjects;
    if (filtered.isEmpty || lightboxIndex == null) return;
    setState(() {
      lightboxIndex = (lightboxIndex! + 1) % filtered.length;
    });
  }

  @override
  Component build(BuildContext context) {
    final filtered = _filteredProjects;
    final visible = _visibleProjects;
    final hasMore = filtered.length > collapsedCount;
    final current = lightboxIndex == null ? null : filtered[lightboxIndex!];
    final chipCounts = _chipCounts;

    return section(id: 'projects', classes: 'projects-section', [
      div(classes: 'section-shell', [
        h2([.text('Recent Projects')]),
        p(classes: 'section-subtitle', [
          .text('Browse all work by category. Open any design to view it in full.'),
        ]),
        div(classes: 'projects-controls', [
          div(classes: 'category-chips', [
            for (final category in chipCategories)
              button(
                classes: selectedCategory == category ? 'category-chip active' : 'category-chip',
                events: {'click': (e) => _selectCategory(category)},
                [
                  .text('$category (${chipCounts[category] ?? 0})'),
                ],
              ),
          ]),
        ]),
        div(
          classes: 'projects-grid',
          attributes: {
            'style': 'display:grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 1.6rem;',
          },
          [
            for (var index = 0; index < visible.length; index++)
              article(
                classes: 'project-card',
                events: {'click': (e) => _openLightbox(index)},
                [
                  img(src: visible[index].imagePath, alt: visible[index].title, classes: 'project-image'),
                  div(classes: 'project-meta', [
                    h3([.text(visible[index].title)]),
                    p(classes: 'project-category', [.text(visible[index].category)]),
                  ]),
                ],
              ),
          ],
        ),
        if (hasMore)
          div(classes: 'projects-footer-toggle', [
            button(
              classes: 'toggle-gallery-btn',
              events: {'click': (e) => _toggleExpand()},
              [
                .text(expanded ? 'Show Less' : 'Show More'),
              ],
            ),
          ]),
        div(classes: 'view-all-wrap', [
          a(
            href: 'https://wa.me/2349011085172?text=Hi%20CADE%20Design%2C%20I%20want%20to%20start%20a%20project.',
            classes: 'view-all-btn',
            [
              .text('Start a Project'),
            ],
          ),
        ]),
        if (current != null)
          div(classes: 'gallery-lightbox', [
            div(classes: 'gallery-lightbox-content', [
              img(src: current.imagePath, alt: current.title, classes: 'gallery-lightbox-image'),
              div(classes: 'gallery-lightbox-meta', [
                h3([.text(current.title)]),
                p([.text(current.category)]),
              ]),
              button(
                classes: 'lightbox-close-btn',
                events: {'click': (e) => _closeLightbox()},
                [
                  .text('✕'),
                ],
              ),
              button(
                classes: 'lightbox-nav-btn prev-btn',
                events: {'click': (e) => _goToPrevious()},
                [
                  .text('‹'),
                ],
              ),
              button(
                classes: 'lightbox-nav-btn next-btn',
                events: {'click': (e) => _goToNext()},
                [
                  .text('›'),
                ],
              ),
            ]),
          ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.projects-section').styles(
      raw: {
        'padding': '4.2rem 0',
        'border-top': '1px solid rgba(255, 255, 255, 0.06)',
        'border-bottom': '1px solid rgba(255, 255, 255, 0.06)',
      },
    ),
    css('.projects-section h2').styles(
      raw: {
        'font-size': '2.2rem',
        'margin': '0',
        'letter-spacing': '-0.4px',
      },
    ),
    css('.section-subtitle').styles(
      raw: {
        'font-size': '1.2rem',
        'color': '#9ea6b9',
        'margin': '0.8rem 0 2rem',
        'max-width': '54rem',
        'line-height': '1.6',
      },
    ),
    css('.projects-controls').styles(
      raw: {
        'display': 'flex',
        'justify-content': 'space-between',
        'align-items': 'flex-start',
        'margin-bottom': '1.4rem',
      },
    ),
    css('.category-chips').styles(
      raw: {
        'display': 'flex',
        'flex-wrap': 'wrap',
        'gap': '0.75rem',
      },
    ),
    css('.category-chip').styles(
      raw: {
        'border': '1px solid rgba(255, 255, 255, 0.1)',
        'background': 'rgba(255, 255, 255, 0.03)',
        'color': '#888888',
        'padding': '0.5rem 1rem',
        'border-radius': '999px',
        'cursor': 'pointer',
        'font-size': '0.95rem',
        'white-space': 'nowrap',
        'touch-action': 'manipulation',
        '-webkit-tap-highlight-color': 'transparent',
        'transition': 'all 0.2s ease',
      },
    ),
    css('.category-chip:hover').styles(
      raw: {
        'color': '#EDEDED',
        'background': 'rgba(255, 255, 255, 0.08)',
      },
    ),
    css('.category-chip.active').styles(
      raw: {
        'background': 'rgba(0, 112, 243, 0.15)',
        'border': '1px solid rgba(0, 112, 243, 0.5)',
        'color': '#0070F3',
      },
    ),
    css('.project-card').styles(
      raw: {
        'background-color': 'rgba(255, 255, 255, 0.03)',
        'border': '1px solid rgba(255, 255, 255, 0.08)',
        'border-radius': '12px',
        'overflow': 'hidden',
        'backdrop-filter': 'blur(10px)',
        'transition': 'all 0.3s ease',
        'cursor': 'zoom-in',
      },
    ),
    css('.project-card:hover').styles(
      raw: {
        'transform': 'translateY(-4px)',
        'border-color': 'rgba(255, 255, 255, 0.2)',
        'box-shadow': '0 8px 30px rgba(0, 0, 0, 0.4)',
      },
    ),
    css('.project-image').styles(
      raw: {
        'width': '100%',
        'aspect-ratio': '4 / 3',
        'display': 'block',
        'object-fit': 'cover',
      },
    ),
    css('.project-meta').styles(
      raw: {
        'padding': '1.25rem',
      },
    ),
    css('.project-meta h3').styles(
      raw: {
        'margin': '0 0 0.25rem',
        'font-size': '1.15rem',
        'line-height': '1.3',
        'font-weight': '600',
        'color': '#EDEDED',
      },
    ),
    css('.project-category').styles(
      raw: {
        'margin': '0',
        'color': '#888888',
        'font-size': '0.9rem',
      },
    ),
    css('.view-all-wrap').styles(
      raw: {
        'display': 'flex',
        'justify-content': 'center',
        'margin-top': '2.2rem',
      },
    ),
    css('.projects-footer-toggle').styles(
      raw: {
        'display': 'flex',
        'justify-content': 'center',
        'margin-top': '1.5rem',
      },
    ),
    css('.toggle-gallery-btn').styles(
      raw: {
        'padding': '0.75rem 1.4rem',
        'border-radius': '0.7rem',
        'border': '1px solid rgba(255, 255, 255, 0.2)',
        'background': 'rgba(255, 255, 255, 0.04)',
        'color': '#e7ecf9',
        'font-weight': '500',
        'cursor': 'pointer',
      },
    ),
    css('.gallery-lightbox').styles(
      raw: {
        'position': 'fixed',
        'inset': '0',
        'background': 'rgba(2, 4, 10, 0.9)',
        'display': 'flex',
        'justify-content': 'center',
        'align-items': 'center',
        'z-index': '200',
        'padding': '1rem',
      },
    ),
    css('.gallery-lightbox-content').styles(
      raw: {
        'position': 'relative',
        'width': 'min(980px, 96vw)',
        'max-height': '92vh',
        'background': '#070b14',
        'border': '1px solid rgba(255, 255, 255, 0.12)',
        'border-radius': '1rem',
        'padding': '1rem',
        'display': 'flex',
        'flex-direction': 'column',
        'gap': '0.9rem',
      },
    ),
    css('.gallery-lightbox-image').styles(
      raw: {
        'width': '100%',
        'max-height': '75vh',
        'object-fit': 'contain',
        'border-radius': '0.7rem',
      },
    ),
    css('.gallery-lightbox-meta h3').styles(
      raw: {
        'margin': '0',
      },
    ),
    css('.gallery-lightbox-meta p').styles(
      raw: {
        'margin': '0.2rem 0 0',
        'color': '#43e2c8',
      },
    ),
    css('.lightbox-close-btn').styles(
      raw: {
        'position': 'absolute',
        'top': '0.5rem',
        'right': '0.5rem',
        'width': '2.2rem',
        'height': '2.2rem',
        'border-radius': '999px',
        'border': 'none',
        'background': 'rgba(0, 0, 0, 0.55)',
        'color': '#ffffff',
        'cursor': 'pointer',
        'z-index': '10',
      },
    ),
    css('.lightbox-nav-btn').styles(
      raw: {
        'position': 'absolute',
        'top': '50%',
        'transform': 'translateY(-50%)',
        'width': '2.4rem',
        'height': '2.4rem',
        'border-radius': '999px',
        'border': 'none',
        'background': 'rgba(0, 0, 0, 0.55)',
        'color': '#ffffff',
        'font-size': '1.3rem',
        'cursor': 'pointer',
        'display': 'flex',
        'align-items': 'center',
        'justify-content': 'center',
        'z-index': '10',
      },
    ),
    css('.prev-btn').styles(
      raw: {
        'left': '0.5rem',
      },
    ),
    css('.next-btn').styles(
      raw: {
        'right': '0.5rem',
      },
    ),
    css('.view-all-btn').styles(
      raw: {
        'display': 'inline-flex',
        'align-items': 'center',
        'justify-content': 'center',
        'padding': '0.95rem 2rem',
        'border-radius': '8px',
        'background-color': '#EDEDED',
        'color': '#0A0A0A',
        'font-size': '1rem',
        'font-weight': '600',
        'transition': 'background-color 0.2s ease',
      },
    ),
    css('.view-all-btn:hover').styles(
      raw: {
        'background-color': '#FFFFFF',
      },
    ),
    css('@media (max-width: 768px)', [
      css('.projects-section').styles(
        raw: {
          'padding-top': '2.6rem',
          'padding-bottom': '2.8rem',
        },
      ),
      css('.project-meta h3').styles(
        raw: {
          'font-size': '1rem',
        },
      ),
      css('.category-chips').styles(
        raw: {
          'flex-wrap': 'nowrap',
          'overflow-x': 'auto',
          'padding-bottom': '0.5rem',
          'width': '100%',
          '-webkit-overflow-scrolling': 'touch',
        },
      ),
      css('.category-chips::-webkit-scrollbar').styles(
        raw: {
          'display': 'none',
        },
      ),
      css('.view-all-btn').styles(
        raw: {
          'width': '100%',
        },
      ),
      css('.lightbox-nav-btn').styles(
        raw: {
          'width': '2rem',
          'height': '2rem',
          'font-size': '1.1rem',
        },
      ),
    ]),
  ];
}

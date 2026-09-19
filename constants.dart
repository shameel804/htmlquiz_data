// python3 generate_pipeline.py prompts "Javascript" --topic basic
// python3 generate_pipeline.py process "Javascript"
// Read the file staging/INSTRUCTIONS.md and follow all instructions. For each task, read the prompt file, generate the quiz JSON following ALL rules, and write the output to the specified output file path.

class Constants {
     static const Map<String, List<Map<String, dynamic>>> allTypes = {
    "Html": [
      {
        'id': 'basic',
        'title': 'Basics',
        'tier': 'free',
        'topics': ["Tags", "elements", "attributes", "structure"],
      },
      {
        'id': 'forms',
        'title': 'Forms',
        'tier': 'free',
        'topics': ["Form elements", "inputs", "buttons", "validation"],
      },
      {
        'id': 'html5',
        'title': 'HTML5 New Features',
        'tier': 'free',
        'topics': ["Semantic tags", "multimedia (audio/video)", "canvas"],
      },
      {
        'id': 'tables',
        'title': 'Tables',
        'tier': 'free',
        'topics': ["Table structure", "headers", "captions", "colspan/rowspan"],
      },
      {
        'id': 'lists',
        'title': 'Lists',
        'tier': 'free',
        'topics': ["Ordered", "unordered", "description lists"],
      },
      {
        'id': 'links',
        'title': 'Links & Navigation',
        'tier': 'vip',
        'topics': ["Anchor tags", "navigation menus"],
      },
      {
        'id': 'media',
        'title': 'Media Elements',
        'tier': 'vip',
        'topics': ["Embedding videos", "audio", "images"],
      },
    ],
    "Css": [
      {
        'id': 'basics',
        'title': 'Basics',
        'tier': 'free',
        'topics': ["Selectors", "properties", "values", "syntax"],
      },
      {
        'id': 'box',
        'title': 'Box Model',
        'tier': 'free',
        'topics': ["Margin", "border", "padding", "content"],
      },
      {
        'id': 'position',
        'title': 'Positioning',
        'tier': 'free',
        'topics': ["Static", "relative", "absolute", "fixed", "sticky"],
      },
      {
        'id': 'flex',
        'title': 'Flexbox & Grid',
        'tier': 'free',
        'topics': [
          "Containers",
          "flex items",
          "alignment",
          "spacing",
          "Grid containers",
          "tracks",
          "areas",
        ],
      },
      {
        'id': 'font',
        'title': 'Typography',
        'tier': 'free',
        'topics': ["Fonts", "text alignment", "line height", "letter spacing"],
      },
      {
        'id': 'color',
        'title': 'Colors and Backgrounds',
        'tier': 'free',
        'topics': ["Color formats", "gradients", "background images"],
      },
      {
        'id': 'anim',
        'title': 'Transitions & Animations',
        'tier': 'vip',
        'topics': ["Keyframes", "easing", "delays"],
      },
      {
        'id': 'query',
        'title': 'Media Queries',
        'tier': 'vip',
        'topics': ["Responsive design", "breakpoints"],
      },
      {
        'id': 'pseudo',
        'title': 'Pseudo-classes & Elements',
        'tier': 'vip',
        'topics': ["Hover effects", "first-child", "::before", "::after"],
      },
    ],
    "Javascript": [
      {
        'id': 'basic',
        'title': 'Basics',
        'tier': 'free',
        'topics': ["Variables", "data types", "operators", "syntax"],
      },
      {
        'id': 'control',
        'title': 'Control Structures',
        'tier': 'free',
        'topics': ["If-else", "switch-case", "loops (for, while, do-while)"],
      },
      {
        'id': 'func',
        'title': 'Functions',
        'tier': 'free',
        'topics': [
          "Function declarations",
          "expressions",
          "arrow functions",
          "scopes",
        ],
      },
      {
        'id': 'dom',
        'title': 'DOM Manipulation',
        'tier': 'free',
        'topics': [
          "Selecting elements",
          "event handling",
          "modifying HTML/CSS",
        ],
      },
      {
        'id': 'events',
        'title': 'Events',
        'tier': 'free',
        'topics': [
          "Event listeners",
          "bubbling",
          "delegation",
          "default actions",
        ],
      },
      {
        'id': 'obj',
        'title': 'Objects and Arrays',
        'tier': 'free',
        'topics': ["Creation", "methods", "destructuring"],
      },
      {
        'id': 'es6',
        'title': 'ES6+ Features',
        'tier': 'vip',
        'topics': [
          "Let/const",
          "template literals",
          "spread/rest operators",
          "modules",
        ],
      },
      {
        'id': 'async',
        'title': 'Asynchronous JavaScript',
        'tier': 'vip',
        'topics': ["Callbacks", "promises", "async/await"],
      },
      {
        'id': 'error',
        'title': 'Error Handling',
        'tier': 'vip',
        'topics': ["Try-catch", "custom errors", "debugging"],
      },
      {
        'id': 'api',
        'title': 'APIs',
        'tier': 'vip',
        'topics': ["Fetch API", "local storage", "geolocation"],
      },
    ],
    "TypeScript": [
      {
        'id': 'ts_basics',
        'title': 'Basics & Types',
        'tier': 'free',
        'topics': ["Basic types (string, number, boolean)", "Type inference", "Any & Unknown", "Arrays & Tuples", "Null & Undefined", "Type assertions"],
      },
      {
        'id': 'ts_functions',
        'title': 'Functions & Object Types',
        'tier': 'free',
        'topics': ["Typing function parameters", "Typing return values", "Optional & default parameters", "Rest parameters", "Object types", "Void & Never types"],
      },
      {
        'id': 'ts_interfaces',
        'title': 'Interfaces & Aliases',
        'tier': 'free',
        'topics': ["Defining interfaces", "Optional properties", "Readonly properties", "Extending interfaces", "Type aliases vs Interfaces", "Index signatures"],
      },
      {
        'id': 'ts_advanced',
        'title': 'Advanced Types',
        'tier': 'vip',
        'topics': ["Generics basics", "Generic constraints", "Union types", "Intersection types", "Literal types", "Type narrowing (typeof, instanceof)", "Discriminated unions"],
      },
      {
        'id': 'ts_classes',
        'title': 'Classes & OOP',
        'tier': 'vip',
        'topics': ["Class properties & methods", "Access modifiers (public, private, protected)", "Readonly properties", "Abstract classes", "Implements keyword", "Getters & Setters"],
      },
      {
        'id': 'ts_utility',
        'title': 'Utility Types & Enums',
        'tier': 'vip',
        'topics': ["Enums (Numeric & String)", "Partial<T>", "Required<T>", "Readonly<T>", "Record<K, T>", "Pick<T, K>", "Omit<T, K>", "Exclude<T, U>", "Extract<T, U>"],
      },
    ],
    "TailwindCSS": [
      {
        'id': 'tw_basics',
        'title': 'Core Concepts',
        'tier': 'free',
        'topics': ["Utility-first concept", "Responsive design (sm, md, lg, xl)", "Hover, focus, & active states", "Dark mode configuration", "Preflight (base styles)"],
      },
      {
        'id': 'tw_layout',
        'title': 'Layout & Spacing',
        'tier': 'free',
        'topics': ["Flexbox utilities (flex, justify, items, wrap)", "Grid utilities (grid-cols, gap)", "Padding & margin (p, m)", "Width & height (w, h)", "Positioning (absolute, relative, sticky)", "Z-index"],
      },
      {
        'id': 'tw_typography',
        'title': 'Typography & Colors',
        'tier': 'free',
        'topics': ["Font families (sans, serif, mono)", "Text sizing (text-sm, text-lg)", "Text colors", "Font weights (font-bold, font-light)", "Text alignment", "Line height (leading)", "Letter spacing (tracking)"],
      },
      {
        'id': 'tw_borders',
        'title': 'Borders & Effects',
        'tier': 'vip',
        'topics': ["Border radius (rounded)", "Border width (border)", "Border color", "Box shadows (shadow)", "Opacity", "Ring utilities (outlines)", "Divide utilities (borders between children)"],
      },
      {
        'id': 'tw_customization',
        'title': 'Customization',
        'tier': 'vip',
        'topics': ["tailwind.config.js setup", "Theme configuration", "Adding custom colors & fonts", "Arbitrary values ([color:var(--my-color)])", "Directives (@tailwind, @apply, @layer)", "Plugins"],
      },
    ],
    "Sass": [
      {
        'id': 'sass_basics',
        'title': 'Variables & Nesting',
        'tier': 'free',
        'topics': ["Declaring variables (\$)", "Variable scope (local vs global)", "Nesting selectors", "Parent selector (&)", "Nesting properties", "Interpolation (#{})"],
      },
      {
        'id': 'sass_partials',
        'title': 'Partials & Modules',
        'tier': 'free',
        'topics': ["Creating partials (_filename.scss)", "@use rule", "@import (deprecated)", "Namespaces and aliasing (as)", "Forwarding files (@forward)", "Built-in modules (math, color, string)"],
      },
      {
        'id': 'sass_mixins',
        'title': 'Mixins & Functions',
        'tier': 'vip',
        'topics': ["Defining mixins (@mixin)", "Including mixins (@include)", "Passing arguments", "Default arguments", "Keyword arguments", "Passing content blocks (@content)", "Custom functions (@function, @return)"],
      },
      {
        'id': 'sass_extend',
        'title': 'Extend/Inheritance',
        'tier': 'vip',
        'topics': ["@extend directive", "Placeholder selectors (%)", "Multiple extends", "When to use extend vs mixin", "Limitations of @extend"],
      },
      {
        'id': 'sass_control',
        'title': 'Control Directives',
        'tier': 'vip',
        'topics': ["@if, @else if, and @else", "@each loops (iterating over lists/maps)", "@for loops (through/to)", "@while loops", "@error, @warn, @debug"],
      },
    ],
    "Bootstrap": [
      {
        'id': 'bs_basics',
        'title': 'Layout & Grid System',
        'tier': 'free',
        'topics': ["Containers (container, container-fluid)", "Rows and Columns (row, col)", "Breakpoints (sm, md, lg, xl, xxl)", "Responsive grid behavior", "Gutters (gx, gy)", "Nesting columns"],
      },
      {
        'id': 'bs_content',
        'title': 'Content & Typography',
        'tier': 'free',
        'topics': ["Headings & Display headings", "Lead text", "Inline text elements", "Blockquotes", "Tables (striped, hover, bordered)", "Images (img-fluid, thumbnails)", "Figures"],
      },
      {
        'id': 'bs_components1',
        'title': 'Basic Components',
        'tier': 'free',
        'topics': ["Buttons & Button groups", "Badges", "Cards (body, title, links, images)", "Alerts (dismissible)", "List groups", "Breadcrumbs", "Spinners", "Progress bars"],
      },
      {
        'id': 'bs_components2',
        'title': 'Advanced Components',
        'tier': 'vip',
        'topics': ["Navbars (responsive toggler, brand, links)", "Navs & Tabs", "Modals (dialog, content, header, body, footer)", "Carousels (controls, indicators, captions)", "Accordions", "Dropdowns", "Tooltips", "Popovers", "Offcanvas"],
      },
      {
        'id': 'bs_utilities',
        'title': 'Utilities',
        'tier': 'vip',
        'topics': ["Spacing (m, p, t, b, l, r, x, y)", "Colors (text, bg, border)", "Flexbox utilities", "Display property (d-block, d-none)", "Position (fixed, absolute, sticky)", "Text alignment & wrapping", "Visibility"],
      },
    ],
    "WebSecurity": [
      {
        'id': 'ws_basics',
        'title': 'Security Fundamentals',
        'tier': 'free',
        'topics': ["CIA Triad (Confidentiality, Integrity, Availability)", "Authentication vs Authorization", "HTTPS/TLS encryption", "Same-Origin Policy (SOP)", "Principle of Least Privilege", "Defense in Depth"],
      },
      {
        'id': 'ws_xss',
        'title': 'Cross-Site Scripting (XSS)',
        'tier': 'free',
        'topics': ["Stored XSS (Persistent)", "Reflected XSS (Non-persistent)", "DOM-based XSS", "Prevention: Output Encoding", "Prevention: Input Validation", "Prevention: Sanitization libraries (DOMPurify)"],
      },
      {
        'id': 'ws_csrf',
        'title': 'Cross-Site Request Forgery (CSRF)',
        'tier': 'vip',
        'topics': ["How CSRF works", "Impact of CSRF", "Anti-CSRF tokens (Synchronizer Token Pattern)", "SameSite cookies (Strict, Lax, None)", "Double Submit Cookie", "Verifying Origin/Referer headers"],
      },
      {
        'id': 'ws_headers',
        'title': 'Security Headers',
        'tier': 'vip',
        'topics': ["Content Security Policy (CSP) & directives", "X-Frame-Options (Clickjacking prevention)", "Strict-Transport-Security (HSTS)", "X-Content-Type-Options (MIME sniffing prevention)", "Referrer-Policy", "Permissions-Policy"],
      },
      {
        'id': 'ws_auth',
        'title': 'Auth & Session Management',
        'tier': 'vip',
        'topics': ["Password hashing (Bcrypt, Argon2)", "Session hijacking & fixation", "Secure, HttpOnly, and SameSite cookie flags", "JWT structure and vulnerabilities", "OAuth 2.0 & OIDC basics", "Multi-Factor Authentication (MFA)"],
      },
      {
        'id': 'ws_injection',
        'title': 'Injection Attacks',
        'tier': 'vip',
        'topics': ["SQL Injection (In-band, Inferential, Out-of-band)", "Command Injection", "LDAP/NoSQL Injection", "Prevention: Prepared statements (Parameterized queries)", "Prevention: Stored procedures", "Prevention: Escaping inputs"],
      },
    ],
  };
}

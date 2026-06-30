---
name: Hawsha
colors:
  surface: '#faf8ff'
  surface-dim: '#d9d9e5'
  surface-bright: '#faf8ff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f3f3fe'
  surface-container: '#ededf9'
  surface-container-high: '#e7e7f3'
  surface-container-highest: '#e1e2ed'
  on-surface: '#191b23'
  on-surface-variant: '#434655'
  inverse-surface: '#2e3039'
  inverse-on-surface: '#f0f0fb'
  outline: '#737686'
  outline-variant: '#c3c6d7'
  surface-tint: '#0053db'
  primary: '#004ac6'
  on-primary: '#ffffff'
  primary-container: '#2563eb'
  on-primary-container: '#eeefff'
  inverse-primary: '#b4c5ff'
  secondary: '#006c49'
  on-secondary: '#ffffff'
  secondary-container: '#6cf8bb'
  on-secondary-container: '#00714d'
  tertiary: '#ab0b1c'
  on-tertiary: '#ffffff'
  tertiary-container: '#cf2c30'
  on-tertiary-container: '#ffecea'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#dbe1ff'
  primary-fixed-dim: '#b4c5ff'
  on-primary-fixed: '#00174b'
  on-primary-fixed-variant: '#003ea8'
  secondary-fixed: '#6ffbbe'
  secondary-fixed-dim: '#4edea3'
  on-secondary-fixed: '#002113'
  on-secondary-fixed-variant: '#005236'
  tertiary-fixed: '#ffdad7'
  tertiary-fixed-dim: '#ffb3ad'
  on-tertiary-fixed: '#410004'
  on-tertiary-fixed-variant: '#930013'
  background: '#faf8ff'
  on-background: '#191b23'
  surface-variant: '#e1e2ed'
typography:
  display-lg:
    fontFamily: beVietnamPro
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 40px
    letterSpacing: -0.02em
  headline-md:
    fontFamily: beVietnamPro
    fontSize: 24px
    fontWeight: '700'
    lineHeight: 32px
  headline-sm:
    fontFamily: beVietnamPro
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 28px
  body-lg:
    fontFamily: ibmPlexSans
    fontSize: 16px
    fontWeight: '500'
    lineHeight: 24px
  body-md:
    fontFamily: ibmPlexSans
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  label-sm:
    fontFamily: ibmPlexSans
    fontSize: 12px
    fontWeight: '600'
    lineHeight: 16px
    letterSpacing: 0.05em
  display-lg-mobile:
    fontFamily: beVietnamPro
    fontSize: 28px
    fontWeight: '700'
    lineHeight: 36px
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  container-margin: 20px
  stack-gap: 16px
  inline-gap: 12px
  section-padding: 24px
  radius-card: 20px
---

## Brand & Style
The design system for this product is centered on the concept of "Financial Serenity." It targets a sophisticated audience seeking clarity in their personal economy. The brand personality is **Trustworthy, Visionary, and Effortless**. 

The visual style blends **Modern Minimalism** with subtle **Glassmorphism**, taking heavy inspiration from the precision of high-end fintech platforms. It utilizes a "Depth-First" approach where information is layered on soft, translucent surfaces to reduce cognitive load while maintaining a premium, high-fidelity aesthetic. The experience should feel like a private concierge: quiet, efficient, and always one step ahead through AI-driven insights.

## Colors
The palette is rooted in a "Clean White" foundation to ensure maximum readability and a sense of institutional security.

- **Primary (Soft Blue):** Used for primary actions, progress indicators, and active states. It represents stability.
- **Income (Emerald Green):** Used exclusively for positive cash flow, savings growth, and "Success" states.
- **Expenses (Red):** Reserved for outflows and critical alerts.
- **Warnings (Orange):** Used for AI-driven budget alerts and pending actions.
- **Surfaces:** We use a hierarchy of whites. The base background is pure `#FFFFFF`, while cards and containers use semi-transparent white with a backdrop blur (Glassmorphism) to create a sense of lightness and modern tech.

## Typography
The typography system is optimized for **Arabic RTL (Right-to-Left)** readability while maintaining a global fintech feel. 

- **Headlines:** We use bold, assertive weights for H1 and H2 to establish clear information hierarchy.
- **Body:** Body text is set in Medium weights (500) rather than Regular to ensure the Arabic script remains legible at smaller sizes and on varying background blurs.
- **Alignment:** All text defaults to Right-Aligned. Numerical data (currency) should use tabular lining to ensure digits align perfectly in transaction lists.

## Layout & Spacing
This design system utilizes a **Fluid Grid** optimized for mobile-first consumption. 

- **Margins:** A consistent 20px "Safe Area" margin is maintained on the left and right edges of the screen.
- **RTL Reflow:** The layout is strictly RTL. Icons that indicate direction (arrows, chevrons) must be mirrored. The progress bars and charts must fill from right to left.
- **Rhythm:** An 8px linear scale is used for all spacing. Most card internals use 16px (2x) or 24px (3x) padding to maintain a spacious, premium feel.

## Elevation & Depth
Elevation in this design system is achieved through **Tonal Layering** and **Ambient Shadows** rather than harsh outlines.

- **Level 0 (Background):** Pure White (#FFFFFF).
- **Level 1 (Cards):** Soft Glassmorphism. White background at 70% opacity with a 20px Backdrop Blur. Shadow: `0px 4px 20px rgba(0, 0, 0, 0.05)`.
- **Level 2 (Active/Floating):** Used for the FAB and active modals. Shadow: `0px 10px 30px rgba(37, 99, 235, 0.15)` (Primary-tinted shadow).
- **Depth:** Elements should feel like they are floating on a physical plane. When a user scrolls, the navigation bar should increase its backdrop-blur intensity to maintain separation.

## Shapes
The shape language is "Hyper-Soft." 

- **Cards & Containers:** Use a 20px corner radius to evoke a friendly and modern fintech feel, echoing the aesthetic of high-end physical credit cards.
- **Buttons:** Primary buttons use a slightly higher radius or full pill-shape to distinguish them from informational cards.
- **Inputs:** Text fields follow the card radius (20px) to maintain a cohesive visual rhythm.

## Components
Consistent component behavior is vital for the premium Hawsha experience:

- **Buttons:** Large, 56px height for primary actions. They use the Primary Blue with white text. Support for "Loading" states with a subtle spinner is required.
- **Floating Action Button (FAB):** A circular or "Squircle" button located at the bottom-left (due to RTL layout) for the most frequent action (e.g., "Add Transaction").
- **Cards:** The core unit. Cards should never have borders. Depth is created purely via the 20px radius and soft ambient shadows.
- **Transaction Lists:** Each item should have a leading icon (categorized) on the right, title/subtitle in the middle, and amount on the left.
- **Bottom Navigation:** A glassmorphic bar with 4-5 icons. The active state is indicated by a Primary Blue tint and a subtle dot indicator below the icon.
- **Chips:** Small, highly rounded (pill) tags used for transaction categories (e.g., "Shopping", "Bills").
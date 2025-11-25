# Mindycore Keycloak Login Theme

This is a custom login theme for Keycloak that provides a modern purple/pink/orange gradient design with Mindycore branding for the Mindy AI platform.

## Features

- **Gradient Theme**: Modern purple (#a855f7), pink (#ec4899), and orange (#f97316) gradient design
- **Mindycore Branding**: Robot emoji 🤖 logo with "Hello, Mindy!" title and "Powered by MindyMinds®" subtitle
- **Modern UI**: Clean white card design with rounded corners (30px) and purple shadows
- **Google Fonts**: Inter for body text, Comfortaa for headings
- **Responsive Design**: Works seamlessly on desktop and mobile devices
- **Enhanced Form Styling**: Modern inputs with purple focus states and gradient buttons
- **Accessibility**: Proper focus states and high contrast text

## Color Palette

### Primary Brand Colors
- **Mindy Purple**: `#a855f7` - Primary brand color for links and accents
- **Mindy Pink**: `#ec4899` - Secondary color for gradients and hover effects  
- **Mindy Orange**: `#f97316` - Accent color for gradient completions

### Background & UI Colors
- **Background**: Soft gradient from light purple to light pink (`linear-gradient(135deg, #f8f4ff 0%, #fdf4ff 50%, #fff5f7 100%)`)
- **Card Background**: `#ffffff` - Clean white for the login form
- **Text Dark**: `#1f2937` - Primary text color
- **Text Medium**: `#6b7280` - Secondary text and labels
- **Text Light**: `#9ca3af` - Placeholders and subtle text

## Installation

This theme is designed to be used with Keycloak and can be:

1. **Volume mounted** in Docker containers
2. **Built into a custom Keycloak image** using the provided Dockerfile
3. **Deployed manually** to Keycloak's theme directory

## Files Structure

```
mindycore-theme/
├── login/
│   ├── theme.properties      # Theme configuration
│   ├── login.ftl            # Login page template
│   ├── template.ftl         # Base template with Google Fonts
│   └── resources/
│       ├── css/
│       │   └── custom.css   # Mindycore custom styling
│       └── img/
│           └── (optional logo images)
```

## Customization

To customize this theme:

1. **Colors**: Update the CSS variables in `custom.css` (`:root` section)
2. **Branding**: Modify the logo section in `login.ftl` (emoji, title, subtitle)
3. **Layout**: Adjust the FreeMarker templates (`*.ftl` files)
4. **Styling**: Add custom CSS rules to `custom.css`

## Theme Properties

The theme extends the base Keycloak theme with:
- Parent: `keycloak`
- Import: `common/keycloak`
- Styles: `css/login.css css/custom.css`

## Browser Support

- Chrome/Chromium 90+
- Firefox 88+
- Safari 14+
- Edge 90+

## Development

For development and testing:

1. Mount the theme directory to `/opt/keycloak/themes/mindycore-theme`
2. Restart Keycloak or clear theme cache
3. Select "mindycore-theme" in realm settings under Login Theme

## Design Notes

This theme is inspired by modern AI assistant interfaces with:
- Soft gradient backgrounds for a welcoming feel
- Purple/pink/orange gradients representing creativity and innovation
- Clean, minimalist design focused on usability
- Friendly robot emoji branding for the Mindy AI assistant

## License

This theme is part of the Mindycore platform and follows the project's licensing terms.

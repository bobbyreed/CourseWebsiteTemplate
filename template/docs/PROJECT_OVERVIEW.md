# Course Website Template - Project Overview

## Purpose

This repository serves as a **domain-agnostic template** for creating professional course websites, extracted from three production course sites:
- Web Programming (CSCI 3403) - Undergraduate
- Software Engineering (CSCI 5403) - Graduate
- Database Design (CSCI 5603) - Graduate

The template provides a robust foundation for building engaging, interactive course websites with modern presentation features, student tracking, and customizable theming.

## Template Philosophy

This template is designed to be:
- **Domain-Agnostic**: No course-specific content, ready to customize for any subject
- **Production-Ready**: Battle-tested infrastructure from three live courses
- **Feature-Rich**: Presentation system, attendance tracking, theme customization
- **Easy to Customize**: Clear structure with separated concerns (content, styling, functionality)
- **Modern**: Responsive design, dark/light themes, keyboard navigation

## Core Features

### 1. Interactive Presentation System
- **Keyboard Navigation**: Arrow keys, Home, End, Space bar, 'f' for fullscreen, 't' for theme toggle
- **Auto-Hide Controls**: Intelligent UI that hides after 2 seconds of inactivity
- **Timer System**: Countdown timers for in-class exercises with audio alerts
- **Slide Counter**: Current/total slides with visual progress
- **Smooth Transitions**: CSS-based slide animations
- **Print-Friendly**: Optimized for PDF export and printing

### 2. Course Homepage
- **Lecture Grid**: Dynamic, responsive grid of lecture cards
- **Availability Logic**: Lock lectures until specified dates (day-before access)
- **Status Indicators**: Visual markers for completed, current, and upcoming lectures
- **Responsive Layout**: Mobile-first design that adapts to all screen sizes
- **Quick Links**: Customizable resource cards for external links

### 3. Theme System
- **Light/Dark Mode**: User preference with localStorage persistence
- **Custom Color Schemes**: Easy to customize with CSS variables
- **OCU Branding**: Includes Oklahoma City University color palette (customizable)
- **Theme Toggle UI**: Bubble interface with auto-hide functionality

### 4. Student Engagement (Optional)
- **Attendance Tracking**: Card swipe authentication system
- **Progress Tracking**: Individual student dashboards
- **Admin Panel**: Instructor-only access for managing students
- **Database Integration**: PostgreSQL backend via Netlify serverless functions

## Technology Stack

### Frontend
- **HTML5**: Semantic markup for accessibility
- **CSS3**: Custom properties (CSS variables), flexbox, grid
- **Vanilla JavaScript**: No frameworks - pure, maintainable code

### Backend & Services
- **Netlify Functions**: Serverless backend for database operations
- **PostgreSQL**: Student and attendance data (via Neon serverless)
- **GitHub Pages**: Alternative hosting option

### Styling Philosophy
- **CSS Variables**: All colors, spacing, and typography defined as variables
- **Mobile-First**: Responsive breakpoints for all screen sizes
- **Accessibility**: WCAG AA compliant with semantic HTML
- **Print Support**: Clean print styles for lecture materials

## Project Structure

```
CourseWebsiteTemplate/
├── index.html                    # Course homepage template
├── package.json                  # Node dependencies for Netlify functions
├── netlify.toml                  # Netlify configuration
├── pages/
│   ├── lectures/
│   │   └── lectureTemplate.html  # Template for creating new lectures
│   ├── notes/
│   │   └── notesTemplate.html    # Template for student notes (optional)
│   ├── attendance.html           # Attendance tracking page (optional)
│   └── quick.html                # Quick reference page (optional)
├── js/
│   ├── presentation.js           # Core presentation engine
│   ├── classroom-auth.js         # Authentication system (optional)
│   └── utils.js                  # Utility functions
├── styles/
│   ├── presentation.css          # Main presentation styles
│   ├── lecture-tracking-styles.css  # Student progress styles (optional)
│   └── theme-variables.css       # Customizable theme variables
├── images/
│   └── favicon.png               # Course icon
├── netlify/
│   └── functions/                # Serverless API endpoints (optional)
│       ├── db-config.js
│       ├── mark-attendance.js
│       └── get-students.js
└── docs/
    ├── PROJECT_OVERVIEW.md       # This file
    ├── CUSTOMIZATION_GUIDE.md    # How to customize for your course
    └── LECTURE_CREATION_GUIDE.md # How to create new lectures
```

## Getting Started

### Option 1: Minimal Setup (Lectures Only)
1. Clone this repository
2. Update `index.html` with your course information
3. Create lectures using `pages/lectures/lectureTemplate.html`
4. Deploy to GitHub Pages, Netlify, or any static host

### Option 2: Full Setup (With Attendance Tracking)
1. Clone this repository
2. Set up Neon PostgreSQL database
3. Configure Netlify environment variables
4. Update course information in `index.html`
5. Create lectures and customize theme
6. Deploy to Netlify with functions enabled

## Customization Points

### Essential Customizations
1. **Course Information** (`index.html`):
   - Course title, number, and description
   - Instructor name and contact information
   - Semester and schedule
   - Lecture list with dates and titles

2. **Color Theme** (`styles/theme-variables.css`):
   - Primary and secondary colors
   - Light and dark mode palettes
   - Typography (fonts, sizes, weights)

3. **Lectures** (`pages/lectures/`):
   - Create lecture HTML files from template
   - Add slides with course-specific content
   - Configure timers for exercises

### Optional Customizations
4. **Branding** (`images/`):
   - Favicon
   - Logo images
   - Background patterns

5. **Features** (Enable/Disable):
   - Attendance tracking system
   - Student progress dashboards
   - Achievement badges
   - Leaderboards

## Key Files Explained

### index.html
The course homepage that displays:
- Course header with title and instructor info
- Course overview section
- Quick links to resources
- Lecture grid with availability logic
- Footer

**Customize**: Update header content, course description, quick links, and lecture array

### pages/lectures/lectureTemplate.html
A blank lecture presentation with:
- Presentation framework loaded
- Title slide structure
- Example content slides
- Timer controls
- Navigation UI

**Use**: Copy this file to create each new lecture

### js/presentation.js
The core presentation engine that handles:
- Slide navigation (keyboard and button)
- Auto-hide controls
- Timer management
- Theme toggling
- Fullscreen mode
- Print optimization

**Customize**: Rarely needed, but you can adjust timing, transitions, or add features

### styles/presentation.css
The main stylesheet defining:
- Slide layout and typography
- Navigation controls
- Theme colors (via CSS variables)
- Responsive breakpoints
- Print styles

**Customize**: Color scheme, fonts, spacing, and visual design

## Common Course Patterns

### Pattern 1: Undergraduate Course (Web Programming Style)
- **Lectures**: 30+ classes over 16 weeks
- **Features**: Student notes, achievement system, leaderboard
- **Style**: Clean, modern, accessible
- **Extras**: Integration with external curriculum (The Odin Project)

### Pattern 2: Graduate Intensive (Software Engineering Style)
- **Lectures**: 15 classes over 8 weeks
- **Features**: Card swipe attendance, admin panel
- **Style**: Blueprint/Windows 95 themed, unique aesthetic
- **Extras**: Industry case studies, hands-on projects

### Pattern 3: Graduate Specialized (Database Design Style)
- **Lectures**: 16 classes over 8 weeks
- **Features**: Entity-relationship themed design
- **Style**: Database-inspired color scheme and iconography
- **Extras**: Technical documentation, code examples

## Deployment Options

### GitHub Pages (Free, Simple)
1. Push repository to GitHub
2. Enable GitHub Pages in repository settings
3. Select branch and directory
4. Access at `username.github.io/repository`

**Limitations**: No serverless functions (attendance tracking won't work)

### Netlify (Free, Full-Featured)
1. Connect repository to Netlify
2. Configure build settings (none needed for static site)
3. Add environment variables for database
4. Auto-deploys on git push

**Benefits**: Serverless functions, custom domains, SSL, previews

### Custom Server
- Any static file server (Apache, Nginx, etc.)
- Upload files to web root
- Configure virtual host if needed

## Database Schema (Optional)

If using attendance tracking:

### students Table
```sql
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    full_name VARCHAR(200) NOT NULL,
    card_data TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(first_name, last_name)
);
```

### attendance Table
```sql
CREATE TABLE attendance (
    id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
    attendance_date DATE NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_late BOOLEAN DEFAULT false,
    UNIQUE(student_id, attendance_date)
);
```

## Accessibility Features

- **Semantic HTML**: Proper heading hierarchy, landmarks, and ARIA labels
- **Keyboard Navigation**: All features accessible without mouse
- **Color Contrast**: WCAG AA compliant (4.5:1 for text)
- **Screen Reader Support**: Meaningful alt text and ARIA descriptions
- **Focus Indicators**: Clear visual focus states
- **Responsive Text**: Scales appropriately at different zoom levels

## Browser Support

- **Modern Browsers**: Chrome, Firefox, Safari, Edge (latest 2 versions)
- **Mobile**: iOS Safari, Chrome Mobile, Samsung Internet
- **Features**: CSS Grid, Flexbox, CSS Variables, ES6 JavaScript
- **Fallbacks**: Graceful degradation for older browsers

## Best Practices

### Creating Lectures
1. Copy `lectureTemplate.html` for each new lecture
2. Update title, lecture number, and total slides
3. Use semantic HTML structure for slides
4. Include timers for timed activities
5. Test keyboard navigation
6. Verify print layout

### Styling Guidelines
1. Use CSS variables for all colors and spacing
2. Follow mobile-first responsive design
3. Maintain consistent typography hierarchy
4. Test in both light and dark themes
5. Verify accessibility with tools (WAVE, axe)

### Content Organization
1. One topic per slide (avoid overcrowding)
2. Use visual examples (code, diagrams, screenshots)
3. Include interactive exercises with timers
4. Add clear learning objectives
5. Provide summary/review slides

## File Naming Conventions

### Lecture Files
- Format: `{Number}{Title}.html`
- Examples: `1CourseIntro.html`, `15FinalExam.html`
- Use camelCase for multi-word titles: `5SoftwareArchitecture.html`

### CSS Files
- `presentation.css` - Core presentation styles
- `theme-variables.css` - Customizable color/font variables
- `{feature}-styles.css` - Feature-specific styles (e.g., `attendance-styles.css`)

### JavaScript Files
- `presentation.js` - Core presentation engine
- `{feature}.js` - Feature-specific logic (e.g., `classroom-auth.js`)

## Performance Considerations

- **Minimal Dependencies**: Pure JavaScript, no heavy frameworks
- **Lazy Loading**: Images and content loaded as needed
- **Local Storage**: Theme preferences cached locally
- **Serverless Functions**: Cold start ~500ms (acceptable for attendance)
- **CDN Delivery**: Use Netlify CDN for fast global access

## Security Best Practices

### If Using Attendance System
1. **Environment Variables**: Never commit database credentials
2. **Input Validation**: Sanitize all user inputs in functions
3. **SQL Injection**: Use parameterized queries
4. **Authentication**: Card-based instructor auth with expiration
5. **HTTPS Only**: Enforce SSL for all traffic

## Lessons Learned from Production

### What Works Well
- Auto-hide controls reduce distraction during presentations
- Keyboard navigation is heavily used by instructors
- Dark mode is preferred by 60%+ of students
- Day-before lecture unlocking prevents students from racing ahead
- Card swipe attendance is faster than manual entry

### What to Avoid
- Don't over-complicate the UI (keep it clean)
- Don't use heavy animations (they distract from content)
- Don't make lectures available too early (students lose sync with class)
- Don't rely solely on color for status (use icons too)

## Support & Maintenance

### For Course Instructors
- Update lecture dates in `index.html` lecture array
- Create new lectures by copying template
- Customize theme colors in CSS variables
- Monitor attendance in admin panel (if enabled)

### For Developers
- All JavaScript is well-commented
- CSS uses BEM-like naming conventions
- Database queries are in `netlify/functions/`
- Logs available in Netlify dashboard

## Future Enhancement Ideas

- **Video Integration**: Embed lecture recordings
- **Quiz System**: Interactive quizzes with instant feedback
- **Discussion Boards**: Integrated Q&A for each lecture
- **Assignment Submission**: Upload and track assignments
- **Grade Book**: Full LMS-lite functionality
- **Mobile App**: Native iOS/Android companion apps
- **Live Polling**: Real-time audience participation
- **Code Playground**: Embedded code editor for live coding

## Credits

This template is derived from three production course websites created for Oklahoma City University:
- **Web Programming** (CSCI 3403) - Fall 2024/2025
- **Software Engineering** (CSCI 5403) - Spring 2025
- **Database Design** (CSCI 5603) - Fall 2024

**Created By**: bobby reed
**Institution**: Oklahoma City University
**License**: Educational use encouraged

## Next Steps

After reviewing this overview:
1. Read `CUSTOMIZATION_GUIDE.md` for step-by-step customization
2. Read `LECTURE_CREATION_GUIDE.md` for creating lecture content
3. Explore the three source courses in their respective directories
4. Start customizing for your own course!

---

**Last Updated**: November 2025
**Template Version**: 1.0
**Maintainer**: Course Website Template Team

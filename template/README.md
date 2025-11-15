# Course Website Template

A domain-agnostic, professional course website template with interactive presentations, attendance tracking, and theme customization.

## Features

- **Interactive Presentation System**: Keyboard navigation, theme toggle, timers, and auto-hide controls
- **Responsive Design**: Mobile-first layout that works on all devices
- **Dark/Light Themes**: User preference with localStorage persistence
- **Attendance Tracking** (Optional): Serverless PostgreSQL backend via Netlify Functions
- **Easy Customization**: Separated theme variables for quick branding

## Quick Start

### Option 1: Static Website (No Attendance)

1. Clone or download this template
2. Edit `index.html` with your course information
3. Customize colors in `styles/theme-variables.css`
4. Create lectures using `pages/lectures/lectureTemplate.html`
5. Deploy to GitHub Pages, Netlify, or any static host

### Option 2: Full Setup (With Attendance Tracking)

1. Clone this template
2. Set up a [Neon PostgreSQL](https://neon.tech) database
3. Deploy to Netlify
4. Add `DATABASE_URL` environment variable in Netlify dashboard
5. Run database schema (see Database Setup below)
6. Customize your course information

## File Structure

```
template/
├── index.html                 # Course homepage (customize this)
├── package.json               # Node dependencies for Netlify functions
├── netlify.toml               # Netlify configuration
├── pages/
│   ├── lectures/
│   │   └── lectureTemplate.html  # Template for new lectures
│   ├── notes/
│   │   └── notesTemplate.html    # Template for student notes
│   └── attendance.html        # Attendance tracking (optional)
├── js/
│   ├── presentation.js        # Core presentation engine
│   ├── classroom-auth.js      # Authentication (optional)
│   └── utils.js               # Utility functions
├── styles/
│   ├── theme-variables.css    # CUSTOMIZE: Colors and branding
│   └── presentation.css       # Core presentation styles
├── images/
│   └── favicon.png            # Course icon
├── netlify/
│   └── functions/             # Serverless backend (optional)
└── docs/
    ├── CUSTOMIZATION_GUIDE.md
    └── LECTURE_CREATION_GUIDE.md
```

## Customization Guide

### 1. Update Course Information

Edit `index.html`:
- Course title, number, and description
- Instructor name and contact
- Semester and schedule
- Lecture list with dates and titles

### 2. Customize Colors

Edit `styles/theme-variables.css`:
```css
--primary-color: #00669b;      /* Your institution's primary color */
--secondary-color: #009edb;    /* Accent color */
--accent-color: #ffc222;       /* Highlight color */
```

### 3. Create Lectures

1. Copy `pages/lectures/lectureTemplate.html`
2. Rename to match your lecture (e.g., `1Introduction.html`)
3. Edit slides with your content
4. Add to lectures array in `index.html`

## Database Setup (Optional - For Attendance)

If using attendance tracking, create these tables in your Neon database:

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

CREATE TABLE attendance (
    id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
    attendance_date DATE NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_late BOOLEAN DEFAULT false,
    UNIQUE(student_id, attendance_date)
);
```

## Keyboard Shortcuts (In Presentations)

- **Arrow Keys**: Navigate slides
- **Space**: Next slide
- **Home/End**: First/Last slide
- **F**: Toggle fullscreen
- **T**: Toggle theme
- **Esc**: Exit fullscreen

## Deployment

### GitHub Pages
1. Push to GitHub
2. Enable Pages in repository settings
3. Select branch and directory

### Netlify
1. Connect repository to Netlify
2. Set build directory to `.`
3. Add environment variables (if using attendance)
4. Auto-deploys on push

## Documentation

- [Customization Guide](docs/CUSTOMIZATION_GUIDE.md) - Detailed customization instructions
- [Lecture Creation Guide](docs/LECTURE_CREATION_GUIDE.md) - How to create engaging lectures

## Browser Support

- Chrome, Firefox, Safari, Edge (latest 2 versions)
- Mobile: iOS Safari, Chrome Mobile
- Requires: CSS Grid, Flexbox, CSS Variables, ES6 JavaScript

## License

MIT License - Feel free to use for educational purposes

## Credits

Created for educational use. Based on production course websites from Oklahoma City University.

---

**Need Help?** Check the documentation in the `docs/` folder or create an issue.

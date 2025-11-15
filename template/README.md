# Course Website Template

[![GitHub Template](https://img.shields.io/badge/GitHub-Template-green?logo=github)](https://github.com/bobbyreed/CourseWebsiteTemplate)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Tested](https://img.shields.io/badge/Tests-71%2F71%20Passed-brightgreen)](TEST_REPORT.md)

A domain-agnostic, professional course website template with interactive presentations, attendance tracking, and theme customization. **Battle-tested with 100+ students across 3 production courses.**

## 🚀 Using This Template

This is a GitHub template repository! To create your own course website:

1. **Click "Use this template"** button at the top of this repository
2. **Name your new repository** (e.g., `CSCI3403-WebProgramming`)
3. **Clone your new repository** to your local machine
4. **Run the setup wizard** (optional but recommended):
   ```bash
   bash initialize-course.sh
   ```
   This will prompt you for course details and automatically update the template.
5. **Follow the [Setup Checklist](SETUP_CHECKLIST.md)** to complete your site

**Prefer manual setup?** See the [Quick Start](#quick-start) section below.

---

## Features

- **Interactive Presentation System**: Keyboard navigation, theme toggle, timers, and auto-hide controls
- **Responsive Design**: Mobile-first layout that works on all devices
- **Dark/Light Themes**: User preference with localStorage persistence
- **Attendance Tracking** (Optional): Serverless PostgreSQL backend via Netlify Functions
- **Easy Customization**: Separated theme variables for quick branding

## Quick Start

### Automated Setup (Recommended)

```bash
# After creating from template and cloning
cd your-course-repo
bash initialize-course.sh
```

The wizard will prompt you for:
- Course title, number, and level
- Instructor information
- Institution colors
- Whether you want attendance tracking
- Deployment preferences

Then follow the [Setup Checklist](SETUP_CHECKLIST.md) for remaining tasks.

### Manual Setup

#### Option 1: Static Website (No Attendance)

1. Create repository from this template on GitHub
2. Clone your new repository
3. Edit `index.html` with your course information
4. Customize colors in `styles/theme-variables.css`
5. Create lectures using `pages/lectures/lectureTemplate.html`
6. Deploy to GitHub Pages, Netlify, or any static host

#### Option 2: Full Setup (With Attendance Tracking)

1. Create repository from this template
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

### GitHub Pages (Automated!)

This template includes GitHub Actions for automatic deployment:

**Setup:**
1. Push your repository to GitHub
2. Go to Settings → Pages → Source: "GitHub Actions"
3. Workflow automatically deploys on every push to `main`
4. Access at: `https://[username].github.io/[repository-name]`

**Limitations:** Serverless functions won't work (attendance tracking disabled)

### Netlify (Full Features)

**Setup:**
1. Connect repository to Netlify
2. Build settings pre-configured in `netlify.toml`
3. Add `DATABASE_URL` environment variable (if using attendance)
4. Auto-deploys on every push

**Benefits:** Serverless functions, custom domains, SSL, deploy previews

### Other Hosts
Works with Vercel, Cloudflare Pages, AWS S3, Azure Static Web Apps

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

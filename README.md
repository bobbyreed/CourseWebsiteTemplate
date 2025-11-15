# Course Website Template

[![GitHub Template](https://img.shields.io/badge/GitHub-Template-green?logo=github)](https://github.com/bobbyreed/CourseWebsiteTemplate)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Tested](https://img.shields.io/badge/Tests-71%2F71%20Passed-brightgreen)](docs/testing/TEST_REPORT.md)

A domain-agnostic, professional course website template with interactive presentations, attendance tracking, and theme customization. **Battle-tested with 100+ students across 3 production courses.**

## 📚 What Is This?

This template provides everything you need to create a modern, interactive course website. It's designed for educators who want to:
- **Present lectures** using a built-in slide presentation system with keyboard navigation
- **Track attendance** (optional) using serverless PostgreSQL backend
- **Customize branding** quickly with theme variables
- **Deploy easily** to GitHub Pages, Netlify, or any static host

No complex frameworks, no heavy dependencies—just clean HTML, CSS, and vanilla JavaScript that works everywhere.

## 🚀 Getting Started

### Step 1: Create Your Repository

This is a **GitHub Template Repository**, which means you can create a copy with one click:

1. Click the **"Use this template"** button (green button at the top of this page)
2. Name your repository:
   - Use format: `[CourseNumber]-[CourseName]` (e.g., `CSCI3403-WebProgramming`)
   - Choose public or private (public allows free GitHub Pages hosting)
3. Click **"Create repository from template"**

You now have your own copy! All files are yours to customize.

### Step 2: Clone to Your Computer

```bash
git clone https://github.com/YOUR-USERNAME/YOUR-REPO-NAME.git
cd YOUR-REPO-NAME
```

### Step 3: Choose Your Setup Path

#### 🎯 Path A: Automated Setup (Recommended for Beginners)

Run the interactive setup wizard:

```bash
bash initialize-course.sh
```

The wizard will ask you questions and automatically update:
- Course title, number, and level
- Instructor name and contact information
- Institution colors and branding
- Semester and schedule
- Whether you want attendance tracking enabled

**Time:** ~5 minutes | **Best for:** First-time users or quick setup

Then follow the [Setup Checklist](SETUP_CHECKLIST.md) for deployment and final touches.

#### 🔧 Path B: Manual Setup (More Control)

Edit files directly for maximum customization:

1. **Update course info** in `index.html` (lines 10-50)
2. **Customize colors** in `styles/theme-variables.css`
3. **Create lectures** by copying `pages/lectures/lectureTemplate.html`
4. **Deploy** to GitHub Pages or Netlify (see [Deployment](#deployment))

**Time:** ~15-30 minutes | **Best for:** Experienced users or specific customization needs

See the [Quick Start](#quick-start) section below for detailed manual setup instructions.

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

## 📁 Repository Structure

After creating from this template, your repository will have this structure:

```
your-course-website/
├── index.html                    # 🏠 Course homepage - start here!
├── SETUP_CHECKLIST.md            # 📋 Step-by-step setup guide
├── initialize-course.sh          # 🔧 Automated setup wizard
│
├── pages/                        # 📄 All your course pages
│   ├── lectures/                 # Lecture presentations
│   │   ├── lectureTemplate.html  # Copy this for each new lecture
│   │   └── 1ExampleLecture.html  # Example lecture to reference
│   ├── attendance.html           # Student attendance tracking (optional)
│   └── register-students.html    # Student registration (optional)
│
├── js/                           # 🎮 Interactive functionality
│   ├── presentation.js           # Core slide navigation & controls
│   ├── classroom-auth.js         # Authentication helpers (optional)
│   └── utils.js                  # Shared utility functions
│
├── styles/                       # 🎨 Look and feel
│   ├── theme-variables.css       # ⚡ CUSTOMIZE: Your colors here!
│   └── presentation.css          # Core presentation styles
│
├── images/                       # 🖼️  Visual assets
│   └── favicon.png               # Browser tab icon
│
├── docs/                         # 📚 Documentation & guides
│   ├── CUSTOMIZATION_GUIDE.md    # Detailed customization instructions
│   ├── LECTURE_CREATION_GUIDE.md # How to create engaging lectures
│   ├── PROJECT_OVERVIEW.md       # Architecture and design decisions
│   ├── repository/               # Template repository documentation
│   └── testing/                  # Test files and reports
│
├── .github/                      # ⚙️  GitHub configuration
│   ├── workflows/                # Automated deployment workflows
│   └── ISSUE_TEMPLATE/           # Issue templates for support
│
├── netlify.toml                  # ☁️  Netlify deployment config
└── package.json                  # 📦 Dependencies (for Netlify functions)
```

**Key Files to Customize:**
1. `index.html` - Your course information, lecture list, and homepage content
2. `styles/theme-variables.css` - Your institution's colors and branding
3. `pages/lectures/*.html` - Create one file per lecture using the template

## 📝 Common Customization Tasks

### Creating Your First Lecture

**What:** Lectures are HTML slide presentations with keyboard navigation, timers, and theme support.

**How:**

1. **Copy the template:**
   ```bash
   cp pages/lectures/lectureTemplate.html pages/lectures/1Introduction.html
   ```

2. **Edit the content:**
   Open `pages/lectures/1Introduction.html` and:
   - Update the `<title>` tag (line 5)
   - Replace slide content inside `<div class="slide">` elements
   - Add or remove slides as needed (each slide is a `<div class="slide">`)
   - The first slide should have `class="slide active"`

3. **Add to homepage:**
   Edit `index.html` and add your lecture to the `lectures` array:
   ```javascript
   const lectures = [
       {
           number: 1,
           title: "Introduction to Web Development",
           date: "2025-01-15",  // Lecture becomes available day before
           link: "./pages/lectures/1Introduction.html"
       },
       // Add more lectures here
   ];
   ```

4. **Test it:**
   - Open `index.html` in a browser
   - Your lecture should appear in the schedule
   - Click to open and test keyboard navigation (←, →, Space)

**Pro tip:** Check the date logic—lectures become accessible the day before their scheduled date to allow student preparation.

---

### Changing Colors & Branding

**What:** All colors are centralized in one file for easy customization.

**How:**

1. **Open** `styles/theme-variables.css`

2. **Find the color variables** (around lines 5-20):
   ```css
   /* Light mode colors */
   --primary-color: #00669b;      /* Main brand color */
   --secondary-color: #009edb;    /* Links and accents */
   --accent-color: #ffc222;       /* Buttons and highlights */
   ```

3. **Replace with your institution's colors:**
   ```css
   /* Example: University of Example */
   --primary-color: #003366;      /* Deep blue */
   --secondary-color: #0066cc;    /* Bright blue */
   --accent-color: #ffcc00;       /* Gold */
   ```

4. **Update dark mode colors too** (around lines 30-40):
   ```css
   [data-theme="dark"] {
       --primary-color: #0088cc;  /* Lighter shade for dark backgrounds */
       /* ... update other colors ... */
   }
   ```

5. **Test both themes:**
   - Open `index.html`
   - Click the theme toggle button (🌙/☀️)
   - Verify colors look good in both light and dark mode

**Pro tip:** Use your institution's official brand guidelines for color codes.

---

### Updating Course Information

**What:** All course metadata lives in `index.html`.

**Where to edit:**

1. **Page title** (line 6):
   ```html
   <title>CSCI 3403 - Web Development | Fall 2025</title>
   ```

2. **Course header** (around line 40):
   ```html
   <h1>CSCI 3403: Web Development</h1>
   <p class="subtitle">Fall 2025 | MWF 10:00-10:50 AM</p>
   ```

3. **Instructor info** (around line 80):
   ```html
   <h3>Instructor</h3>
   <p><strong>Prof. Jane Doe</strong><br>
   Email: jane.doe@university.edu<br>
   Office: Walker Hall 315<br>
   Office Hours: MW 2-4 PM or by appointment</p>
   ```

4. **Course description** (around line 90):
   ```html
   <p>This course covers modern web development including HTML5, CSS3,
   JavaScript, responsive design, and web frameworks...</p>
   ```

**Pro tip:** Search for "CUSTOMIZE" comments in the HTML—they mark all places that typically need updates.

## 📊 Database Setup (Optional - For Attendance Tracking)

**Do you need this?** Only if you want to track student attendance using the built-in attendance pages. Most users skip this and just use the presentation features.

### Setting Up Attendance Tracking

**Prerequisites:**
- Deployed to Netlify (serverless functions required)
- Free Neon PostgreSQL account

**Step-by-step setup:**

1. **Create a Neon database:**
   - Go to [neon.tech](https://neon.tech) and sign up (free tier is plenty)
   - Create a new project
   - Copy your connection string (looks like: `postgresql://user:pass@host/db`)

2. **Run the database schema:**
   - In Neon's SQL Editor, run this SQL:
   ```sql
   -- Students table
   CREATE TABLE students (
       id SERIAL PRIMARY KEY,
       first_name VARCHAR(100) NOT NULL,
       last_name VARCHAR(100) NOT NULL,
       full_name VARCHAR(200) NOT NULL,
       card_data TEXT,                  -- Optional: for card swipe systems
       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
       UNIQUE(first_name, last_name)
   );

   -- Attendance records table
   CREATE TABLE attendance (
       id SERIAL PRIMARY KEY,
       student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
       attendance_date DATE NOT NULL,
       timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
       is_late BOOLEAN DEFAULT false,  -- Optional: mark late arrivals
       UNIQUE(student_id, attendance_date)  -- Prevent duplicate records
   );

   -- Index for faster lookups
   CREATE INDEX idx_attendance_date ON attendance(attendance_date);
   CREATE INDEX idx_student_name ON students(last_name, first_name);
   ```

3. **Add DATABASE_URL to Netlify:**
   - In Netlify: Site settings → Environment variables
   - Variable name: `DATABASE_URL`
   - Value: Your Neon connection string
   - Click **Save**
   - Redeploy your site

4. **Register students:**
   - Visit: `https://your-site.netlify.app/pages/register-students.html`
   - Enter student names one by one
   - Or bulk import via SQL:
     ```sql
     INSERT INTO students (first_name, last_name, full_name)
     VALUES
         ('John', 'Doe', 'John Doe'),
         ('Jane', 'Smith', 'Jane Smith');
     ```

5. **Test attendance:**
   - Visit: `https://your-site.netlify.app/pages/attendance.html`
   - Search for a student name
   - Click to mark present
   - Check `pages/attendance-overview.html` to see reports

**Security note:** The attendance functions use basic authentication. For production with sensitive data, consider adding proper authentication (e.g., OAuth, password protection).

## Keyboard Shortcuts (In Presentations)

- **Arrow Keys**: Navigate slides
- **Space**: Next slide
- **Home/End**: First/Last slide
- **F**: Toggle fullscreen
- **T**: Toggle theme
- **Esc**: Exit fullscreen

## 🚀 Deployment Options

Your course website is just static files, so it can be hosted almost anywhere. Here are the most common options:

### Option 1: GitHub Pages (Free & Easy)

**Best for:** Simple deployments without attendance tracking

**Advantages:**
- ✅ Completely free
- ✅ Automatic deployment on every push
- ✅ Built-in HTTPS
- ✅ Custom domain support

**Limitations:**
- ❌ No serverless functions (attendance tracking won't work)

**Setup Steps:**

1. **Push your code to GitHub:**
   ```bash
   git add .
   git commit -m "Initial course website setup"
   git push origin main
   ```

2. **Enable GitHub Pages:**
   - Go to your repository on GitHub
   - Click **Settings** → **Pages**
   - Under "Source", select **"Deploy from a branch"**
   - Select branch: **`main`**, folder: **`/ (root)`**
   - Click **Save**

3. **Wait for deployment** (1-2 minutes):
   - Go to **Actions** tab to watch the deployment
   - Once complete, your site will be at:
     ```
     https://YOUR-USERNAME.github.io/YOUR-REPO-NAME/
     ```

4. **Test your site:**
   - Visit the URL
   - Test navigation, theme toggle, and lecture links
   - Share the URL with your students!

**Troubleshooting:**
- If pages don't load, check that `index.html` is in the root directory
- If styles are broken, verify all paths are relative (e.g., `./styles/` not `/styles/`)

---

### Option 2: Netlify (Full Features)

**Best for:** Deployments with attendance tracking or advanced features

**Advantages:**
- ✅ Serverless functions (attendance tracking works!)
- ✅ Deploy previews for every PR
- ✅ Custom domains with free SSL
- ✅ Environment variables for secrets
- ✅ Automatic deployments

**Setup Steps:**

1. **Create Netlify account:**
   - Go to [netlify.com](https://netlify.com) and sign up (free tier is plenty)

2. **Connect your repository:**
   - Click **"Add new site"** → **"Import an existing project"**
   - Choose **GitHub** and authorize Netlify
   - Select your course website repository

3. **Configure build settings:**
   - Build command: *leave empty* (it's a static site)
   - Publish directory: `.` (root directory)
   - Click **"Deploy site"**

4. **Set up environment variables** (if using attendance):
   - Go to **Site settings** → **Environment variables**
   - Add variable: `DATABASE_URL`
   - Value: Your Neon PostgreSQL connection string (see [Database Setup](#database-setup))

5. **Access your site:**
   - Netlify provides a URL like: `https://random-name-12345.netlify.app`
   - You can customize this or add your own domain

6. **Automatic deployments:**
   - Every push to `main` automatically deploys
   - Pull requests get preview URLs for testing

**Pro tip:** Use Netlify's deploy previews to test changes before merging to main.

---

### Option 3: Other Platforms

This template works with any static hosting provider:

| Provider | Free Tier | Serverless Functions | Custom Domain |
|----------|-----------|---------------------|---------------|
| **Vercel** | ✅ Yes | ✅ Yes | ✅ Yes |
| **Cloudflare Pages** | ✅ Yes | ✅ Yes (Workers) | ✅ Yes |
| **AWS S3 + CloudFront** | ⚠️ Free tier | ❌ Requires Lambda | ✅ Yes |
| **Azure Static Web Apps** | ✅ Yes | ✅ Yes | ✅ Yes |

**General deployment steps:**
1. Build/bundle: None needed (already static HTML/CSS/JS)
2. Publish directory: Root directory (where `index.html` is)
3. Environment variables: `DATABASE_URL` if using attendance

---

### Custom Domain Setup

After deploying to any platform, you can add a custom domain:

**For GitHub Pages:**
1. Go to Settings → Pages
2. Enter your domain (e.g., `csci3403.university.edu`)
3. Add DNS records (CNAME or A record) per GitHub's instructions

**For Netlify:**
1. Go to Site settings → Domain management
2. Click "Add custom domain"
3. Follow DNS configuration instructions

**Pro tip:** Most universities allow faculty to create subdomains for courses. Contact your IT department.

## ❓ Frequently Asked Questions

### General Questions

**Q: Do I need to know how to code to use this template?**
A: Basic HTML knowledge helps, but the automated setup wizard (`initialize-course.sh`) can handle most customization. For creating lectures, you can copy the template and modify the text—no coding required.

**Q: Is this template free to use?**
A: Yes! It's MIT licensed, which means you can use it for any educational purpose, modify it, and even share your modified version.

**Q: Can I use this for non-course websites?**
A: Absolutely! While designed for courses, the presentation system works great for any sequential content: training materials, workshops, conference talks, etc.

**Q: How many students can this handle?**
A: The static site itself scales infinitely (it's just HTML). If using attendance tracking, Neon's free tier handles 10GB, which is enough for thousands of students across multiple semesters.

### Technical Questions

**Q: Why aren't my lectures showing up on the homepage?**
A: Check these common issues:
1. Ensure the lecture `date` is in `YYYY-MM-DD` format
2. Verify the lecture is added to the `lectures` array in `index.html`
3. Check browser console (F12) for JavaScript errors
4. Ensure the `link` path is correct (relative to `index.html`)

**Q: How do I make lectures available immediately (ignore the date check)?**
A: In `index.html`, find this code:
```javascript
const isAvailable = currentDate >= new Date(lecture.date);
```
Replace it with:
```javascript
const isAvailable = true;  // All lectures always available
```

**Q: The theme toggle isn't working. What's wrong?**
A: Make sure both CSS files are linked in your HTML:
```html
<link rel="stylesheet" href="./styles/theme-variables.css">
<link rel="stylesheet" href="./styles/presentation.css">
```
And that `presentation.js` is loaded at the bottom of the `<body>`.

**Q: Can I add videos to my slides?**
A: Yes! Just add HTML5 video tags in your slide content:
```html
<div class="slide">
    <h2>Lecture Video</h2>
    <video controls width="80%">
        <source src="../videos/lecture1.mp4" type="video/mp4">
    </video>
</div>
```

**Q: How do I export lectures to PDF?**
A: Open the lecture in your browser and use Print (Ctrl+P / Cmd+P). The CSS includes print styles that work well for PDF export. For best results:
1. Set orientation to "Landscape"
2. Enable "Background graphics"
3. Print to PDF

**Q: Can I password-protect my course site?**
A: GitHub Pages and Netlify don't have built-in password protection on free tiers. Options:
- Use Netlify's password protection (requires paid plan)
- Deploy to a platform with authentication (e.g., Vercel with auth)
- Use your university's LMS integration
- Keep the repository private (but then you can't use GitHub Pages)

### Customization Questions

**Q: How do I change the favicon?**
A: Replace `images/favicon.png` with your own image (recommended: 32x32 or 64x64 PNG).

**Q: Can I use Google Fonts or custom fonts?**
A: Yes! Add to the `<head>` of your HTML:
```html
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
```
Then update `theme-variables.css`:
```css
--font-family: 'Roboto', sans-serif;
```

**Q: How do I add a syllabus page?**
A: Create `pages/syllabus.html`, copy the structure from `index.html`, and add content. Link to it from your homepage quick links.

**Q: Can I add code syntax highlighting to slides?**
A: Yes! Include a library like Prism.js or Highlight.js. Add to your lecture HTML:
```html
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/themes/prism.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/prism.min.js"></script>
```
Then use:
```html
<pre><code class="language-python">
def hello():
    print("Hello, world!")
</code></pre>
```

---

## 🛠️ Troubleshooting

### Common Issues

**Problem:** Styles aren't loading / site looks broken
**Solutions:**
- Check that all CSS files are in the `styles/` folder
- Verify file paths are relative (e.g., `./styles/theme-variables.css`)
- Clear browser cache (Ctrl+Shift+R / Cmd+Shift+R)
- Open browser console (F12) and check for 404 errors

**Problem:** JavaScript features not working (navigation, theme toggle, etc.)
**Solutions:**
- Open browser console (F12) and check for errors
- Verify `js/presentation.js` is loaded before the closing `</body>` tag
- Ensure you're not blocking JavaScript
- Try in a different browser to rule out extensions

**Problem:** Lectures are all showing as "Available Soon"
**Solutions:**
- Check that lecture dates are in the past or today
- Remember: lectures become available the day *before* their date
- Verify dates are in `YYYY-MM-DD` format (not `MM/DD/YYYY` or other formats)
- Check your computer's date/time settings

**Problem:** Attendance tracking not working on Netlify
**Solutions:**
- Verify `DATABASE_URL` environment variable is set in Netlify
- Check Netlify function logs: Site → Functions → Click function → Logs
- Ensure database schema was created correctly
- Test database connection string in a PostgreSQL client
- Make sure you redeployed after adding environment variables

**Problem:** GitHub Pages deployment fails
**Solutions:**
- Check Actions tab for error messages
- Ensure `index.html` is in the root directory (not in a subfolder)
- Verify GitHub Pages is enabled in Settings → Pages
- Make sure your repository is public (or you have GitHub Pro for private repos)

**Problem:** Mobile layout is broken
**Solutions:**
- Add viewport meta tag to HTML (should already be there):
  ```html
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  ```
- Test using browser developer tools (F12) with device emulation
- Check for custom CSS that overrides responsive styles

**Problem:** Theme toggle persists across different courses
**Solutions:**
- This is expected behavior (uses localStorage per domain)
- If deploying multiple courses, use different subdomains
- Or modify the localStorage key in `presentation.js` to include course name

---

## 📚 Additional Documentation

Detailed guides are available in the `docs/` folder:

- **[Customization Guide](docs/CUSTOMIZATION_GUIDE.md)** - Deep dive into customization options
- **[Lecture Creation Guide](docs/LECTURE_CREATION_GUIDE.md)** - How to create engaging, interactive lectures
- **[Project Overview](docs/PROJECT_OVERVIEW.md)** - Architecture and design decisions
- **[Testing Report](docs/testing/TEST_REPORT.md)** - Comprehensive testing documentation

For template repository documentation:
- **[Template Repository Guide](docs/repository/TEMPLATE_REPOSITORY_GUIDE.md)** - How to use GitHub templates
- **[Template Repository README](docs/repository/TEMPLATE_REPOSITORY_README.md)** - Original repository information

---

## 🌐 Browser Support

**Fully Supported:**
- Chrome/Edge (latest 2 versions)
- Firefox (latest 2 versions)
- Safari (latest 2 versions)
- Mobile: iOS Safari 13+, Chrome Mobile

**Minimum Requirements:**
- CSS Grid and Flexbox support
- CSS Custom Properties (CSS Variables)
- ES6 JavaScript (arrow functions, const/let, template literals)
- LocalStorage API

**Not supported:** Internet Explorer (use Edge instead)

---

## 📄 License

MIT License - See [LICENSE](LICENSE) file for details

**What this means:**
- ✅ Use for any educational purpose
- ✅ Modify and customize freely
- ✅ Share your modifications
- ✅ Use commercially (e.g., paid courses)
- ⚠️ No warranty or liability (use at your own risk)

---

## 🙏 Credits & Acknowledgments

Created by **Bobby Reed** for educational use.

**Based on production course websites from Oklahoma City University:**
- CSCI 3403 - Web Programming
- CSCI 2383 - Foundations of Computer Science II
- CSCI 1383 - Foundations of Computer Science I

**Special thanks to:**
- 100+ students who battle-tested this template across 3 semesters
- Oklahoma City University for supporting open educational resources

**Technologies used:**
- Vanilla JavaScript (no frameworks!)
- CSS Grid and Flexbox
- PostgreSQL (via Neon)
- Netlify Functions (serverless)

---

## 💬 Getting Help & Contributing

**Found a bug?** [Create an issue](https://github.com/bobbyreed/CourseWebsiteTemplate/issues)

**Have a question?** Check the [FAQ](#frequently-asked-questions) or [create a discussion](https://github.com/bobbyreed/CourseWebsiteTemplate/discussions)

**Want to contribute?** Pull requests welcome! Please:
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

**Ready to create your course website?** Click "Use this template" at the top of this page to get started! 🎓

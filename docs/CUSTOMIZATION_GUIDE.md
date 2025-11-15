# Customization Guide

This guide will walk you through customizing the Course Website Template for your specific course.

## Table of Contents

1. [Essential Customizations](#essential-customizations)
2. [Theme Customization](#theme-customization)
3. [Homepage Customization](#homepage-customization)
4. [Lecture Management](#lecture-management)
5. [Optional Features](#optional-features)
6. [Advanced Customization](#advanced-customization)

---

## Essential Customizations

These are the minimum changes you should make before deploying your course website.

### 1. Course Information (index.html)

Open `index.html` and update the following sections:

#### Header Section (Lines ~365-372)
```html
<header>
    <h1>Your Course Title Here</h1>
    <p class="subtitle">COURSE 0000 - Level (Undergraduate/Graduate)</p>
    <p class="meta-info">Semester Year | Instructor: Your Name</p>
</header>
```

**Replace with:**
```html
<header>
    <h1>Database Systems</h1>
    <p class="subtitle">CSCI 4410 - Undergraduate Course</p>
    <p class="meta-info">Spring 2025 | Instructor: Dr. Jane Smith</p>
</header>
```

#### Course Overview Section (Lines ~376-386)
```html
<div class="info-section">
    <h2>📚 Course Overview</h2>
    <p>Welcome to [Course Name]! This course covers [brief description].</p>

    <h3>Important Information:</h3>
    <ul>
        <li>📧 Email: your.email@institution.edu</li>
        <li>🏢 Office: Building Name - Room Number</li>
        <li>⏰ Office Hours: Days and Times</li>
    </ul>
</div>
```

#### Lectures Array (Lines ~415-430)
```javascript
const lectures = [
    {
        number: 1,
        title: "Course Introduction",
        date: "2025-01-15",
        link: "./pages/lectures/1Introduction.html"
    },
    {
        number: 2,
        title: "Database Fundamentals",
        date: "2025-01-17",
        link: "./pages/lectures/2DatabaseFundamentals.html"
    },
    // Add more lectures...
];
```

**Important Date Format:**
- Dates must be in `YYYY-MM-DD` format
- Lectures unlock the day before (students get day-before access)
- Set `available: false` to manually lock a lecture

### 2. Page Metadata

Update the `<head>` section:

```html
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Database Systems - CSCI 4410 | Your University</title>
    <meta name="description" content="Your course description for SEO">
    <link rel="icon" type="image/x-icon" href="./images/favicon.png">
    ...
</head>
```

### 3. Footer

Update the footer at the bottom of `index.html`:

```html
<footer>
    <p>© 2025 Your Name | Your Institution</p>
</footer>
```

---

## Theme Customization

All visual customization happens in `styles/theme-variables.css`.

### Color Scheme

Edit the `:root` section to match your institution's colors:

```css
:root {
    /* Primary brand colors */
    --primary-color: #00669b;        /* Main color (headers, buttons) */
    --primary-dark: #043d5d;         /* Darker shade */
    --secondary-color: #009edb;      /* Accent color (borders, links) */
    --secondary-light: #9ddcf9;      /* Light accent */
    --accent-color: #ffc222;         /* Highlight color */
}
```

#### Examples by Institution Type:

**Traditional University (Blue/Gold):**
```css
--primary-color: #003366;
--primary-dark: #001a33;
--secondary-color: #0066cc;
--accent-color: #ffcc00;
```

**Tech School (Modern):**
```css
--primary-color: #6200ea;
--primary-dark: #3700b3;
--secondary-color: #03dac6;
--accent-color: #ff0266;
```

**Professional/Corporate:**
```css
--primary-color: #2c3e50;
--primary-dark: #1a252f;
--secondary-color: #3498db;
--accent-color: #e74c3c;
```

### Typography

Change fonts in `theme-variables.css`:

```css
:root {
    --font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    --font-size-xs: 0.9em;
    --font-size-sm: 1em;
    --font-size-md: 1.2em;
    --font-size-lg: 1.5em;
    --font-size-xl: 2em;
    --font-size-xxl: 2.8em;
}
```

**To use Google Fonts:**

1. Add to `<head>` in `index.html`:
```html
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
```

2. Update variable:
```css
--font-family: 'Roboto', sans-serif;
```

### Spacing System

Adjust spacing throughout the site:

```css
:root {
    --spacing-xs: 8px;
    --spacing-sm: 16px;
    --spacing-md: 24px;
    --spacing-lg: 40px;
    --spacing-xl: 60px;
}
```

---

## Homepage Customization

### Quick Links Section

The quick links section is **optional**. To customize or remove it:

#### Option 1: Customize Links

Edit the quick links in `index.html` (lines ~390-420):

```html
<div class="quick-links">
    <a href="https://canvas.instructure.com" target="_blank" class="quick-link-card">
        <div class="quick-link-icon">📚</div>
        <div class="quick-link-title">Canvas LMS</div>
        <div class="quick-link-description">Access course materials</div>
    </a>

    <a href="./pages/syllabus.pdf" class="quick-link-card">
        <div class="quick-link-icon">📄</div>
        <div class="quick-link-title">Syllabus</div>
        <div class="quick-link-description">Course syllabus PDF</div>
    </a>
</div>
```

#### Option 2: Remove Quick Links

Simply delete or comment out the entire section:

```html
<!-- Quick Links Section Removed -->
```

### Lecture Cards

Customize how lecture cards look in the `index.html` styles section:

```css
.lecture-card {
    background: var(--bg-primary);
    border-radius: 8px;
    padding: 20px;
    border: 2px solid #e0e0e0;
    min-height: 140px;  /* Adjust height */
}
```

---

## Lecture Management

### Creating a New Lecture

1. **Copy the template:**
   ```bash
   cp pages/lectures/lectureTemplate.html pages/lectures/5DatabaseNormalization.html
   ```

2. **Edit the lecture file:**
   - Update `<title>` tag
   - Change lecture title in timer-display
   - Edit slide content
   - Update slide counter (total slides)

3. **Add to homepage:**
   ```javascript
   const lectures = [
       // ... existing lectures
       {
           number: 5,
           title: "Database Normalization",
           date: "2025-02-05",
           link: "./pages/lectures/5DatabaseNormalization.html"
       }
   ];
   ```

### Lecture Availability Logic

Lectures unlock based on the `date` field:

- **Available**: Today, past dates, or tomorrow (day-before access)
- **Locked**: More than 1 day in the future
- **Manual Lock**: Set `available: false`

Example:
```javascript
{
    number: 10,
    title: "Final Exam",
    date: "2025-05-15",
    link: "#",
    available: false  // Manually locked until you're ready
}
```

---

## Optional Features

### Attendance Tracking

To enable attendance tracking:

1. **Set up Neon Database:**
   - Create account at [neon.tech](https://neon.tech)
   - Run SQL schema (see README.md)
   - Copy connection string

2. **Deploy to Netlify:**
   - Connect your repository
   - Add environment variable: `DATABASE_URL`
   - Deploy

3. **Enable attendance page:**
   - Uncomment in navigation or quick links
   - Test with `/pages/attendance.html`

### Student Notes

If you want printable note templates:

1. Create `pages/notes/notesTemplate.html`
2. Link from quick links or lectures
3. Students can download/print for class

---

## Advanced Customization

### Custom CSS Classes

Add to your lecture HTML files:

```html
<style>
.my-custom-box {
    background: var(--bg-accent);
    padding: 20px;
    border-radius: 10px;
    border-left: 4px solid var(--primary-color);
}
</style>

<div class="my-custom-box">
    <h3>Custom Content</h3>
    <p>Your styled content here</p>
</div>
```

### JavaScript Customization

Add custom behavior to lectures:

```javascript
<script>
// Run code when a specific slide is shown
document.addEventListener('slidechange', (e) => {
    if (e.detail.currentSlide === 3) {
        console.log('Now on slide 4!');
        // Trigger animation, load content, etc.
    }
});

// Custom keyboard shortcut
document.addEventListener('keydown', (e) => {
    if (e.key === 'r') {
        // Reset something, show answer, etc.
    }
});
</script>
```

### Animated Slides

Add CSS animations to specific slides:

```html
<style>
@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.slide h1 {
    animation: fadeInUp 0.6s ease;
}
</style>
```

---

## Testing Your Customizations

### Local Testing

1. Open `index.html` in a web browser
2. Test theme toggle
3. Navigate through slides
4. Check responsiveness (resize window)
5. Test on mobile devices

### Checklist

- [ ] All links work
- [ ] Dates are correct format (YYYY-MM-DD)
- [ ] Colors match your brand
- [ ] All lecture files exist
- [ ] Theme toggle works
- [ ] Keyboard navigation works
- [ ] Mobile responsive
- [ ] Print styles work (Ctrl+P / Cmd+P)

---

## Common Issues

### Lectures Not Showing

**Problem:** Lecture cards don't appear on homepage

**Solution:** Check JavaScript console for errors. Ensure dates are in `YYYY-MM-DD` format.

### Theme Not Changing

**Problem:** Dark mode doesn't work

**Solution:** Ensure both CSS files are linked:
```html
<link rel="stylesheet" href="./styles/theme-variables.css">
<link rel="stylesheet" href="./styles/presentation.css">
```

### Slides Not Advancing

**Problem:** Next button doesn't work

**Solution:** Ensure `presentation.js` is loaded:
```html
<script src="../../js/presentation.js"></script>
```

---

## Next Steps

1. Read [LECTURE_CREATION_GUIDE.md](LECTURE_CREATION_GUIDE.md) for creating engaging content
2. Review `PROJECT_OVERVIEW.md` for architecture details
3. Deploy your site (see README.md)

---

**Questions?** Check the main README.md or review the source code comments.

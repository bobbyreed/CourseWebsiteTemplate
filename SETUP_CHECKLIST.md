# Course Website Setup Checklist

Use this checklist to ensure you've completed all necessary steps when setting up your course website from this template.

## ✅ Initial Setup

### Getting Started
- [ ] Create new repository from this template on GitHub
  - Click "Use this template" button
  - Name it: `[CourseNumber]-[CourseName]` (e.g., `CSCI3403-WebProgramming`)
  - Make it public (or private if preferred)
- [ ] Clone repository to your local machine
- [ ] Run initialization script: `bash initialize-course.sh` (optional)

### Basic Information
- [ ] Update course title in `index.html`
- [ ] Update course number and level
- [ ] Update semester and year
- [ ] Update instructor name and contact info
- [ ] Update institution name
- [ ] Update page title in `<head>`
- [ ] Update meta description for SEO

### Branding & Theme
- [ ] Customize colors in `styles/theme-variables.css`
  - Primary color
  - Secondary color
  - Accent color
  - Review both light and dark mode
- [ ] Replace `images/favicon.png` with your course/institution logo
- [ ] Test theme toggle to ensure colors work in both modes
- [ ] Verify color contrast meets accessibility standards

---

## 📅 Course Schedule

### Lecture Planning
- [ ] Determine number of lectures for the semester
- [ ] Set lecture dates (YYYY-MM-DD format)
- [ ] Plan lecture topics/titles
- [ ] Create lectures array in `index.html`
  ```javascript
  const lectures = [
      { number: 1, title: "Introduction", date: "2025-01-15", link: "./pages/lectures/1Introduction.html" },
      // Add all lectures here
  ];
  ```

### Creating Lectures
- [ ] Copy `pages/lectures/lectureTemplate.html` for each lecture
- [ ] Name files consistently: `[Number][Title].html` (e.g., `1Introduction.html`)
- [ ] Update each lecture's:
  - Title
  - Content slides
  - Timer durations (if using activities)
  - Total slide count in navigation
- [ ] Update home link in each lecture: `<a href="../../index.html">Home</a>`

---

## 🎨 Homepage Customization

### Course Overview Section
- [ ] Write course description
- [ ] Add course objectives/learning outcomes
- [ ] Update important information:
  - Email address
  - Office location
  - Office hours
  - Textbook (if applicable)

### Quick Links (Optional)
- [ ] Customize quick link cards or remove section
- [ ] Update links to external resources
- [ ] Update icons/emojis
- [ ] Test all external links

### Footer
- [ ] Update copyright year
- [ ] Update instructor name
- [ ] Add any additional footer information

---

## 🚀 Deployment Setup

### Choose Deployment Platform

#### Option A: GitHub Pages (Simple, Free)
- [ ] Enable GitHub Pages in repository settings
  - Settings → Pages
  - Source: Deploy from branch
  - Branch: `main`, folder: `/ (root)`
- [ ] Wait for deployment (check Actions tab)
- [ ] Visit your site: `https://[username].github.io/[repo-name]`
- [ ] Test all functionality
- [ ] **Note:** Attendance tracking won't work (requires serverless functions)

#### Option B: Netlify (Full Features)
- [ ] Create Netlify account
- [ ] Connect GitHub repository
- [ ] Configure build settings:
  - Build command: (leave empty for static site)
  - Publish directory: `.` (root)
- [ ] Add environment variables (if using attendance):
  - `DATABASE_URL` - Your Neon PostgreSQL connection string
- [ ] Deploy and test
- [ ] Configure custom domain (optional)

---

## 📊 Optional Features

### Attendance Tracking (Netlify Only)
- [ ] Set up Neon PostgreSQL database
  - Create account at [neon.tech](https://neon.tech)
  - Create new database
  - Copy connection string
- [ ] Run database schema:
  ```sql
  -- See README.md for full schema
  CREATE TABLE students (...);
  CREATE TABLE attendance (...);
  ```
- [ ] Add `DATABASE_URL` to Netlify environment variables
- [ ] Test attendance page: `/pages/attendance.html`
- [ ] Add students via register page or admin panel
- [ ] Test card swipe or manual attendance marking

### Student Notes (Optional)
- [ ] Create notes templates in `pages/notes/`
- [ ] Link from quick links or lecture pages
- [ ] Format for printing

---

## 🧪 Testing

### Functionality Tests
- [ ] Test on desktop browser (Chrome, Firefox, Safari)
- [ ] Test on mobile device
- [ ] Verify keyboard navigation:
  - [ ] Arrow keys navigate slides
  - [ ] Space advances slides
  - [ ] Home/End jump to first/last
  - [ ] F toggles fullscreen
  - [ ] T toggles theme
- [ ] Test theme toggle (light/dark mode)
- [ ] Verify theme persists after page reload
- [ ] Test timer buttons (if using)
- [ ] Check audio alert when timer expires
- [ ] Test all internal links
- [ ] Test all external links
- [ ] Verify lecture availability logic
  - [ ] Future lectures are locked
  - [ ] Past lectures are accessible
  - [ ] Day-before access works

### Visual/UX Tests
- [ ] All text is readable
- [ ] Colors have sufficient contrast
- [ ] Responsive layout works on mobile
- [ ] No content overflow on small screens
- [ ] Print preview looks good (Ctrl+P / Cmd+P)
- [ ] Images load correctly
- [ ] Favicon displays in browser tab

### Accessibility Tests
- [ ] Tab navigation works through all buttons
- [ ] Focus indicators are visible
- [ ] Heading hierarchy is logical (h1 → h2 → h3)
- [ ] Images have alt text (if you added any)
- [ ] Color is not the only indicator of state

---

## 📝 Documentation

### Update Documentation (If Needed)
- [ ] Review README.md - update if you made structural changes
- [ ] Add course-specific information to README
- [ ] Update any custom instructions
- [ ] Document any custom features you added

### For Students
- [ ] Create syllabus (PDF or page)
- [ ] Add course calendar/schedule
- [ ] Provide keyboard shortcut reference
- [ ] Add any course-specific guides

---

## 🔒 Security & Privacy

### Before Going Live
- [ ] Remove any test/dummy content
- [ ] Ensure no sensitive information in code
- [ ] Verify `.env` is in `.gitignore`
- [ ] Don't commit database credentials
- [ ] Review student data privacy (if using attendance)
- [ ] Add FERPA/GDPR compliance notice (if needed)

---

## 🎓 Pre-Semester Checklist

### One Week Before Class
- [ ] All lectures created (at least first few weeks)
- [ ] Lectures have correct dates
- [ ] External resources linked and tested
- [ ] Site is deployed and accessible
- [ ] Share URL with students
- [ ] Test from student perspective
- [ ] Prepare first lecture

### Ongoing Maintenance
- [ ] Update lecture availability dates as semester progresses
- [ ] Add new lectures before they're needed
- [ ] Monitor attendance (if using)
- [ ] Respond to student questions/issues
- [ ] Update office hours if they change
- [ ] Fix any broken links

---

## ✨ Enhancement Ideas (Optional)

### Consider Adding Later
- [ ] Assignment submission page
- [ ] Grade calculator
- [ ] FAQ section
- [ ] Course calendar integration
- [ ] Discussion board/forum links
- [ ] Video lecture embeddings
- [ ] Code playground embeds
- [ ] Student project showcase

---

## 🆘 Troubleshooting

If you encounter issues:

1. **Slides not showing:**
   - Check browser console for JavaScript errors
   - Verify `presentation.js` is loaded
   - Ensure slide has `class="slide"` and first has `class="slide active"`

2. **Theme not working:**
   - Verify both CSS files are linked: `theme-variables.css` and `presentation.css`
   - Check browser console for CSS loading errors
   - Clear browser cache

3. **Lectures not rendering on homepage:**
   - Check JavaScript console for errors
   - Verify lectures array is properly formatted
   - Ensure dates are in `YYYY-MM-DD` format

4. **Attendance not working:**
   - Verify Netlify functions are deployed
   - Check environment variables in Netlify
   - Review Netlify function logs
   - Ensure database is accessible

5. **Mobile layout broken:**
   - Check for custom CSS overriding responsive styles
   - Test with browser dev tools device emulation
   - Verify viewport meta tag is present

---

## 📞 Getting Help

- Review documentation in `docs/` folder
- Check `TEST_REPORT.md` for verified functionality
- Create an issue on GitHub repository
- Consult with IT department for deployment help

---

## ✅ Final Checklist Before Launch

- [ ] All course information is accurate
- [ ] Theme colors match your institution
- [ ] All links work (internal and external)
- [ ] Site is deployed and accessible
- [ ] Tested on multiple devices/browsers
- [ ] First lecture is ready
- [ ] Students have been given the URL
- [ ] Backup plan in place (PDF exports, etc.)

---

**Congratulations! Your course website is ready to go! 🎉**

Good luck with your course! 🎓

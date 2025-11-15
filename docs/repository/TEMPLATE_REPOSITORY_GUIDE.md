# GitHub Template Repository Guide

This document explains how to set up and use this repository as a GitHub Template for creating new course websites.

---

## What is a GitHub Template Repository?

A template repository lets you create a "Use this template" button that allows others (or yourself) to quickly create new repositories with all the template's files and structure, without forking or cloning.

**Benefits:**
- ✅ One-click course creation
- ✅ Clean git history for each course
- ✅ No connection to original template (unlike forks)
- ✅ Easy to maintain multiple courses
- ✅ Students/instructors can create their own versions

---

## Setting Up as a Template Repository

### Step 1: Enable Template Status

1. Go to your repository on GitHub
2. Click **Settings** (top navigation)
3. Scroll to **Template repository** section
4. Check ✅ **Template repository**
5. Save

That's it! The "Use this template" button will now appear on your repository.

### Step 2: Add Template Description

Update your repository description to indicate it's a template:

```
Course Website Template - Interactive presentations with attendance tracking.
Click "Use this template" to create your own course site!
```

### Step 3: Add Topics (Tags)

Add relevant topics to make it discoverable:
- `course-website`
- `education`
- `template`
- `presentation`
- `github-template`
- `netlify`
- `attendance-tracking`

---

## Using the Template to Create a New Course

### For You (Creating Your Course Sites)

1. **Navigate to this template repository**
   - Go to: `https://github.com/[username]/CourseWebsiteTemplate`

2. **Click "Use this template"**
   - Green button at the top right
   - Select "Create a new repository"

3. **Configure new repository**
   - Owner: Your GitHub username/organization
   - Name: `CSCI3403-WebProgramming` (or your course code)
   - Description: "Web Programming course website for Fall 2025"
   - Public or Private (your choice)
   - ✅ Include all branches (optional - usually you want just `main`)

4. **Clone your new repository**
   ```bash
   git clone https://github.com/[username]/CSCI3403-WebProgramming.git
   cd CSCI3403-WebProgramming
   ```

5. **Run initialization wizard**
   ```bash
   bash initialize-course.sh
   ```

6. **Follow the Setup Checklist**
   ```bash
   open SETUP_CHECKLIST.md
   ```

7. **Enable GitHub Pages**
   - Settings → Pages
   - Source: "GitHub Actions"
   - Workflow will auto-deploy

8. **Start creating lectures!**

---

## Template Repository Structure

### Files Instructors Will Customize

```
template/
├── index.html                      # ✏️ Course info, lectures array
├── styles/theme-variables.css      # ✏️ Institution colors
├── pages/lectures/
│   ├── lectureTemplate.html        # 📋 Copy for each lecture
│   └── 1ExampleLecture.html        # 👀 Demo of all features
└── README.md                       # ✏️ Course-specific info
```

### Files Instructors Won't Touch

```
template/
├── .github/
│   ├── workflows/                  # 🤖 Auto-deployment
│   └── ISSUE_TEMPLATE/             # 🐛 Support templates
├── js/presentation.js              # 🎮 Presentation engine
├── styles/presentation.css         # 🎨 Core styles
├── netlify/functions/              # ☁️ Optional backend
└── docs/                           # 📚 Guides
```

### Automation Features

```
template/
├── initialize-course.sh            # 🧙 Setup wizard
├── SETUP_CHECKLIST.md              # ✅ Step-by-step guide
└── .github/workflows/              # 🚀 Auto-deploy & validation
```

---

## Recommended Workflow for Multiple Courses

### Scenario: You Teach 3 Courses Per Year

**Template Approach:**
1. Keep this template repository updated with improvements
2. Create new repository from template for each course
3. Each course is independent (no git conflicts)
4. Share improvements back to template if desired

**Example:**
```
Your GitHub Repositories:
├── CourseWebsiteTemplate (template)
├── CSCI3403-WebProgramming-Fall2025 (from template)
├── CSCI5403-SoftwareEngineering-Spring2026 (from template)
└── CSCI5603-DatabaseDesign-Fall2026 (from template)
```

**Benefits:**
- Each course has clean git history
- No merge conflicts between courses
- Easy to archive old semesters
- Students can't see other courses
- Can make course-specific customizations

---

## Updating the Template

### Making Improvements

When you improve the template based on experience:

1. **Make changes in the template repository**
   ```bash
   cd CourseWebsiteTemplate/template
   # Make your improvements
   git add .
   git commit -m "Improve feature X"
   git push
   ```

2. **Tag releases** (optional but recommended)
   ```bash
   git tag -a v1.1 -m "Added feature X, fixed bug Y"
   git push --tags
   ```

3. **New courses automatically get improvements**
   - Future courses created from template have latest features
   - Existing courses remain unchanged (stable)

### Backporting to Existing Courses

If you want to add template improvements to existing courses:

**Option 1: Manual Copy**
```bash
# Copy specific improved files
cp CourseWebsiteTemplate/template/js/presentation.js CSCI3403/js/
```

**Option 2: Cherry-Pick Commits**
```bash
cd CSCI3403
git remote add template ../CourseWebsiteTemplate
git fetch template
git cherry-pick <commit-hash>
```

**Option 3: Create New Course** (for major changes)
- Create fresh course from updated template
- Copy over your lecture content
- Archive old course

---

## Sharing the Template

### With Other Instructors

**Public Template:**
```markdown
Share this link: https://github.com/[username]/CourseWebsiteTemplate

Instructions for them:
1. Click "Use this template"
2. Create their own repository
3. Run: bash initialize-course.sh
4. Follow SETUP_CHECKLIST.md
```

**Private Template:**
- Template can be private
- You can still create courses from it
- Only people with access can use it
- Good for institution-specific templates

### Within an Organization

**Organization Template:**
1. Move template to GitHub Organization
2. All org members can use it
3. Maintain one template for department
4. Consistent branding across courses

**Example:**
```
Organization: Oklahoma-City-University
Template: OCU-Course-Website-Template

Instructors create:
- OCU-CSCI-3403-Fall2025
- OCU-MATH-2301-Spring2026
- etc.
```

---

## Template Maintenance Best Practices

### Version Control

**Semantic Versioning:**
```
v1.0.0 - Initial release
v1.1.0 - Added feature (backward compatible)
v1.1.1 - Bug fix
v2.0.0 - Breaking change (not backward compatible)
```

**Branching Strategy:**
```
main           - Stable, tested template
develop        - Latest improvements
feature/xyz    - New features in development
```

### Documentation

**Keep Updated:**
- [ ] README.md - Usage instructions
- [ ] SETUP_CHECKLIST.md - Setup steps
- [ ] CUSTOMIZATION_GUIDE.md - How to customize
- [ ] Changelog - What's new in each version

### Testing

**Before Releasing Updates:**
1. Run test suite: `bash run-tests.sh`
2. Create a test course from template
3. Verify initialization wizard works
4. Test deployment (GitHub Pages & Netlify)
5. Review all documentation

---

## Automation Features Included

### 1. GitHub Actions Workflows

**deploy-github-pages.yml**
- Triggers: Push to `main` branch
- Action: Deploys to GitHub Pages
- Result: Automatic course website updates
- No configuration needed

**html-validation.yml**
- Triggers: Push and pull requests
- Action: Validates HTML, checks links
- Result: Catches errors before deployment
- Prevents broken links

### 2. Initialization Wizard

**initialize-course.sh**
- Interactive prompts for course info
- Automatically updates files
- Configures optional features
- Saves 25+ minutes of manual editing

**What it updates:**
- Course title, number, level
- Instructor information
- Institution colors
- Semester and year
- Footer copyright
- Removes unneeded features

### 3. Issue Templates

**Templates provided:**
- Bug reports
- Customization help
- Feature requests

**Benefits:**
- Structured feedback
- Easier to help users
- Tracks common issues
- Community contributions

---

## Frequently Asked Questions

### Q: Can I make the template private?
**A:** Yes! Template repositories can be private. You'll still see the "Use this template" button and can create courses from it.

### Q: What happens when I update the template?
**A:** Existing courses created from the template are independent and won't be affected. Only new courses created after the update will have the changes.

### Q: Can students use the template?
**A:** Yes, if it's public. Students could create their own course sites, which might be useful for student-led study groups or review sessions.

### Q: How do I archive old courses?
**A:** Just make the repository private or archive it (Settings → Archive). The website will still be accessible if deployed, but the repository becomes read-only.

### Q: Can I use this for multiple institutions?
**A:** Absolutely! Use branches or separate templates for different institutions:
- `main` - Generic template
- `ocu-branded` - Oklahoma City University colors
- `another-institution` - Different branding

### Q: What if I want to contribute improvements?
**A:** Create a pull request! Improvements to the core template benefit everyone.

---

## Next Steps

### 1. Mark Repository as Template

Settings → Check "Template repository"

### 2. Test It Out

Click "Use this template" and create a test course to verify everything works.

### 3. Document Course-Specific Workflow

Add to template README:
- Your institution's deployment process
- IT department contacts
- LMS integration (if applicable)
- Student access instructions

### 4. Share With Colleagues

Send them the repository link and point them to:
- README.md (quick start)
- SETUP_CHECKLIST.md (detailed steps)
- 1ExampleLecture.html (feature demo)

---

## Support

### For Template Issues
- Review documentation in `docs/` folder
- Check TEST_REPORT.md for verified functionality
- Create issue in template repository

### For Course-Specific Issues
- Check SETUP_CHECKLIST.md
- Review CUSTOMIZATION_GUIDE.md
- Create issue in your course repository

---

## Summary

This template repository is designed to make creating course websites:

✅ **Fast** - 5 minutes with initialization wizard
✅ **Easy** - Step-by-step checklist
✅ **Automated** - GitHub Actions deployment
✅ **Flexible** - Customize everything
✅ **Maintainable** - Each course is independent
✅ **Scalable** - Create unlimited courses
✅ **Professional** - Battle-tested with 100+ students

**Ready to use it for your next course?**

1. Enable template status in repository settings
2. Click "Use this template" for your new course
3. Run `bash initialize-course.sh`
4. Follow SETUP_CHECKLIST.md
5. Start teaching!

---

**Questions?** Create an issue or refer to the comprehensive documentation in the `docs/` folder.

**Happy Teaching! 🎓**

# CourseWebsiteTemplate

A free, modern course website template featuring interactive HTML presentations, attendance tracking with card reader support, and serverless backend - all deployable at no cost using GitHub and Netlify.

## Live Examples

See the template in action with these live course sites:
- **Web Programming**: [wp.profbobby.com](https://wp.profbobby.com)
- **Software Engineering**: [se.profbobby.com](https://se.profbobby.com)
- **Database Design**: [db.profbobby.com](https://db.profbobby.com)

## Features

- **Interactive Presentations**: Built-in HTML slide deck with keyboard navigation and presentation mode
- **Attendance Tracking**: Student registration and daily attendance with card swipe support
- **Attendance Overview**: Visual attendance reports and analytics
- **Serverless Backend**: Netlify Functions + Neon PostgreSQL (all free tier)
- **No Build Step**: Pure vanilla JS, HTML, and CSS - edit and deploy instantly
- **Responsive Design**: Works on desktop, tablet, and mobile devices
- **Dark/Light Mode**: Theme toggle with CSS custom properties

## Quick Start (100% Free!)

### 1. Use This Template

Click the green **"Use this template"** button at the top of this page to create your own course repository.

### 2. Set Up Your Free Services

**GitHub** (already done if you're reading this!)
- Free hosting for your code
- Free static site hosting via GitHub Pages (optional)

**Netlify** (recommended - free tier)
1. Sign up at [netlify.com](https://netlify.com) (free account)
2. Connect your GitHub repository
3. Deploy with one click - automatic HTTPS included!
4. Free tier includes: 100GB bandwidth/month, serverless functions, form handling

**Neon** (for attendance database - free tier)
1. Sign up at [neon.tech](https://neon.tech) (free account)
2. Create a PostgreSQL database (free tier: 3GB storage, autoscaling)
3. Copy connection string to Netlify environment variables

### 3. Customize Your Site

Run the initialization wizard:
```bash
bash template/initialize-course.sh
```

Or manually edit:
- `template/index.html` - Course title, schedule, instructor info
- `template/styles/presentation.css` - Colors and theming
- `template/pages/lectures/` - Add your lecture slides

### 4. Deploy

**Option A: Netlify (Recommended)**
- Push to GitHub → Netlify auto-deploys
- Get free HTTPS domain: `your-course.netlify.app`
- Optional: Use custom domain

**Option B: GitHub Pages**
- Enable in repository Settings → Pages
- Free hosting at `username.github.io/repo-name`

## Documentation

- **[Template Repository Guide](TEMPLATE_REPOSITORY_GUIDE.md)** - How to use this as a GitHub template
- **[Setup Checklist](template/SETUP_CHECKLIST.md)** - Step-by-step customization guide
- **[Project Overview](PROJECT_OVERVIEW.md)** - Technical architecture and features

## Cost Breakdown

Everything runs on free tiers:
- GitHub: Free (unlimited public repos)
- Netlify: Free (100GB bandwidth, 125k serverless function calls/month)
- Neon PostgreSQL: Free (3GB storage, 0.5GB RAM)
- **Total Monthly Cost: $0**

## Support

For questions or issues:
1. Check the [documentation files](template/SETUP_CHECKLIST.md)
2. Review [live examples](#live-examples) for inspiration
3. Open an issue in this repository

## License

MIT License - see [LICENSE](LICENSE) for details

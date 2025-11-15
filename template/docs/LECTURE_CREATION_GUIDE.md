# Lecture Creation Guide

This guide will help you create engaging, effective lecture presentations using the course website template.

## Table of Contents

1. [Getting Started](#getting-started)
2. [Slide Structure](#slide-structure)
3. [Content Components](#content-components)
4. [Interactive Elements](#interactive-elements)
5. [Best Practices](#best-practices)
6. [Examples](#examples)
7. [Accessibility](#accessibility)

---

## Getting Started

### Creating Your First Lecture

1. **Copy the template:**
   ```bash
   cp pages/lectures/lectureTemplate.html pages/lectures/1Introduction.html
   ```

2. **Update metadata:**
   ```html
   <head>
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <title>Course Introduction - CSCI 4410</title>
       ...
   </head>
   ```

3. **Update timer display:**
   ```html
   <span id="timer-text">Course Introduction
        <button class="home"><a href="../../index.html">Home</a></button>
   </span>
   ```

4. **Edit slides** (see sections below)

5. **Update slide counter:**
   ```html
   <span id="currentSlide">1</span> / <span id="totalSlides">12</span>
   ```

6. **Add to homepage** (`index.html`):
   ```javascript
   {
       number: 1,
       title: "Course Introduction",
       date: "2025-01-15",
       link: "./pages/lectures/1Introduction.html"
   }
   ```

---

## Slide Structure

### Basic Slide Template

Every slide follows this structure:

```html
<div class="slide">
    <h1>Slide Title</h1>
    <!-- Content goes here -->
</div>
```

The first slide should have `class="slide active"` to show it on load.

### Recommended Slide Flow

1. **Title Slide** - Course name, lecture topic, date
2. **Learning Objectives** - What students will learn
3. **Content Slides** - Main teaching content (3-8 slides)
4. **Activity/Exercise** - Practice what was taught
5. **Summary** - Recap and next steps

---

## Content Components

### Headings

```html
<div class="slide">
    <h1>Main Slide Title</h1>
    <h2>Section Heading</h2>
    <h3>Subsection</h3>
    <p>Regular paragraph text.</p>
</div>
```

**Guidelines:**
- One `<h1>` per slide (main title)
- Use `<h2>` for major sections within a slide
- Use `<h3>` for sub-points
- Keep titles concise (5-8 words max)

### Lists

**Unordered List:**
```html
<ul>
    <li>First point</li>
    <li>Second point</li>
    <li>Third point</li>
</ul>
```

**Ordered List:**
```html
<ol>
    <li>Step one</li>
    <li>Step two</li>
    <li>Step three</li>
</ol>
```

**List with Emojis:**
```html
<ul style="font-size: 1.4em; line-height: 2;">
    <li>🎯 Focus on fundamentals</li>
    <li>💡 Practice regularly</li>
    <li>🤝 Collaborate with peers</li>
</ul>
```

### Code Examples

**Inline Code:**
```html
<p>Use the <code>console.log()</code> function to debug.</p>
```

**Code Block:**
```html
<div class="code-example">
function greet(name) {
    console.log("Hello, " + name);
}
</div>
```

**Syntax Highlighted Code:**
```html
<div class="code-example">
    <span class="tag">&lt;div</span>
    <span class="attribute"> class</span>=<span class="value">"container"</span><span class="tag">&gt;</span>
    <span class="content">Content here</span>
    <span class="tag">&lt;/div&gt;</span>
</div>
```

**Code Size Variants:**
```html
<!-- Large code -->
<div class="code-example code-lg">...</div>

<!-- Medium code -->
<div class="code-example code-md">...</div>

<!-- Small code -->
<div class="code-example code-sm">...</div>
```

### Information Boxes

**Tip Box (Green):**
```html
<div class="tip-box">
    <strong>💡 Pro Tip:</strong> Always validate your HTML code before submitting.
</div>
```

**Warning Box (Yellow):**
```html
<div class="warning-box">
    <strong>⚠️ Important:</strong> Never commit passwords to version control.
</div>
```

**Activity Box (Blue Gradient):**
```html
<div class="activity-box">
    <h3>Practice Exercise</h3>
    <p>Create a function that calculates the area of a rectangle.</p>
    <ol>
        <li>Define parameters for width and height</li>
        <li>Return width × height</li>
        <li>Test with different values</li>
    </ol>
</div>
```

**Visual Example Box:**
```html
<div class="visual-example">
    <h3>Example Output</h3>
    <p>This is how your result should look.</p>
</div>
```

### Comparison Layouts

**Side-by-Side Comparison:**
```html
<div class="comparison-table">
    <div class="comparison-card good">
        <h3>✅ Good Practice</h3>
        <div class="code-example">
            <span class="good">const pi = 3.14159;</span>
        </div>
        <p>Uses descriptive variable names</p>
    </div>
    <div class="comparison-card bad">
        <h3>❌ Bad Practice</h3>
        <div class="code-example">
            <span class="bad">const x = 3.14159;</span>
        </div>
        <p>Variable name doesn't indicate purpose</p>
    </div>
</div>
```

**Two-Column Layout:**
```html
<div class="two-column">
    <div>
        <h3>Theory</h3>
        <p>Explanation of the concept...</p>
    </div>
    <div>
        <h3>Practice</h3>
        <p>How to apply it...</p>
    </div>
</div>
```

---

## Interactive Elements

### Countdown Timers

Add interactive timers for exercises:

```html
<div class="slide">
    <h1>Practice Time! <span class="emoji">💻</span></h1>
    <div class="activity-box">
        <h3>15-Minute Challenge</h3>
        <p>Build a simple calculator app</p>
    </div>

    <!-- Timer buttons -->
    <button data-timer="15">Start 15-Minute Timer</button>
    <button data-timer="5">Start 5-Minute Timer</button>
</div>
```

**How it works:**
- Click button to start countdown
- Audio alert when time is up
- Timer displays in corner during countdown

### Embedded Media

**Images:**
```html
<img src="../../images/diagram.png" alt="System architecture diagram" style="max-width: 100%; border-radius: 10px;">
```

**YouTube Videos:**
```html
<iframe width="800" height="450"
    src="https://www.youtube.com/embed/VIDEO_ID"
    frameborder="0"
    allow="accelerometer; autoplay; encrypted-media; gyroscope"
    allowfullscreen
    style="border-radius: 10px;">
</iframe>
```

**CodePen Embeds:**
```html
<iframe height="400" style="width: 100%;"
    src="https://codepen.io/username/embed/XXXXXX?default-tab=html,result"
    frameborder="0"
    allowfullscreen>
</iframe>
```

### Custom Interactions

**Reveal Answer on Click:**
```html
<div class="slide">
    <h1>Quiz Question</h1>
    <p>What is the capital of France?</p>

    <button onclick="document.getElementById('answer').style.display='block'">
        Show Answer
    </button>

    <div id="answer" style="display: none; margin-top: 20px;">
        <div class="tip-box">
            <strong>Answer:</strong> Paris
        </div>
    </div>
</div>
```

---

## Best Practices

### Content Guidelines

1. **One Topic Per Slide**
   - Don't overcrowd slides
   - Break complex topics into multiple slides
   - Use visual hierarchy (headings → subheadings → text)

2. **Use Visual Examples**
   - Code snippets for programming courses
   - Diagrams for system architecture
   - Screenshots for tool demonstrations
   - Real-world examples

3. **Engagement Techniques**
   - Ask questions throughout
   - Include practice exercises every 3-4 slides
   - Use emojis sparingly for emphasis
   - Add timers for active learning

4. **Consistency**
   - Same structure for similar topics
   - Consistent code formatting
   - Standard color scheme from theme variables

### Slide Timing

**Recommended Pace:**
- Title slide: 30 seconds
- Content slides: 2-3 minutes each
- Activity slides: 5-15 minutes
- Summary slide: 1-2 minutes

**For a 50-minute class:**
- 10-15 content slides
- 1-2 activities with timers
- Leave time for questions

### Text Guidelines

**Font Sizes:**
```html
<!-- Large, attention-grabbing -->
<p style="font-size: 1.8em;">Key Concept Here</p>

<!-- Standard readable size -->
<p style="font-size: 1.2em;">Regular explanation text</p>

<!-- Fine print / citations -->
<p style="font-size: 0.9em;">Source: Reference material</p>
```

**Line Spacing:**
```html
<!-- More spacious for lists -->
<ul style="line-height: 2;">
    <li>Point one</li>
    <li>Point two</li>
</ul>
```

**Text Alignment:**
```html
<p style="text-align: center;">Centered text</p>
<p style="text-align: right;">Right-aligned text</p>
```

---

## Examples

### Example 1: Conceptual Slide

```html
<div class="slide">
    <h1>What is a Variable?</h1>

    <p style="font-size: 1.4em; margin-bottom: 30px;">
        A variable is a <strong>named container</strong> that stores a value in memory.
    </p>

    <h3>Think of it like:</h3>
    <div class="visual-example">
        <p style="font-size: 1.3em;">
            📦 A labeled box where you can store and retrieve items
        </p>
    </div>

    <div class="two-column" style="margin-top: 40px;">
        <div>
            <h3>In Real Life</h3>
            <p>A mailbox with a name on it</p>
        </div>
        <div>
            <h3>In Programming</h3>
            <div class="code-example code-sm">
                <span class="tag">let</span>
                <span class="attribute"> userName</span> =
                <span class="value"> "Alice"</span>;
            </div>
        </div>
    </div>
</div>
```

### Example 2: Step-by-Step Tutorial

```html
<div class="slide">
    <h1>Creating Your First Function</h1>

    <h3>Step 1: Define the function</h3>
    <div class="code-example">
function calculateArea(width, height) {

}
    </div>

    <h3>Step 2: Add the logic</h3>
    <div class="code-example">
function calculateArea(width, height) {
    return width * height;
}
    </div>

    <h3>Step 3: Call the function</h3>
    <div class="code-example">
const area = calculateArea(10, 5);
console.log(area); // Output: 50
    </div>

    <div class="tip-box">
        <strong>💡 Tip:</strong> Always test your functions with different inputs!
    </div>
</div>
```

### Example 3: Interactive Activity

```html
<div class="slide">
    <h1>Hands-On Practice <span class="emoji">💻</span></h1>

    <div class="activity-box">
        <h3>Build a Greeting Function</h3>
        <p><strong>Your Task:</strong></p>
        <ol>
            <li>Create a function called <code>greet()</code></li>
            <li>It should take a <code>name</code> parameter</li>
            <li>Return "Hello, [name]!"</li>
            <li>Test with at least 3 different names</li>
        </ol>

        <p style="margin-top: 20px;"><strong>Bonus Challenge:</strong></p>
        <ul>
            <li>Add a second parameter for time of day</li>
            <li>Return "Good morning/afternoon/evening, [name]!"</li>
        </ul>
    </div>

    <div style="margin-top: 30px; text-align: center;">
        <button data-timer="10">Start 10-Minute Timer</button>
        <button data-timer="5">Start 5-Minute Timer</button>
    </div>
</div>
```

---

## Accessibility

### Alt Text for Images

Always provide descriptive alt text:

```html
<img src="diagram.png" alt="Flowchart showing the database normalization process from 1NF to 3NF">
```

### Semantic HTML

Use proper heading hierarchy:

```html
<!-- Good -->
<h1>Main Topic</h1>
<h2>Subtopic</h2>
<h3>Detail</h3>

<!-- Bad - don't skip levels -->
<h1>Main Topic</h1>
<h3>Subtopic</h3> <!-- Skipped h2 -->
```

### Color Contrast

Test your theme colors:
- Text should have 4.5:1 contrast ratio minimum
- Large text (18pt+) should have 3:1 ratio
- Use [WebAIM Contrast Checker](https://webaim.org/resources/contrastchecker/)

### Keyboard Navigation

Your slides already support:
- ← → Arrow keys to navigate
- Space bar to advance
- Home/End for first/last slide
- Tab key for buttons and links

---

## Testing Your Lecture

### Pre-Launch Checklist

- [ ] All slides display correctly
- [ ] Code examples are properly formatted
- [ ] Links work (both internal and external)
- [ ] Images load and have alt text
- [ ] Timers function correctly
- [ ] Slide counter matches actual slide count
- [ ] Theme toggle works
- [ ] Mobile responsive (test on phone)
- [ ] Print preview looks good (Ctrl+P / Cmd+P)

### Presentation Day Checklist

- [ ] Test in presentation mode (fullscreen with 'f' key)
- [ ] Have backup plan (PDF export)
- [ ] Test audio (timer alerts)
- [ ] Check internet connection (for embedded content)
- [ ] Bookmark the lecture URL

---

## Tips for Live Presentation

1. **Use Keyboard Shortcuts:**
   - → or Space: Next slide
   - ←: Previous slide
   - F: Fullscreen
   - T: Toggle theme
   - Esc: Exit fullscreen

2. **Engage Students:**
   - Pause after key points
   - Use timers for activities
   - Switch to dark mode for code-heavy slides
   - Encourage questions between slides

3. **Timing Management:**
   - Spend less time on introductory slides
   - More time on complex concepts
   - Always leave time for practice activities
   - Save 5-10 minutes for questions

4. **Technical Setup:**
   - Open lecture in fullscreen before class
   - Test audio/video embeds
   - Have PDF backup ready
   - Close unnecessary tabs/applications

---

## Advanced Techniques

### Custom Animations

Add subtle animations for engagement:

```html
<style>
@keyframes slideInFromLeft {
    0% { transform: translateX(-100%); opacity: 0; }
    100% { transform: translateX(0); opacity: 1; }
}

.animated-list li {
    animation: slideInFromLeft 0.5s ease forwards;
    opacity: 0;
}

.animated-list li:nth-child(1) { animation-delay: 0.1s; }
.animated-list li:nth-child(2) { animation-delay: 0.2s; }
.animated-list li:nth-child(3) { animation-delay: 0.3s; }
</style>

<ul class="animated-list">
    <li>First point</li>
    <li>Second point</li>
    <li>Third point</li>
</ul>
```

### Slide-Specific Behaviors

```javascript
<script>
document.addEventListener('slidechange', (e) => {
    const slideNum = e.detail.currentSlide;

    // Auto-start timer on slide 5
    if (slideNum === 4 && window.presentation) {
        window.presentation.startTimer(10);
    }

    // Load external content on demand
    if (slideNum === 7) {
        loadExternalDemo();
    }
});
</script>
```

---

## Next Steps

1. Create your first lecture using the template
2. Review [CUSTOMIZATION_GUIDE.md](CUSTOMIZATION_GUIDE.md) for styling
3. Test with students and gather feedback
4. Iterate and improve

---

**Questions?** Refer to PROJECT_OVERVIEW.md or review example lectures in the source course folders.

Happy teaching! 🎓

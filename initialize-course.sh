#!/bin/bash
# Course Website Template - Initialization Script
# This script helps you quickly set up a new course from the template

set -e

echo "╔════════════════════════════════════════════════════════════════╗"
echo "║        Course Website Template - Initialization Wizard        ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""
echo "This script will help you customize the template for your course."
echo "You can always manually edit these values later."
echo ""

# Color codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to prompt for input with default
prompt_with_default() {
    local prompt="$1"
    local default="$2"
    local var_name="$3"

    echo -ne "${BLUE}${prompt}${NC}"
    if [ -n "$default" ]; then
        echo -ne " [${default}]: "
    else
        echo -ne ": "
    fi
    read input

    if [ -z "$input" ]; then
        eval "$var_name='$default'"
    else
        eval "$var_name='$input'"
    fi
}

# Gather course information
echo -e "${GREEN}=== Course Information ===${NC}"
echo ""

prompt_with_default "Course Title" "Introduction to Computer Science" COURSE_TITLE
prompt_with_default "Course Number" "CSCI 1000" COURSE_NUMBER
prompt_with_default "Course Level" "Undergraduate" COURSE_LEVEL
prompt_with_default "Semester & Year" "Fall 2025" SEMESTER
prompt_with_default "Instructor Name" "Dr. Jane Smith" INSTRUCTOR_NAME
prompt_with_default "Instructor Email" "instructor@university.edu" INSTRUCTOR_EMAIL
prompt_with_default "Office Location" "Science Building - Room 101" OFFICE_LOCATION
prompt_with_default "Institution Name" "University Name" INSTITUTION_NAME

echo ""
echo -e "${GREEN}=== Theme Customization ===${NC}"
echo ""
echo "Enter your institution's brand colors (hex format, e.g., #00669b)"
echo "Press Enter to keep the default blue theme."
echo ""

prompt_with_default "Primary Color (main brand color)" "#00669b" PRIMARY_COLOR
prompt_with_default "Secondary Color (accent color)" "#009edb" SECONDARY_COLOR
prompt_with_default "Accent Color (highlight color)" "#ffc222" ACCENT_COLOR

echo ""
echo -e "${GREEN}=== Optional Features ===${NC}"
echo ""

echo -ne "${BLUE}Do you want to use attendance tracking? (y/n)${NC} [n]: "
read use_attendance
use_attendance=${use_attendance:-n}

echo -ne "${BLUE}Do you want to use Netlify for deployment? (y/n)${NC} [n]: "
read use_netlify
use_netlify=${use_netlify:-n}

echo ""
echo -e "${GREEN}=== Configuration Summary ===${NC}"
echo ""
echo "Course Title:       $COURSE_TITLE"
echo "Course Number:      $COURSE_NUMBER"
echo "Level:              $COURSE_LEVEL"
echo "Semester:           $SEMESTER"
echo "Instructor:         $INSTRUCTOR_NAME"
echo "Email:              $INSTRUCTOR_EMAIL"
echo "Office:             $OFFICE_LOCATION"
echo "Institution:        $INSTITUTION_NAME"
echo "Primary Color:      $PRIMARY_COLOR"
echo "Secondary Color:    $SECONDARY_COLOR"
echo "Accent Color:       $ACCENT_COLOR"
echo "Attendance:         $use_attendance"
echo "Netlify:            $use_netlify"
echo ""

echo -ne "${YELLOW}Apply these settings? (y/n)${NC} [y]: "
read confirm
confirm=${confirm:-y}

if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
    echo "Initialization cancelled."
    exit 0
fi

echo ""
echo -e "${GREEN}Applying configuration...${NC}"

# Update index.html
echo "→ Updating index.html..."
sed -i.bak "s/Course Title Here/$COURSE_TITLE/g" index.html
sed -i.bak "s/COURSE 0000/$COURSE_NUMBER/g" index.html
sed -i.bak "s/Level (Undergraduate\/Graduate)/$COURSE_LEVEL Course/g" index.html
sed -i.bak "s/Semester Year/$SEMESTER/g" index.html
sed -i.bak "s/Instructor: Your Name/Instructor: $INSTRUCTOR_NAME/g" index.html
sed -i.bak "s/your.email@institution.edu/$INSTRUCTOR_EMAIL/g" index.html
sed -i.bak "s/Building Name - Room Number/$OFFICE_LOCATION/g" index.html
sed -i.bak "s/Your Institution/$INSTITUTION_NAME/g" index.html

# Update theme-variables.css
echo "→ Updating theme colors..."
sed -i.bak "s/#00669b/$PRIMARY_COLOR/g" styles/theme-variables.css
sed -i.bak "s/#009edb/$SECONDARY_COLOR/g" styles/theme-variables.css
sed -i.bak "s/#ffc222/$ACCENT_COLOR/g" styles/theme-variables.css

# Update page title
echo "→ Updating page title..."
sed -i.bak "s/<title>Course Title - Course Number/<title>$COURSE_TITLE - $COURSE_NUMBER/g" index.html

# Update footer
echo "→ Updating footer..."
YEAR=$(date +%Y)
sed -i.bak "s/© 2025 Your Name/© $YEAR $INSTRUCTOR_NAME/g" index.html

# Handle optional features
if [ "$use_attendance" != "y" ] && [ "$use_attendance" != "Y" ]; then
    echo "→ Removing attendance tracking files (not needed)..."
    rm -f pages/attendance.html
    rm -f js/classroom-auth.js
    rm -rf netlify/functions/*
    echo "   (You can always add these back from the template later)"
fi

if [ "$use_netlify" != "y" ] && [ "$use_netlify" != "Y" ]; then
    echo "→ Removing Netlify configuration (not needed)..."
    rm -f netlify.toml
    echo "   (You can use GitHub Pages or any static host)"
fi

# Clean up backup files
echo "→ Cleaning up..."
find . -name "*.bak" -delete

echo ""
echo -e "${GREEN}╔════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║                    ✓ Setup Complete!                          ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo "Your course website has been initialized with your settings."
echo ""
echo "Next steps:"
echo "  1. Review and edit index.html if needed"
echo "  2. Customize theme-variables.css for fine-tuning"
echo "  3. Create lectures using pages/lectures/lectureTemplate.html"
echo "  4. Update the lectures array in index.html with your schedule"
echo "  5. Deploy to your chosen platform"
echo ""
echo "Documentation:"
echo "  • README.md - Quick start guide"
echo "  • docs/CUSTOMIZATION_GUIDE.md - Detailed customization"
echo "  • docs/LECTURE_CREATION_GUIDE.md - Creating lectures"
echo ""
echo "Need help? Check the documentation or create an issue on GitHub."
echo ""
echo -e "${GREEN}Happy teaching! 🎓${NC}"

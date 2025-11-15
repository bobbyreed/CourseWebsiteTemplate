#!/bin/bash
# Template Testing Suite
# Tests all functionality of the course website template

set -e  # Exit on error

TEMPLATE_DIR="/home/user/CourseWebsiteTemplate/template"
TEST_RESULTS_DIR="/home/user/CourseWebsiteTemplate/test-results"
mkdir -p "$TEST_RESULTS_DIR"

echo "=================================="
echo "Course Website Template Test Suite"
echo "=================================="
echo ""

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

PASS_COUNT=0
FAIL_COUNT=0
WARN_COUNT=0

# Function to log test results
log_pass() {
    echo -e "${GREEN}✓ PASS${NC}: $1"
    ((PASS_COUNT++))
}

log_fail() {
    echo -e "${RED}✗ FAIL${NC}: $1"
    ((FAIL_COUNT++))
}

log_warn() {
    echo -e "${YELLOW}⚠ WARN${NC}: $1"
    ((WARN_COUNT++))
}

log_info() {
    echo -e "ℹ INFO: $1"
}

# =================================
# TEST 1: Directory Structure
# =================================
echo ""
echo "TEST 1: Directory Structure"
echo "----------------------------"

required_dirs=(
    "template"
    "template/pages"
    "template/pages/lectures"
    "template/js"
    "template/styles"
    "template/images"
    "template/netlify"
    "template/netlify/functions"
    "template/docs"
)

for dir in "${required_dirs[@]}"; do
    if [ -d "/home/user/CourseWebsiteTemplate/$dir" ]; then
        log_pass "Directory exists: $dir"
    else
        log_fail "Missing directory: $dir"
    fi
done

# =================================
# TEST 2: Required Files
# =================================
echo ""
echo "TEST 2: Required Files"
echo "----------------------"

required_files=(
    "template/index.html"
    "template/README.md"
    "template/package.json"
    "template/netlify.toml"
    "template/.gitignore"
    "template/pages/lectures/lectureTemplate.html"
    "template/js/presentation.js"
    "template/js/utils.js"
    "template/styles/presentation.css"
    "template/styles/theme-variables.css"
    "template/docs/CUSTOMIZATION_GUIDE.md"
    "template/docs/LECTURE_CREATION_GUIDE.md"
    "template/docs/PROJECT_OVERVIEW.md"
)

for file in "${required_files[@]}"; do
    if [ -f "/home/user/CourseWebsiteTemplate/$file" ]; then
        log_pass "File exists: $file"
    else
        log_fail "Missing file: $file"
    fi
done

# =================================
# TEST 3: HTML Validation
# =================================
echo ""
echo "TEST 3: HTML Validation"
echo "-----------------------"

# Check for basic HTML structure
if grep -q "<!DOCTYPE html>" "$TEMPLATE_DIR/index.html"; then
    log_pass "index.html has DOCTYPE declaration"
else
    log_fail "index.html missing DOCTYPE"
fi

if grep -q "<meta charset=\"UTF-8\">" "$TEMPLATE_DIR/index.html"; then
    log_pass "index.html has charset declaration"
else
    log_fail "index.html missing charset"
fi

if grep -q "viewport" "$TEMPLATE_DIR/index.html"; then
    log_pass "index.html has viewport meta tag"
else
    log_fail "index.html missing viewport meta"
fi

# Check lecture template
if [ -f "$TEMPLATE_DIR/pages/lectures/lectureTemplate.html" ]; then
    if grep -q "<!DOCTYPE html>" "$TEMPLATE_DIR/pages/lectures/lectureTemplate.html"; then
        log_pass "lectureTemplate.html has DOCTYPE declaration"
    else
        log_fail "lectureTemplate.html missing DOCTYPE"
    fi
fi

# =================================
# TEST 4: CSS Files
# =================================
echo ""
echo "TEST 4: CSS Files"
echo "-----------------"

# Check theme-variables.css has required variables
required_css_vars=(
    "--primary-color"
    "--secondary-color"
    "--accent-color"
    "--bg-primary"
    "--text-primary"
    "--font-family"
)

for var in "${required_css_vars[@]}"; do
    if grep -q "$var:" "$TEMPLATE_DIR/styles/theme-variables.css"; then
        log_pass "theme-variables.css defines $var"
    else
        log_fail "theme-variables.css missing $var"
    fi
done

# Check for dark mode support
if grep -q '\[data-theme="dark"\]' "$TEMPLATE_DIR/styles/theme-variables.css"; then
    log_pass "Dark mode variables defined"
else
    log_fail "Dark mode variables missing"
fi

# =================================
# TEST 5: JavaScript Files
# =================================
echo ""
echo "TEST 5: JavaScript Files"
echo "------------------------"

# Check presentation.js has required class and methods
if grep -q "class PresentationController" "$TEMPLATE_DIR/js/presentation.js"; then
    log_pass "PresentationController class exists"
else
    log_fail "PresentationController class missing"
fi

required_methods=(
    "showSlide"
    "changeSlide"
    "toggleTheme"
    "toggleFullscreen"
    "startTimer"
    "bindKeyboardNavigation"
)

for method in "${required_methods[@]}"; do
    if grep -q "$method" "$TEMPLATE_DIR/js/presentation.js"; then
        log_pass "Method exists: $method"
    else
        log_fail "Method missing: $method"
    fi
done

# Check for event listeners
if grep -q "addEventListener" "$TEMPLATE_DIR/js/presentation.js"; then
    log_pass "Event listeners implemented"
else
    log_fail "Event listeners missing"
fi

# =================================
# TEST 6: Package.json
# =================================
echo ""
echo "TEST 6: Package Configuration"
echo "------------------------------"

if [ -f "$TEMPLATE_DIR/package.json" ]; then
    if grep -q "\"name\":" "$TEMPLATE_DIR/package.json"; then
        log_pass "package.json has name field"
    else
        log_fail "package.json missing name field"
    fi

    if grep -q "\"version\":" "$TEMPLATE_DIR/package.json"; then
        log_pass "package.json has version field"
    else
        log_fail "package.json missing version field"
    fi

    if grep -q "@neondatabase/serverless" "$TEMPLATE_DIR/package.json"; then
        log_pass "package.json includes database dependency"
    else
        log_warn "package.json missing database dependency (optional)"
    fi
fi

# =================================
# TEST 7: Netlify Functions
# =================================
echo ""
echo "TEST 7: Netlify Functions"
echo "-------------------------"

netlify_functions=(
    "db-config.js"
    "get-students.js"
    "mark-attendance.js"
    "get-attendance.js"
)

for func in "${netlify_functions[@]}"; do
    if [ -f "$TEMPLATE_DIR/netlify/functions/$func" ]; then
        log_pass "Netlify function exists: $func"
    else
        log_warn "Netlify function missing: $func (optional)"
    fi
done

# =================================
# TEST 8: Documentation
# =================================
echo ""
echo "TEST 8: Documentation"
echo "---------------------"

# Check README has required sections
if grep -q "## Features" "$TEMPLATE_DIR/README.md"; then
    log_pass "README has Features section"
else
    log_fail "README missing Features section"
fi

if grep -q "## Quick Start" "$TEMPLATE_DIR/README.md"; then
    log_pass "README has Quick Start section"
else
    log_fail "README missing Quick Start section"
fi

# Check CUSTOMIZATION_GUIDE
if grep -q "Theme Customization" "$TEMPLATE_DIR/docs/CUSTOMIZATION_GUIDE.md"; then
    log_pass "CUSTOMIZATION_GUIDE has theme section"
else
    log_fail "CUSTOMIZATION_GUIDE missing theme section"
fi

# Check LECTURE_CREATION_GUIDE
if grep -q "Creating Your First Lecture" "$TEMPLATE_DIR/docs/LECTURE_CREATION_GUIDE.md"; then
    log_pass "LECTURE_CREATION_GUIDE has tutorial section"
else
    log_fail "LECTURE_CREATION_GUIDE missing tutorial section"
fi

# =================================
# TEST 9: Link Integrity
# =================================
echo ""
echo "TEST 9: Link Integrity in HTML"
echo "-------------------------------"

# Check for broken internal links in index.html
if grep -q 'href="./styles/theme-variables.css"' "$TEMPLATE_DIR/index.html"; then
    log_pass "index.html links to theme-variables.css"
else
    log_fail "index.html missing link to theme-variables.css"
fi

if grep -q 'href="./styles/presentation.css"' "$TEMPLATE_DIR/index.html"; then
    log_pass "index.html links to presentation.css"
else
    log_fail "index.html missing link to presentation.css"
fi

# Check lecture template links
if grep -q 'src="../../js/presentation.js"' "$TEMPLATE_DIR/pages/lectures/lectureTemplate.html"; then
    log_pass "lectureTemplate.html links to presentation.js"
else
    log_fail "lectureTemplate.html has incorrect path to presentation.js"
fi

# =================================
# TEST 10: Configuration Files
# =================================
echo ""
echo "TEST 10: Configuration Files"
echo "----------------------------"

# Check .gitignore
if grep -q "node_modules" "$TEMPLATE_DIR/.gitignore"; then
    log_pass ".gitignore includes node_modules"
else
    log_fail ".gitignore missing node_modules"
fi

if grep -q ".env" "$TEMPLATE_DIR/.gitignore"; then
    log_pass ".gitignore includes .env files"
else
    log_fail ".gitignore missing .env files"
fi

# Check netlify.toml
if grep -q "functions = " "$TEMPLATE_DIR/netlify.toml"; then
    log_pass "netlify.toml defines functions directory"
else
    log_fail "netlify.toml missing functions directory"
fi

# =================================
# TEST 11: Code Quality
# =================================
echo ""
echo "TEST 11: Code Quality Checks"
echo "-----------------------------"

# Check for console.log in production code (warning only)
if grep -q "console.log" "$TEMPLATE_DIR/js/presentation.js"; then
    log_warn "presentation.js contains console.log statements"
else
    log_pass "presentation.js has no console.log statements"
fi

# Check for proper error handling
if grep -q "try\|catch" "$TEMPLATE_DIR/js/presentation.js"; then
    log_pass "presentation.js has error handling"
else
    log_warn "presentation.js may lack error handling"
fi

# =================================
# TEST 12: Accessibility
# =================================
echo ""
echo "TEST 12: Accessibility Features"
echo "--------------------------------"

# Check for keyboard navigation
if grep -q "keydown" "$TEMPLATE_DIR/js/presentation.js"; then
    log_pass "Keyboard navigation implemented"
else
    log_fail "Keyboard navigation missing"
fi

# Check for ARIA or semantic HTML
if grep -q "aria-\|role=" "$TEMPLATE_DIR/index.html"; then
    log_pass "ARIA attributes found"
else
    log_warn "Consider adding ARIA attributes for accessibility"
fi

# =================================
# TEST SUMMARY
# =================================
echo ""
echo "=================================="
echo "TEST SUMMARY"
echo "=================================="
echo -e "${GREEN}Passed: $PASS_COUNT${NC}"
echo -e "${RED}Failed: $FAIL_COUNT${NC}"
echo -e "${YELLOW}Warnings: $WARN_COUNT${NC}"
echo ""

TOTAL_TESTS=$((PASS_COUNT + FAIL_COUNT))
if [ $TOTAL_TESTS -gt 0 ]; then
    PASS_RATE=$((PASS_COUNT * 100 / TOTAL_TESTS))
    echo "Pass Rate: $PASS_RATE%"
fi

# Save results to file
echo "Test Results Summary" > "$TEST_RESULTS_DIR/test-summary.txt"
echo "===================" >> "$TEST_RESULTS_DIR/test-summary.txt"
echo "Passed: $PASS_COUNT" >> "$TEST_RESULTS_DIR/test-summary.txt"
echo "Failed: $FAIL_COUNT" >> "$TEST_RESULTS_DIR/test-summary.txt"
echo "Warnings: $WARN_COUNT" >> "$TEST_RESULTS_DIR/test-summary.txt"
echo "Pass Rate: $PASS_RATE%" >> "$TEST_RESULTS_DIR/test-summary.txt"

if [ $FAIL_COUNT -eq 0 ]; then
    echo ""
    echo -e "${GREEN}All critical tests passed! ✓${NC}"
    exit 0
else
    echo ""
    echo -e "${RED}Some tests failed. Please review the output above.${NC}"
    exit 1
fi

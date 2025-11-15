#!/bin/bash
# Template Testing Suite

TEMPLATE_DIR="template"
PASS=0
FAIL=0
WARN=0

echo "=================================="
echo "Course Website Template Test Suite"
echo "=================================="
echo ""

# TEST 1: Directory Structure
echo "TEST 1: Directory Structure"
echo "----------------------------"

for dir in template template/pages template/pages/lectures template/js template/styles template/images template/netlify template/netlify/functions template/docs; do
    if [ -d "$dir" ]; then
        echo "✓ Directory exists: $dir"
        ((PASS++))
    else
        echo "✗ Missing directory: $dir"
        ((FAIL++))
    fi
done

# TEST 2: Required Files
echo ""
echo "TEST 2: Required Files"
echo "----------------------"

for file in template/index.html template/README.md template/package.json template/netlify.toml template/.gitignore template/pages/lectures/lectureTemplate.html template/js/presentation.js template/js/utils.js template/styles/presentation.css template/styles/theme-variables.css template/docs/CUSTOMIZATION_GUIDE.md template/docs/LECTURE_CREATION_GUIDE.md template/docs/PROJECT_OVERVIEW.md; do
    if [ -f "$file" ]; then
        echo "✓ File exists: $file"
        ((PASS++))
    else
        echo "✗ Missing file: $file"
        ((FAIL++))
    fi
done

# TEST 3: HTML Validation
echo ""
echo "TEST 3: HTML Validation"
echo "-----------------------"

if grep -q "<!DOCTYPE html>" template/index.html; then
    echo "✓ index.html has DOCTYPE"
    ((PASS++))
else
    echo "✗ index.html missing DOCTYPE"
    ((FAIL++))
fi

if grep -q "charset=\"UTF-8\"" template/index.html; then
    echo "✓ index.html has charset"
    ((PASS++))
else
    echo "✗ index.html missing charset"
    ((FAIL++))
fi

if grep -q "viewport" template/index.html; then
    echo "✓ index.html has viewport"
    ((PASS++))
else
    echo "✗ index.html missing viewport"
    ((FAIL++))
fi

# TEST 4: CSS Variables
echo ""
echo "TEST 4: CSS Variables"
echo "---------------------"

for var in "--primary-color" "--secondary-color" "--accent-color" "--bg-primary" "--text-primary" "--font-family"; do
    if grep -q "$var:" template/styles/theme-variables.css; then
        echo "✓ Variable defined: $var"
        ((PASS++))
    else
        echo "✗ Variable missing: $var"
        ((FAIL++))
    fi
done

if grep -q '\[data-theme="dark"\]' template/styles/theme-variables.css; then
    echo "✓ Dark mode variables defined"
    ((PASS++))
else
    echo "✗ Dark mode variables missing"
    ((FAIL++))
fi

# TEST 5: JavaScript
echo ""
echo "TEST 5: JavaScript Functions"
echo "-----------------------------"

if grep -q "class PresentationController" template/js/presentation.js; then
    echo "✓ PresentationController class exists"
    ((PASS++))
else
    echo "✗ PresentationController class missing"
    ((FAIL++))
fi

for method in showSlide changeSlide toggleTheme toggleFullscreen startTimer bindKeyboardNavigation; do
    if grep -q "$method" template/js/presentation.js; then
        echo "✓ Method exists: $method"
        ((PASS++))
    else
        echo "✗ Method missing: $method"
        ((FAIL++))
    fi
done

# TEST 6: Links
echo ""
echo "TEST 6: Internal Links"
echo "----------------------"

if grep -q 'href="./styles/theme-variables.css"' template/index.html; then
    echo "✓ Links to theme-variables.css"
    ((PASS++))
else
    echo "✗ Missing link to theme-variables.css"
    ((FAIL++))
fi

if grep -q 'href="./styles/presentation.css"' template/index.html; then
    echo "✓ Links to presentation.css"
    ((PASS++))
else
    echo "✗ Missing link to presentation.css"
    ((FAIL++))
fi

if grep -q 'src="../../js/presentation.js"' template/pages/lectures/lectureTemplate.html; then
    echo "✓ Lecture template links to presentation.js"
    ((PASS++))
else
    echo "✗ Lecture template missing presentation.js link"
    ((FAIL++))
fi

# TEST 7: Configuration
echo ""
echo "TEST 7: Configuration Files"
echo "---------------------------"

if grep -q "node_modules" template/.gitignore; then
    echo "✓ .gitignore includes node_modules"
    ((PASS++))
else
    echo "✗ .gitignore missing node_modules"
    ((FAIL++))
fi

if grep -q ".env" template/.gitignore; then
    echo "✓ .gitignore includes .env"
    ((PASS++))
else
    echo "✗ .gitignore missing .env"
    ((FAIL++))
fi

if grep -q "functions = " template/netlify.toml; then
    echo "✓ netlify.toml defines functions"
    ((PASS++))
else
    echo "✗ netlify.toml missing functions"
    ((FAIL++))
fi

# TEST 8: Documentation
echo ""
echo "TEST 8: Documentation"
echo "---------------------"

if grep -q "## Features" template/README.md; then
    echo "✓ README has Features section"
    ((PASS++))
else
    echo "✗ README missing Features section"
    ((FAIL++))
fi

if grep -q "Theme Customization" template/docs/CUSTOMIZATION_GUIDE.md; then
    echo "✓ CUSTOMIZATION_GUIDE has theme section"
    ((PASS++))
else
    echo "✗ CUSTOMIZATION_GUIDE missing theme section"
    ((FAIL++))
fi

if grep -q "Creating Your First Lecture" template/docs/LECTURE_CREATION_GUIDE.md; then
    echo "✓ LECTURE_CREATION_GUIDE has tutorial"
    ((PASS++))
else
    echo "✗ LECTURE_CREATION_GUIDE missing tutorial"
    ((FAIL++))
fi

# Summary
echo ""
echo "=================================="
echo "TEST SUMMARY"
echo "=================================="
echo "Passed: $PASS"
echo "Failed: $FAIL"
echo "Warnings: $WARN"

TOTAL=$((PASS + FAIL))
if [ $TOTAL -gt 0 ]; then
    RATE=$((PASS * 100 / TOTAL))
    echo "Pass Rate: $RATE%"
fi

if [ $FAIL -eq 0 ]; then
    echo ""
    echo "All tests passed! ✓"
    exit 0
else
    echo ""
    echo "Some tests failed."
    exit 1
fi

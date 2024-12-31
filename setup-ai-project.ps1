# Setup script
$basePath = "my-project/"

# Create the full directory structure
$directories = @(
    "src",
    "prompts",
    "data"
)

# Create directories
foreach ($dir in $directories) {
    $path = Join-Path $basePath $dir
    New-Item -ItemType Directory -Path $path -Force
}

# Function to create files
function Create-File {
    param($path, $content = "// TODO: Implement")
    $fullPath = Join-Path $basePath $path
    New-Item -ItemType File -Path $fullPath -Force
    Set-Content -Path $fullPath -Value $content
}

# Python Source Code
Create-File "src/_init_.py"
Create-File "src/main.py"

# Prompt Files
Create-File "prompts/generate_function.txt"
Create-File "prompts/summarize_code.txt"
Create-File "prompts/code_refractor.json"

# Files
Create-File ".env"
Create-File ".gitignore" @"
# Ignore environment files
.env
node_modules/
dist/
"@
Create-File "README.md" "# Project Title: Territory Management System - A brief description of your project."

Write-Host "Project structure has been created successfully!"
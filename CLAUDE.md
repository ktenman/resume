# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a LaTeX-based resume/CV repository that automatically builds a PDF resume using Docker and GitHub Actions.

## Essential Commands

### Building the Resume Locally
```bash
# Build Docker image
docker build -t latex .

# Compile LaTeX to PDF
docker run --rm -i -v "$PWD":/data latex pdflatex konstantin_tenman_resume.tex
```

### Deployment
The `generate.sh` script is used for production deployment:
```bash
./generate.sh
```
This script:
1. Resets and pulls latest changes from git
2. Builds the Docker image
3. Compiles the LaTeX file
4. Copies the PDF to `/var/www/html/` as both `cv.pdf` and `resume.pdf`

## Architecture

The repository follows a simple build pipeline:
- **Source**: `konstantin_tenman_resume.tex` (LaTeX document)
- **Build Environment**: Docker container with Ubuntu 18.04 and texlive packages
- **CI/CD**: GitHub Actions workflow (`.github/workflows/build-latex.yml`) automatically builds PDF on push/PR
- **Output**: `konstantin_tenman_resume.pdf`

## Key Files

- `konstantin_tenman_resume.tex`: Main resume content and formatting
- `Dockerfile`: Defines the LaTeX compilation environment
- `.github/workflows/build-latex.yml`: Automated build pipeline
- `generate.sh`: Production deployment script

## Development Workflow

1. Edit `konstantin_tenman_resume.tex` with resume content
2. Test locally using Docker commands above
3. Commit and push - GitHub Actions will automatically build and upload PDF artifact
4. For production deployment, run `generate.sh` on the server
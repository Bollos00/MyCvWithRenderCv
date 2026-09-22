# My Curriculum Vitae built with [RenderCV](https://github.com/rendercv/rendercv)

<div align="center">

[![Build and publish CVs](https://github.com/Bollos00/MyCvWithRenderCv/actions/workflows/deploy-pages.yml/badge.svg)](https://github.com/Bollos00/MyCvWithRenderCv/actions/workflows/deploy-pages.yml)
[![RenderCV 2.8.0](https://img.shields.io/badge/RenderCV-2.8.0-0F766E?style=flat-square)](https://github.com/rendercv/rendercv)
[![Python 3.12](https://img.shields.io/badge/Python-3.12-3776AB?style=flat-square&logo=python&logoColor=white)](https://www.python.org/)

[View the published CVs](https://bollos00.github.io/MyCvWithRenderCv/)

</div>

## Overview

This repository contains the editable YAML sources for my curriculum vitae in portuguese and english. RenderCV converts the sources into PDFs.

## Getting started

### Prerequisites

- [Python 3.12](https://www.python.org/downloads/)
- [APM (Agent Package Manager)](https://microsoft.github.io/apm/): Optional

### Install

Clone the repository and install RenderCV:

```bash
git clone https://github.com/Bollos00/MyCvWithRenderCv.git
cd MyCvWithRenderCv
python -m pip install "rendercv[full]==2.8.0"
apm install # Optionally install rendercv skill
```

### Render the CVs locally

Run both commands in separate terminals:

```bash
rendercv render cv/Bruno_Bollos_Correa-en_CV.yaml --watch
rendercv render cv/Bruno_Bollos_Correa-pt_CV.yaml --watch
```

> The `--watch` option keeps the render process running and automatically updates the output when the YAML files change. 

The generated files are written to:

- `cv/rendercv_output/english/`
- `cv/rendercv_output/portuguese/`

Each directory contains the rendered PDF and its corresponding Typst source. 

### Build the Pages site locally

From the repository root, run:

```bash
bash .github/pages/build.sh
```

The script handles both YAML files and copies the generated PDFs together with the static index page into `site/`.

## Resources

- [RenderCV GitHub repository](https://github.com/rendercv/rendercv)
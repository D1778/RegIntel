#!/usr/bin/env bash
set -eu

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKEND_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
LOG_DIR="${BACKEND_DIR}/logs"
PYTHON_BIN="${PYTHON_BIN:-python}"

mkdir -p "${LOG_DIR}"

cd "${BACKEND_DIR}"
"${PYTHON_BIN}" manage.py website_scraper >> "${LOG_DIR}/website_scraper_cron.log" 2>&1
#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd -- "${script_dir}/../.." && pwd)"
site_dir="${repo_root}/site"
rendercv_output_dir="${repo_root}/cv/rendercv_output"

mapfile -d '' cv_files < <(
  find "${repo_root}/cv" -type f -name '*.yaml' \
    ! -path '*/rendercv_output/*' -print0 | sort -z
)

if ((${#cv_files[@]} == 0)); then
  echo "No RenderCV YAML files found under ${repo_root}/cv" >&2
  exit 1
fi

(
  cd "${repo_root}/cv"
  for cv_file in "${cv_files[@]}"; do
    rendercv render "${cv_file#"${repo_root}/cv/"}"
  done
)

if [[ ! -d "${rendercv_output_dir}" ]]; then
  echo "RenderCV output directory not found: ${rendercv_output_dir}" >&2
  exit 1
fi

rm -rf "${site_dir}"
mkdir -p "${site_dir}"

mapfile -d '' pdf_files < <(
  find "${rendercv_output_dir}" -type f -name '*.pdf' -print0 | sort -z
)

if ((${#pdf_files[@]} == 0)); then
  echo "No PDF files found under ${rendercv_output_dir}" >&2
  exit 1
fi

for pdf_file in "${pdf_files[@]}"; do
  test -s "${pdf_file}"
  relative_pdf="${pdf_file#"${rendercv_output_dir}/"}"
  mkdir -p "${site_dir}/cv/$(dirname "${relative_pdf}")"
  cp "${pdf_file}" "${site_dir}/cv/${relative_pdf}"
done

cp "${script_dir}/index.html" "${site_dir}/index.html"
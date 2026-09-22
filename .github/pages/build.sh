#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd -- "${script_dir}/../.." && pwd)"
site_dir="${repo_root}/site"
english_pdf="${repo_root}/cv/rendercv_output/english/Bruno_Bollos_Correa-en_CV.pdf"
portuguese_pdf="${repo_root}/cv/rendercv_output/portuguese/Bruno_Bollos_Correa-pt_CV.pdf"

(
  cd "${repo_root}/cv"
  rendercv render Bruno_Bollos_Correa-en_CV.yaml
  rendercv render Bruno_Bollos_Correa-pt_CV.yaml
)

test -s "${english_pdf}"
test -s "${portuguese_pdf}"

rm -rf "${site_dir}"
mkdir -p "${site_dir}"
cp "${english_pdf}" "${site_dir}/"
cp "${portuguese_pdf}" "${site_dir}/"
cp "${script_dir}/index.html" "${site_dir}/index.html"
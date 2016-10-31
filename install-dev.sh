#!/usr/bin/env bash

# Wake up project
# bash install-dev.sh [clean]

set -o errexit
set -o pipefail
set -o nounset
#set -o xtrace

# Set magic variables for current file & dir
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
readonly __dir __file

if [ "${1:-}" == 'clean' ]; then
  rm -rf ${__dir}/vendor/bundle
fi

if [ ! -d ${__dir}/vendor/bundle ]; then
  # check bundler version
  if [ '1.12.5' != "$(bundler --version | cut -d' ' -f 3)" ]; then
    gem uninstall bundler \
      --install-dir /usr/local/lib/ruby/gems/2.2.0
    gem install --version 1.12.5 bundler \
      --install-dir /usr/local/lib/ruby/gems/2.2.0
  fi

  bundle install --path vendor/bundle
fi

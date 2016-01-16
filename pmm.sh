#!/usr/bin/env sh
color_reset="\033[m"
color_error="\033[1;31m"
color_process="\033[0;34m"
color_skiped="\033[1;33m"
color_success="\033[0;32m"
color_info="\033[0;35m"

# Default tag
TAG=${2:-latest}

function __jsonval() {
  KEY=$2
  num=$3
  cat $1 | awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/\042'$KEY'\042/){print $(i+1)}}}' | tr -d '"' | sed -n ${num}p
}

function header() {
  echo
  echo " /\$\$\$\$\$\$\$  /\$\$      /\$\$ /\$\$      /\$\$"
  echo "| \$\$__  \$\$| \$\$\$    /\$\$\$| \$\$\$    /\$\$\$"
  echo "| \$\$  \ \$\$| \$\$\$\$  /\$\$\$\$| \$\$\$\$  /\$\$\$\$"
  echo "| \$\$\$\$\$\$\$/| \$\$ \$\$/\$\$ \$\$| \$\$ \$\$/\$\$ \$\$"
  echo "| \$\$____/ | \$\$  \$\$\$| \$\$| \$\$  \$\$\$| \$\$"
  echo "| \$\$      | \$\$\  \$ | \$\$| \$\$\  \$ | \$\$"
  echo "| \$\$      | \$\$ \/  | \$\$| \$\$ \/  | \$\$"
  echo "|__/      |__/     |__/|__/     |__/"
  echo
}

function confirm() {
  read -p $'\e[35mAre you sure you want to publish new version to npm?\e[0m (y/n) ' -n 1 -r
  echo && echo    # (optional) move to a new line
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1;
  fi
}

function releaseInfo() {
  echo " ${color_info}Version:${color_reset}       " $(__jsonval package.json version)
  echo " ${color_info}Latest commit:${color_reset} " $(git log -1 --oneline)
  echo " ${color_info}Publish tag:${color_reset}   " $TAG
  echo " ${color_info}Publisher:${color_reset}     " $(npm whoami --silent)
}

function runPrepare() {
    if grep -q "\"prepare\":\?\s\"" "package.json"; then
        npm run prepare
    else
        echo "${color_skiped}[Skiped] ${color_reset} There is no prepare script in package.json." >&2;
    fi
}

function gitChecks() {
    if test -n "$(git status --porcelain)"; then
        echo "${color_error}[Error]  ${color_reset} Unclean working tree. Commit or stash changes first." >&2;
        exit 128;
    fi

    if ! git fetch --quiet 2>/dev/null; then
        echo "${color_error}[Error]  ${color_reset} There was a problem fetching your branch." >&2;
        exit 128;
    fi

    if test "0" != "$(git rev-list --count --left-only @'{u}'...HEAD)"; then
        echo "${color_error}[Error]  ${color_reset} Remote history differ. Please pull changes." >&2;
        exit 128;
    fi
}

#
#
# RUN Commands
#
#
header &&
confirm &&

echo "${color_process}Publishing${color_reset}" &&
echo "${color_process}----------${color_reset}" &&

echo "${color_process}[Running]${color_reset} Git checks." &&
gitChecks &&

echo "${color_process}[Running]${color_reset} NPM prepare script." &&
runPrepare &&

echo "${color_process}[Running]${color_reset} Bumping package version." &&
npm version ${1:-patch} &&

echo "${color_process}[Running]${color_reset} Publishing new package version." &&
npm publish &&

echo "${color_process}[Running]${color_reset} Pushing commits and tags to GitHub." &&
git push --follow-tags &&

echo &&
echo "${color_success}[Done] ${color_success}Release info${color_reset}" &&
echo "${color_success}--------------------${color_reset}" &&
releaseInfo &&
echo

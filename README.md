# pmm

[![npm](https://img.shields.io/npm/v/pmm.svg)](https://www.npmjs.com/package/pmm)
[![license](https://img.shields.io/npm/l/pmm.svg)](http://opensource.org/licenses/MIT)
[![github-issues](https://img.shields.io/github/issues/d4rkr00t/pmm.svg)](https://github.com/d4rkr00t/pmm/issues)
[![commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](http://commitizen.github.io/cz-cli/)

Better npm publish


## Features
* Ensures the working directory is clean and that there are no unpulled changes
* Runs your checks before publishing via npm scripts
* Bumps the package version and creates git tag
* Publishes new version to npm
* Pushes commits and tags to GitHub

## Install

```sh
npm install -g pmm
```

## Usage

```sh
pmm [<newversion> | major | minor | patch | premajor | preminor | prepatch | prerelease]
# default: patch
```

If you define **"prepare"** script in **package.json** it will be run before every publish.
Also you can use **prepublish** or **preversion** npm scripts to run checks before publishing.

## Author

Stanislav Sysoev d4rkr00t@gmail.com https://github.com/d4rkr00t

## License

- **MIT** : http://opensource.org/licenses/MIT

## Contributing

Contributing are highly welcome! This repos is commitizen friendly — please read about it [here](http://commitizen.github.io/cz-cli/).

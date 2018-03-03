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
* Confirm before publishing
* Verbose release info after publishing

![publish my module](https://cloud.githubusercontent.com/assets/200119/12373470/2def0ec8-bc8b-11e5-88c9-b6006c8b8848.png)

## Install

```sh
npm install -g pmm
```

## Usage

```sh
pmm [<newversion> | major | minor | patch | premajor | preminor | prepatch | prerelease] [<npmtag>]
# default version: patch
# default npm tag: latest
```

If you define **"pmm:prepare"** script in **package.json** it will be run before every publish. Also you can use **prepublish** or **preversion** npm scripts to run checks before publishing.

* Read more about [npm tags](https://docs.npmjs.com/cli/tag).
* Read more about [npm verisons](https://docs.npmjs.com/cli/version).

## Author

Stanislav Sysoev d4rkr00t@gmail.com https://github.com/d4rkr00t

## License

- **MIT** : http://opensource.org/licenses/MIT

## Contributing

Contributing are highly welcome! This repos is commitizen friendly — please read about it [here](http://commitizen.github.io/cz-cli/).

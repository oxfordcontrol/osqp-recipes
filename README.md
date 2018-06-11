# OSQP Conda Recipes builder

[![Build Status](https://travis-ci.org/oxfordcontrol/osqp-recipes.svg?branch=master)](https://travis-ci.org/oxfordcontrol/osqp-recipes)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/bstellato/osqp-recipes?branch=master&svg=true)](https://ci.appveyor.com/project/bstellato/osqp-recipes)

This repository builds conda recipes and uploads them automatically to anaconda.

## Release number

To change a release number you need to edit *both* `package/version` and `source/git_rev` to match the same release number. For example

```yaml
package:
  ...
  version: "0.3.1"

source:
  ...
  git_rev: v0.3.1
```


## Triggering a build

You can trigger a build by:

-   making a commit to the `osqp-recipes` repository (e.g. with
    `git commit --allow-empty`); or
-   clicking on the circular arrow icon towards the top right of the
    travis-ci page, to rerun the previous build.

In general, it is better to trigger a build with a commit, because this
makes a new set of build products and logs, keeping the old ones for
reference. Keeping the old build logs helps us keep track of previous
problems and successful builds.

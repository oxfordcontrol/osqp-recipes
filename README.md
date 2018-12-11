# OSQP Conda Recipes builder

[![Build Status](https://travis-ci.org/oxfordcontrol/osqp-recipes.svg?branch=master)](https://travis-ci.org/oxfordcontrol/osqp-recipes)
[![Build status](https://ci.appveyor.com/api/projects/status/2a9tm8w94te1u9iy/branch/master?svg=true)](https://ci.appveyor.com/project/bstellato/osqp-recipes/branch/master)

This repository builds conda recipes and uploads them automatically to anaconda.

## Release number

To change a release number you need to edit the file `conda_recipe/osqp/meta.yaml` at the line

```yaml
{% set version = "0.5.0" %}
```

to set the right version number.


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

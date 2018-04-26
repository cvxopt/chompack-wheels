# CHOMPACK wheels for macOS, Linux, and Windows

This repository automates [CHOMPACK](https://github.com/cvxopt/chompack) wheel building using [multibuild](https://github.com/matthew-brett/multibuild), [Travis CI](https://travis-ci.org/cvxopt/chompack-wheels), and [AppVeyor](https://ci.appveyor.com/project/martinandersen/chompack-wheels).

[![Build Status](https://travis-ci.org/cvxopt/chompack-wheels.svg?branch=master)](https://travis-ci.org/cvxopt/chompack-wheels)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/martinandersen/chompack-wheels?branch=master&svg=true)](https://ci.appveyor.com/project/martinandersen/chompack-wheels)

## Copyright and license

CHOMPACK is free software; you can redistribute it and/or modify it under the terms of the [GNU General Public License](http://www.gnu.org/licenses/gpl-3.0.html) as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.

CHOMPACK is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the [GNU General Public License](http://www.gnu.org/licenses/gpl-3.0.html) for more details.

## What is being built?

We currently build the following:

- Self-contained wheels for macOS and Linux ([manylinux1](https://www.python.org/dev/peps/pep-0513/)). Linux wheels are linked against [OpenBLAS](http://www.openblas.net) and macOS wheels are linked against Accellerate.
- Wheels for Windows (x86-64 only). The wheels are linked against MKL and are *not self-contained*: MKL must be installed (e.g., via Pip or Conda) for these wheels to work.

The build process performs the following steps:

- downloads/builds OpenBLAS (Linux)
- builds CHOMPACK wheel, linking against dependencies
- processes wheel using [delocate](https://github.com/matthew-brett/delocate) (macOS) or [auditwheel](https://github.com/pypa/auditwheel) (Linux) to include dependencies in wheel
- uploads wheel to a Rackspace container (macOS/Linux) or to [AppVeyor cloud storage](https://ci.appveyor.com/project/martinandersen/chompack-wheels/history) (Windows)

## Triggering a build

The build process is triggered by making a commit to the `chompack-wheels` repository. The variable `BUILD_COMMIT` in `.travis.yml` and `.appveyor.yml` specifies which commit from the CHOMPACK repository to build.

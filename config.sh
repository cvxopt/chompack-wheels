# Define custom utilities
# Test for OSX with [ -n "$IS_OSX" ]

TESTS_DIR="$(pwd)/chompack/tests"

function pre_build {
    # Any stuff that you need to do before you start building the wheels
    # Runs in the root directory of this repository.

    # Build dependencies
    if [ -z "$IS_OSX" ]; then
        build_openblas
        export CVXOPT_BLAS_LIB=openblas
        export CVXOPT_LAPACK_LIB=openblas
        export CVXOPT_BLAS_LIB_DIR=${BUILD_PREFIX}/lib
    fi
}

function run_tests {
    # Runs tests on installed distribution from an empty directory
    python --version
    python -c 'from chompack import *'
    pytest ${TESTS_DIR}
}

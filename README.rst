Ravi Distribution Dependencies
==============================

This repository contains external dependencies used by `Ravi <http://ravilang.org>`_ Libraries (under development). 

Installing on Windows
---------------------
A number of pre-built 64-bit DLLs are supplied for Windows - these include:

* BLAS (both reference and OpenBLAS implementations)
* LAPACK

Run CMake as follows::

  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=c:\ravi -G "Visual Studio 14 Win64" ..

Then open the solution in Visual Studio 2015 and build the 'INSTALL' target.

Installing on Ubuntu
--------------------

For information on how to install and configure BLAS and LAPACK refer to information at `DebianScience Wiki  <http://wiki.debian.org/DebianScience/LinearAlgebraLibraries>`_.

Install OpenBLAS as follows::

  sudo apt-get install libopenblas-dev

Then configure as follows::

  sudo update-alternatives --config libblas.so.3
  sudo update-alternatives --config liblapack.so.3

Run CMake as follows::

  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=$HOME/ravi ..

At present no build is needed. The CMake script merely checks for pre-requisites such as BLAS and LAPACK libraries.

Installing on Mac OSX Yosemite
------------------------------

Run CMake as follows::

  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=$HOME/ravi ..

At present no build is needed. The CMake script merely checks for pre-requisites such as BLAS and LAPACK libraries.



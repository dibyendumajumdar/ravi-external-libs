Ravi Distribution Dependencies
==============================

This repository contains external dependencies used by `Ravi <http://ravilang.org>`_ Libraries (under development). 

Installing on Windows
---------------------
A number of pre-built 64-bit DLLs are supplied for Windows - these include:

* BLAS (both reference and OpenBLAS implementations)
* LAPACK
* GNU Scientific Library (GSL)

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
  sudo apt-get install libgsl0-dev

Configure OpenBLAS to be the default BLAS as follows::

  sudo update-alternatives --config libblas.so.3
  sudo update-alternatives --config liblapack.so.3

Run CMake as follows::

  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=$HOME/ravi ..
  make install

The CMake script checks for pre-requisites such as BLAS, LAPACK and GSL libraries.
The ``make install`` instruction copies scripts to ``$HOME/ravi/bin``.

Installing on Mac OSX Yosemite
------------------------------

Run CMake as follows::

  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=$HOME/ravi ..

At present no build is needed. The CMake script merely checks for pre-requisites such as BLAS and LAPACK libraries.


How Reference LAPACK was built on Win64
---------------------------------------
You will need mingw64. I installed SEH / win32 threads option - using the mingw-64 installer `downloaded from sourceforge <http://sourceforge.net/projects/mingw-w64/files/latest/download?source=files>`_. 

The above distribution of MinGW is needed for the GNU Fortran compiler and library dependencies of LAPACK; not all distributions include the Fortran compilers. I also tried building with msys2 GNU toolchain but faced problems getting CMake to work correctly with that version.

To build LAPACK on Win64 platforms, follow these steps.
I used Visual Studio 2015. Make sure that the bin folder of MinGW and ``cmake`` are in the ``PATH``. 

1. Open command prompt
2. Run ``cmake-gui``.
3. Point CMake to your LAPACK folder as the source code folder 
4. Point to a new folder where you want the build to be (not the same is better) 
5. Click configure, check the install path if you want to have the libraries and includes in a particular location. I set this to ``c:\lapack``
6. Choose MinGW Makefiles. 
7. Click "Specify native compilers" and indicate the path to the Mingw compilers. On my machine, it was ``C:\mingw-w64\mingw64\bin\gfortran.exe``
8. Set the ``BUILD_SHARED_LIBS`` option to ON.
9. Set the ``CMAKE_GNUtoMS`` option to ON.
10. I also switched off options to build complex functions and the tests.
11. Click again configure - everything will becomes white
12. Click generate; this will create the mingw build.
13. Close `cmake-gui`.
14. Open the build folder in the command prompt and run ``mingw32-make.exe``.
15. Install to target folder by running ``mingw32-make install``.
16. Your libs will be in the lib folder, the dlls will in the bin folder. Copy the *.lib and *.dll files to your destination folder.


Notes regarding OpenBLAS 
------------------------
The supplied OpenBLAS distribution was obtained from OpenBLAS `sourceforge site <https://sourceforge.net/projects/openblas/files/>`_. The supplied version is `0.2.15 Win64 int32 <http://sourceforge.net/projects/openblas/files/v0.2.15/OpenBLAS-v0.2.15-Win64-int32.zip/download>`_. This version uses 32-bit integers as BLASINT type which is needed for compatibility with the reference LAPACK build.

The OpenBLAS distribution contains an import library named ``libopenblas.dll.a`` - I copied this to ``libopenblas.lib``. 


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



How Reference LAPACK was built on Win64
---------------------------------------
You will need mingw64. I installed SEH / win32 threads option - using the mingw-64 installer `downloaded from sourceforge <http://sourceforge.net/projects/mingw-w64/files/latest/download?source=files>`_. 

The above distrbution of MinGW is needed for Fortran compiler and library dependencies of LAPACK; not all distributions include the Fortran compilers.

To build LAPACK on Win64 platforms, follow these steps.
I used Visual Studio 2013, but VS2015 should be fine as well. Make sure that the bin folder of MinGW and ``cmake`` are in the ``PATH``. 

1. Open command prompt
2. Run `cmake-gui`.
3. Point CMake to your LAPCAK folder as the source code folder 
4. Point to a new folder where you want the build to be (not the same is better) 
5. Click configure, check the install path if you want to have the libraries and includes in a particular location. I set this to ``c:\lapack``
6. Choose MinGW Makefiles. 
7. Click "Specify native compilers" and indicate the path to the Mingw compilers. On my machine, it was ``C:/MinGW/bin/gfortran.exe``
8. Set the ``BUILD_SHARED_LIBS`` option to ON.
9. Set the ``CMAKE_GNUtoMS`` option to ON.
10. Click again configure - everything will becomes white
11. You may see a variable ``VCVARSAMD64`` which is not properly set. Edit this variable as follows::
    
      C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\bin\x86_amd64\vcvarsx86_amd64.bat

    Note on for VS2015 this could be a different file.
12. Click generate; this will create the mingw build.
13. Close `cmake-gui`.
14. Run ``C:/MinGW/bin/mingw32-make.exe``.
15. Your libs will be in the lib folder, the dlls will in the bin folder. Copy the *.lib and *.dll files to your destination folder.


Notes regarding OpenBLAS 
------------------------
The supplied OpenBLAS distribution was obtained from OpenBLAS `sourceforge site <https://sourceforge.net/projects/openblas/files/>`_. The supplied version is `0.2.14 Win64 int32 <http://sourceforge.net/projects/openblas/files/v0.2.14/OpenBLAS-v0.2.14-Win64-int32.zip/download>`_. This version uses 32-bit integers as BLASINT type which is needed for compatibility with the reference LAPACK build.

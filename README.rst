Ravi Distribution Dependencies
==============================

This repository contains external dependencies used by `Ravi <http://ravilang.org>`_. 

Installing on Windows
---------------------

Run CMake as follows::

  mkdr build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=c:\ravi -G "Visual Studio 14 Win64" ..

Then open the solution in Visual Studio 2015 and build the 'INSTALL' target. 
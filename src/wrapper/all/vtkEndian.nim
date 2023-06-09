## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkEndian.h.in
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================

##  Byte order.
##  All compilers that support Mac OS X define either __BIG_ENDIAN__ or
##    __LITTLE_ENDIAN__ to match the endianness of the architecture being
##    compiled for. This is not necessarily the same as the architecture of the
##    machine doing the building. In order to support Universal Binaries on
##    Mac OS X, we prefer those defines to decide the endianness.
##    On other platforms we use the result of the TRY_RUN.

when not defined(__APPLE__):
  ##  #undef VTK_WORDS_BIGENDIAN
elif defined(__BIG_ENDIAN__):
  discard
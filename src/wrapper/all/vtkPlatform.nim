## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPlatform.h.in
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

##  Whether we require large files support.

##  The maximum length of a file name in bytes including the
##  terminating null.
##

when defined(PATH_MAX):        ##  Usually defined on Windows
  const
    VTK_MAXPATH* = PATH_MAX
elif defined(MAXPATHLEN):      ##  Usually defined on linux
  const
    VTK_MAXPATH* = MAXPATHLEN
else:
  const
    VTK_MAXPATH* = 32767
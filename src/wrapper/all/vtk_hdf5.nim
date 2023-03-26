## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtk_hdf5.h
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

##  Use the hdf5 library configured for VTK.

const
  VTK_MODULE_USE_EXTERNAL_vtkhdf5* = 1
  H5_USE_110_API* = true

when VTK_MODULE_USE_EXTERNAL_vtkhdf5:
  const
    vtkhdf5_is_parallel* = 0
  when vtkhdf5_is_parallel:
    discard
else:
  discard
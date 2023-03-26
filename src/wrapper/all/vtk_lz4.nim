## =========================================================================
##
##   Program:   ParaView
##   Module:    vtk_lz4.h.in
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================

##  Use the lz4 library configured for VTK.

const
  VTK_MODULE_USE_EXTERNAL_vtklz4* = 1

when VTK_MODULE_USE_EXTERNAL_vtklz4:
  discard
else:
  discard
## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtk_cli11_forward.h
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

##  VTK_MODULE_USE_EXTERNAL_VTK_cli11 is defined in this header,
##  so include it.

when VTK_MODULE_USE_EXTERNAL_VTK_cli11:
  ##  using external CLI11, no mangling needed.
else:
  ##  CLI may get already defined if `vtk_cli11.h` was included,
  ##  hence this check to avoid redefinition.
  when not defined(CLI):
    ##  mangle the namespace.
    const
      CLI* = VTK_CLI
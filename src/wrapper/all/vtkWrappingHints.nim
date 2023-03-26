## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkWrappingHints.h
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
## *
##  @class   vtkWrappingHints
##  @brief   hint macros for wrappers
##
##  The macros defined in this file can be used to supply hints for the
##  wrappers.
##

## !!!Ignored construct:  # vtkWrappingHints_h [NewLine] # vtkWrappingHints_h [NewLine] # __VTK_WRAP__ [NewLine] # [NewLine]  Exclude a method or class from wrapping # VTK_WRAPEXCLUDE vtk::wrapexclude [NewLine]  The return value points to a newly-created VTK object. # VTK_NEWINSTANCE vtk::newinstance [NewLine]  The parameter is a pointer to a zerocopy buffer. # VTK_ZEROCOPY vtk::zerocopy [NewLine]  The parameter is a path on the filesystem. # VTK_FILEPATH vtk::filepath [NewLine]  Set preconditions for a function # VTK_EXPECTS ( x ) vtk::expects(x) [NewLine]  Set size hint for parameter or return value # VTK_SIZEHINT ( ... ) vtk::sizehint(__VA_ARGS__) [NewLine] # [NewLine] # [NewLine] # VTK_WRAPEXCLUDE [NewLine] # VTK_NEWINSTANCE [NewLine] # VTK_ZEROCOPY [NewLine] # VTK_FILEPATH [NewLine] # VTK_EXPECTS ( x ) [NewLine] # VTK_SIZEHINT ( ... ) [NewLine] # [NewLine] # [NewLine]  VTK-HeaderTest-Exclude: vtkWrappingHints.h
## Error: did not expect vtk::expects(x)!!!

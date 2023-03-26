## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParseAttributes.h
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
##  This header defines attribute specifiers for use by the wrappers.
##  They are stored in a 32-bit unsigned int (see vtkParseData.h).
##

const
  VTK_PARSE_NEWINSTANCE* = 0x00000001
  VTK_PARSE_ZEROCOPY* = 0x00000002
  VTK_PARSE_FILEPATH* = 0x00000004
  VTK_PARSE_WRAPEXCLUDE* = 0x00000010
  VTK_PARSE_DEPRECATED* = 0x00000020

##  VTK-HeaderTest-Exclude: vtkParseAttributes.h

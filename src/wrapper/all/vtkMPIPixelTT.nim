## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMPIPixelTT.h
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

## !!!Ignored construct:  # vtkMPIPixelTT_h [NewLine] # vtkMPIPixelTT_h [NewLine] # vtkMPI.h [NewLine] # vtkType.h  for vtk types [NewLine]  Description:
##  Traits class for converting from vtk data type enum
##  to the appropriate C or MPI datatype. template < typename T > [end of template] class vtkMPIPixelTT ;
## Error: did not expect > [end of template]!!!

## !!!Ignored construct:  # vtkMPIPixelTTMacro1 ( _ctype ) template < > [end of template] class vtkMPIPixelTT < void > { public : static MPI_Datatype MPIType ; static int VTKType ; } ;
## Error: did not expect > [end of template]!!!

vtkMPIPixelTTMacro1(char)
vtkMPIPixelTTMacro1(signed, char)
vtkMPIPixelTTMacro1(unsigned, char)
vtkMPIPixelTTMacro1(short)
vtkMPIPixelTTMacro1(unsigned, short)
vtkMPIPixelTTMacro1(int)
vtkMPIPixelTTMacro1(unsigned, int)
vtkMPIPixelTTMacro1(long)
vtkMPIPixelTTMacro1(unsigned, long)
vtkMPIPixelTTMacro1(float)
vtkMPIPixelTTMacro1(double)
## ignored statement

vtkMPIPixelTTMacro1(unsigned, long, long)
##  VTK-HeaderTest-Exclude: vtkMPIPixelTT.h

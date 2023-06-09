/*=========================================================================

  Program:   Visualization Toolkit
  Module:    vtk_xdmf2.h

  Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
  All rights reserved.
  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.

     This software is distributed WITHOUT ANY WARRANTY; without even
     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
     PURPOSE.  See the above copyright notice for more information.

=========================================================================*/
#ifndef vtk_xdmf3_h
#define vtk_xdmf3_h

/* Use the xdmf3 library configured for VTK.  */
#define VTK_MODULE_USE_EXTERNAL_vtkxdmf3 0

#ifdef VTK_USE_SYSTEM_XDMF3
#else
#define VTKXDMF3_HEADER(x)  <vtkxdmf3/x>
#endif

#endif

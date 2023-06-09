/*=========================================================================

  Program:   Visualization Toolkit
  Module:    vtk_pugixml.h.in

  Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
  All rights reserved.
  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.

     This software is distributed WITHOUT ANY WARRANTY; without even
     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
     PURPOSE.  See the above copyright notice for more information.

=========================================================================*/
#ifndef vtk_pugixml_h
#define vtk_pugixml_h

/* Use the pugixml library configured for VTK.  */
#define VTK_MODULE_USE_EXTERNAL_vtkpugixml 1

#if VTK_MODULE_USE_EXTERNAL_vtkpugixml
# include <pugixml.hpp>
#else
# include <vtkpugixml/src/pugixml.hpp>
#endif

#endif

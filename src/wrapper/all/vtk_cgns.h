/*=========================================================================

  Program:   Visualization Toolkit
  Module:    vtk_cgns.h

  Copyright (c) Kitware, Inc.
  All rights reserved.
  See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.

     This software is distributed WITHOUT ANY WARRANTY; without even
     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
     PURPOSE.  See the above copyright notice for more information.

=========================================================================*/
#ifndef vtk_cgns_h
#define vtk_cgns_h

/* Use the cgns library configured for VTK.  */
#define VTK_MODULE_USE_EXTERNAL_VTK_cgns 1

/**
 * When including an CGNS header in VTK code, use the following form:
 *
 *   // .clang-format off
 *   #include VTK_CGNS(cgnslib.h)
 *   // .clang-format on
 *
 * Note, the clang-format sentinels are needed to avoid incorrect formatting.
 */
#if VTK_MODULE_USE_EXTERNAL_VTK_cgns
# define VTK_CGNS(x) <x>
#else
# define VTK_CGNS(x) <vtkcgns/src/x>
#endif

#endif

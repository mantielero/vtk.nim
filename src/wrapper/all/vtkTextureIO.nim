## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTextureIO.h
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
##  @class   vtkTextureIO
##  @brief   A small collection of I/O routines that write vtkTextureObject
##  to disk for debugging.
##

## !!!Ignored construct:  # vtkTextureIO_h [NewLine] # vtkTextureIO_h [NewLine] # vtkPixelExtent.h  for pixel extent # vtkRenderingLICOpenGL2Module.h  for export [NewLine]  included vtkSystemIncludes in vtkPixelExtent # < cstddef >  for NULL # < deque >  for deque # < string >  for string [NewLine] class vtkTextureObject ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKRENDERINGLICOPENGL2_EXPORT vtkTextureIO { public : *
##  Write to disk as image data with subset(optional) at dataset origin(optional)
##  static void Write ( VTK_FILEPATH const char * filename , vtkTextureObject * texture , const unsigned int * subset = nullptr , const double * origin = nullptr ) ; *
##  Write to disk as image data with subset(optional) at dataset origin(optional)
##  static void Write ( VTK_FILEPATH std :: string filename , vtkTextureObject * texture , const unsigned int * subset = nullptr , const double * origin = nullptr ) { Write ( filename . c_str ( ) , texture , subset , origin ) ; } *
##  Write to disk as image data with subset(optional) at dataset origin(optional)
##  static void Write ( VTK_FILEPATH std :: string filename , vtkTextureObject * texture , const vtkPixelExtent & subset , const double * origin = nullptr ) { Write ( filename . c_str ( ) , texture , subset . GetDataU ( ) , origin ) ; } *
##  Write list of subsets to disk as multiblock image data at dataset origin(optional).
##  static void Write ( VTK_FILEPATH const char * filename , vtkTextureObject * texture , const std :: deque < vtkPixelExtent > & exts , const double * origin = nullptr ) ; /@{ *
##  Write list of subsets to disk as multiblock image data at dataset origin(optional).
##  static void Write ( VTK_FILEPATH std :: string filename , vtkTextureObject * texture , const std :: deque < vtkPixelExtent > & exts , const double * origin = nullptr ) { Write ( filename . c_str ( ) , texture , exts , origin ) ; } /@} } ;
## Error: token expected: ; but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkTextureIO.h

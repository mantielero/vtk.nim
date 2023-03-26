## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPixelTransfer.h
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
##  @class   vtkPixelTransfer
##  pixel extents
##
##
##  Class to handle non-contiguous data transfers of data described
##  by pixel extents within a process. For transferring data between
##  processes see vtkPPixelTransfer.
##
##  @sa
##  vtkPixelExtent vtkPPixelTransfer
##

## !!!Ignored construct:  # vtkPixelTransfer_h [NewLine] # vtkPixelTransfer_h [NewLine] # vtkCommonDataModelModule.h  for export # vtkPixelExtent.h  for pixel extent # vtkSetGet.h  for macros # < cstring >  for memcpy [NewLine] class VTKCOMMONDATAMODEL_EXPORT vtkPixelTransfer { public : vtkPixelTransfer ( ) = default ; *
##  for memory to memory transfers. Convenience api for working
##  with vtk type enum rather than c-data types and simple extents.
##  static int Blit ( const vtkPixelExtent & ext , int nComps , int srcType , void * srcData , int destType , void * destData ) ; *
##  for memory to memory transfers. Convenience api for working
##  with vtk type enum rather than c-data types.
##  static int Blit ( const vtkPixelExtent & srcWhole , const vtkPixelExtent & srcSubset , const vtkPixelExtent & destWhole , const vtkPixelExtent & destSubset , int nSrcComps , int srcType , void * srcData , int nDestComps , int destType , void * destData ) ; *
##  for local memory to memory transfers
##  template < typename SOURCE_TYPE , typename DEST_TYPE > static int Blit ( const vtkPixelExtent & srcWhole , const vtkPixelExtent & srcSubset , const vtkPixelExtent & destWhole , const vtkPixelExtent & destSubset , int nSrcComps , SOURCE_TYPE * srcData , int nDestComps , DEST_TYPE * destData ) ; private :  distpatch helper for vtk data type enum template < typename SOURCE_TYPE > static int Blit ( const vtkPixelExtent & srcWhole , const vtkPixelExtent & srcSubset , const vtkPixelExtent & destWhole , const vtkPixelExtent & destSubset , int nSrcComps , SOURCE_TYPE * srcData , int nDestComps , int destType , void * destData ) ; } ;
## Error: token expected: ; but got: [identifier]!!!

## -----------------------------------------------------------------------------

proc Blit*(ext: vtkPixelExtent; nComps: cint; srcType: cint; srcData: pointer;
          destType: cint; destData: pointer): cint {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::Blit(@)", header: "vtkPixelTransfer.h".}
## -----------------------------------------------------------------------------

proc Blit*(srcWholeExt: vtkPixelExtent; srcExt: vtkPixelExtent;
          destWholeExt: vtkPixelExtent; destExt: vtkPixelExtent; nSrcComps: cint;
          srcData: ptr SOURCE_TYPE; nDestComps: cint; destType: cint; destData: pointer): cint {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::Blit(@)", header: "vtkPixelTransfer.h".}
## -----------------------------------------------------------------------------

proc Blit*(srcWholeExt: vtkPixelExtent; srcSubset: vtkPixelExtent;
          destWholeExt: vtkPixelExtent; destSubset: vtkPixelExtent; nSrcComps: cint;
          srcData: ptr SOURCE_TYPE; nDestComps: cint; destData: ptr DEST_TYPE): cint {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::Blit(@)", header: "vtkPixelTransfer.h".}
##  VTK-HeaderTest-Exclude: vtkPixelTransfer.h

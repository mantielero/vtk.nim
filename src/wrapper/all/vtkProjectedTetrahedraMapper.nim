## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkProjectedTetrahedraMapper.h
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
##
##  Copyright 2003 Sandia Corporation.
##  Under the terms of Contract DE-AC04-94AL85000, there is a non-exclusive
##  license for use of this work by or on behalf of the
##  U.S. Government. Redistribution and use in source and binary forms, with
##  or without modification, are permitted provided that this Notice and any
##  statement of authorship are reproduced on all copies.
##
## *
##  @class   vtkProjectedTetrahedraMapper
##  @brief   Unstructured grid volume renderer.
##
##
##  vtkProjectedTetrahedraMapper is an implementation of the classic
##  Projected Tetrahedra algorithm presented by Shirley and Tuchman in "A
##  Polygonal Approximation to Direct Scalar Volume Rendering" in Computer
##  Graphics, December 1990.
##
##  @bug
##  This mapper relies highly on the implementation of the OpenGL pipeline.
##  A typical hardware driver has lots of options and some settings can
##  cause this mapper to produce artifacts.
##
##

## !!!Ignored construct:  # vtkProjectedTetrahedraMapper_h [NewLine] # vtkProjectedTetrahedraMapper_h [NewLine] # vtkRenderingVolumeModule.h  For export macro # vtkUnstructuredGridVolumeMapper.h [NewLine] class vtkFloatArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPoints"
discard "forward decl of vtkUnsignedCharArray"
discard "forward decl of vtkVisibilitySort"
discard "forward decl of vtkVolumeProperty"
discard "forward decl of vtkRenderWindow"
## !!!Ignored construct:  class VTKRENDERINGVOLUME_EXPORT vtkProjectedTetrahedraMapper : public vtkUnstructuredGridVolumeMapper { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridVolumeMapper Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridVolumeMapper :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkProjectedTetrahedraMapper :: IsTypeOf ( type ) ; } static vtkProjectedTetrahedraMapper * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkProjectedTetrahedraMapper * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkProjectedTetrahedraMapper * NewInstance ( ) const { return vtkProjectedTetrahedraMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridVolumeMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkProjectedTetrahedraMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkProjectedTetrahedraMapper :: New ( ) ; } public : ; static vtkProjectedTetrahedraMapper * New ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; virtual void SetVisibilitySort ( vtkVisibilitySort * sort ) ; virtual vtkVisibilitySort * GetnameVisibilitySort ( ) { vtkDebugWithObjectMacro ( this , <<  returning  VisibilitySort  address  << static_cast < vtkVisibilitySort * > ( this -> VisibilitySort ) ) ; return this -> VisibilitySort ; } ; static void MapScalarsToColors ( vtkDataArray * colors , vtkVolumeProperty * property , vtkDataArray * scalars ) ; static void TransformPoints ( vtkPoints * inPoints , const float projection_mat [ 16 ] , const float modelview_mat [ 16 ] , vtkFloatArray * outPoints ) ; *
##  Return true if the rendering context provides
##  the nececessary functionality to use this class.
##  virtual bool IsSupported ( vtkRenderWindow * ) { return false ; } protected : vtkProjectedTetrahedraMapper ( ) ; ~ vtkProjectedTetrahedraMapper ( ) override ; vtkVisibilitySort * VisibilitySort ; *
##  The visibility sort will probably make a reference loop by holding a
##  reference to the input.
##  void ReportReferences ( vtkGarbageCollector * collector ) override ; private : vtkProjectedTetrahedraMapper ( const vtkProjectedTetrahedraMapper & ) = delete ; void operator = ( const vtkProjectedTetrahedraMapper & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

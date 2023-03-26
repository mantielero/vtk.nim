## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRenderedSurfaceRepresentation.h
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
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkRenderedSurfaceRepresentation
##  @brief   Displays a geometric dataset as a surface.
##
##
##  vtkRenderedSurfaceRepresentation is used to show a geometric dataset in a view.
##  The representation uses a vtkGeometryFilter to convert the dataset to
##  polygonal data (e.g. volumetric data is converted to its external surface).
##  The representation may then be added to vtkRenderView.
##

## !!!Ignored construct:  # vtkRenderedSurfaceRepresentation_h [NewLine] # vtkRenderedSurfaceRepresentation_h [NewLine] # vtkRenderedRepresentation.h [NewLine] # vtkViewsInfovisModule.h  For export macro [NewLine] class vtkActor ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkAlgorithmOutput"
discard "forward decl of vtkApplyColors"
discard "forward decl of vtkDataObject"
discard "forward decl of vtkGeometryFilter"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkRenderView"
discard "forward decl of vtkScalarsToColors"
discard "forward decl of vtkSelection"
discard "forward decl of vtkTransformFilter"
discard "forward decl of vtkView"
## !!!Ignored construct:  class VTKVIEWSINFOVIS_EXPORT vtkRenderedSurfaceRepresentation : public vtkRenderedRepresentation { public : static vtkRenderedSurfaceRepresentation * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkRenderedRepresentation Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkRenderedRepresentation :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkRenderedSurfaceRepresentation :: IsTypeOf ( type ) ; } static vtkRenderedSurfaceRepresentation * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkRenderedSurfaceRepresentation * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkRenderedSurfaceRepresentation * NewInstance ( ) const { return vtkRenderedSurfaceRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkRenderedRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRenderedSurfaceRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRenderedSurfaceRepresentation :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Sets the color array name
##  virtual void SetCellColorArrayName ( const char * arrayName ) ; virtual const char * GetCellColorArrayName ( ) { return this -> GetCellColorArrayNameInternal ( ) ; } *
##  Apply a theme to this representation.
##  void ApplyViewTheme ( vtkViewTheme * theme ) override ; protected : vtkRenderedSurfaceRepresentation ( ) ; ~ vtkRenderedSurfaceRepresentation ( ) override ; *
##  Sets the input pipeline connection to this representation.
##  int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; *
##  Performs per-render operations.
##  void PrepareForRendering ( vtkRenderView * view ) override ; *
##  Adds the representation to the view.  This is called from
##  vtkView::AddRepresentation().
##  bool AddToView ( vtkView * view ) override ; *
##  Removes the representation to the view.  This is called from
##  vtkView::RemoveRepresentation().
##  bool RemoveFromView ( vtkView * view ) override ; *
##  Convert the selection to a type appropriate for sharing with other
##  representations through vtkAnnotationLink.
##  If the selection cannot be applied to this representation, returns nullptr.
##  vtkSelection * ConvertSelection ( vtkView * view , vtkSelection * selection ) override ; /@{ *
##  Internal pipeline objects.
##  vtkTransformFilter * TransformFilter ; vtkApplyColors * ApplyColors ; vtkGeometryFilter * GeometryFilter ; vtkPolyDataMapper * Mapper ; vtkActor * Actor ; /@} virtual char * GetCellColorArrayNameInternal ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << CellColorArrayNameInternal  of  << ( this -> CellColorArrayNameInternal ? this -> CellColorArrayNameInternal : (null) ) ) ; return this -> CellColorArrayNameInternal ; } ; virtual void SetCellColorArrayNameInternal ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << CellColorArrayNameInternal  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> CellColorArrayNameInternal == nullptr && _arg == nullptr ) { return ; } if ( this -> CellColorArrayNameInternal && _arg && ( ! strcmp ( this -> CellColorArrayNameInternal , _arg ) ) ) { return ; } delete [ ] this -> CellColorArrayNameInternal ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> CellColorArrayNameInternal = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> CellColorArrayNameInternal = nullptr ; } this -> Modified ( ) ; } ; char * CellColorArrayNameInternal ; private : vtkRenderedSurfaceRepresentation ( const vtkRenderedSurfaceRepresentation & ) = delete ; void operator = ( const vtkRenderedSurfaceRepresentation & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

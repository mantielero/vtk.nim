## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkResliceCursorLineRepresentation.h
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
##  @class   vtkResliceCursorThickLineRepresentation
##  @brief   represents a thick slab of the reslice cursor widget
##
##  This class respresents a thick reslice cursor, that can be used to
##  perform interactive thick slab MPR's through data. The class internally
##  uses vtkImageSlabReslice to do its reslicing. The slab thickness is set
##  interactively from the widget. The slab resolution (ie the number of
##  blend points) is set as the minimum spacing along any dimension from
##  the dataset.
##  @sa
##  vtkImageSlabReslice vtkResliceCursorLineRepresentation vtkResliceCursorWidget
##

## !!!Ignored construct:  # vtkResliceCursorThickLineRepresentation_h [NewLine] # vtkResliceCursorThickLineRepresentation_h [NewLine] # vtkInteractionWidgetsModule.h  For export macro # vtkResliceCursorLineRepresentation.h [NewLine] class VTKINTERACTIONWIDGETS_EXPORT vtkResliceCursorThickLineRepresentation : public vtkResliceCursorLineRepresentation { public : *
##  Instantiate the class.
##  static vtkResliceCursorThickLineRepresentation * New ( ) ; /@{ *
##  Standard VTK methods.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkResliceCursorLineRepresentation Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkResliceCursorLineRepresentation :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkResliceCursorThickLineRepresentation :: IsTypeOf ( type ) ; } static vtkResliceCursorThickLineRepresentation * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkResliceCursorThickLineRepresentation * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkResliceCursorThickLineRepresentation * NewInstance ( ) const { return vtkResliceCursorThickLineRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkResliceCursorLineRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkResliceCursorThickLineRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkResliceCursorThickLineRepresentation :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  INTERNAL - Do not use
##  Create the thick reformat class. This overrides the superclass
##  implementation and creates a vtkImageSlabReslice instead of a
##  vtkImageReslice.
##  void CreateDefaultResliceAlgorithm ( ) override ; *
##  INTERNAL - Do not use
##  Reslice parameters which are set from vtkResliceCursorWidget based on
##  user interactions.
##  void SetResliceParameters ( double outputSpacingX , double outputSpacingY , int extentX , int extentY ) override ; protected : vtkResliceCursorThickLineRepresentation ( ) ; ~ vtkResliceCursorThickLineRepresentation ( ) override ; private : vtkResliceCursorThickLineRepresentation ( const vtkResliceCursorThickLineRepresentation & ) = delete ; void operator = ( const vtkResliceCursorThickLineRepresentation & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

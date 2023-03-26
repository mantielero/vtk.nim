## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVersion.h
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
##  @class   vtkVersion
##  @brief   Versioning class for vtk
##
##  Holds methods for defining/determining the current vtk version
##  (major, minor, build).
##
##  @warning
##  This file will change frequently to update the VTKSourceVersion which
##  timestamps a particular source release.
##

## !!!Ignored construct:  # vtkVersion_h [NewLine] # vtkVersion_h [NewLine] # vtkCommonCoreModule.h  For export macro # vtkObject.h [NewLine] # vtkVersionMacros.h  For version macros [NewLine] class VTKCOMMONCORE_EXPORT vtkVersion : public vtkObject { public : static vtkVersion * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkVersion :: IsTypeOf ( type ) ; } static vtkVersion * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkVersion * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkVersion * NewInstance ( ) const { return vtkVersion :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVersion :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVersion :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Return the version of vtk this object is a part of.
##  A variety of methods are included. GetVTKSourceVersion returns a string
##  with an identifier which timestamps a particular source tree.
##  static const char * GetVTKVersion ( ) { return VTK_VERSION ; } static const char * GetVTKVersionFull ( ) ; static int GetVTKMajorVersion ( ) { return VTK_MAJOR_VERSION ; } static int GetVTKMinorVersion ( ) { return VTK_MINOR_VERSION ; } static int GetVTKBuildVersion ( ) { return VTK_BUILD_VERSION ; } static const char * GetVTKSourceVersion ( ) { return VTK_SOURCE_VERSION ; } protected : vtkVersion ( ) = default ;  ensure constructor/destructor protected ~ vtkVersion ( ) override = default ; private : vtkVersion ( const vtkVersion & ) = delete ; void operator = ( const vtkVersion & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  extern C { VTKCOMMONCORE_EXPORT const char * GetVTKVersion ( ) ; } # [NewLine]
## Error: identifier expected, but got: {!!!

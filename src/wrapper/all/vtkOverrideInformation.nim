## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOverrideInformation.h
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
##  @class   vtkOverrideInformation
##  @brief   Factory object override information
##
##  vtkOverrideInformation is used to represent the information about
##  a class which is overridden in a vtkObjectFactory.
##
##

## !!!Ignored construct:  # vtkOverrideInformation_h [NewLine] # vtkOverrideInformation_h [NewLine] # vtkCommonCoreModule.h  For export macro # vtkObject.h [NewLine] class vtkObjectFactory ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKCOMMONCORE_EXPORT vtkOverrideInformation : public vtkObject { public : static vtkOverrideInformation * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkOverrideInformation :: IsTypeOf ( type ) ; } static vtkOverrideInformation * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkOverrideInformation * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkOverrideInformation * NewInstance ( ) const { return vtkOverrideInformation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOverrideInformation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOverrideInformation :: New ( ) ; } public : ; *
##  Print ObjectFactor to stream.
##  void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Returns the name of the class being overridden.  For example,
##  if you had a factory that provided an override for
##  vtkVertex, then this function would return "vtkVertex"
##  const char * GetClassOverrideName ( ) { return this -> ClassOverrideName ; } *
##  Returns the name of the class that will override the class.
##  For example, if you had a factory that provided an override for
##  vtkVertex called vtkMyVertex, then this would return "vtkMyVertex"
##  const char * GetClassOverrideWithName ( ) { return this -> ClassOverrideWithName ; } *
##  Return a human readable or GUI displayable description of this
##  override.
##  const char * GetDescription ( ) { return this -> Description ; } *
##  Return the specific object factory that this override occurs in.
##  vtkObjectFactory * GetObjectFactory ( ) { return this -> ObjectFactory ; } /@{ *
##  Set the class override name
##  virtual void SetClassOverrideName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ClassOverrideName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> ClassOverrideName == nullptr && _arg == nullptr ) { return ; } if ( this -> ClassOverrideName && _arg && ( ! strcmp ( this -> ClassOverrideName , _arg ) ) ) { return ; } delete [ ] this -> ClassOverrideName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> ClassOverrideName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> ClassOverrideName = nullptr ; } this -> Modified ( ) ; } ; *
##  Set the class override with name
##  virtual void SetClassOverrideNameClassOverrideWithName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ClassOverrideWithName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> ClassOverrideWithName == nullptr && _arg == nullptr ) { return ; } if ( this -> ClassOverrideWithName && _arg && ( ! strcmp ( this -> ClassOverrideWithName , _arg ) ) ) { return ; } delete [ ] this -> ClassOverrideWithName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> ClassOverrideWithName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> ClassOverrideWithName = nullptr ; } this -> Modified ( ) ; } ; *
##  Set the description
##  virtual void SetClassOverrideNameClassOverrideWithNameDescription ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Description  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> Description == nullptr && _arg == nullptr ) { return ; } if ( this -> Description && _arg && ( ! strcmp ( this -> Description , _arg ) ) ) { return ; } delete [ ] this -> Description ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> Description = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> Description = nullptr ; } this -> Modified ( ) ; } ; /@} protected : virtual void SetObjectFactory ( vtkObjectFactory * ) ; private : vtkOverrideInformation ( ) ; ~ vtkOverrideInformation ( ) override ;  allow the object factory to set the values in this
##  class, but only the object factory friend class vtkObjectFactory ; char * ClassOverrideName ; char * ClassOverrideWithName ; char * Description ; vtkObjectFactory * ObjectFactory ; private : vtkOverrideInformation ( const vtkOverrideInformation & ) = delete ; void operator = ( const vtkOverrideInformation & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

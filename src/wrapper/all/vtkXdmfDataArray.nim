## *****************************************************************
##                                XDMF
##                    eXtensible Data Model and Format
##
##   Id : Id
##
##   Author:
##      Jerry A. Clarke
##      clarke@arl.army.mil
##      US Army Research Laboratory
##      Aberdeen Proving Ground, MD
##
##      Copyright @ 2002 US Army Research Laboratory
##      All Rights Reserved
##      See Copyright.txt or http://www.arl.hpc.mil/ice for details
##
##      This software is distributed WITHOUT ANY WARRANTY; without
##      even the implied warranty of MERCHANTABILITY or FITNESS
##      FOR A PARTICULAR PURPOSE.  See the above copyright notice
##      for more information.
##
## *****************************************************************

## !!!Ignored construct:  # vtkXdmfDataArray_h [NewLine] # vtkXdmfDataArray_h [NewLine] # vtkIOXdmf2Module.h  For export macro # vtkObject.h [NewLine] class vtkDataArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of XdmfArray"
## !!!Ignored construct:  class VTKIOXDMF2_EXPORT vtkXdmfDataArray : public vtkObject { public : static vtkXdmfDataArray * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkXdmfDataArray :: IsTypeOf ( type ) ; } static vtkXdmfDataArray * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkXdmfDataArray * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkXdmfDataArray * NewInstance ( ) const { return vtkXdmfDataArray :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXdmfDataArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXdmfDataArray :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; vtkDataArray * FromArray ( void ) ; char * ToArray ( void ) ; vtkDataArray * FromXdmfArray ( char * ArrayName = nullptr , int CopyShape = 1 , int rank = 1 , int Components = 1 , int MakeCopy = 1 ) ; char * ToXdmfArray ( vtkDataArray * DataArray = nullptr , int CopyShape = 1 ) ; void SetArray ( char * TagName ) ; char * GetArray ( void ) ; void SetVtkArray ( vtkDataArray * array ) ; vtkDataArray * GetVtkArray ( void ) ; protected : vtkXdmfDataArray ( ) ; private : vtkDataArray * vtkArray ; xdmf2 :: XdmfArray * Array ; vtkXdmfDataArray ( const vtkXdmfDataArray & ) = delete ; void operator = ( const vtkXdmfDataArray & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

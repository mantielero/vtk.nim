## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLDataObjectWriter.h
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
##  @class   vtkXMLDataObjectWriter
##  @brief   Write any type of VTK XML file.
##
##  vtkXMLDataObjectWriter is a wrapper around the VTK XML file format
##  writers.  Given an input vtkDataSet, the correct writer is
##  automatically selected based on the type of input.
##
##  @sa
##  vtkXMLImageDataWriter vtkXMLStructuredGridWriter
##  vtkXMLRectilinearGridWriter vtkXMLPolyDataWriter
##  vtkXMLUnstructuredGridWriter
##

## !!!Ignored construct:  # vtkXMLDataObjectWriter_h [NewLine] # vtkXMLDataObjectWriter_h [NewLine] # vtkIOXMLModule.h  For export macro # vtkXMLWriter.h [NewLine] class vtkCallbackCommand ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOXML_EXPORT vtkXMLDataObjectWriter : public vtkXMLWriter { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkXMLWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkXMLWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkXMLDataObjectWriter :: IsTypeOf ( type ) ; } static vtkXMLDataObjectWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkXMLDataObjectWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkXMLDataObjectWriter * NewInstance ( ) const { return vtkXMLDataObjectWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLDataObjectWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLDataObjectWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkXMLDataObjectWriter * New ( ) ; *
##  Get/Set the writer's input.
##  vtkDataSet * GetInput ( ) ; *
##  Creates a writer for the given dataset type. May return nullptr for
##  unsupported/unrecognized dataset types. Returns a new instance. The caller
##  is responsible of calling vtkObject::Delete() or vtkObject::UnRegister() on
##  it when done.
##  static vtkXMLWriter * NewWriter ( int dataset_type ) ; protected : vtkXMLDataObjectWriter ( ) ; ~ vtkXMLDataObjectWriter ( ) override ;  see algorithm for more info int FillInputPortInformation ( int port , vtkInformation * info ) override ;  Override writing method from superclass. int WriteInternal ( ) override ;  Dummies to satisfy pure virtuals from superclass. const char * GetDataSetName ( ) override ; const char * GetDefaultFileExtension ( ) override ;  Callback registered with the InternalProgressObserver. static void ProgressCallbackFunction ( vtkObject * , unsigned long , void * , void * ) ;  Progress callback from internal writer. virtual void ProgressCallback ( vtkAlgorithm * w ) ;  The observer to report progress from the internal writer. vtkCallbackCommand * InternalProgressObserver ; private : vtkXMLDataObjectWriter ( const vtkXMLDataObjectWriter & ) = delete ; void operator = ( const vtkXMLDataObjectWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

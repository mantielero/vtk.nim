## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMNITagPointWriter.h
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
## =========================================================================
##
## Copyright (c) 2006 Atamai, Inc.
##
## Use, modification and redistribution of the software, in source or
## binary forms, are permitted provided that the following terms and
## conditions are met:
##
## 1) Redistribution of the source code, in verbatim or modified
##    form, must retain the above copyright notice, this license,
##    the following disclaimer, and any notices that refer to this
##    license and/or the following disclaimer.
##
## 2) Redistribution in binary form must include the above copyright
##    notice, a copy of this license and the following disclaimer
##    in the documentation or with other materials provided with the
##    distribution.
##
## 3) Modified copies of the source code must be clearly marked as such,
##    and must not be misrepresented as verbatim copies of the source code.
##
## THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE SOFTWARE "AS IS"
## WITHOUT EXPRESSED OR IMPLIED WARRANTY INCLUDING, BUT NOT LIMITED TO,
## THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
## PURPOSE.  IN NO EVENT SHALL ANY COPYRIGHT HOLDER OR OTHER PARTY WHO MAY
## MODIFY AND/OR REDISTRIBUTE THE SOFTWARE UNDER THE TERMS OF THIS LICENSE
## BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL OR CONSEQUENTIAL DAMAGES
## (INCLUDING, BUT NOT LIMITED TO, LOSS OF DATA OR DATA BECOMING INACCURATE
## OR LOSS OF PROFIT OR BUSINESS INTERRUPTION) ARISING IN ANY WAY OUT OF
## THE USE OR INABILITY TO USE THE SOFTWARE, EVEN IF ADVISED OF THE
## POSSIBILITY OF SUCH DAMAGES.
##
## =========================================================================
## *
##  @class   vtkMNITagPointWriter
##  @brief   A writer for MNI tag point files.
##
##  The MNI .tag file format is used to store tag points, for use in
##  either registration or labeling of data volumes.  This file
##  format was developed at the McConnell Brain Imaging Centre at
##  the Montreal Neurological Institute and is used by their software.
##  Tag points can be stored for either one volume or two volumes,
##  and this filter can take one or two inputs.  Alternatively, the
##  points to be written can be specified by calling SetPoints().
##  @sa
##  vtkMINCImageReader vtkMNIObjectReader vtkMNITransformReader
##  @par Thanks:
##  Thanks to David Gobbi for contributing this class to VTK.
##

## !!!Ignored construct:  # vtkMNITagPointWriter_h [NewLine] # vtkMNITagPointWriter_h [NewLine] # vtkIOMINCModule.h  For export macro # vtkWriter.h [NewLine] class vtkDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPointSet"
discard "forward decl of vtkStringArray"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkIntArray"
discard "forward decl of vtkPoints"
## !!!Ignored construct:  class VTKIOMINC_EXPORT vtkMNITagPointWriter : public vtkWriter { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMNITagPointWriter :: IsTypeOf ( type ) ; } static vtkMNITagPointWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMNITagPointWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMNITagPointWriter * NewInstance ( ) const { return vtkMNITagPointWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMNITagPointWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMNITagPointWriter :: New ( ) ; } public : ; static vtkMNITagPointWriter * New ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Get the extension for this file format.
##  virtual const char * GetFileExtensions ( ) { return .tag ; } *
##  Get the name of this file format.
##  virtual const char * GetDescriptiveName ( ) { return MNI tags ; } /@{ *
##  Set the points (unless you set them as inputs).
##  virtual void SetPoints ( int port , vtkPoints * points ) ; virtual void SetPoints ( vtkPoints * points ) { this -> SetPoints ( 0 , points ) ; } virtual vtkPoints * GetPoints ( int port ) ; virtual vtkPoints * GetPoints ( ) { return this -> GetPoints ( 0 ) ; } /@} /@{ *
##  Set the labels (unless the input PointData has an
##  array called LabelText). Labels are optional.
##  virtual void SetLabelText ( vtkStringArray * a ) ; virtual vtkStringArray * GetnameLabelText ( ) { vtkDebugWithObjectMacro ( this , <<  returning  LabelText  address  << static_cast < vtkStringArray * > ( this -> LabelText ) ) ; return this -> LabelText ; } ; /@} /@{ *
##  Set the weights (unless the input PointData has an
##  array called Weights).  Weights are optional.
##  virtual void SetWeights ( vtkDoubleArray * a ) ; virtual vtkDoubleArray * GetnameLabelTextWeights ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Weights  address  << static_cast < vtkDoubleArray * > ( this -> Weights ) ) ; return this -> Weights ; } ; /@} /@{ *
##  Set the structure ids (unless the input PointData has
##  an array called StructureIds).  These are optional.
##  virtual void SetStructureIds ( vtkIntArray * a ) ; virtual vtkIntArray * GetnameLabelTextWeightsStructureIds ( ) { vtkDebugWithObjectMacro ( this , <<  returning  StructureIds  address  << static_cast < vtkIntArray * > ( this -> StructureIds ) ) ; return this -> StructureIds ; } ; /@} /@{ *
##  Set the structure ids (unless the input PointData has
##  an array called PatientIds).  These are optional.
##  virtual void SetPatientIds ( vtkIntArray * a ) ; virtual vtkIntArray * GetnameLabelTextWeightsStructureIdsPatientIds ( ) { vtkDebugWithObjectMacro ( this , <<  returning  PatientIds  address  << static_cast < vtkIntArray * > ( this -> PatientIds ) ) ; return this -> PatientIds ; } ; /@} /@{ *
##  Set comments to be added to the file.
##  virtual void SetComments ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Comments  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> Comments == nullptr && _arg == nullptr ) { return ; } if ( this -> Comments && _arg && ( ! strcmp ( this -> Comments , _arg ) ) ) { return ; } delete [ ] this -> Comments ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> Comments = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> Comments = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetComments ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << Comments  of  << ( this -> Comments ? this -> Comments : (null) ) ) ; return this -> Comments ; } ; /@} *
##  Write the file.
##  int Write ( ) override ; *
##  Get the MTime.
##  vtkMTimeType GetMTime ( ) override ; /@{ *
##  Specify file name of vtk polygon data file to write.
##  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; /@} protected : vtkMNITagPointWriter ( ) ; ~ vtkMNITagPointWriter ( ) override ; vtkPoints * Points [ 2 ] ; vtkStringArray * LabelText ; vtkDoubleArray * Weights ; vtkIntArray * StructureIds ; vtkIntArray * PatientIds ; char * Comments ; void WriteData ( ) override { } virtual void WriteData ( vtkPointSet * inputs [ 2 ] ) ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; char * FileName ; int FileType ; ostream * OpenFile ( ) ; void CloseFile ( ostream * fp ) ; private : vtkMNITagPointWriter ( const vtkMNITagPointWriter & ) = delete ; void operator = ( const vtkMNITagPointWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkConvertToPolyhedra.h
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
##  @class   vtkConvertToPolyhedra
##  @brief   convert 3D linear cells to vtkPolyhedra
##
##  vtkConvertToPolyhedra is a filter that takes a vtkUnstructuredGrid as
##  input and produces a vtkUnstructuredGrid on output, converting 3D linear
##  cells such as tetrahedra, hexahedra, wedges, and pyramids into
##  vtkPolyhedron.
##
##  @warning
##  Certain cells are skipped and not converted, this includes cells of dimension
##  two or less (e.g., triangles, quads, lines, verts, and so on); and higher
##  order cells that cannot easily be converted to vtkPolyhedra. (TODO: tessellate
##  high-order 3D cell faces and then use these to form the polyhedra.)
##
##  @warning
##  This filter is typically used for testing. In general, processing linear cells
##  is preferrable to processing polyhedra due to differences in speed of processing,
##  and memory requirements.
##
##  @sa
##  vtkUnstructuredGrid vtkPolyhedron
##

## !!!Ignored construct:  # vtkConvertToPolyhedra_h [NewLine] # vtkConvertToPolyhedra_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkUnstructuredGridAlgorithm.h [NewLine] class VTKFILTERSCORE_EXPORT vtkConvertToPolyhedra : public vtkUnstructuredGridAlgorithm { public : /@{ *
##  Standard methods for instantiation, obtaining type information, and
##  printing the state of the object.
##  static vtkConvertToPolyhedra * New ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkConvertToPolyhedra :: IsTypeOf ( type ) ; } static vtkConvertToPolyhedra * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkConvertToPolyhedra * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkConvertToPolyhedra * NewInstance ( ) const { return vtkConvertToPolyhedra :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkConvertToPolyhedra :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkConvertToPolyhedra :: New ( ) ; } public : ; /@} /@{ *
##  Indicate whether to include non-polyhedral cells in the filter output.
##  Non-polyhedral cells are cells which cannot be converted to polyhedra,
##  for example cells of dimension < 3, and higher-order cells.
##  If enabled, the output will contain a mix of polyhedra and non-polyhedra
##  cells. If disabled, only polyhedra cells will be output. By default, this
##  is disabled.
##  virtual void SetOutputAllCells ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputAllCells  to  << _arg ) ; if ( this -> OutputAllCells != _arg ) { this -> OutputAllCells = _arg ; this -> Modified ( ) ; } } ; virtual bool GetOutputAllCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputAllCells  of  << this -> OutputAllCells ) ; return this -> OutputAllCells ; } ; virtual void OutputAllCellsOn ( ) { this -> SetOutputAllCells ( static_cast < bool > ( 1 ) ) ; } virtual void OutputAllCellsOff ( ) { this -> SetOutputAllCells ( static_cast < bool > ( 0 ) ) ; } ; /@} protected : vtkConvertToPolyhedra ( ) ; ~ vtkConvertToPolyhedra ( ) override = default ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ;  Control output of cells bool OutputAllCells ; private : vtkConvertToPolyhedra ( const vtkConvertToPolyhedra & ) = delete ; void operator = ( const vtkConvertToPolyhedra & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHyperTreeGridContour.h
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
##  @class   vtkHyperTreeGridContour
##  @brief   Extract cells from a hyper tree grid
##  where selected scalar value is within given range.
##
##
##  This filter extracts cells from a hyper tree grid that satisfy the
##  following contour: a cell is considered to be within range if its
##  value for the active scalar is within a specified range (inclusive).
##  The output remains a hyper tree grid.
##
##  @sa
##  vtkHyperTreeGrid vtkHyperTreeGridAlgorithm vtkContourFilter
##
##  @par Thanks:
##  This class was written by Guenole Harel and Jacques-Bernard Lekien 2014
##  This class was revised by Philippe Pebay, 2016
##  This class was modified by Jacques-Bernard Lekien, 2018
##  This work was supported by Commissariat a l'Energie Atomique
##  CEA, DAM, DIF, F-91297 Arpajon, France.
##

## !!!Ignored construct:  # vtkHyperTreeGridContour_h [NewLine] # vtkHyperTreeGridContour_h [NewLine] # vtkContourValues.h  Needed for inline methods # vtkFiltersHyperTreeModule.h  For export macro # vtkHyperTreeGridAlgorithm.h [NewLine] # < vector >  For STL [NewLine] class vtkBitArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCellData"
discard "forward decl of vtkContourHelper"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkHyperTreeGrid"
discard "forward decl of vtkIdList"
discard "forward decl of vtkIncrementalPointLocator"
discard "forward decl of vtkLine"
discard "forward decl of vtkPixel"
discard "forward decl of vtkUnsignedCharArray"
discard "forward decl of vtkVoxel"
discard "forward decl of vtkHyperTreeGridNonOrientedCursor"
discard "forward decl of vtkHyperTreeGridNonOrientedMooreSuperCursor"
## !!!Ignored construct:  class VTKFILTERSHYPERTREE_EXPORT vtkHyperTreeGridContour : public vtkHyperTreeGridAlgorithm { public : static vtkHyperTreeGridContour * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkHyperTreeGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkHyperTreeGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkHyperTreeGridContour :: IsTypeOf ( type ) ; } static vtkHyperTreeGridContour * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkHyperTreeGridContour * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkHyperTreeGridContour * NewInstance ( ) const { return vtkHyperTreeGridContour :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHyperTreeGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHyperTreeGridContour :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHyperTreeGridContour :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set / get a spatial locator for merging points. By default,
##  an instance of vtkMergePoints is used.
##  void SetLocator ( vtkIncrementalPointLocator * ) ; virtual vtkIncrementalPointLocator * GetnameLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Locator  address  << static_cast < vtkIncrementalPointLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; /@} *
##  Create default locator. Used to create one when none is
##  specified. The locator is used to merge coincident points.
##  void CreateDefaultLocator ( ) ; *
##  Modified GetMTime Because we delegate to vtkContourValues.
##  vtkMTimeType GetMTime ( ) override ; /@{ *
##  Methods (inlined) to set / get contour values.
##  void SetValue ( int , double ) ; double GetValue ( int ) ; double * GetValues ( ) ; void GetValues ( double * ) ; void SetNumberOfContours ( int ) ; vtkIdType GetNumberOfContours ( ) ; void GenerateValues ( int , double [ 2 ] ) ; void GenerateValues ( int , double , double ) ; /@} protected : vtkHyperTreeGridContour ( ) ; ~ vtkHyperTreeGridContour ( ) override ; *
##  For this algorithm the output is a vtkPolyData instance
##  int FillOutputPortInformation ( int , vtkInformation * ) override ; *
##  Main routine to generate isocontours of hyper tree grid.
##  int ProcessTrees ( vtkHyperTreeGrid * , vtkDataObject * ) override ; *
##  Recursively decide whether a cell is intersected by a contour
##  bool RecursivelyPreProcessTree ( vtkHyperTreeGridNonOrientedCursor * ) ; *
##  Recursively descend into tree down to leaves
##  void RecursivelyProcessTree ( vtkHyperTreeGridNonOrientedMooreSuperCursor * ) ; *
##  Storage for contour values.
##  vtkContourValues * ContourValues ; *
##  Storage for pre-selected cells to be processed
##  vtkBitArray * SelectedCells ; *
##  Sign of isovalue if cell not treated
##  vtkBitArray * * CellSigns ; *
##  Spatial locator to merge points.
##  vtkIncrementalPointLocator * Locator ; /@{ *
##  Pointers needed to perform isocontouring
##  vtkContourHelper * Helper ; vtkDataArray * CellScalars ; vtkLine * Line ; vtkPixel * Pixel ; vtkVoxel * Voxel ; vtkIdList * Leaves ; /@} *
##  Storage for signs relative to current contour value
##  std :: vector < bool > Signs ; *
##  Keep track of current index in output polydata
##  vtkIdType CurrentId ; *
##  Keep track of selected input scalars
##  vtkDataArray * InScalars ; vtkBitArray * InMask ; vtkUnsignedCharArray * InGhostArray ; private : vtkHyperTreeGridContour ( const vtkHyperTreeGridContour & ) = delete ; void operator = ( const vtkHyperTreeGridContour & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Set a particular contour value at contour number i. The index i ranges
##  between 0<=i<NumberOfContours.
##

proc SetValue*(i: cint; value: cdouble) {.importcpp: "VTKFILTERSHYPERTREE_EXPORT::SetValue(@)",
                                     header: "vtkHyperTreeGridContour.h".}
## *
##  Get the ith contour value.
##

proc GetValue*(i: cint): cdouble {.importcpp: "VTKFILTERSHYPERTREE_EXPORT::GetValue(@)",
                               header: "vtkHyperTreeGridContour.h".}
## *
##  Get a pointer to an array of contour values. There will be
##  GetNumberOfContours() values in the list.
##

proc GetValues*(): ptr cdouble {.importcpp: "VTKFILTERSHYPERTREE_EXPORT::GetValues(@)",
                             header: "vtkHyperTreeGridContour.h".}
## *
##  Fill a supplied list with contour values. There will be
##  GetNumberOfContours() values in the list. Make sure you allocate
##  enough memory to hold the list.
##

proc GetValues*(contourValues: ptr cdouble) {.
    importcpp: "VTKFILTERSHYPERTREE_EXPORT::GetValues(@)",
    header: "vtkHyperTreeGridContour.h".}
## *
##  Set the number of contours to place into the list. You only really
##  need to use this method to reduce list size. The method SetValue()
##  will automatically increase list size as needed.
##

proc SetNumberOfContours*(number: cint) {.importcpp: "VTKFILTERSHYPERTREE_EXPORT::SetNumberOfContours(@)",
                                       header: "vtkHyperTreeGridContour.h".}
## *
##  Get the number of contours in the list of contour values.
##

proc GetNumberOfContours*(): vtkIdType {.importcpp: "VTKFILTERSHYPERTREE_EXPORT::GetNumberOfContours(@)",
                                      header: "vtkHyperTreeGridContour.h".}
## *
##  Generate numContours equally spaced contour values between specified
##  range. Contour values will include min/max range values.
##

proc GenerateValues*(numContours: cint; range: array[2, cdouble]) {.
    importcpp: "VTKFILTERSHYPERTREE_EXPORT::GenerateValues(@)",
    header: "vtkHyperTreeGridContour.h".}
## *
##  Generate numContours equally spaced contour values between specified
##  range. Contour values will include min/max range values.
##

proc GenerateValues*(numContours: cint; rangeStart: cdouble; rangeEnd: cdouble) {.
    importcpp: "VTKFILTERSHYPERTREE_EXPORT::GenerateValues(@)",
    header: "vtkHyperTreeGridContour.h".}
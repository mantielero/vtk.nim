## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkComputeHistogram2DOutliers.h
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
##   Copyright 2009 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkComputeHistogram2DOutliers
##  @brief   compute the outliers in a set
##   of 2D histograms and extract the corresponding row data.
##
##
##   This class takes a table and one or more vtkImageData histograms as input
##   and computes the outliers in that data.  In general it does so by
##   identifying histogram bins that are removed by a median (salt and pepper)
##   filter and below a threshold.  This threshold is automatically identified
##   to retrieve a number of outliers close to a user-determined value.  This
##   value is set by calling SetPreferredNumberOfOutliers(int).
##
##   The image data input can come either as a multiple vtkImageData via the
##   repeatable INPUT_HISTOGRAM_IMAGE_DATA port, or as a single
##   vtkMultiBlockDataSet containing vtkImageData objects as blocks.  One
##   or the other must be set, not both (or neither).
##
##   The output can be retrieved as a set of row ids in a vtkSelection or
##   as a vtkTable containing the actual outlier row data.
##
##  @sa
##   vtkExtractHistogram2D vtkPComputeHistogram2DOutliers
##
##  @par Thanks:
##   Developed by David Feng at Sandia National Laboratories
## ------------------------------------------------------------------------------
##

## !!!Ignored construct:  # vtkComputeHistogram2DOutliers_h [NewLine] # vtkComputeHistogram2DOutliers_h [NewLine] ------------------------------------------------------------------------------ # vtkFiltersImagingModule.h  For export macro # vtkSelectionAlgorithm.h [NewLine] ------------------------------------------------------------------------------ class vtkCollection ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkImageData"
discard "forward decl of vtkTable"
## !!!Ignored construct:  class VTKFILTERSIMAGING_EXPORT vtkComputeHistogram2DOutliers : public vtkSelectionAlgorithm { public : static vtkComputeHistogram2DOutliers * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkSelectionAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkSelectionAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkComputeHistogram2DOutliers :: IsTypeOf ( type ) ; } static vtkComputeHistogram2DOutliers * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkComputeHistogram2DOutliers * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkComputeHistogram2DOutliers * NewInstance ( ) const { return vtkComputeHistogram2DOutliers :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSelectionAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkComputeHistogram2DOutliers :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkComputeHistogram2DOutliers :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; virtual void SetPreferredNumberOfOutliers ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PreferredNumberOfOutliers  to  << _arg ) ; if ( this -> PreferredNumberOfOutliers != _arg ) { this -> PreferredNumberOfOutliers = _arg ; this -> Modified ( ) ; } } ; virtual int GetPreferredNumberOfOutliers ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PreferredNumberOfOutliers  of  << this -> PreferredNumberOfOutliers ) ; return this -> PreferredNumberOfOutliers ; } ;  vtkTable * GetOutputTable ( ) ; enum InputPorts { INPUT_TABLE_DATA = 0 , INPUT_HISTOGRAMS_IMAGE_DATA , INPUT_HISTOGRAMS_MULTIBLOCK } ; enum OutputPorts { OUTPUT_SELECTED_ROWS = 0 , OUTPUT_SELECTED_TABLE_DATA } ; *
##  Set the source table data, from which data will be filtered.
##  void SetInputTableConnection ( vtkAlgorithmOutput * cxn ) { this -> SetInputConnection ( INPUT_TABLE_DATA , cxn ) ; } *
##  Set the input histogram data as a (repeatable) vtkImageData
##  void SetInputHistogramImageDataConnection ( vtkAlgorithmOutput * cxn ) { this -> SetInputConnection ( INPUT_HISTOGRAMS_IMAGE_DATA , cxn ) ; } *
##  Set the input histogram data as a vtkMultiBlockData set
##  containing multiple vtkImageData objects.
##  void SetInputHistogramMultiBlockConnection ( vtkAlgorithmOutput * cxn ) { this -> SetInputConnection ( INPUT_HISTOGRAMS_MULTIBLOCK , cxn ) ; } protected : vtkComputeHistogram2DOutliers ( ) ; ~ vtkComputeHistogram2DOutliers ( ) override ; int PreferredNumberOfOutliers ; vtkTimeStamp BuildTime ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int FillOutputPortInformation ( int port , vtkInformation * info ) override ; *
##  Compute the thresholds (essentially bin extents) that contain outliers for
##  a collection of vtkImageData histograms.
##  virtual int ComputeOutlierThresholds ( vtkCollection * histograms , vtkCollection * thresholds ) ; *
##  Compute the thresholds (bin extents) that contain outliers for a single vtkImageData histogram
##  virtual int ComputeOutlierThresholds ( vtkImageData * histogram , vtkDoubleArray * thresholds , double threshold ) ; *
##  Take a set of range thresholds (bin extents) and filter out rows from the input table data that
##  fits inside those thresholds.
##  virtual int FillOutlierIds ( vtkTable * data , vtkCollection * thresholds , vtkIdTypeArray * rowIds , vtkTable * outTable ) ; private : vtkComputeHistogram2DOutliers ( const vtkComputeHistogram2DOutliers & ) = delete ; void operator = ( const vtkComputeHistogram2DOutliers & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

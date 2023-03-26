## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageStencilData.h
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
##  @class   vtkImageStencilData
##  @brief   efficient description of an image stencil
##
##  vtkImageStencilData describes an image stencil in a manner which is
##  efficient both in terms of speed and storage space.  The stencil extents
##  are stored for each x-row across the image (multiple extents per row if
##  necessary) and can be retrieved via the GetNextExtent() method.
##  @sa
##  vtkImageStencilSource vtkImageStencil
##

## !!!Ignored construct:  # vtkImageStencilData_h [NewLine] # vtkImageStencilData_h [NewLine] # vtkDataObject.h [NewLine] # vtkImagingCoreModule.h  For export macro [NewLine] class VTKIMAGINGCORE_EXPORT vtkImageStencilData : public vtkDataObject { public : static vtkImageStencilData * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageStencilData :: IsTypeOf ( type ) ; } static vtkImageStencilData * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageStencilData * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageStencilData * NewInstance ( ) const { return vtkImageStencilData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageStencilData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageStencilData :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; void Initialize ( ) override ; void DeepCopy ( vtkDataObject * o ) override ; void ShallowCopy ( vtkDataObject * f ) override ; void InternalImageStencilDataCopy ( vtkImageStencilData * s ) ; *
##  Returns `VTK_IMAGE_STENCIL_DATA`.
##  int GetDataObjectType ( ) override { return VTK_IMAGE_STENCIL_DATA ; } *
##  The extent type is 3D, just like vtkImageData.
##  int GetExtentType ( ) override { return VTK_3D_EXTENT ; } *
##  Given the total output x extent [xMin,xMax] and the current y, z indices,
##  return each sub-extent [r1,r2] that lies within within the unclipped
##  region in sequence.  A value of '0' is returned if no more sub-extents
##  are available.  The variable 'iter' must be initialized to zero before
##  the first call, unless you want the complementary sub-extents in which
##  case you must initialize 'iter' to -1.  The variable 'iter' is used
##  internally to keep track of which sub-extent should be returned next.
##  int GetNextExtent ( int & r1 , int & r2 , int xMin , int xMax , int yIdx , int zIdx , int & iter ) ; *
##  Checks if an image index is inside the stencil.
##  Even though GetNextExtent and the vtkImageStencilIterator are faster
##  if every voxel in the volume has to be checked, IsInside provides an
##  efficient alternative for if just a single voxel has to be checked.
##  int IsInside ( int xIdx , int yIdx , int zIdx ) ; *
##  This method is used by vtkImageStencilDataSource to add an x
##  sub extent [r1,r2] for the x row (yIdx,zIdx).  The specified sub
##  extent must not intersect any other sub extents along the same x row.
##  As well, r1 and r2 must both be within the total x extent
##  [Extent[0],Extent[1]].
##  void InsertNextExtent ( int r1 , int r2 , int yIdx , int zIdx ) ; *
##  Similar to InsertNextExtent, except that the extent (r1,r2) at yIdx,
##  zIdx is merged with other extents, (if any) on that row. So a
##  unique extent may not necessarily be added. For instance, if an extent
##  [5,11] already exists adding an extent, [7,9] will not affect the
##  stencil. Likewise adding [10, 13] will replace the existing extent
##  with [5,13].
##  void InsertAndMergeExtent ( int r1 , int r2 , int yIdx , int zIdx ) ; *
##  Remove the extent from (r1,r2) at yIdx, zIdx
##  void RemoveExtent ( int r1 , int r2 , int yIdx , int zIdx ) ; /@{ *
##  Set the desired spacing for the stencil.
##  This must be called before the stencil is Updated, ideally
##  in the ExecuteInformation method of the imaging filter that
##  is using the stencil.
##  virtual void SetSpacing ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Spacing  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Spacing [ 0 ] != _arg1 ) || ( this -> Spacing [ 1 ] != _arg2 ) || ( this -> Spacing [ 2 ] != _arg3 ) ) { this -> Spacing [ 0 ] = _arg1 ; this -> Spacing [ 1 ] = _arg2 ; this -> Spacing [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetSpacing ( const double _arg [ 3 ] ) { this -> SetSpacing ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetSpacing ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Spacing  pointer  << this -> Spacing ) ; return this -> Spacing ; } VTK_WRAPEXCLUDE virtual void GetSpacing ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Spacing [ 0 ] ; _arg2 = this -> Spacing [ 1 ] ; _arg3 = this -> Spacing [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Spacing  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetSpacing ( double _arg [ 3 ] ) { this -> GetSpacing ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Set the desired origin for the stencil.
##  This must be called before the stencil is Updated, ideally
##  in the ExecuteInformation method of the imaging filter that
##  is using the stencil.
##  virtual void SetSpacingOrigin ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Origin  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Origin [ 0 ] != _arg1 ) || ( this -> Origin [ 1 ] != _arg2 ) || ( this -> Origin [ 2 ] != _arg3 ) ) { this -> Origin [ 0 ] = _arg1 ; this -> Origin [ 1 ] = _arg2 ; this -> Origin [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetSpacingOrigin ( const double _arg [ 3 ] ) { this -> SetSpacingOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetSpacingOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Origin  pointer  << this -> Origin ) ; return this -> Origin ; } VTK_WRAPEXCLUDE virtual void GetSpacingOrigin ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Origin [ 0 ] ; _arg2 = this -> Origin [ 1 ] ; _arg3 = this -> Origin [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Origin  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetSpacingOrigin ( double _arg [ 3 ] ) { this -> GetSpacingOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Set the extent of the data.  This is should be called only
##  by vtkImageStencilSource, as it is part of the basic pipeline
##  functionality.
##  void SetExtent ( const int extent [ 6 ] ) ; void SetExtent ( int x1 , int x2 , int y1 , int y2 , int z1 , int z2 ) ; virtual int * GetExtent ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Extent  pointer  << this -> Extent ) ; return this -> Extent ; } VTK_WRAPEXCLUDE virtual void GetExtent ( int & _arg1 , int & _arg2 , int & _arg3 , int & _arg4 , int & _arg5 , int & _arg6 ) { _arg1 = this -> Extent [ 0 ] ; _arg2 = this -> Extent [ 1 ] ; _arg3 = this -> Extent [ 2 ] ; _arg4 = this -> Extent [ 3 ] ; _arg5 = this -> Extent [ 4 ] ; _arg6 = this -> Extent [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Extent  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetExtent ( int _arg [ 6 ] ) { this -> GetExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; /@} *
##  Allocate space for the sub-extents.  This is called by
##  vtkImageStencilSource.
##  void AllocateExtents ( ) ; *
##  Fill the sub-extents.
##  void Fill ( ) ; /@{ *
##  Override these to handle origin, spacing, scalar type, and scalar
##  number of components.  See vtkDataObject for details.
##  void CopyInformationFromPipeline ( vtkInformation * info ) override ; void CopyInformationToPipeline ( vtkInformation * info ) override ; /@} /@{ *
##  Retrieve an instance of this class from an information object.
##  static vtkImageStencilData * GetData ( vtkInformation * info ) ; static vtkImageStencilData * GetData ( vtkInformationVector * v , int i = 0 ) ; /@} *
##  Add merges the stencil supplied as argument into Self.
##  virtual void Add ( vtkImageStencilData * ) ; *
##  Subtract removes the portion of the stencil, supplied as argument,
##  that lies within Self from Self.
##  virtual void Subtract ( vtkImageStencilData * ) ; *
##  Replaces the portion of the stencil, supplied as argument,
##  that lies within Self from Self.
##  virtual void Replace ( vtkImageStencilData * ) ; *
##  Clip the stencil with the supplied extents. In other words, discard data
##  outside the specified extents. Return 1 if something changed.
##  virtual int Clip ( int extent [ 6 ] ) ; protected : vtkImageStencilData ( ) ; ~ vtkImageStencilData ( ) override ; enum Operation { Merge , Erase } ; *
##  Apply the given operation over the given (r1, r2) extent.
##  void LogicalOperationExtent ( int r1 , int r2 , int yIdx , int zIdx , Operation operation ) ; *
##  Combine with the given stencil, using the given operation.
##  void LogicalOperationInPlace ( vtkImageStencilData * stencil , Operation operation ) ; *
##  Change the extent while preserving the data.
##  This can be used to either expand or clip the extent.  The new extent
##  does not have to overlap the current extent.
##  void ChangeExtent ( const int extent [ 6 ] ) ; *
##  Get important info from pipeline.
##  void CopyOriginAndSpacingFromPipeline ( vtkInformation * info ) ; /@{ *
##  The Spacing and Origin of the data.
##  double Spacing [ 3 ] ; double Origin [ 3 ] ; /@} int Extent [ 6 ] ; /@{ *
##  The actual 'data' is stored here.
##  int NumberOfExtentEntries ; int * ExtentListLengths ; int * * ExtentLists ; /@} private : vtkImageStencilData ( const vtkImageStencilData & ) = delete ; void operator = ( const vtkImageStencilData & ) = delete ; friend class vtkImageStencilIteratorFriendship ; } ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  This is a helper class for stencil creation.  It is a raster with
##  infinite resolution in the X direction (approximately, since it uses
##  double precision).  Lines that represent polygon edges can be drawn
##  into this raster, and then filled given a tolerance.
##

## !!!Ignored construct:  class VTKIMAGINGCORE_EXPORT vtkImageStencilRaster { public : *
##  Create a raster with the specified whole y extent.
##  vtkImageStencilRaster ( const int wholeExtent [ 2 ] ) ; *
##  Destructor.
##  ~ vtkImageStencilRaster ( ) ; *
##  Reset the raster to its original state, but keep the same whole
##  extent. Pre-allocate the specified 1D allocateExtent, which must be
##  within the whole extent.
##  void PrepareForNewData ( const int allocateExtent [ 2 ] = nullptr ) ; /@{ *
##  Insert a line into the raster, given the two end points.
##  void InsertLine ( const double pt1 [ 2 ] , const double pt2 [ 2 ] ) ; /@} *
##  Fill the specified extent of a vtkImageStencilData with the raster,
##  after permuting the raster according to xj and yj.
##  void FillStencilData ( vtkImageStencilData * data , const int extent [ 6 ] , int xj = 0 , int yj = 1 ) ; *
##  The tolerance for float-to-int conversions.
##  void SetTolerance ( double tol ) { this -> Tolerance = tol ; } double GetTolerance ( ) { return this -> Tolerance ; } protected : *
##  Ensure that the raster is initialized for the specified range
##  of y values, which must be within the Extent.
##  void PrepareExtent ( int ymin , int ymax ) ; *
##  Insert an x point into the raster.  If the y value is larger than
##  the y extent, the extent will grow automatically.  The parameter i
##  indicates which of the two internal rasters is to be used.
##  void InsertPoint ( int y , double x , int i ) ; int Extent [ 2 ] ; int UsedExtent [ 2 ] ; double * * Raster ; double Tolerance ; private : vtkImageStencilRaster ( const vtkImageStencilRaster & ) = delete ; void operator = ( const vtkImageStencilRaster & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

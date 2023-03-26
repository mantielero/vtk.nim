## =========================================================================
##
##   Program:   ParaView
##   Module:    vtkPlot3DMetaReader.h
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkPlot3DMetaReader
##  @brief   reads meta-files points to PLOT3D files
##
##  The main goal of this reader is to make it easy to read PLOT3D files,
##  specifically time series of PLOT3D files. PLOT3D files can take many
##  different forms based on their content. Unfortunately, it is not a
##  self-describing format therefore the user needs to pass information
##  about the contents of the file to the reader. Normally, this is done
##  by setting a number of member variables. The goal of this reader is
##  to provide a simple format that enable the writer of the PLOT3D file
##  to describe its settings as well as group a number of files as a time
##  series. Note that for binary files, the auto-detect-format option,
##  which is on by default negates the need to specify most other option.
##  However, this reader is still very useful when trying to read file
##  series even for binary files. The format for this meta-file is very simple
##  and is based on JSON (there is no need to know anything about JSON to
##  understand this format). Below is an example with comments (followed by //)
##  that describe the format. Note that the PLOT3D file names are relative
##  to the location of the meta-file unless they start with a leading /.
##
##  \verbatim
##  {
##  "auto-detect-format" : true // Tells the reader to try to figure out the format automatically.
##  Only works
##                              // with binary file. This is on by default, negating the need for
##  most other
##                              // options for binary files (format, byte-order, precision,
##  multi-grid,
##                              // blanking, 2D).
##  "format" : "binary",  // Is this a binary or ascii file, values : binary, ascii
##  "byte-order" : "big", // Byte order for binary files, values : little, big (denoting little or
##  big endian) "precision" : 32,     // Precision of floating point values, can be 32 or 64 (bits)
##  "multi-grid" : false, // Is this a multi-grid file, values: true, false
##  "language" : "C",     // Which language was this file written in, values : C, fortran. This is
##                        // used to determine if an binary PLOT3D file contains byte counts, used by
##                        // Fortran IO routines.
##  "blanking" : false,   // Does this file have blanking information (iblanks), values : true, false
##  "2D" : false,         // Is this a 2D dataset, values : true, false
##  "R" : 8.314,          // The value of the gas constant, default is 1.0. Set this according to the
##  dimensions you use "gamma" : 1.4,        // Ratio of specific heats. Default is 1.4. "functions":
##  [ 110, 200, 201 ],  // Additional derived values to calculate. This is an array of integers
##  formatted
##                                   // as [ value, value, value, ...]
##  "filenames" : [     // List of xyz (geometry) and q (value) file names along with the time
##  values.
##                      // This is an array which contains items in the format:
##                      // {"time" : values, "xyz" : "xyz file name", "q" : "q file name", "function"
##  : "function file name"}
##                      // Note that q and function are optional. Also, you can repeat the same file
##  name for xyz or q
##                      // if they don't change over time. The reader will not read files
##  unnecessarily. { "time" : 3.5, "xyz" : "combxyz.bin", "q" : "combq.1.bin", "function" :
##  "combf.1.bin" }, { "time" : 4.5, "xyz" : "combxyz.bin", "q" : "combq.2.bin", "function" :
##  "combf.2.bin" }
##  ],
##  "function-names" : ["density", "velocity_x", "temperature"]
##                    // list of names of functions in function files
##  }
##  \endverbatim
##
##  This reader leverages vtkMultiBlockPLOT3DReader to do the actual
##  reading so you may want to refer to the documentation of
##  vtkMultiBlockPLOT3DReader about the details of some of these
##  parameters including the function numbers for derived value
##  calculation.
##
##  @sa
##  vtkMultiBlockPLOT3DReader
##

## !!!Ignored construct:  # vtkPlot3DMetaReader_h [NewLine] # vtkPlot3DMetaReader_h [NewLine] # vtkIOParallelModule.h  For export macro # vtkMultiBlockDataSetAlgorithm.h [NewLine] # vtk_jsoncpp_fwd.h  For forward declarations [NewLine] struct vtkPlot3DMetaReaderInternals ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkMultiBlockPLOT3DReader"
## !!!Ignored construct:  class VTKIOPARALLEL_EXPORT vtkPlot3DMetaReader : public vtkMultiBlockDataSetAlgorithm { public : static vtkPlot3DMetaReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkMultiBlockDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkMultiBlockDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPlot3DMetaReader :: IsTypeOf ( type ) ; } static vtkPlot3DMetaReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPlot3DMetaReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPlot3DMetaReader * NewInstance ( ) const { return vtkPlot3DMetaReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPlot3DMetaReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPlot3DMetaReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/Get the meta PLOT3D filename. See the class documentation for
##  format details.
##  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; /@} protected : vtkPlot3DMetaReader ( ) ; ~ vtkPlot3DMetaReader ( ) override ; int RequestInformation ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; char * FileName ; void SetAutoDetectFormat ( Json :: Value * value ) ; void SetByteOrder ( Json :: Value * value ) ; void SetPrecision ( Json :: Value * val ) ; void SetMultiGrid ( Json :: Value * val ) ; void SetFormat ( Json :: Value * val ) ; void SetBlanking ( Json :: Value * val ) ; void Set2D ( Json :: Value * val ) ; void SetR ( Json :: Value * val ) ; void SetGamma ( Json :: Value * val ) ; void SetFileNames ( Json :: Value * val ) ; void SetLanguage ( Json :: Value * val ) ; void AddFunctions ( Json :: Value * val ) ; void SetFunctionNames ( Json :: Value * val ) ; private : vtkPlot3DMetaReader ( const vtkPlot3DMetaReader & ) = delete ; void operator = ( const vtkPlot3DMetaReader & ) = delete ; vtkMultiBlockPLOT3DReader * Reader ; vtkPlot3DMetaReaderInternals * Internal ; } ;
## Error: token expected: ; but got: [identifier]!!!

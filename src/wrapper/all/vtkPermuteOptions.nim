## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPermuteOptions.h
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
##  vtkPermuteOptions is a class template designed to exhaustively explore the
##  parameter space of a vtkObject subclass.
##
##  This testing utility can be taught to update parameters that are defined
##  using an API similar to the vtkSetGet macros. Concretely, consider testing
##  vtkXMLWriter. This class has a number of independent settings: byte order,
##  compressor, data mode, and more. When testing this class, it would be ideal
##  to test every combination of these parameters, but this would normally
##  require a lot of verbose, redundant, error-prone boilerplate code.
##
##  This class simplifies this process. The following describes how to use
##  vtkPermuteOptions to run a test using all combinations of vtkXMLWriter's
##  byte order and compressor settings (just sticking to two options for
##  simplicity -- the class has no limit on number of options or number of
##  values for those options).
##
##  First, the vtkPermuteOptions object must be instantiated, using the
##  configured class as the template parameter:
##
##  @code
##  vtkPermuteOptions<vtkXMLWriter> config;
##  @endcode
##
##  Next the options and their possible values are specified. Each call to
##  AddOptionValue adds a value to a specific option. Options are created
##  automatically as new option names are passed to AddOptionValue. The
##  following instructs vtkPermuteOptions to test option ByteOrder (with values
##  LittleEndian and BigEndian) and CompressorType (with values NONE, ZLIB, and
##  LZ4):
##
##  @code
##  this->AddOptionValue("ByteOrder", &vtkXMLWriter::SetByteOrder,
##                       "BigEndian", vtkXMLWriter::BigEndian);
##  this->AddOptionValue("ByteOrder", &vtkXMLWriter::SetByteOrder,
##                       "LittleEndian", vtkXMLWriter::LittleEndian);
##
##  this->AddOptionValues("CompressorType", &vtkXMLWriter::SetCompressorType,
##                        "NONE", vtkXMLWriter::NONE,
##                        "ZLIB", vtkXMLWriter::ZLIB,
##                        "LZ4", vtkXMLWriter::LZ4);
##  @endcode
##
##  Note that that there are two variations on how values may be added to an
##  option. For ByteOrder, we use AddOptionValue to specify a human-readable
##  string that uniquely identifies the option, a member function pointer to the
##  option's setter, a human readable string that uniquely identifies the value,
##  and the value itself (in this case, an enum value). The first call creates
##  the option named "ByteOrder" and adds the "BigEndian" value. The second call
##  adds the "LittleEndian" value to the same option.
##
##  The CompressorType call uses the variatic function template AddOptionValues
##  to specify multiple values to the same option at once. The value-name and
##  value pairs are repeated, and each is added to the option with the supplied
##  name. Any number of values may be added to a single option this way.
##
##  To run through the permutations, a vtk-esque iterator API is used:
##
##  @code
##  config.InitPermutations();
##  while (!config.IsDoneWithPermutations())
##  {
##    // Testing code...
##
##    // Apply the current option permutation to a vtkXMLWriter object:
##    vtkXMLWriter *writer = ...;
##    config.ApplyCurrentPermutation(writer);
##
##    // More testing code...
##
##    config.GoToNextPermutation();
##  }
##  @endcode
##
##  This will repeat the testing code, but configure the vtkXMLWriter object
##  differently each time. It will perform a total of 6 iterations, with
##  parameters:
##
##  @code
##  Test Iteration    ByteOrder         CompressorType
##  --------------    ---------         --------------
##  1                 BigEndian         NONE
##  2                 BigEndian         ZLIB
##  3                 BigEndian         LZ4
##  4                 LittleEndian      NONE
##  5                 LittleEndian      ZLIB
##  6                 LittleEndian      LZ4
##  @endcode
##
##  thus exploring the entire parameter space.
##
##  A unique, human-readable description of the current configuration can be
##  obtained with GetCurrentPermutationName() as long as IsDoneWithPermutations()
##  returns false. E.g. the third iteration will be named
##  "ByteOrder.BigEndian-CompressorType.LZ4".
##

type
  vtkPermuteOptions*[ObjType] {.importcpp: "vtkPermuteOptions<\'0>",
                               header: "vtkPermuteOptions.h", bycopy.} = object

  Permutation* = vector[csize_t]

proc constructvtkPermuteOptions*[ObjType](): vtkPermuteOptions[ObjType] {.
    constructor, importcpp: "vtkPermuteOptions<\'*0>(@)",
    header: "vtkPermuteOptions.h".}
proc AddOptionValue*[ObjType; SetterType; ValueType](
    this: var vtkPermuteOptions[ObjType]; optionName: string; setter: SetterType;
    valueName: string; value: ValueType) {.importcpp: "AddOptionValue",
                                       header: "vtkPermuteOptions.h".}
proc AddOptionValues*[ObjType; SetterType; ValueType](
    this: var vtkPermuteOptions[ObjType]; optionName: string; setter: SetterType;
    valueName: string; value: ValueType) {.importcpp: "AddOptionValues",
                                       header: "vtkPermuteOptions.h".}
## !!!Ignored construct:  template < typename SetterType , typename ValueType , typename ... Tail > [end of template] void AddOptionValues ( const std :: string & optionName , SetterType setter , const std :: string & valueName , ValueType value , Tail ... tail ) { this -> AddOptionValue ( optionName , setter , valueName , value ) ; this -> AddOptionValues ( optionName , setter , tail ... ) ; } void InitPermutations ( ) { if ( this -> OptionTime > this -> PermutationTime ) { this -> RebuildPermutations ( ) ; } this -> CurrentPermutation = 0 ; } bool IsDoneWithPermutations ( ) const { assert ( Modified options without resetting permutations. && this -> PermutationTime > this -> OptionTime ) ; return this -> CurrentPermutation >= this -> Permutations . size ( ) ; } void GoToNextPermutation ( ) { assert ( Modified options without resetting permutations. && this -> PermutationTime > this -> OptionTime ) ; assert ( Invalid permutation. && ! this -> IsDoneWithPermutations ( ) ) ; ++ this -> CurrentPermutation ; } void ApplyCurrentPermutation ( ObjType * obj ) const { assert ( Modified options without resetting permutations. && this -> PermutationTime > this -> OptionTime ) ; assert ( Invalid permutation. && ! this -> IsDoneWithPermutations ( ) ) ; this -> Apply ( obj , this -> Permutations [ this -> CurrentPermutation ] ) ; } std :: string GetCurrentPermutationName ( ) const { assert ( Modified options without resetting permutations. && this -> PermutationTime > this -> OptionTime ) ; assert ( Invalid permutation. && ! this -> IsDoneWithPermutations ( ) ) ; return this -> NamePermutation ( this -> Permutations [ this -> CurrentPermutation ] ) ; } }
## Error: identifier expected, but got: ...!!!

##  VTK-HeaderTest-Exclude: vtkPermuteOptions.h

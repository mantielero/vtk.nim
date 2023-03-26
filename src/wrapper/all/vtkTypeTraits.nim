## =========================================================================
##
##   Program:   ParaView
##   Module:    vtkTypeTraits.h
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
##  @class   vtkTypeTraits
##  @brief   Template defining traits of native types used by VTK.
##
##  vtkTypeTraits provides information about VTK's supported scalar types
##  that is useful for templates.
##

## !!!Ignored construct:  # vtkTypeTraits_h [NewLine] # vtkTypeTraits_h [NewLine] # vtkSystemIncludes.h [NewLine]  Forward-declare template.  There is no primary template. template < class T > [end of template] struct vtkTypeTraits ;
## Error: did not expect > [end of template]!!!

##  Define a macro to simplify trait definitions.

## !!!Ignored construct:  # VTK_TYPE_TRAITS ( type , macro , isSigned , name , print , format ) template < > [end of template] struct vtkTypeTraits < type > {  The type itself. typedef type ValueType ;  the value defined for this type in vtkType enum { VTK_TYPE_ID = VTK_ ## macro } ; static int VTKTypeID ( ) { return VTK_ ## macro ; }  The smallest possible value represented by the type. static type Min ( ) { return VTK_ ## macro ## _MIN ; }  The largest possible value represented by the type. static type Max ( ) { return VTK_ ## macro ## _MAX ; }  Whether the type is signed. static int IsSigned ( ) { return isSigned ; }  An "alias" type that is the same size and signedness. typedef vtkType ## name SizedType ;  A name for the type indicating its size and signedness. static const char * SizedName ( ) { return # ; }  The common C++ name for the type (e.g. float, unsigned int, etc). static const char * Name ( ) { return # ; }  A type to use for printing or parsing values in strings. typedef print PrintType ;  A format for parsing values from strings.  Use with PrintType. static const char * ParseFormat ( ) { return format ; } } [NewLine]  Define traits for floating-point types. # VTK_TYPE_NAME_FLOAT float [NewLine] # VTK_TYPE_NAME_DOUBLE double [NewLine] # VTK_TYPE_SIZED_FLOAT FLOAT32 [NewLine] # VTK_TYPE_SIZED_DOUBLE FLOAT64 [NewLine] VTK_TYPE_TRAITS ( float , FLOAT , 1 , Float32 , float , %f ) ;
## Error: did not expect > [end of template]!!!

VTK_TYPE_TRAITS(double, DOUBLE, 1, Float64, double, "%lf")
##  Define traits for char types.
##  Note the print type is short because not all platforms support formatting integers with char.

const
  VTK_TYPE_NAME_CHAR* = char

when VTK_TYPE_CHAR_IS_SIGNED:
  const
    VTK_TYPE_SIZED_CHAR* = INT8
  VTK_TYPE_TRAITS(char, CHAR, 1, Int8, short, "%hd")
else:
  const
    VTK_TYPE_SIZED_CHAR* = UINT8
  VTK_TYPE_TRAITS(char, CHAR, 0, UInt8, unsigned, short, "%hu")
const
  VTK_TYPE_NAME_SIGNED_CHAR* = signed

## !!!Ignored construct:  char [NewLine] # VTK_TYPE_NAME_UNSIGNED_CHAR unsigned char [NewLine] # VTK_TYPE_SIZED_SIGNED_CHAR INT8 [NewLine] # VTK_TYPE_SIZED_UNSIGNED_CHAR UINT8 [NewLine] VTK_TYPE_TRAITS ( signed char , SIGNED_CHAR , 1 , Int8 , short , %hd ) ;
## Error: identifier expected, but got: [NewLine]!!!

VTK_TYPE_TRAITS(unsigned, char, UNSIGNED_CHAR, 0, UInt8, unsigned, short, "%hu")
##  Define traits for short types.

const
  VTK_TYPE_NAME_SHORT* = short
  VTK_TYPE_NAME_UNSIGNED_SHORT* = unsigned

## !!!Ignored construct:  short [NewLine] # VTK_TYPE_SIZED_SHORT INT16 [NewLine] # VTK_TYPE_SIZED_UNSIGNED_SHORT UINT16 [NewLine] VTK_TYPE_TRAITS ( short , SHORT , 1 , Int16 , short , %hd ) ;
## Error: identifier expected, but got: [NewLine]!!!

VTK_TYPE_TRAITS(unsigned, short, UNSIGNED_SHORT, 0, UInt16, unsigned, short, "%hu")
##  Define traits for int types.

const
  VTK_TYPE_NAME_INT* = int
  VTK_TYPE_NAME_UNSIGNED_INT* = unsigned

## !!!Ignored construct:  int [NewLine] # VTK_TYPE_SIZED_INT INT32 [NewLine] # VTK_TYPE_SIZED_UNSIGNED_INT UINT32 [NewLine] VTK_TYPE_TRAITS ( int , INT , 1 , Int32 , int , %d ) ;
## Error: identifier expected, but got: [NewLine]!!!

VTK_TYPE_TRAITS(unsigned, int, UNSIGNED_INT, 0, UInt32, unsigned, int, "%u")
##  Define traits for long types.

const
  VTK_TYPE_NAME_LONG* = long
  VTK_TYPE_NAME_UNSIGNED_LONG* = unsigned

## !!!Ignored construct:  long [NewLine] # VTK_SIZEOF_LONG == 4 [NewLine] # VTK_TYPE_SIZED_LONG INT32 [NewLine] # VTK_TYPE_SIZED_UNSIGNED_LONG UINT32 [NewLine] VTK_TYPE_TRAITS ( long , LONG , 1 , Int32 , long , %ld ) ;
## Error: identifier expected, but got: [NewLine]!!!

VTK_TYPE_TRAITS(unsigned, long, UNSIGNED_LONG, 0, UInt32, unsigned, long, "%lu")
const
  VTK_TYPE_SIZED_LONG* = INT64
  VTK_TYPE_SIZED_UNSIGNED_LONG* = UINT64

VTK_TYPE_TRAITS(long, LONG, 1, Int64, long, "%ld")
VTK_TYPE_TRAITS(unsigned, long, UNSIGNED_LONG, 0, UInt64, unsigned, long, "%lu")
##  Define traits for long long types if they are enabled.

const
  VTK_TYPE_NAME_LONG_LONG* = long

## !!!Ignored construct:  long [NewLine] # VTK_TYPE_NAME_UNSIGNED_LONG_LONG unsigned long long [NewLine] # VTK_SIZEOF_LONG_LONG == 8 [NewLine] # VTK_TYPE_SIZED_LONG_LONG INT64 [NewLine] # VTK_TYPE_SIZED_UNSIGNED_LONG_LONG UINT64 [NewLine] # VTK_TYPE_LONG_LONG_FORMAT %ll [NewLine] VTK_TYPE_TRAITS ( long long , LONG_LONG , 1 , Int64 , long long , VTK_TYPE_LONG_LONG_FORMAT d ) ;
## Error: identifier expected, but got: [NewLine]!!!

VTK_TYPE_TRAITS(unsigned, long, long, UNSIGNED_LONG_LONG, 0, UInt64, unsigned, long,
                long, VTK_TYPE_LONG_LONG_FORMAT, "u")
##  Define traits for vtkIdType.  The template specialization is
##  already defined for the corresponding native type.

const
  VTK_TYPE_NAME_ID_TYPE* = vtkIdType

when defined(VTK_USE_64BIT_IDS):
  const
    VTK_TYPE_SIZED_ID_TYPE* = INT64
else:
  const
    VTK_TYPE_SIZED_ID_TYPE* = INT32
##  VTK-HeaderTest-Exclude: vtkTypeTraits.h

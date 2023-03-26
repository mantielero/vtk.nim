## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMultiProcessSerialization.h
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
##  @file vtkMultiProcessStreamSerialization.h
##  @brief Utility to serialize STL containers to vtkMultiProcessStream
##
##  This header provides helpers to make it easier to serialize STL containers
##  to vtkMultiProcessStream.
##
##  Typical usage is as follows:
##
##  @code{.cpp}
##
##  std::set<std::string> set_of_strings;
##  ...
##  vtkMultiProcessStream stream;
##  stream << set_of_strings; // save
##
##  .... do communication ...
##
##  vtkMultiProcessStream result;
##  stream >> result; // load
##
##  ...
##  @endcode
##

## !!!Ignored construct:  # vtkMultiProcessSerialization_h [NewLine] # vtkMultiProcessSerialization_h [NewLine] # vtkMultiProcessStream.h [NewLine] # < array > [NewLine] # < map > [NewLine] # < set > [NewLine] # < utility > [NewLine] # < vector > [NewLine] template < typename T > [end of template] struct Serialization { static void Save ( vtkMultiProcessStream & stream , const T & t ) { stream << t ; } static void Load ( vtkMultiProcessStream & stream , T & t ) { stream >> t ; } } ;
## Error: identifier expected, but got: <!!!

## !!!Ignored construct:  template < typename ElementType > [end of template] struct Serialization < std :: set < ElementType >> { static void Save ( vtkMultiProcessStream & stream , const std :: set < ElementType > & set ) { stream << static_cast < vtkTypeInt64 > ( set . size ( ) ) ; for ( const auto & elem : set ) { Serialization < ElementType > :: Save ( stream , elem ) ; } } static void Load ( vtkMultiProcessStream & stream , std :: set < ElementType > & set ) { vtkTypeInt64 count ; stream >> count ; for ( vtkTypeInt64 cc = 0 ; cc < count ; ++ cc ) { ElementType elem ; Serialization < ElementType > :: Load ( stream , elem ) ; set . insert ( std :: move ( elem ) ) ; } } } ;
## Error: identifier expected, but got: <!!!

## !!!Ignored construct:  template < typename ElementType , std :: size_t N > [end of template] struct Serialization < std :: array < ElementType , N >> { static void Save ( vtkMultiProcessStream & stream , const std :: array < ElementType , N > & array ) { for ( const auto & elem : array ) { Serialization < ElementType > :: Save ( stream , elem ) ; } } static void Load ( vtkMultiProcessStream & stream , std :: array < ElementType , N > & array ) { for ( std :: size_t cc = 0 ; cc < N ; ++ cc ) { Serialization < ElementType > :: Load ( stream , array [ cc ] ) ; } } } ;
## Error: token expected: > [end of template] but got: [identifier]!!!

## !!!Ignored construct:  template < typename T1 , typename T2 > [end of template] struct Serialization < std :: pair < T1 , T2 >> { static void Save ( vtkMultiProcessStream & stream , const std :: pair < T1 , T2 > & pair ) { Serialization < T1 > :: Save ( stream , pair . first ) ; Serialization < T2 > :: Save ( stream , pair . second ) ; } static void Load ( vtkMultiProcessStream & stream , std :: pair < T1 , T2 > & pair ) { Serialization < T1 > :: Load ( stream , pair . first ) ; Serialization < T2 > :: Load ( stream , pair . second ) ; } } ;
## Error: identifier expected, but got: <!!!

## !!!Ignored construct:  template < typename T1 , typename T2 > [end of template] struct Serialization < std :: map < T1 , T2 >> { static void Save ( vtkMultiProcessStream & stream , const std :: map < T1 , T2 > & map ) { stream << static_cast < vtkTypeInt64 > ( map . size ( ) ) ; for ( const auto & pair : map ) { Serialization < std :: pair < T1 , T2 >> :: Save ( stream , pair ) ; } } static void Load ( vtkMultiProcessStream & stream , std :: map < T1 , T2 > & map ) { vtkTypeInt64 count ; stream >> count ; for ( vtkTypeInt64 cc = 0 ; cc < count ; ++ cc ) { std :: pair < T1 , T2 > pair ; Serialization < std :: pair < T1 , T2 >> :: Load ( stream , pair ) ; map . insert ( std :: move ( pair ) ) ; } } } ;
## Error: identifier expected, but got: <!!!

## !!!Ignored construct:  template < typename ElementType > [end of template] struct Serialization < std :: vector < ElementType >> { static void Save ( vtkMultiProcessStream & stream , const std :: vector < ElementType > & vector ) { stream << static_cast < vtkTypeInt64 > ( vector . size ( ) ) ; for ( const auto & elem : vector ) { Serialization < ElementType > :: Save ( stream , elem ) ; } } static void Load ( vtkMultiProcessStream & stream , std :: vector < ElementType > & vector ) { vtkTypeInt64 count ; stream >> count ; for ( vtkTypeInt64 cc = 0 ; cc < count ; ++ cc ) { ElementType elem ; Serialization < ElementType > :: Load ( stream , elem ) ; vector . push_back ( std :: move ( elem ) ) ; } } } ;
## Error: identifier expected, but got: <!!!

proc `<<`*(stream: var vtkMultiProcessStream; value: T): var vtkMultiProcessStream {.
    importcpp: "(# << #)", header: "vtkMultiProcessStreamSerialization.h".}
proc `>>`*(stream: var vtkMultiProcessStream; value: var T): var vtkMultiProcessStream {.
    importcpp: "(# >> #)", header: "vtkMultiProcessStreamSerialization.h".}
##  VTK-HeaderTest-Exclude: vtkMultiProcessStreamSerialization.h

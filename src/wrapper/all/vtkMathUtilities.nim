## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMathUtilities.h
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
##  @class   vtkMathUtilities
##  @brief   templated utility math functions intended for
##  internal use in tests etc.
##
##
##  Provide a set of inline, lightweight templated math utility functions.
##  The initial motivation is to provide a few lightweight functions to help in
##  testing and internal implementation files.
##

## *
##  Perform a fuzzy compare of floats/doubles, specify the allowed tolerance
##

proc FuzzyCompare*[A](a: A; b: A; epsilon: A = epsilon[A]()): bool =
  discard

## *
##  Performs safe division that catches overflow and underflow.
##

proc SafeDivision*[A](a: A; b: A): A =
  discard

## *
##  A slightly different fuzzy comparator that checks if two values are
##  "nearly" equal based on Knuth, "The Art of Computer Programming (vol II)"
##

proc NearlyEqual*[A](a: A; b: A; tol: A = epsilon[A]()): bool =
  discard

## *
##  Update an existing min - max range with a new prospective value.  If the
##  value is non NaN then the appropriate range comparisons are made and
##  updated, otherwise the original min - max values are set.
##
##  Examples:
##
##    No change:
##    UpdateRange(-100, 100, 20) -> (-100, 100)
##
##    Update min:
##    UpdateRange(-100, 100, -200) -> (-200, 100)
##
##    Update max:
##    UpdateRange(-100, 100, 200) -> (-100, 200)
##
##    Input min and max are inverted creating an invalid range so a new range
##    with the specified value is set:
##    UpdateRange(100, -100, 20) -> (20, 20)
##
##    Input value is NaN so the original range is set
##    UpdateRange(-100, 100, NaN) -> (-100, 100)
##

proc UpdateRangeImpl*[A](min0: var A; max0: var A; value: A) =
  discard

## !!!Ignored construct:  template < class A > [end of template]  Non floating point implementation not caring about NaN void UpdateRange ( A & min0 , A & max0 , const A & value , typename std :: enable_if < ! std :: is_floating_point < A > :: value > :: type * = 0 ) { UpdateRangeImpl < A > ( min0 , max0 , value ) ; } template < class A >  Floating point implementation specifically considering NaN void UpdateRange ( A & min0 , A & max0 , const A & value , typename std :: enable_if < std :: is_floating_point < A > :: value > :: type * = 0 ) { if ( ! std :: isnan ( value ) ) { UpdateRangeImpl < A > ( min0 , max0 , value ) ; } } }
## Error: identifier expected, but got:  Non floating point implementation not caring about NaN!!!

##  End vtkMathUtilities namespace.

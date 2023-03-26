## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVectorOperators.h
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

## !!!Ignored construct:  # vtkVectorOperators_h [NewLine] # vtkVectorOperators_h [NewLine]  This set of operators enhance the vtkVector classes, allowing various
##  operator overloads one might expect. # vtkVector.h [NewLine]  Description:
##  Unary minus / negation of vector. template < typename A , int Size > [end of template] vtkVector < A , Size > [end of template] operator - ( const vtkVector < A , Size > [end of template] & v ) { vtkVector < A , Size > [end of template] ret ; for ( int i = 0 ; i < Size ; ++ i ) { ret [ i ] = - v [ i ] ; } return ret ; }  Description:
##  Performs addition of vectors of the same basic type. template < typename A , int Size > [end of template] vtkVector < A , Size > [end of template] operator + ( const vtkVector < A , Size > [end of template] & v1 , const vtkVector < A , Size > [end of template] & v2 ) { vtkVector < A , Size > [end of template] ret ; for ( int i = 0 ; i < Size ; ++ i ) { ret [ i ] = v1 [ i ] + v2 [ i ] ; } return ret ; }  Description:
##  Add the vector b to the vector a of the same basic type. template < typename T , int Size > [end of template] vtkVector < T , Size > [end of template] & operator += ( vtkVector < T , Size > [end of template] & a , const vtkVector < T , Size > [end of template] & b ) { for ( int dim = 0 ; dim < Size ; ++ dim ) { a [ dim ] += b [ dim ] ; } return a ; }  Description:
##  Performs subtraction of vectors of the same basic type. template < typename A , int Size > [end of template] vtkVector < A , Size > [end of template] operator - ( const vtkVector < A , Size > [end of template] & v1 , const vtkVector < A , Size > [end of template] & v2 ) { vtkVector < A , Size > [end of template] ret ; for ( int i = 0 ; i < Size ; ++ i ) { ret [ i ] = v1 [ i ] - v2 [ i ] ; } return ret ; }  Description:
##  Substract the vector b to the vector a of the same basic type. template < typename T , int Size > [end of template] vtkVector < T , Size > [end of template] & operator -= ( vtkVector < T , Size > [end of template] & a , const vtkVector < T , Size > [end of template] & b ) { for ( int dim = 0 ; dim < Size ; ++ dim ) { a [ dim ] -= b [ dim ] ; } return a ; }  Description:
##  Performs multiplication of vectors of the same basic type. template < typename A , int Size > [end of template] vtkVector < A , Size > [end of template] operator * ( const vtkVector < A , Size > [end of template] & v1 , const vtkVector < A , Size > [end of template] & v2 ) { vtkVector < A , Size > [end of template] ret ; for ( int i = 0 ; i < Size ; ++ i ) { ret [ i ] = v1 [ i ] * v2 [ i ] ; } return ret ; }  Description:
##  Performs multiplication of vectors by a scalar value. template < typename A , typename B , int Size > [end of template] vtkVector < A , Size > [end of template] operator * ( const vtkVector < A , Size > [end of template] & v1 , const B & scalar ) { vtkVector < A , Size > [end of template] ret ; for ( int i = 0 ; i < Size ; ++ i ) { ret [ i ] = v1 [ i ] * scalar ; } return ret ; }  Description:
##  Performs divisiom of vectors of the same type. template < typename A , int Size > [end of template] vtkVector < A , Size > [end of template] operator / ( const vtkVector < A , Size > [end of template] & v1 , const vtkVector < A , Size > [end of template] & v2 ) { vtkVector < A , Size > [end of template] ret ; for ( int i = 0 ; i < Size ; ++ i ) { ret [ i ] = v1 [ i ] / v2 [ i ] ; } return ret ; }  Description:
##  Several macros to define the various operator overloads for the vectors. # vtkVectorOperatorNegate ( vectorType , type , size ) inline vectorType operator - ( const vectorType & v ) { return vectorType ( ( - static_cast < vtkVector < type , size > [end of template] > [end of template] ( v ) ) . GetData ( ) ) ; } [NewLine] # vtkVectorOperatorPlus ( vectorType , type , size ) inline vectorType operator + ( const vectorType & v1 , const vectorType & v2 ) { return vectorType ( ( static_cast < vtkVector < type , size > [end of template] > [end of template] ( v1 ) + static_cast < vtkVector < type , size > [end of template] > [end of template] ( v2 ) ) . GetData ( ) ) ; } [NewLine] # vtkVectorOperatorMinus ( vectorType , type , size ) inline vectorType operator - ( const vectorType & v1 , const vectorType & v2 ) { return vectorType ( ( static_cast < vtkVector < type , size > [end of template] > [end of template] ( v1 ) - static_cast < vtkVector < type , size > [end of template] > [end of template] ( v2 ) ) . GetData ( ) ) ; } [NewLine] # vtkVectorOperatorMultiply ( vectorType , type , size ) inline vectorType operator * ( const vectorType & v1 , const vectorType & v2 ) { return vectorType ( ( static_cast < vtkVector < type , size > [end of template] > [end of template] ( v1 ) * static_cast < vtkVector < type , size > [end of template] > [end of template] ( v2 ) ) . GetData ( ) ) ; } [NewLine] # vtkVectorOperatorMultiplyScalar ( vectorType , type , size ) template < typename B > [end of template] inline vectorType operator * ( const vectorType & v1 , const B & scalar ) { return vectorType ( ( static_cast < vtkVector < type , size >> ( v1 ) * scalar ) . GetData ( ) ) ; } [NewLine] # vtkVectorOperatorMultiplyScalarPre ( vectorType , type , size ) template < typename B > inline vectorType operator * ( const B & scalar , const vectorType & v1 ) { return vectorType ( ( static_cast < vtkVector < type , size >> ( v1 ) * scalar ) . GetData ( ) ) ; } [NewLine] # vtkVectorOperatorDivide ( vectorType , type , size ) inline vectorType operator / ( const vectorType & v1 , const vectorType & v2 ) { return vectorType ( ( static_cast < vtkVector < type , size >> ( v1 ) / static_cast < vtkVector < type , size >> ( v2 ) ) . GetData ( ) ) ; } [NewLine] # vtkVectorOperatorMacro ( vectorType , type , size ) vtkVectorOperatorNegate ( vectorType , type , size ) ;
## Error: token expected: > [end of template] but got: [identifier]!!!

vtkVectorOperatorPlus(vectorType, `type`, size)
vtkVectorOperatorMinus(vectorType, `type`, size)
vtkVectorOperatorMultiply(vectorType, `type`, size)
vtkVectorOperatorMultiplyScalar(vectorType, `type`, size)
vtkVectorOperatorMultiplyScalarPre(vectorType, `type`, size)
## !!!Ignored construct:  vtkVectorOperatorDivide ( vectorType , type , size ) [NewLine]  Description:
##  Overload the operators for the common types. vtkVectorOperatorMacro ( vtkVector2i , int , 2 ) ;
## Error: expected ';'!!!

vtkVectorOperatorMacro(vtkVector2f, float, 2)
vtkVectorOperatorMacro(vtkVector2d, double, 2)
vtkVectorOperatorMacro(vtkVector3i, int, 3)
vtkVectorOperatorMacro(vtkVector3f, float, 3)
vtkVectorOperatorMacro(vtkVector3d, double, 3)
##  VTK-HeaderTest-Exclude: vtkVectorOperators.h

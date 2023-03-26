## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParseMerge.h
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
##   Copyright (c) 2010,2015 David Gobbi
##
##   Contributed to the VisualizationToolkit by the author in March 2015
##   under the terms of the Visualization Toolkit 2015 copyright.
## -------------------------------------------------------------------------
## *
##  This file contains utility functions for merging together the
##  methods for a class with those inherited from all superclasses.
##

## !!!Ignored construct:  # vtkParseMerge_h [NewLine] # vtkParseMerge_h [NewLine] # vtkParseData.h [NewLine] # vtkParseHierarchy.h [NewLine] # vtkWrappingToolsModule.h [NewLine] *
##  This struct is meant to supplement ClassInfo, it gives information
##  about which class (or classes) each method was inherited from
##  typedef struct MergeInfo_ { int NumberOfClasses ;  number of classes in genealogy const char * * ClassNames ;  class name int NumberOfFunctions ;  must match FunctionInfo int * NumberOfOverrides ;  n classes that define this function int * * OverrideClasses ;  class for the override } MergeInfo ;
## Error: token expected: ; but got: *!!!

## *
##  Merge all inherited methods into the ClassInfo.
##  This will find and parse the header files for all the superclasses,
##  and recursively add all inherited superclass methods into one ClassInfo.
##  The returned MergeInfo object provides information about which class
##  each inherited method was inherited from.
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT MergeInfo * vtkParseMerge_MergeSuperClasses ( FileInfo * finfo , NamespaceInfo * data , ClassInfo * classInfo ) ;
## Error: token expected: ; but got: *!!!

## *
##  Create an initialized MergeInfo object.
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT MergeInfo * vtkParseMerge_CreateMergeInfo ( ClassInfo * classInfo ) ;
## Error: token expected: ; but got: *!!!

## *
##  Free the MergeInfo object.
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParseMerge_FreeMergeInfo ( MergeInfo * info ) ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Recursive suproutine to inherit methods from "classname".
##  The class named by "classname" should be a superclass of the ClassInfo.
##  If the MergeInfo is not provided (if it is NULL), then the only methods
##  that are brought into the class are ones that are explicitly named
##  by using declarations.  The hintfile can also be NULL, if there is
##  no hints file.
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParseMerge_MergeHelper ( FileInfo * finfo , const NamespaceInfo * data , const HierarchyInfo * hinfo , const char * classname , int nhintfiles , char * * hintfiles , MergeInfo * info , ClassInfo * merge ) ;
## Error: token expected: ; but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkParseMerge.h

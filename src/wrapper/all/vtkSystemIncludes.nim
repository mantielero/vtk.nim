## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSystemIncludes.h
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
##  @class   vtkSystemIncludes
##  @brief   transition VTK to ANSI C++, centralize
##  inclusion of system files
##
##  The vtkSystemIncludes centralizes the inclusion of system include
##  files.
##

## !!!Ignored construct:  # vtkSystemIncludes_h [NewLine] # vtkSystemIncludes_h [NewLine]  first include the local configuration for this machine # [NewLine] # vtkWin32Header.h [NewLine] # [NewLine]  The language wrapper files do not need the real streams.  They
##  define VTK_STREAMS_FWD_ONLY so that the streams are only
##  forward-declared.  This significantly improves compile time on some
##  platforms. # defined ( VTK_STREAMS_FWD_ONLY ) [NewLine] # vtkIOStreamFwd.h  Forward-declare the C++ streams. # [NewLine] # vtkIOStream.h  Include the real C++ streams. # [NewLine]  Setup the basic types to be used by VTK. # vtkType.h [NewLine]  Define some macros to provide wrapping hints # vtkWrappingHints.h [NewLine]  this should be removed at some point # [NewLine] # [NewLine] # vtkOStreamWrapper.h  Include the ostream wrapper. [NewLine] # vtkOStrStreamWrapper.h  Include the ostrstream wrapper. # [NewLine]  Include generic stuff. # < stdio . h > [NewLine] # < stdlib . h > [NewLine] # < string . h > [NewLine]  These types define error codes for vtk functions # VTK_OK 1 [NewLine] # VTK_ERROR 2 [NewLine]  These types define different text properties # VTK_ARIAL 0 [NewLine] # VTK_COURIER 1 [NewLine] # VTK_TIMES 2 [NewLine] # VTK_UNKNOWN_FONT 3 [NewLine] # VTK_FONT_FILE 4 [NewLine] # VTK_TEXT_LEFT 0 [NewLine] # VTK_TEXT_CENTERED 1 [NewLine] # VTK_TEXT_RIGHT 2 [NewLine] # VTK_TEXT_BOTTOM 0 [NewLine] # VTK_TEXT_TOP 2 [NewLine] # VTK_TEXT_GLOBAL_ANTIALIASING_SOME 0 [NewLine] # VTK_TEXT_GLOBAL_ANTIALIASING_NONE 1 [NewLine] # VTK_TEXT_GLOBAL_ANTIALIASING_ALL 2 [NewLine] # VTK_LUMINANCE 1 [NewLine] # VTK_LUMINANCE_ALPHA 2 [NewLine] # VTK_RGB 3 [NewLine] # VTK_RGBA 4 [NewLine] # VTK_COLOR_MODE_DEFAULT 0 [NewLine] # VTK_COLOR_MODE_MAP_SCALARS 1 [NewLine] # VTK_COLOR_MODE_DIRECT_SCALARS 2 [NewLine]  Constants for InterpolationType # VTK_NEAREST_INTERPOLATION 0 [NewLine] # VTK_LINEAR_INTERPOLATION 1 [NewLine] # VTK_CUBIC_INTERPOLATION 2 [NewLine]  Constants for SlabType # VTK_IMAGE_SLAB_MIN 0 [NewLine] # VTK_IMAGE_SLAB_MAX 1 [NewLine] # VTK_IMAGE_SLAB_MEAN 2 [NewLine] # VTK_IMAGE_SLAB_SUM 3 [NewLine]  For volume rendering # VTK_MAX_VRCOMP 4 [NewLine]  For encoding # VTK_ENCODING_NONE 0  to specify that no encoding should occur # VTK_ENCODING_US_ASCII 1 [NewLine] # VTK_ENCODING_UNICODE 2 [NewLine] # VTK_ENCODING_UTF_8 3 [NewLine] # VTK_ENCODING_ISO_8859_1 4 [NewLine] # VTK_ENCODING_ISO_8859_2 5 [NewLine] # VTK_ENCODING_ISO_8859_3 6 [NewLine] # VTK_ENCODING_ISO_8859_4 7 [NewLine] # VTK_ENCODING_ISO_8859_5 8 [NewLine] # VTK_ENCODING_ISO_8859_6 9 [NewLine] # VTK_ENCODING_ISO_8859_7 10 [NewLine] # VTK_ENCODING_ISO_8859_8 11 [NewLine] # VTK_ENCODING_ISO_8859_9 12 [NewLine] # VTK_ENCODING_ISO_8859_10 13 [NewLine] # VTK_ENCODING_ISO_8859_11 14 [NewLine] # VTK_ENCODING_ISO_8859_12 15 [NewLine] # VTK_ENCODING_ISO_8859_13 16 [NewLine] # VTK_ENCODING_ISO_8859_14 17 [NewLine] # VTK_ENCODING_ISO_8859_15 18 [NewLine] # VTK_ENCODING_ISO_8859_16 19 [NewLine] # VTK_ENCODING_UNKNOWN 20  leave this one at the end [NewLine] # [NewLine]  VTK-HeaderTest-Exclude: vtkSystemIncludes.h
## Error: identifier expected, but got: [NewLine]!!!

## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParseData.h
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
##   Copyright (c) 2010 David Gobbi.
##
##   Contributed to the VisualizationToolkit by the author in May 2010
##   under the terms of the Visualization Toolkit 2008 copyright.
## -------------------------------------------------------------------------
##
##   Data structures used by vtkParse.
##

## !!!Ignored construct:  # vtkParseData_h [NewLine] # vtkParseData_h [NewLine] # vtkParseAttributes.h [NewLine] # vtkParseString.h [NewLine] # vtkParseType.h [NewLine] # vtkWrappingToolsModule.h [NewLine]  legacy # VTK_PARSE_LEGACY_REMOVE [NewLine] # MAX_ARGS 20 [NewLine] # [NewLine] *
##  Access flags
##  typedef enum parse_access_t_ { VTK_ACCESS_PUBLIC = 0 , VTK_ACCESS_PROTECTED = 1 , VTK_ACCESS_PRIVATE = 2 } parse_access_t ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Comment type constants
##

type
  parse_dox_t* {.size: sizeof(cint), importcpp: "ClassInfo_::ClassInfo_::ClassInfo_::ClassInfo::ClassInfo_::ClassInfo_::FileInfo_::parse_dox_t",
                header: "vtkParseData.h".} = enum
    DOX_COMMAND_OTHER = 0, DOX_COMMAND_DEF, DOX_COMMAND_CATEGORY,
    DOX_COMMAND_INTERFACE, DOX_COMMAND_PROTOCOL, DOX_COMMAND_CLASS,
    DOX_COMMAND_ENUM, DOX_COMMAND_STRUCT, DOX_COMMAND_UNION, DOX_COMMAND_NAMESPACE,
    DOX_COMMAND_TYPEDEF, DOX_COMMAND_FN, DOX_COMMAND_PROPERTY, DOX_COMMAND_VAR,
    DOX_COMMAND_NAME, DOX_COMMAND_DEFGROUP, DOX_COMMAND_ADDTOGROUP,
    DOX_COMMAND_WEAKGROUP, DOX_COMMAND_EXAMPLE, DOX_COMMAND_FILE, DOX_COMMAND_DIR,
    DOX_COMMAND_MAINPAGE, DOX_COMMAND_PAGE, DOX_COMMAND_SUBPAGE,
    DOX_COMMAND_INTERNAL, DOX_COMMAND_PACKAGE, DOX_COMMAND_PRIVATESECTION,
    DOX_COMMAND_PROTECTEDSECTION, DOX_COMMAND_PUBLICSECTION


## *
##  ItemType constants
##

type
  parse_item_t* {.size: sizeof(cint), importcpp: "ClassInfo_::ClassInfo_::ClassInfo_::ClassInfo::ClassInfo_::ClassInfo_::FileInfo_::parse_item_t",
                 header: "vtkParseData.h".} = enum
    VTK_NAMESPACE_INFO = 1, VTK_CLASS_INFO = 2, VTK_STRUCT_INFO = 3, VTK_UNION_INFO = 4,
    VTK_ENUM_INFO = 5, VTK_FUNCTION_INFO = 6, VTK_VARIABLE_INFO = 7,
    VTK_CONSTANT_INFO = 8, VTK_TYPEDEF_INFO = 9, VTK_USING_INFO = 10


## *
##  ItemInfo just contains an index
##

type
  ItemInfo* {.importcpp: "ClassInfo_::ClassInfo_::ClassInfo_::ClassInfo::ClassInfo_::ClassInfo_::FileInfo_::ItemInfo",
             header: "vtkParseData.h", bycopy.} = object
    Type* {.importc: "Type".}: parse_item_t
    Index* {.importc: "Index".}: cint


##  forward declarations

discard "forward decl of ValueInfo_"
discard "forward decl of FunctionInfo_"
discard "forward decl of FileInfo_"
type
  ValueInfo* = ValueInfo_
  FunctionInfo* = FunctionInfo_
  FileInfo* = FileInfo_

## *
##  CommentInfo is for storing comments by category
##  This is for comments that cannot be immediately attached to an item,
##  for example class comments that come at the top of the header file
##  rather than immediately before the class that they document.
##

type
  CommentInfo* {.importcpp: "ClassInfo_::ClassInfo_::ClassInfo_::ClassInfo::ClassInfo_::ClassInfo_::FileInfo_::CommentInfo",
                header: "vtkParseData.h", bycopy.} = object
    Type* {.importc: "Type".}: parse_dox_t
    Comment* {.importc: "Comment".}: cstring
    Name* {.importc: "Name".}: cstring


## *
##  TemplateInfo holds template definitions
##

type
  TemplateInfo* {.importcpp: "ClassInfo_::ClassInfo_::ClassInfo_::ClassInfo::ClassInfo_::ClassInfo_::FileInfo_::TemplateInfo",
                 header: "vtkParseData.h", bycopy.} = object
    NumberOfParameters* {.importc: "NumberOfParameters".}: cint
    Parameters* {.importc: "Parameters".}: ptr ptr ValueInfo


## *
##  ValueInfo is for typedefs, constants, variables,
##  function parameters, and return values
##
##  Note that Dimensions is an array of char pointers, in
##  order to support dimensions that are sized according to
##  template parameter values or according to named constants.
##

type
  ValueInfo_* {.importcpp: "ClassInfo_::ClassInfo_::ClassInfo_::ClassInfo::ClassInfo_::ClassInfo_::FileInfo_::ValueInfo_",
               header: "vtkParseData.h", bycopy.} = object
    ItemType* {.importc: "ItemType".}: parse_item_t
    Access* {.importc: "Access".}: parse_access_t
    Name* {.importc: "Name".}: cstring
    Comment* {.importc: "Comment".}: cstring
    Value* {.importc: "Value".}: cstring ##  for vars or default parameters values
    Attributes* {.importc: "Attributes".}: cuint ##  as defined in vtkParseAttributes.h
    Type* {.importc: "Type".}: cuint ##  as defined in vtkParseType.h
    Class* {.importc: "Class".}: cstring ##  classname for type
    Count* {.importc: "Count".}: cint ##  total number of values, if known
    CountHint* {.importc: "CountHint".}: cstring ##  hint about how to get the count
    NumberOfDimensions* {.importc: "NumberOfDimensions".}: cint ##  dimensionality for arrays
    Dimensions* {.importc: "Dimensions".}: cstringArray ##  dimensions for arrays
    Function* {.importc: "Function".}: ptr FunctionInfo ##  for function pointer values
    Template* {.importc: "Template".}: ptr TemplateInfo ##  template parameters, or NULL
    IsStatic* {.importc: "IsStatic".}: cint ##  for class variables only
    IsEnum* {.importc: "IsEnum".}: cint ##  for constants only
    IsPack* {.importc: "IsPack".}: cint ##  for pack expansions


## *
##  FunctionInfo is for functions and methods
##

type
  FunctionInfo_* {.importcpp: "ClassInfo_::ClassInfo_::ClassInfo_::ClassInfo::ClassInfo_::ClassInfo_::FileInfo_::FunctionInfo_",
                  header: "vtkParseData.h", bycopy.} = object
    ItemType* {.importc: "ItemType".}: parse_item_t
    Access* {.importc: "Access".}: parse_access_t
    Name* {.importc: "Name".}: cstring
    Comment* {.importc: "Comment".}: cstring
    Class* {.importc: "Class".}: cstring ##  class name for methods
    Signature* {.importc: "Signature".}: cstring ##  function signature as text
    Template* {.importc: "Template".}: ptr TemplateInfo ##  template parameters, or NULL
    NumberOfParameters* {.importc: "NumberOfParameters".}: cint
    Parameters* {.importc: "Parameters".}: ptr ptr ValueInfo
    ReturnValue* {.importc: "ReturnValue".}: ptr ValueInfo ##  NULL for constructors and destructors
    NumberOfPreconds* {.importc: "NumberOfPreconds".}: cint
    Preconds* {.importc: "Preconds".}: cstringArray ##  preconditions
    Macro* {.importc: "Macro".}: cstring ##  the macro that defined this function
    SizeHint* {.importc: "SizeHint".}: cstring ##  hint the size e.g. for operator[]
    DeprecatedReason* {.importc: "DeprecatedReason".}: cstring ##  reason for deprecation, or NULL
    DeprecatedVersion* {.importc: "DeprecatedVersion".}: cstring ##  version of deprecation, or NULL
    IsOperator* {.importc: "IsOperator".}: cint
    IsVariadic* {.importc: "IsVariadic".}: cint
    IsExcluded* {.importc: "IsExcluded".}: cint ##  marked as excluded from wrapping
    IsDeprecated* {.importc: "IsDeprecated".}: cint ##  method or function has been deprecated
    IsStatic* {.importc: "IsStatic".}: cint ##  methods only
    IsVirtual* {.importc: "IsVirtual".}: cint ##  methods only
    IsPureVirtual* {.importc: "IsPureVirtual".}: cint ##  methods only
    IsConst* {.importc: "IsConst".}: cint ##  methods only
    IsDeleted* {.importc: "IsDeleted".}: cint ##  methods only
    IsFinal* {.importc: "IsFinal".}: cint ##  methods only
    IsOverride* {.importc: "IsOverride".}: cint ##  methods only
    IsExplicit* {.importc: "IsExplicit".}: cint ##  constructors only
    when not defined(VTK_PARSE_LEGACY_REMOVE):
      NumberOfArguments* {.importc: "NumberOfArguments".}: cint ##  legacy
    when not defined(VTK_PARSE_LEGACY_REMOVE):
      ArgTypes* {.importc: "ArgTypes".}: array[MAX_ARGS, cuint] ##  legacy
    when not defined(VTK_PARSE_LEGACY_REMOVE):
      ArgClasses* {.importc: "ArgClasses".}: array[MAX_ARGS, cstring] ##  legacy
    when not defined(VTK_PARSE_LEGACY_REMOVE):
      ArgCounts* {.importc: "ArgCounts".}: array[MAX_ARGS, cint] ##  legacy
    when not defined(VTK_PARSE_LEGACY_REMOVE):
      ReturnType* {.importc: "ReturnType".}: cuint ##  legacy
    when not defined(VTK_PARSE_LEGACY_REMOVE):
      ReturnClass* {.importc: "ReturnClass".}: cstring ##  legacy
    when not defined(VTK_PARSE_LEGACY_REMOVE):
      HaveHint* {.importc: "HaveHint".}: cint ##  legacy
    when not defined(VTK_PARSE_LEGACY_REMOVE):
      HintSize* {.importc: "HintSize".}: cint ##  legacy
    when not defined(VTK_PARSE_LEGACY_REMOVE):
      ArrayFailure* {.importc: "ArrayFailure".}: cint ##  legacy
    when not defined(VTK_PARSE_LEGACY_REMOVE):
      IsPublic* {.importc: "IsPublic".}: cint ##  legacy
    when not defined(VTK_PARSE_LEGACY_REMOVE):
      IsProtected* {.importc: "IsProtected".}: cint ##  legacy
    when not defined(VTK_PARSE_LEGACY_REMOVE):
      IsLegacy* {.importc: "IsLegacy".}: cint ##  legacy


## *
##  UsingInfo is for using directives
##

type
  UsingInfo* {.importcpp: "ClassInfo_::ClassInfo_::ClassInfo_::ClassInfo::ClassInfo_::ClassInfo_::FileInfo_::UsingInfo",
              header: "vtkParseData.h", bycopy.} = object
    ItemType* {.importc: "ItemType".}: parse_item_t
    Access* {.importc: "Access".}: parse_access_t
    Name* {.importc: "Name".}: cstring ##  null for using whole namespace
    Comment* {.importc: "Comment".}: cstring
    Scope* {.importc: "Scope".}: cstring ##  the namespace or class


## *
##  ClassInfo is for classes, structs, unions, and namespaces
##

var Classes* {.importcpp: "Classes", header: "vtkParseData.h".}: ptr ptr ClassInfoClassInfo_

var Enums* {.importcpp: "Enums", header: "vtkParseData.h".}: ptr ptr ClassInfoClassInfo_

var Namespaces* {.importcpp: "Namespaces", header: "vtkParseData.h".}: ptr ptr ClassInfoClassInfo_

type
  ClassInfo* {.importcpp: "ClassInfo_::ClassInfo_::ClassInfo_::ClassInfo::ClassInfo_::ClassInfo_::FileInfo_::ClassInfo_::ClassInfo_::ClassInfo_::ClassInfo::ClassInfo_::ClassInfo_::ClassInfo",
              header: "vtkParseData.h", bycopy.} = object
    ItemType* {.importc: "ItemType".}: parse_item_t
    Access* {.importc: "Access".}: parse_access_t
    Name* {.importc: "Name".}: cstring
    Comment* {.importc: "Comment".}: cstring
    Template* {.importc: "Template".}: ptr TemplateInfo
    NumberOfSuperClasses* {.importc: "NumberOfSuperClasses".}: cint
    SuperClasses* {.importc: "SuperClasses".}: cstringArray
    NumberOfItems* {.importc: "NumberOfItems".}: cint
    Items* {.importc: "Items".}: ptr ItemInfo
    NumberOfClasses* {.importc: "NumberOfClasses".}: cint
    NumberOfFunctions* {.importc: "NumberOfFunctions".}: cint
    Functions* {.importc: "Functions".}: ptr ptr FunctionInfo
    NumberOfConstants* {.importc: "NumberOfConstants".}: cint
    Constants* {.importc: "Constants".}: ptr ptr ValueInfo
    NumberOfVariables* {.importc: "NumberOfVariables".}: cint
    Variables* {.importc: "Variables".}: ptr ptr ValueInfo
    NumberOfEnums* {.importc: "NumberOfEnums".}: cint
    NumberOfTypedefs* {.importc: "NumberOfTypedefs".}: cint
    Typedefs* {.importc: "Typedefs".}: ptr ptr ValueInfo
    NumberOfUsings* {.importc: "NumberOfUsings".}: cint
    Usings* {.importc: "Usings".}: ptr ptr UsingInfo
    NumberOfNamespaces* {.importc: "NumberOfNamespaces".}: cint
    NumberOfComments* {.importc: "NumberOfComments".}: cint
    Comments* {.importc: "Comments".}: ptr ptr CommentInfo
    DeprecatedReason* {.importc: "DeprecatedReason".}: cstring
    DeprecatedVersion* {.importc: "DeprecatedVersion".}: cstring
    IsAbstract* {.importc: "IsAbstract".}: cint
    IsFinal* {.importc: "IsFinal".}: cint
    HasDelete* {.importc: "HasDelete".}: cint
    IsExcluded* {.importc: "IsExcluded".}: cint
    IsDeprecated* {.importc: "IsDeprecated".}: cint


## *
##  EnumInfo is for enums
##  For scoped enums, the constants are in the enum itself, but for
##  standard enums, the constants are at the same level as the enum.
##

type
  EnumInfo* = ClassInfo_

## *
##  Namespace is for namespaces
##

type
  NamespaceInfo* = ClassInfo_

## *
##  FileInfo is for header files
##

type
  FileInfo_* {.importcpp: "ClassInfo_::ClassInfo_::ClassInfo_::ClassInfo::ClassInfo_::ClassInfo_::FileInfo_::ClassInfo_::ClassInfo_::ClassInfo_::ClassInfo::ClassInfo_::ClassInfo_::FileInfo_::FileInfo_",
              header: "vtkParseData.h", bycopy.} = object
    FileName* {.importc: "FileName".}: cstring
    NameComment* {.importc: "NameComment".}: cstring
    Description* {.importc: "Description".}: cstring
    Caveats* {.importc: "Caveats".}: cstring
    SeeAlso* {.importc: "SeeAlso".}: cstring
    NumberOfIncludes* {.importc: "NumberOfIncludes".}: cint
    MainClass* {.importc: "MainClass".}: ptr ClassInfo
    Contents* {.importc: "Contents".}: ptr NamespaceInfo
    Strings* {.importc: "Strings".}: ptr StringCache


var Includes* {.importcpp: "Includes", header: "vtkParseData.h".}: ptr ptr FileInfo_FileInfo_

## *
##  Initializer methods
##
## @{

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_InitFile ( FileInfo * file_info ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_InitNamespace ( NamespaceInfo * namespace_info ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_InitClass ( ClassInfo * cls ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_InitFunction ( FunctionInfo * func ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_InitValue ( ValueInfo * val ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_InitEnum ( EnumInfo * item ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_InitUsing ( UsingInfo * item ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_InitTemplate ( TemplateInfo * arg ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_InitComment ( CommentInfo * arg ) ;
## Error: token expected: ; but got: [identifier]!!!

## @}
## *
##  Copy methods
##
##  Strings are not deep-copied, they are assumed to be persistent.
##
## @{

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_CopyNamespace ( NamespaceInfo * data , const NamespaceInfo * orig ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_CopyClass ( ClassInfo * data , const ClassInfo * orig ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_CopyFunction ( FunctionInfo * data , const FunctionInfo * orig ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_CopyValue ( ValueInfo * data , const ValueInfo * orig ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_CopyEnum ( EnumInfo * data , const EnumInfo * orig ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_CopyUsing ( UsingInfo * data , const UsingInfo * orig ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_CopyTemplate ( TemplateInfo * data , const TemplateInfo * orig ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_CopyComment ( CommentInfo * data , const CommentInfo * orig ) ;
## Error: token expected: ; but got: [identifier]!!!

## @}
## *
##  Free methods
##
##  Strings are not freed, they are assumed to be persistent.
##
## @{

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_FreeFile ( FileInfo * file_info ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_FreeNamespace ( NamespaceInfo * namespace_info ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_FreeClass ( ClassInfo * cls ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_FreeFunction ( FunctionInfo * func ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_FreeValue ( ValueInfo * val ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_FreeEnum ( EnumInfo * item ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_FreeUsing ( UsingInfo * item ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_FreeTemplate ( TemplateInfo * arg ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_FreeComment ( CommentInfo * arg ) ;
## Error: token expected: ; but got: [identifier]!!!

## @}
## *
##  Add a string to an array of strings, grow array as necessary.
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_AddStringToArray ( const char * * * valueArray , int * count , const char * value ) ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Expand the Item array for classes and namespaces.
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_AddItemToArray ( ItemInfo * * valueArray , int * count , parse_item_t type , int idx ) ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Add various items to the structs.
##
## @{

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_AddIncludeToFile ( FileInfo * info , FileInfo * item ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_AddClassToClass ( ClassInfo * info , ClassInfo * item ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_AddFunctionToClass ( ClassInfo * info , FunctionInfo * item ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_AddEnumToClass ( ClassInfo * info , EnumInfo * item ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_AddConstantToClass ( ClassInfo * info , ValueInfo * item ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_AddVariableToClass ( ClassInfo * info , ValueInfo * item ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_AddTypedefToClass ( ClassInfo * info , ValueInfo * item ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_AddUsingToClass ( ClassInfo * info , UsingInfo * item ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_AddCommentToClass ( ClassInfo * info , CommentInfo * item ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_AddNamespaceToNamespace ( NamespaceInfo * info , NamespaceInfo * item ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_AddClassToNamespace ( NamespaceInfo * info , ClassInfo * item ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_AddFunctionToNamespace ( NamespaceInfo * info , FunctionInfo * item ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_AddEnumToNamespace ( NamespaceInfo * info , EnumInfo * item ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_AddConstantToNamespace ( NamespaceInfo * info , ValueInfo * item ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_AddVariableToNamespace ( NamespaceInfo * info , ValueInfo * item ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_AddTypedefToNamespace ( NamespaceInfo * info , ValueInfo * item ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_AddUsingToNamespace ( NamespaceInfo * info , UsingInfo * item ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_AddCommentToNamespace ( NamespaceInfo * info , CommentInfo * item ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_AddParameterToFunction ( FunctionInfo * info , ValueInfo * item ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_AddParameterToTemplate ( TemplateInfo * info , ValueInfo * item ) ;
## Error: token expected: ; but got: [identifier]!!!

## @}
## *
##  Add default constructors to a class if they do not already exist
##

proc vtkParse_AddDefaultConstructors*(cls: ptr ClassInfo; cache: ptr StringCache) {.
    importcpp: "vtkParse_AddDefaultConstructors(@)", header: "vtkParseData.h".}
##  VTK-HeaderTest-Exclude: vtkParseData.h

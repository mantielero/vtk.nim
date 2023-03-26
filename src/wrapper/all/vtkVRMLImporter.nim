## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVRMLImporter.h
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
##  @class   vtkVRMLImporter
##  @brief   imports VRML 2.0 files.
##
##
##  vtkVRMLImporter imports VRML 2.0 files into VTK.
##
##  @warning
##  These nodes are currently supported:
##       Appearance                              IndexedFaceSet
##       Box                                     IndexedLineSet
##       Color                                   Material
##       Cone                                    Shape
##       Coordinate                              Sphere
##       Cylinder                                Transform
##       DirectionalLight
##
##  @warning
##  As you can see this implementation focuses on getting the geometry
##  translated.  The routes and scripting nodes are ignored since they deal
##  with directly accessing a nodes internal structure based on the VRML
##  spec. Since this is a translation the internal data structures differ
##  greatly from the VRML spec and the External Authoring Interface (see the
##  VRML spec). The DEF/USE mechanism does allow the VTK user to extract
##  objects from the scene and directly manipulate them using the native
##  language (Python, Java, or whatever language VTK is wrapped
##  in). This, in a way, removes the need for the route and script mechanism
##  (not completely though).
##  Texture coordinates are attached to the mesh is available but
##  image textures are not loaded.
##  Viewpoints (camera presets) are not imported.
##
##  @par Thanks:
##   Thanks to Russ Coucher of Areva for numerous bug fixes and a new test.
##
##  @sa
##  vtkImporter
##

## !!!Ignored construct:  # vtkVRMLImporter_h [NewLine] # vtkVRMLImporter_h [NewLine] # vtkIOImportModule.h  For export macro # vtkImporter.h [NewLine] class vtkActor ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkAlgorithm"
discard "forward decl of vtkProperty"
discard "forward decl of vtkLight"
discard "forward decl of vtkTransform"
discard "forward decl of vtkLookupTable"
discard "forward decl of vtkFloatArray"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkPoints"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkVRMLImporterInternal"
discard "forward decl of vtkVRMLYaccData"
discard "forward decl of vtkCellArray"
## !!!Ignored construct:  class VTKIOIMPORT_EXPORT vtkVRMLImporter : public vtkImporter { public : static vtkVRMLImporter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImporter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImporter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkVRMLImporter :: IsTypeOf ( type ) ; } static vtkVRMLImporter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkVRMLImporter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkVRMLImporter * NewInstance ( ) const { return vtkVRMLImporter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImporter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVRMLImporter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVRMLImporter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Specify the name of the file to read.
##  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; /@} /@{ *
##  Specify the resolution for Sphere, Cone and Cylinder shape sources.
##  Default is 12.
##  virtual void SetShapeResolution ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ShapeResolution  to  << _arg ) ; if ( this -> ShapeResolution != _arg ) { this -> ShapeResolution = _arg ; this -> Modified ( ) ; } } ; virtual int GetShapeResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShapeResolution  of  << this -> ShapeResolution ) ; return this -> ShapeResolution ; } ; /@} *
##  In the VRML spec you can DEF and USE nodes (name them),
##  This routine will return the associated VTK object which
##  was created as a result of the DEF mechanism
##  Send in the name from the VRML file, get the VTK object.
##  You will have to check and correctly cast the object since
##  this only returns vtkObjects.
##  vtkObject * GetVRMLDEFObject ( const char * name ) ; *
##  Get a printable string describing the outputs
##  std :: string GetOutputsDescription ( ) override ; protected : vtkVRMLImporter ( ) ; ~ vtkVRMLImporter ( ) override ; int OpenImportFile ( ) ; int ImportBegin ( ) override ; void ImportEnd ( ) override ; void ImportActors ( vtkRenderer * ) override { } void ImportCameras ( vtkRenderer * ) override { } void ImportLights ( vtkRenderer * ) override { } void ImportProperties ( vtkRenderer * ) override { } /@{ *
##  Needed by the yacc/lex grammar used
##  virtual void enterNode ( const char * ) ; virtual void exitNode ( ) ; virtual void enterField ( const char * ) ; virtual void exitField ( ) ; virtual void useNode ( const char * ) ; /@} *
##  Return the file pointer to the open file.
##  FILE * GetFileFD ( ) { return this -> FileFD ; } char * FileName ; FILE * FileFD ; int ShapeResolution ; friend class vtkVRMLYaccData ; private : vtkPoints * PointsNew ( ) ; vtkFloatArray * FloatArrayNew ( ) ; vtkIdTypeArray * IdTypeArrayNew ( ) ; void DeleteObject ( vtkObject * ) ; vtkVRMLImporterInternal * Internal ; vtkVRMLYaccData * Parser ; vtkActor * CurrentActor ; vtkProperty * CurrentProperty ; vtkLight * CurrentLight ; vtkTransform * CurrentTransform ; vtkAlgorithm * CurrentSource ; vtkPoints * CurrentPoints ; vtkFloatArray * CurrentNormals ; vtkCellArray * CurrentNormalCells ; vtkFloatArray * CurrentTCoords ; vtkCellArray * CurrentTCoordCells ; vtkLookupTable * CurrentLut ; vtkFloatArray * CurrentScalars ; vtkPolyDataMapper * CurrentMapper ; private : vtkVRMLImporter ( const vtkVRMLImporter & ) = delete ; void operator = ( const vtkVRMLImporter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  RAII class for automatically closing H5 handles.
##

## !!!Ignored construct:  # DefineScopedHandle ( name ) class ScopedH5 ## name ## Handle { public : ScopedH5 ## name ## Handle ( const ScopedH5 ## name ## Handle & other ) { this -> Handle = other . Handle ; } ScopedH5 ## name ## Handle ( hid_t handle ) : Handle ( handle ) { } virtual ~ ScopedH5 ## name ## Handle ( ) { if ( this -> Handle >= 0 ) { H5 ## name ## close ( this -> Handle ) ; } } operator hid_t ( ) const { return this -> Handle ; } private : hid_t Handle ; } ;
## Error: token expected: ; but got: ##!!!

## !!!Ignored construct:  [NewLine]  Defines ScopedH5AHandle closed with H5Aclose DefineScopedHandle ( A ) ;
## Error: did not expect [NewLine]!!!

##  Defines ScopedH5DHandle closed with H5Dclose

DefineScopedHandle(D)
##  Defines ScopedH5FHandle closed with H5Fclose

DefineScopedHandle(F)
##  Defines ScopedH5GHandle closed with H5Gclose

DefineScopedHandle(G)
##  Defines ScopedH5SHandle closed with H5Sclose

DefineScopedHandle(S)
##  Defines ScopedH5THandle closed with H5Tclose

DefineScopedHandle(T)
##  VTK-HeaderTest-Exclude: vtkHDF5ScopedHandle.h

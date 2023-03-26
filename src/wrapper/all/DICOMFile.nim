## =========================================================================
##
##   Program:   DICOMParser
##   Module:    DICOMFile.h
##   Language:  C++
##
##   Copyright (c) 2003 Matt Turek
##   All rights reserved.
##   See Copyright.txt for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================

## !!!Ignored construct:  # __DICOMFILE_H_ [NewLine] # __DICOMFILE_H_ [NewLine] # _MSC_VER [NewLine] # warning ( disable : 4514 ) [NewLine] # warning ( push , 3 ) [NewLine] # [NewLine] # defined ( __BORLANDC__ ) && ( __BORLANDC__ < 0x660 ) [NewLine] # warn - 8027  functions containing while are not expanded inline [NewLine] # [NewLine] # < stdio . h > [NewLine] # < stdlib . h > [NewLine] # < string > [NewLine] # DICOMConfig.h [NewLine] # DICOMTypes.h [NewLine]
##  Abstraction of a file used by the DICOMParser.
##  This should probably be cleaned up so that it
##  can be used to abstract a stream.
##  class DICOM_EXPORT DICOMFile { public : DICOMFile ( ) ; virtual ~ DICOMFile ( ) ;
##  Open a file with filename.  Returns a bool
##  that is true if the file is successfully
##  opened.
##  bool Open ( const dicom_stl :: string & filename ) ;
##  Close a file.
##  void Close ( ) ;
##  Return the position in the file.
##  long Tell ( ) ;
##  Move to a particular position in the file.
##  void SkipToPos ( long ) ;
##  Return the size of the file.
##  long GetSize ( ) ;
##  Skip a number of bytes.
##  void Skip ( long ) ;
##  Skip to the beginning of the file.
##  void SkipToStart ( ) ;
##  Read data of length len.
##  void Read ( void * data , long len ) ;
##  Read a double byte of data.
##  doublebyte ReadDoubleByte ( ) ; doublebyte ReadDoubleByteAsLittleEndian ( ) ;
##  Read a quadbyte of data.
##  quadbyte ReadQuadByte ( ) ;
##  Read nbytes of data up to 4 bytes.
##  quadbyte ReadNBytes ( int len ) ;
##  Read a float an ascii.
##  float ReadAsciiFloat ( int len ) ;
##  Read an int as ascii.
##  int ReadAsciiInt ( int len ) ;
##  Read an array of ascii characters.
##  char * ReadAsciiCharArray ( int len ) ;
##  Convert the data to signed long.
##  static int ReturnAsSignedLong ( unsigned char * data , bool ) { return * reinterpret_cast < quadbyte * > ( data ) ; }
##  Convert the data to unsigned long.
##  static uint ReturnAsUnsignedLong ( unsigned char * data , bool ) { return static_cast < uint > ( * reinterpret_cast < ulong * > ( data ) ) ; }
##  Convert data to unsigned short.
##  static ushort ReturnAsUnsignedShort ( unsigned char * data , bool ) { return * reinterpret_cast < doublebyte * > ( data ) ; }
##  Convert data to signed short.
##  static short int ReturnAsSignedShort ( unsigned char * data , bool ) { return * reinterpret_cast < short int * > ( data ) ; }
##  Convert data to int.
##  static int ReturnAsInteger ( unsigned char * data , bool ) { return atoi ( reinterpret_cast < const char * > ( data ) ) ; } static float ReturnAsFloat ( unsigned char * data , bool ) { return static_cast < float > ( atof ( reinterpret_cast < const char * > ( data ) ) ) ; } bool GetPlatformIsBigEndian ( ) { return PlatformIsBigEndian ; } void SetPlatformIsBigEndian ( bool v ) { this -> PlatformIsBigEndian = v ; }
##  Swap the bytes in an array of unsigned shorts.
##  static void swap2 ( ushort * ip , ushort * op , int count ) { while ( count ) { * op ++ = swap2 ( * ip ++ ) ; count -- ; } }
##  Swap the bytes in an array of unsigned longs.
##  static void swap4 ( uint * ip , uint * op , int count ) { while ( count ) { * op ++ = swap4 ( * ip ++ ) ; count -- ; } }
##  Swap the bytes in an unsigned short.
##  static ushort swap2 ( ushort v ) { return ushort ( ( v << 8 ) | ( v >> 8 ) ) ; }
##  Swap the bytes in an unsigned long.
##  static uint swap4 ( uint v ) { return uint ( ( v << 24 ) | ( ( v << 8 ) & 0x00ff0000 ) | ( ( v >> 8 ) & 0x0000ff00 ) | ( ( v >> 24 ) ) ) ; } const char * GetPlatformEndian ( ) { return this -> PlatformEndian ; } protected :
##  Internal storage for the filename.
##
##  char* Filename;
##  Internal storage for the file pointer.
##
##  FILE* Fptr; dicom_stream :: ifstream InputStream ;
##  Flag for swapping bytes.
##  bool PlatformIsBigEndian ;
##  Platform endianness
##  const char * PlatformEndian ; private : DICOMFile ( const DICOMFile & ) ; void operator = ( const DICOMFile & ) ; } ;
## Error: token expected: ; but got: [identifier]!!!

when defined(_MSC_VER):
  discard
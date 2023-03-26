
#ifndef VTKIOXDMF2_EXPORT_H
#define VTKIOXDMF2_EXPORT_H

#ifdef VTKIOXDMF2_STATIC_DEFINE
#  define VTKIOXDMF2_EXPORT
#  define VTKIOXDMF2_NO_EXPORT
#else
#  ifndef VTKIOXDMF2_EXPORT
#    ifdef IOXdmf2_EXPORTS
        /* We are building this library */
#      define VTKIOXDMF2_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKIOXDMF2_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKIOXDMF2_NO_EXPORT
#    define VTKIOXDMF2_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKIOXDMF2_DEPRECATED
#  define VTKIOXDMF2_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKIOXDMF2_DEPRECATED_EXPORT
#  define VTKIOXDMF2_DEPRECATED_EXPORT VTKIOXDMF2_EXPORT VTKIOXDMF2_DEPRECATED
#endif

#ifndef VTKIOXDMF2_DEPRECATED_NO_EXPORT
#  define VTKIOXDMF2_DEPRECATED_NO_EXPORT VTKIOXDMF2_NO_EXPORT VTKIOXDMF2_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKIOXDMF2_NO_DEPRECATED
#    define VTKIOXDMF2_NO_DEPRECATED
#  endif
#endif

#endif /* VTKIOXDMF2_EXPORT_H */

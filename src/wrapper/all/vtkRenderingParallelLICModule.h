
#ifndef VTKRENDERINGPARALLELLIC_EXPORT_H
#define VTKRENDERINGPARALLELLIC_EXPORT_H

#ifdef VTKRENDERINGPARALLELLIC_STATIC_DEFINE
#  define VTKRENDERINGPARALLELLIC_EXPORT
#  define VTKRENDERINGPARALLELLIC_NO_EXPORT
#else
#  ifndef VTKRENDERINGPARALLELLIC_EXPORT
#    ifdef RenderingParallelLIC_EXPORTS
        /* We are building this library */
#      define VTKRENDERINGPARALLELLIC_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKRENDERINGPARALLELLIC_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKRENDERINGPARALLELLIC_NO_EXPORT
#    define VTKRENDERINGPARALLELLIC_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKRENDERINGPARALLELLIC_DEPRECATED
#  define VTKRENDERINGPARALLELLIC_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKRENDERINGPARALLELLIC_DEPRECATED_EXPORT
#  define VTKRENDERINGPARALLELLIC_DEPRECATED_EXPORT VTKRENDERINGPARALLELLIC_EXPORT VTKRENDERINGPARALLELLIC_DEPRECATED
#endif

#ifndef VTKRENDERINGPARALLELLIC_DEPRECATED_NO_EXPORT
#  define VTKRENDERINGPARALLELLIC_DEPRECATED_NO_EXPORT VTKRENDERINGPARALLELLIC_NO_EXPORT VTKRENDERINGPARALLELLIC_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKRENDERINGPARALLELLIC_NO_DEPRECATED
#    define VTKRENDERINGPARALLELLIC_NO_DEPRECATED
#  endif
#endif
/* AutoInit dependencies. */
#include "vtkRenderingLICOpenGL2Module.h"
#include "vtkRenderingOpenGL2Module.h"


/* AutoInit implementations. */
#ifdef vtkRenderingParallelLIC_AUTOINIT_INCLUDE
#include vtkRenderingParallelLIC_AUTOINIT_INCLUDE
#endif
#ifdef vtkRenderingParallelLIC_AUTOINIT
#include "vtkAutoInit.h"
VTK_MODULE_AUTOINIT(vtkRenderingParallelLIC)
#endif

#endif /* VTKRENDERINGPARALLELLIC_EXPORT_H */

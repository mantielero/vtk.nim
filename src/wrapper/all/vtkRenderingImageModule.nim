when defined(VTKRENDERINGIMAGE_STATIC_DEFINE):
else:
when not defined(VTKRENDERINGIMAGE_DEPRECATED):
  discard
when not defined(VTKRENDERINGIMAGE_DEPRECATED_EXPORT):
  const
    VTKRENDERINGIMAGE_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKRENDERINGIMAGE_DEPRECATED_NO_EXPORT):
  const
    VTKRENDERINGIMAGE_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
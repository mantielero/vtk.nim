when defined(VTKFILTERSTEXTURE_STATIC_DEFINE):
else:
when not defined(VTKFILTERSTEXTURE_DEPRECATED):
  discard
when not defined(VTKFILTERSTEXTURE_DEPRECATED_EXPORT):
  const
    VTKFILTERSTEXTURE_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKFILTERSTEXTURE_DEPRECATED_NO_EXPORT):
  const
    VTKFILTERSTEXTURE_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
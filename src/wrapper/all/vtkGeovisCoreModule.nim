when defined(VTKGEOVISCORE_STATIC_DEFINE):
else:
when not defined(VTKGEOVISCORE_DEPRECATED):
  discard
when not defined(VTKGEOVISCORE_DEPRECATED_EXPORT):
  const
    VTKGEOVISCORE_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKGEOVISCORE_DEPRECATED_NO_EXPORT):
  const
    VTKGEOVISCORE_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
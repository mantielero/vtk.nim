when defined(VTKWRAPPINGTOOLS_STATIC_DEFINE):
else:
when not defined(VTKWRAPPINGTOOLS_DEPRECATED):
  discard
when not defined(VTKWRAPPINGTOOLS_DEPRECATED_EXPORT):
  const
    VTKWRAPPINGTOOLS_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKWRAPPINGTOOLS_DEPRECATED_NO_EXPORT):
  const
    VTKWRAPPINGTOOLS_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
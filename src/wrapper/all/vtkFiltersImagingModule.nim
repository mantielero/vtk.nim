when defined(VTKFILTERSIMAGING_STATIC_DEFINE):
else:
when not defined(VTKFILTERSIMAGING_DEPRECATED):
  discard
when not defined(VTKFILTERSIMAGING_DEPRECATED_EXPORT):
  const
    VTKFILTERSIMAGING_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKFILTERSIMAGING_DEPRECATED_NO_EXPORT):
  const
    VTKFILTERSIMAGING_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
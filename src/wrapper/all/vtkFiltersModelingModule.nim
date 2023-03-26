when defined(VTKFILTERSMODELING_STATIC_DEFINE):
else:
when not defined(VTKFILTERSMODELING_DEPRECATED):
  discard
when not defined(VTKFILTERSMODELING_DEPRECATED_EXPORT):
  const
    VTKFILTERSMODELING_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKFILTERSMODELING_DEPRECATED_NO_EXPORT):
  const
    VTKFILTERSMODELING_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
when defined(VTKFILTERSGENERIC_STATIC_DEFINE):
else:
when not defined(VTKFILTERSGENERIC_DEPRECATED):
  discard
when not defined(VTKFILTERSGENERIC_DEPRECATED_EXPORT):
  const
    VTKFILTERSGENERIC_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKFILTERSGENERIC_DEPRECATED_NO_EXPORT):
  const
    VTKFILTERSGENERIC_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
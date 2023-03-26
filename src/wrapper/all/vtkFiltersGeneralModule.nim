when defined(VTKFILTERSGENERAL_STATIC_DEFINE):
else:
when not defined(VTKFILTERSGENERAL_DEPRECATED):
  discard
when not defined(VTKFILTERSGENERAL_DEPRECATED_EXPORT):
  const
    VTKFILTERSGENERAL_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKFILTERSGENERAL_DEPRECATED_NO_EXPORT):
  const
    VTKFILTERSGENERAL_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
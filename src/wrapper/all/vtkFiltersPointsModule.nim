when defined(VTKFILTERSPOINTS_STATIC_DEFINE):
else:
when not defined(VTKFILTERSPOINTS_DEPRECATED):
  discard
when not defined(VTKFILTERSPOINTS_DEPRECATED_EXPORT):
  const
    VTKFILTERSPOINTS_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKFILTERSPOINTS_DEPRECATED_NO_EXPORT):
  const
    VTKFILTERSPOINTS_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
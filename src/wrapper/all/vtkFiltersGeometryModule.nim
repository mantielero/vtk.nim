when defined(VTKFILTERSGEOMETRY_STATIC_DEFINE):
else:
when not defined(VTKFILTERSGEOMETRY_DEPRECATED):
  discard
when not defined(VTKFILTERSGEOMETRY_DEPRECATED_EXPORT):
  const
    VTKFILTERSGEOMETRY_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKFILTERSGEOMETRY_DEPRECATED_NO_EXPORT):
  const
    VTKFILTERSGEOMETRY_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
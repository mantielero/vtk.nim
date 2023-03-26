when defined(VTKFILTERSSELECTION_STATIC_DEFINE):
else:
when not defined(VTKFILTERSSELECTION_DEPRECATED):
  discard
when not defined(VTKFILTERSSELECTION_DEPRECATED_EXPORT):
  const
    VTKFILTERSSELECTION_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKFILTERSSELECTION_DEPRECATED_NO_EXPORT):
  const
    VTKFILTERSSELECTION_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
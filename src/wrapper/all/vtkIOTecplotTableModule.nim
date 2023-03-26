when defined(VTKIOTECPLOTTABLE_STATIC_DEFINE):
else:
when not defined(VTKIOTECPLOTTABLE_DEPRECATED):
  discard
when not defined(VTKIOTECPLOTTABLE_DEPRECATED_EXPORT):
  const
    VTKIOTECPLOTTABLE_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOTECPLOTTABLE_DEPRECATED_NO_EXPORT):
  const
    VTKIOTECPLOTTABLE_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
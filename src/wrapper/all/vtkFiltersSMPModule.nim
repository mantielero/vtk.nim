when defined(VTKFILTERSSMP_STATIC_DEFINE):
else:
when not defined(VTKFILTERSSMP_DEPRECATED):
  discard
when not defined(VTKFILTERSSMP_DEPRECATED_EXPORT):
  const
    VTKFILTERSSMP_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKFILTERSSMP_DEPRECATED_NO_EXPORT):
  const
    VTKFILTERSSMP_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
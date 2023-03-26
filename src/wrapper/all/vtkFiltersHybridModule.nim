when defined(VTKFILTERSHYBRID_STATIC_DEFINE):
else:
when not defined(VTKFILTERSHYBRID_DEPRECATED):
  discard
when not defined(VTKFILTERSHYBRID_DEPRECATED_EXPORT):
  const
    VTKFILTERSHYBRID_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKFILTERSHYBRID_DEPRECATED_NO_EXPORT):
  const
    VTKFILTERSHYBRID_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
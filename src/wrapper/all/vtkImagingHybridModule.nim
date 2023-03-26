when defined(VTKIMAGINGHYBRID_STATIC_DEFINE):
else:
when not defined(VTKIMAGINGHYBRID_DEPRECATED):
  discard
when not defined(VTKIMAGINGHYBRID_DEPRECATED_EXPORT):
  const
    VTKIMAGINGHYBRID_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIMAGINGHYBRID_DEPRECATED_NO_EXPORT):
  const
    VTKIMAGINGHYBRID_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
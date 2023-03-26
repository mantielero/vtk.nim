when defined(VTKIMAGINGSOURCES_STATIC_DEFINE):
else:
when not defined(VTKIMAGINGSOURCES_DEPRECATED):
  discard
when not defined(VTKIMAGINGSOURCES_DEPRECATED_EXPORT):
  const
    VTKIMAGINGSOURCES_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIMAGINGSOURCES_DEPRECATED_NO_EXPORT):
  const
    VTKIMAGINGSOURCES_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
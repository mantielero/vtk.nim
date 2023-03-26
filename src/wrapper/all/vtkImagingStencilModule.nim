when defined(VTKIMAGINGSTENCIL_STATIC_DEFINE):
else:
when not defined(VTKIMAGINGSTENCIL_DEPRECATED):
  discard
when not defined(VTKIMAGINGSTENCIL_DEPRECATED_EXPORT):
  const
    VTKIMAGINGSTENCIL_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIMAGINGSTENCIL_DEPRECATED_NO_EXPORT):
  const
    VTKIMAGINGSTENCIL_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
when defined(VTKPARALLELDIY_STATIC_DEFINE):
else:
when not defined(VTKPARALLELDIY_DEPRECATED):
  discard
when not defined(VTKPARALLELDIY_DEPRECATED_EXPORT):
  const
    VTKPARALLELDIY_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKPARALLELDIY_DEPRECATED_NO_EXPORT):
  const
    VTKPARALLELDIY_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
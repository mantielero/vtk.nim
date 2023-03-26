when defined(VTKVIEWSINFOVIS_STATIC_DEFINE):
else:
when not defined(VTKVIEWSINFOVIS_DEPRECATED):
  discard
when not defined(VTKVIEWSINFOVIS_DEPRECATED_EXPORT):
  const
    VTKVIEWSINFOVIS_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKVIEWSINFOVIS_DEPRECATED_NO_EXPORT):
  const
    VTKVIEWSINFOVIS_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
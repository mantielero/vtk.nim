when defined(VTKIOINFOVIS_STATIC_DEFINE):
else:
when not defined(VTKIOINFOVIS_DEPRECATED):
  discard
when not defined(VTKIOINFOVIS_DEPRECATED_EXPORT):
  const
    VTKIOINFOVIS_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOINFOVIS_DEPRECATED_NO_EXPORT):
  const
    VTKIOINFOVIS_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
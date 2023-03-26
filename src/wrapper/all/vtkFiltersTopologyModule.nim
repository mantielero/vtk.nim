when defined(VTKFILTERSTOPOLOGY_STATIC_DEFINE):
else:
when not defined(VTKFILTERSTOPOLOGY_DEPRECATED):
  discard
when not defined(VTKFILTERSTOPOLOGY_DEPRECATED_EXPORT):
  const
    VTKFILTERSTOPOLOGY_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKFILTERSTOPOLOGY_DEPRECATED_NO_EXPORT):
  const
    VTKFILTERSTOPOLOGY_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
when defined(VTKFILTERSREEBGRAPH_STATIC_DEFINE):
else:
when not defined(VTKFILTERSREEBGRAPH_DEPRECATED):
  discard
when not defined(VTKFILTERSREEBGRAPH_DEPRECATED_EXPORT):
  const
    VTKFILTERSREEBGRAPH_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKFILTERSREEBGRAPH_DEPRECATED_NO_EXPORT):
  const
    VTKFILTERSREEBGRAPH_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
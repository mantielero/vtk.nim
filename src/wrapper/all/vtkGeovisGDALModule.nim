when defined(VTKGEOVISGDAL_STATIC_DEFINE):
else:
when not defined(VTKGEOVISGDAL_DEPRECATED):
  discard
when not defined(VTKGEOVISGDAL_DEPRECATED_EXPORT):
  const
    VTKGEOVISGDAL_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKGEOVISGDAL_DEPRECATED_NO_EXPORT):
  const
    VTKGEOVISGDAL_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
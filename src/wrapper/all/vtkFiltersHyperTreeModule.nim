when defined(VTKFILTERSHYPERTREE_STATIC_DEFINE):
else:
when not defined(VTKFILTERSHYPERTREE_DEPRECATED):
  discard
when not defined(VTKFILTERSHYPERTREE_DEPRECATED_EXPORT):
  const
    VTKFILTERSHYPERTREE_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKFILTERSHYPERTREE_DEPRECATED_NO_EXPORT):
  const
    VTKFILTERSHYPERTREE_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
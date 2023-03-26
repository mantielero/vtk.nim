when defined(VTKTESTINGRENDERING_STATIC_DEFINE):
else:
when not defined(VTKTESTINGRENDERING_DEPRECATED):
  discard
when not defined(VTKTESTINGRENDERING_DEPRECATED_EXPORT):
  const
    VTKTESTINGRENDERING_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKTESTINGRENDERING_DEPRECATED_NO_EXPORT):
  const
    VTKTESTINGRENDERING_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0:
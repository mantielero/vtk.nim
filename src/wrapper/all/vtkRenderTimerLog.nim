## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRenderTimerLog.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkRenderTimerLog
##  @brief   Asynchronously measures GPU execution times for a series of events.
##
##  This class measures the time it takes for events to occur on the GPU by
##  posting timing events into the rendering command stream. This can be used
##  to compute the time spent doing work on the GPU without stalling the
##  CPU.
##
##  To aid asynchronous usage, this class uses the concepts "Event" and "Frame",
##  where a Frame is a logical collection of Events. The timer log can manage
##  multiple Frames at a time:
##  - The current Frame, where new Events are created.
##  - Pending Frames, for which all Events have been marked, but the results are
##    not available (the timer requests are still waiting to be processed by the
##    graphics device).
##  - Ready Frames, which have been completed by the graphics device and may be
##    retrieved.
##
##  Call MarkFrame() to begin a new Frame. This pushes the current Frame to the
##  collection of pending Frames, and creates a new one to store future Events.
##
##  Call MarkStartEvent() and MarkEndEvent() to mark the beginning and end of
##  an Event. These Events may be nested, but all child Events must have their
##  end marked before the parent Event ends.
##
##  Use FrameReady() and PopFirstReadyFrame() to check for completed Frames and
##  retrieve results.
##
##  This is currently only implemented for the OpenGL2 backend. The IsSupported()
##  method can be used to detect if there is a valid implementation available.
##

## !!!Ignored construct:  # vtkRenderTimerLog_h [NewLine] # vtkRenderTimerLog_h [NewLine] # vtkObject.h [NewLine] # vtkRenderingCoreModule.h  For export macro # vtkType.h  For vtkTypeUint64, etc # < sstream >  for std::ostringstream # < string >  for std::string # < vector >  for std::vector [NewLine] *
##  Creates a ScopedEventLogger on @a timer with the given @a name. @a name is
##  passed into a stream and may be constructed using the << operator.
##  # VTK_SCOPED_RENDER_EVENT ( eventName , timer ) VTK_SCOPED_RENDER_EVENT2 ( eventName , timer , _event ) [NewLine] *
##  Creates a ScopedEventLogger on @a timer with the given @a name. @a name is
##  passed into a stream and may be constructed using the << operator. The logger
##  will be created with the provided @a identifier.
##  # VTK_SCOPED_RENDER_EVENT2 ( eventName , timer , identifier ) vtkRenderTimerLog :: ScopedEventLogger identifier ;
## Error: did not expect [NewLine]!!!

while true:                    ##  Do-while loop prevents duplicate semicolon warnings
  var _eventNameStream: ostringstream
  _eventNameStream shl eventName
  identifier = timer.StartScopedEvent(_eventNameStream.str())
  cast[nil](identifier)
  ##  Prevent set-but-not-used var warnings
  if not false:
    break
## !!!Ignored construct:  [NewLine] class vtkRenderTimerLog : public vtkObject { public : struct Frame ; * Container for a single timed event. struct Event { * Event name. std :: string Name ; * Times are in nanoseconds. @{ vtkTypeUInt64 StartTime ; vtkTypeUInt64 EndTime ; *@} * Convenience methods to compute times float ElapsedTimeSeconds ( ) const { return this -> ElapsedTimeNanoseconds ( ) * 1e-9f ; } float ElapsedTimeMilliseconds ( ) const { return this -> ElapsedTimeNanoseconds ( ) * 1e-6f ; } vtkTypeUInt64 ElapsedTimeNanoseconds ( ) const { return this -> EndTime - this -> StartTime ; } * Child events that occurred while this event was running. std :: vector < Event > Events ; * Print details of the event to a stream.
##  @param os The stream.
##  @param threshMs Only print events with a time > threshMs milliseconds.
##  @param indent Starting indentation for the first event.
##  void Print ( std :: ostream & os , float threshMs = 0.f , vtkIndent indent = vtkIndent ( ) ) { this -> Print ( os , 0.f , threshMs , indent ) ; } friend struct vtkRenderTimerLog :: Frame ; protected : void Print ( std :: ostream & os , float parentTime , float threshMs , vtkIndent indent ) ; } ; * Container for a frame's events. struct Frame { std :: vector < Event > Events ; * Print details of all events in this frame to a stream.
##  @param os The stream.
##  @param threshMs Only print events with a time > threshMs milliseconds.
##  void Print ( std :: ostream & os , float threshMs = 0.f ) ; } ; *
##  RAII struct for logging events. Such events start when
##  vtkRenderTimerLog::StartScopedEvent(name) is called, and end when the
##  returned object is destroyed, or ScopedEventLogger::Stop() is called.
##  struct ScopedEventLogger { ScopedEventLogger ( ) : Log ( nullptr ) { } ScopedEventLogger ( ScopedEventLogger && other ) noexcept ; ScopedEventLogger & operator = ( ScopedEventLogger && other ) noexcept ; ~ ScopedEventLogger ( ) { this -> Stop ( ) ; } void Stop ( ) ; friend class vtkRenderTimerLog ; protected : ScopedEventLogger ( vtkRenderTimerLog * log ) : Log ( log ) { } private : void operator = ( const ScopedEventLogger & ) = delete ; ScopedEventLogger ( const ScopedEventLogger & other ) = delete ; vtkRenderTimerLog * Log ; } ; static vtkRenderTimerLog * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkRenderTimerLog :: IsTypeOf ( type ) ; } static vtkRenderTimerLog * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkRenderTimerLog * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkRenderTimerLog * NewInstance ( ) const { return vtkRenderTimerLog :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRenderTimerLog :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRenderTimerLog :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Returns true if stream timings are implemented for the current graphics
##  backend.
##  virtual bool IsSupported ( ) VTK_FUTURE_CONST ; *
##  Call to mark the start of a new frame, or the end of an old one. Does
##  nothing if no events have been recorded in the current frame.
##  virtual void MarkFrame ( ) ; *
##  Create a RAII scoped event. See ScopedEventLogger for details.
##  ScopedEventLogger StartScopedEvent ( const std :: string & name ) ; *
##  Mark the beginning or end of an event. @{
##  virtual void MarkStartEvent ( const std :: string & name ) ; virtual void MarkEndEvent ( ) ; *@} *
##  Returns true if there are any frames ready with complete timing info.
##  virtual bool FrameReady ( ) ; *
##  Retrieve the first available frame's timing info. The returned frame is
##  removed from this log.
##  virtual Frame PopFirstReadyFrame ( ) ; * If false, no events are recorded. Default is false. @{ virtual void SetLoggingEnabled ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  LoggingEnabled  to  << _arg ) ; if ( this -> LoggingEnabled != _arg ) { this -> LoggingEnabled = _arg ; this -> Modified ( ) ; } } ; virtual bool GetLoggingEnabled ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LoggingEnabled  of  << this -> LoggingEnabled ) ; return this -> LoggingEnabled ; } ; virtual void LoggingEnabledOn ( ) { this -> SetLoggingEnabled ( static_cast < bool > ( 1 ) ) ; } virtual void LoggingEnabledOff ( ) { this -> SetLoggingEnabled ( static_cast < bool > ( 0 ) ) ; } ; *@} *
##  If there are more than FrameLimit frames pending/ready, drop the old ones
##  until we are under this limit. Prevents things from backing up.
##  Default is 32. Set to 0 to disable. @{
##  virtual void SetLoggingEnabledFrameLimit ( unsigned int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FrameLimit  to  << _arg ) ; if ( this -> FrameLimit != _arg ) { this -> FrameLimit = _arg ; this -> Modified ( ) ; } } ; virtual unsigned int GetLoggingEnabledFrameLimit ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FrameLimit  of  << this -> FrameLimit ) ; return this -> FrameLimit ; } ; *@} *
##  Releases any resources allocated on the graphics device.
##  virtual void ReleaseGraphicsResources ( ) ; protected : vtkRenderTimerLog ( ) ; ~ vtkRenderTimerLog ( ) override ; mutable bool LoggingEnabled ; unsigned int FrameLimit ; private : vtkRenderTimerLog ( const vtkRenderTimerLog & ) = delete ; void operator = ( const vtkRenderTimerLog & ) = delete ; } ;
## Error: did not expect [NewLine]!!!

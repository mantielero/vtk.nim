/*=========================================================================

  Program:   Visualization Toolkit
  Module:    vtkFiltersParallelFlowPathsObjectFactory.h

  Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
  All rights reserved.
  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.

     This software is distributed WITHOUT ANY WARRANTY; without even
     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
     PURPOSE.  See the above copyright notice for more information.

=========================================================================*/

#ifndef vtkFiltersParallelFlowPathsObjectFactory_h
#define vtkFiltersParallelFlowPathsObjectFactory_h

#include "vtkFiltersParallelFlowPathsModule.h" // For export macro
#include "vtkObjectFactory.h"

class VTKFILTERSPARALLELFLOWPATHS_EXPORT vtkFiltersParallelFlowPathsObjectFactory : public vtkObjectFactory
{
public:
  static vtkFiltersParallelFlowPathsObjectFactory * New();
  vtkTypeMacro(vtkFiltersParallelFlowPathsObjectFactory, vtkObjectFactory);

  const char * GetDescription() override { return "vtkFiltersParallelFlowPaths factory overrides."; }

  const char * GetVTKSourceVersion() override;

  void PrintSelf(ostream &os, vtkIndent indent) override;

protected:
  vtkFiltersParallelFlowPathsObjectFactory();

private:
  vtkFiltersParallelFlowPathsObjectFactory(const vtkFiltersParallelFlowPathsObjectFactory&) = delete;
  void operator=(const vtkFiltersParallelFlowPathsObjectFactory&) = delete;
};

#endif // vtkFiltersParallelFlowPathsObjectFactory_h

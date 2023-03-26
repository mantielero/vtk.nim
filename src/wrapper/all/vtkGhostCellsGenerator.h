/*=========================================================================

  Program:   Visualization Toolkit
  Module:    vtkGhostCellsGenerator.h

  Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
  All rights reserved.
  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.

     This software is distributed WITHOUT ANY WARRANTY; without even
     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
     PURPOSE.  See the above copyright notice for more information.

=========================================================================*/
/**
 * @class vtkGhostCellsGenerator
 * @brief Computes ghost cells on vtkCompositeDataSet inputs
 *
 * This filter computes ghost cells between data sets of same types in a `vtkCompositeDataSet`.
 * For example, a `vtkImageData` inside a `vtkCompositeDataSet` will send and receive ghosts only to
 * and from other `vtkImageData`.
 * The backend used to generate the ghosts is `vtkDIYGhostUtilities::GenerateGhosts`.
 *
 * If the input is a `vtkPartitionedDataSetCollection`, then ghosts are computed per partitioned
 * data set. In other words, ghost are not computed between 2 `vtkDataSet` belonging to 2 different
 * `vtkPartitionedDataSet`, even if they are adjacent.
 *
 * If `BuildIfRequired` is set to true (which is by default), then the filter will compute ghost
 * based on the value being returned by
 * `vtkStreamingDemandDrivenPipeline::UPDATE_NUMBER_OF_GHOST_LEVELS()` in the downstream streaming
 * pipeline. If not (i.e. `BuildIfRequired` is off), then the max between this latter value and
 * `NumberOfGhostLayers` is being used.
 *
 * Ghosts points are generated in addition to ghost cells. The same point exists across multiple
 * partitions at the interface between them. One version of those points is not tagged as ghost,
 * while the others are. As a consequence, there are as many non ghost points as there would be
 * points if the input partitions were all merged into one partition.
 *
 * If the input is composed of some data sets already owning ghosts, those ghosts are removed from
 * the output and are recomputed. Ghosts in the input are as if they didn't exist.
 * A ghost cell is to be peeled off if it holds the `CELLDUPLICATE` flag in its ghost bit mask.
 * Similarly, each generated ghost cells from this filter is tagged with `CELLDUPLICATE`, in
 * addition of other tags that could be set (`HIDDENCELL` for instance).
 *
 * If the input is a `vtkUnstructuredGrid`, if the input `vtkPointData` has global ids, then the
 * values of those global ids are used instead of point position in 3D to connect 2 partitions.
 * If not, point position of the outer surface are used to connect them. The precision of such
 * connection is done using numeric precision of the input coordinates. Points and cells tagged as
 * hidden ghosts are removed from the output.
 *
 * When requesting zero layers of ghost cells, ghost points are still generated. In this instance,
 * the filter will produce a ghost cell array in the output if and only if the input is a structured
 * data set (`vtkImageData`, `vtkRectilinearGrid`, or `vtkStructuredGrid`), and has hidden ghosts
 * within its valid extent (extent when duplicate ghosts are peeled off).
 *
 * Points at the interface between 2 partitions are edited depending on the ownership of the point
 * after the ghost points are generated. One can keep track of which process owns a non-ghost copy
 * of the point if an array associating each point with its process id is available in the input.
 *
 * @warning If an input already holds ghosts, the input ghost cells should be tagged as
 * `CELLDUPLICATE` in order for this filter to work properly.
 *
 * @note Currently,`vtkImageData`, `vtkRectilinearGrid`, `vtkStructuredGrid`,
 * `vtkUnstructuredGrid` and `vtkPolyData` are implemented.
 *
 * @warning This warning only applies for `vtkUnstructuredGrid` and `vtkPolyData` inputs. If
 * there are duplicate points in the outer shell of an input partition, then this filter cannot
 * decide on how to connect the cells properly when generating ghosts. The same phenomenon occurs
 * when the outer shell of the partition has 2 points with the same global id. In such
 * circumstances, use the `vtkStaticCleanUnstructuredGrid`
 * or `vtkStaticCleanPolyData` filter first in order to have a clean input.
 *
 * @sa vtkDIYGhostUtilities
 */

#ifndef vtkGhostCellsGenerator_h
#define vtkGhostCellsGenerator_h

#include "vtkFiltersParallelDIY2Module.h" // for export macros
#include "vtkPassInputTypeAlgorithm.h"

class vtkMultiProcessController;

class VTKFILTERSPARALLELDIY2_EXPORT vtkGhostCellsGenerator : public vtkPassInputTypeAlgorithm
{
public:
  static vtkGhostCellsGenerator* New();
  vtkTypeMacro(vtkGhostCellsGenerator, vtkPassInputTypeAlgorithm);
  void PrintSelf(ostream& os, vtkIndent indent) override;

  ///@{
  /**
   * Get/Set the controller to use. By default
   * vtkMultiProcessController::GlobalController will be used.
   */
  void SetController(vtkMultiProcessController*);
  vtkGetObjectMacro(Controller, vtkMultiProcessController);
  ///@}

  ///@{
  /**
   * Resets parameter.
   */
  ///@}
  virtual void Initialize();

  ///@{
  /**
   * Specify if the filter must generate the ghost cells only if required by
   * the pipeline.
   * If false, ghost cells are computed even if they are not required.
   * Default is TRUE.
   */
  vtkSetMacro(BuildIfRequired, bool);
  vtkGetMacro(BuildIfRequired, bool);
  vtkBooleanMacro(BuildIfRequired, bool);
  ///@}

  ///@{
  /**
   * When BuildIfRequired is `false`, this can be used to set the number
   * of ghost layers to generate. Note, if the downstream pipeline requests more
   * ghost levels than the number specified here, then the filter will generate
   * those extra ghost levels as needed. Accepted values are in the interval
   * [1, VTK_INT_MAX].
   */
  vtkGetMacro(NumberOfGhostLayers, int);
  vtkSetClampMacro(NumberOfGhostLayers, int, 0, VTK_INT_MAX);
  ///@}

protected:
  vtkGhostCellsGenerator();
  ~vtkGhostCellsGenerator() override;

  int FillInputPortInformation(int port, vtkInformation* info) override;

  int RequestData(vtkInformation*, vtkInformationVector**, vtkInformationVector*) override;
  int RequestUpdateExtent(vtkInformation*, vtkInformationVector**, vtkInformationVector*) override;

  /**
   * Local controller.
   */
  vtkMultiProcessController* Controller;

  int NumberOfGhostLayers;
  bool BuildIfRequired;

private:
  vtkGhostCellsGenerator(const vtkGhostCellsGenerator&) = delete;
  void operator=(const vtkGhostCellsGenerator&) = delete;
};

#endif

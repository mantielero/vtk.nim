## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    QVTKTableModelAdapter.h
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
##  @class QVTKTableModelAdapter
##  @brief An adapter to create a vtkTable from an QAbstractItemModel.
##
##  An internal table is used to buffer the QAbstractItemModel. Any changes in the model are applied
##  to the internal table, so that it is always up-to-date with the model.
##
##  Due to the structure of vtkTable it is not possible to have columns with different variable
##  types. The variable type of a column is determined from the first row in the model.
##
##  The data is queried using QAbstractItemModel::data() using Qt::DisplayRole.
##
##  All columns of the table must have unique names. They are queried using
##  QAbstractItemModel::headerData() using Qt::Horizontal as orientation and Qt::DisplayRole.
##
##

import
  vtkGUISupportQtModule, vtkNew, vtkTable

type
  QVTKTableModelAdapter* {.importcpp: "QVTKTableModelAdapter",
                          header: "QVTKTableModelAdapter.h", bycopy.} = object of QObject ## *
                                                                                   ##  The default method for retrieving data for a tabel entry from the item model.
                                                                                   ##


## !!!Ignored construct:  Q_OBJECT public : QVTKTableModelAdapter ( QObject * parent = nullptr ) ;
## Error: token expected: [integer literal] but got: [identifier]!!!

## !!!Ignored construct:  Q_SIGNALS : *
##  Signal emitted when the internal vtkTable has changed. This signal can be used to connect to a
##  slot which handles rendering of an attached chart.
##  void tableChanged ( ) ;
## Error: identifier expected, but got: :!!!

## !!!Ignored construct:  protected Q_SLOTS : virtual void onModified ( ) ;
## Error: token expected: : but got: [identifier]!!!

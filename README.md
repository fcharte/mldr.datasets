[mldr.datasets](https://fcharte.github.io/mldr.datasets)
====

[![Travis](https://img.shields.io/travis/fcharte/mldr.datasets/master.svg)](https://travis-ci.org/fcharte/mldr.datasets/)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/mldr.datasets)](https://cran.r-project.org/package=mldr.datasets)
[![Downloads](http://cranlogs.r-pkg.org/badges/mldr.datasets)](https://cran.r-project.org/package=mldr.datasets)

RUMDR - R Ultimate Multilabel Dataset Repository

## Installation

Use `install.packages` to install *mldr.datasets* and its dependencies:

```R
install.packages("mldr.datasets")
```

Alternatively, you can install it via `install_github` from the
[devtools](https://github.com/hadley/devtools) package.

```R
devtools::install_github("fcharte/mldr.datasets")
```

You can also clone the repository by using entering `git clone https://github.com/fcharte/mldr.datasets.git` at your command line (assuming git is installed in your system) or with your favourite git GUI. 

## Usage and examples

This package provides a large collection of multilabel datasets along with the functions needed to export them to several formats and to obtain bibliographic information. Some of the datasets are integrated into the package, while others are externally available.
To open a list with all the datasets integrated into the package use the following commands:

```R
library(mldr.datasets)
data(package = "mldr.datasets")
```
Once the package has been loaded, any of the datasets can be queried as shown below:

```R
birds$measures  # Obtain a list of characterization measures
flags$labels    # Retrieve information about the labels
emotions$attributes # All info about the attributes in the dataset
scene$labelsets # List of labelsets and their frequencies
cat(toBibtex(ng20)) # Print the BibTeX entry for the dataset
```
The external datasets are automatically donwloaded from GitHub the first time they are needed, then saved locally. To obtain a list of
externally available datasets use the following commands:

```R
library(mldr.datasets)
available.mldrs()
```

The external datasets are not inmediately available. To load any of them enter its name followed by empty parenthesis, as shown below:

```R
bibtex <- bibtex()  # This will load the bibtex dataset, downloading it if is not locally available
bibtex$labels
```
The `toBibtex` S3 method returns bibliographic information about the dataset, if it is available. This can be printed with `cat` or copied to the clipboard to include it in your article.


For more examples and detailed explanation on available functions, please refer to the documentation.

## License

This software is distributed under the following terms:

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

The datasets distributed within this software are propierty of their own authors. You can find authorship and citation information inside the [`datasets.R`](https://github.com/fcharte/mldr.datasets/tree/master/R/datasets.R) file or using the `toBibtex` method.

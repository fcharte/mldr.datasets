[mldr.datasets](https://fcharte.github.io/mldr.datasets)
====

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

You can also clone the repository by using entering `git clone https://github.com/fcharte/mldr.datasets.git` at your command line (assuming git is installed in your system) or with your favourite git GUI. This way all the datasets will be inmediately available in your system. However, take into account that > 600MB will be needed to store the full repository.

Very large datasets, those > 100MB, are stored into the [GitHub Large File Storage](https://git-lfs.github.com/). So, before cloning the repository you will need to install this git extension, initializing it by entering `git lfs init` at the git command line. Without GitHub LFS the aforementioned datasets will appear in your local copy of the repository as files containing a link, instead of real data. This step is not needed in order to install the package though standard methods and access the datasets as explained below.

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
mldrs()
```

The external datasets are not inmediately available. To load any of them enter its name followed by empty parenthesis, as shown below:

```R
bibtex()  # This will load the bibtex dataset, downloading it if is not locally available
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

The datasets distributed within this software and inside this repository are propierty of their own authors. You can find authorship and citation information inside the [`additional-data`](https://github.com/fcharte/mldr.datasets/tree/master/additional-data) folder.

[mldr.datasets](https://fcharte.github.io/mldr.datasets)
====

The universal multilabel dataset repository for R
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

# TP GIS

GIS4, Modélisation avancée

## Run Jupyter notebook online

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/Quentin62/TPGIS/master)

1) NIPALS : [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/Quentin62/TPGIS/binder?filepath=01-nipals.ipynb)
1) MICE : [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/Quentin62/TPGIS/master?filepath=02-mice.ipynb)
1) Regression : [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/Quentin62/TPGIS/master?filepath=03-regression.ipynb)
1) Effets aléatoires : [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/Quentin62/TPGIS/master?filepath=04-effets_aleatoires.ipynb)
1) Régressions discrètes : [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/Quentin62/TPGIS/master?filepath=05-regression_discrete.ipynb)

## Run locally

### Python

#### Install dependencies using pip3

In a terminal, run

``` bash
sudo apt install python3-pip
```

``` bash
pip3 install -r requirements.txt
```

#### Run jupyter

Go to <https://jupyter.org/> for more information.

In a terminal, run

``` bash
jupyter lab
```

#### Convert a jupyter notebook to a pdf

Use [nbconvert](https://nbconvert.readthedocs.io/en/latest/) package.

``` bash
pip3 install nbconvert
```

It requires pandoc and latex

``` bash
sudo apt-get install pandoc
sudo apt-get install texlive-xetex texlive-fonts-recommended texlive-plain-generic
```

In your notebook, run all cells and save it. In a terminal, run:

``` bash
jupyter nbconvert --to pdf my_notebook.ipynb
```

### R

#### Install

In an R console:

```r
install.packages(c("mvtnorm", "FactoMineR"))
```

Running and converting R markdown:

```r
install.packages(c("knitr", "rmarkdown"))
```

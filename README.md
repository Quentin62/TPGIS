# TP GIS

GIS4, Modélisation avancée

## Python ressources

- MOOC python <https://www.fun-mooc.fr/fr/cours/python-3-des-fondamentaux-aux-concepts-avances-du-langage/>
- MOOC scikit-learn (by scikit-learn maintainers) <https://www.fun-mooc.fr/fr/cours/machine-learning-python-scikit-learn/>
- Tuto numpy <https://sebastianraschka.com/blog/2020/numpy-intro.html>
- Tuto pandas <https://pandas.pydata.org/pandas-docs/stable/user_guide/10min.html>

## Run Jupyter notebook online

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/Quentin62/TPGIS/master)

1) NIPALS : [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/Quentin62/TPGIS/master?filepath=01-nipals.ipynb)
1) MICE : [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/Quentin62/TPGIS/master?filepath=02-mice.ipynb)
1) Régression : [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/Quentin62/TPGIS/master?filepath=03-regression.ipynb)
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

In your notebook, run all cells and save the notebook in pdf. In a terminal, run:

``` bash
jupyter nbconvert --to pdf my_notebook.ipynb
```

### R

#### Install

In an R console:

```r
install.packages(c("mvtnorm", "FactoMineR", "mice", "VIM", "lattice"))
```

Running and converting R markdown:

```r
install.packages(c("knitr", "rmarkdown"))
```

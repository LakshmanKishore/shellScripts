@echo off 

echo Hello Lakshman!
echo It is: %date%

doskey jl=jupyter lab $*
doskey clear=cls $*
doskey gs=git status $*
doskey gaa=git add . $*
doskey ca=conda activate "$*"
doskey cdec=conda deactivate 
doskey cel=conda env list
doskey cl=conda list
doskey cat=type
doskey ed=explorer .
# dg2fenia: Converter from DGScript to Fenia

## Installation

```bash
sudo apt-get install perl yapp
sudo cpan -i Parse::Yapp 
```

## Compiling parsers

```bash
yapp -o DGParser.pm -m DGParser dg.yp
yapp -o SubstParser.pm -m SubstParser subst.yp
```

## Running the converter

```bash
./cnv.pl myscript.trg
```

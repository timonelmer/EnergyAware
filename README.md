
<!-- badges: start -->
<!--![GitHub release (latest by date)](https://img.shields.io/github/v/release/timonelmer/EnergyUse)
![GitHub Release Date](https://img.shields.io/github/release-date/timonelmer/EnergyUse) -->
![GitHub issues](https://img.shields.io/github/issues-raw/timonelmer/EnergyUse)
![GitHub All Releases](https://img.shields.io/github/downloads/timonelmer/EnergyUse/total)
<!-- [![Codecov test coverage](https://codecov.io/gh/timonelmer/EnergyUse/branch/master/graph/badge.svg)](https://codecov.io/gh/timonelmer/EnergyUse?branch=master) -->
<!-- badges: end -->

# EnergyAware
`EnergyAware` is R package that allows you to estimate the CPU's energy use of R tasks. The aim of applying `EnergyAware` is that users become more aware of how much energy (sophisticated) computations in R require, in particular those running on external servers (e.g., supercomputers).

# Installation

The latest version of `EnergyAware` can be installed from source using `devtools`:

```r
devtools::install_github("timonelmer/EnergyAware")
```

# Setup 

`EnergyAware` is a very simple package that computes the energy consumption of a particular R task based on the CPU's power consumption (i.e., Thermal Design Power; TDP) over its active timeperiod. For this, you need to let R know what CPU model you are running the R task on or how much TDP your CPU model uses. This can be achieved in two ways:

#### Automatic setup

```r
cpu.info <- setup_cpu()
```

#### Manual setup
If the automatic setup does not work, you can either

* manually enter the CPU model  and let `EnergyAware` search in its database for a match
```r
cpu.info <- setup_cpu(cpu.model = "Intel(R) Core(TM) i7-4870HQ")
```


* manually enter the CPU's thermal design power (TDP) and number of cores. For most CPU models, this information can be found [here](https://www.cpubenchmark.net/cpu_list.php).

```r
cpu.info <- setup_cpu(tdp = 47, n.cores = 4)
```


# Example



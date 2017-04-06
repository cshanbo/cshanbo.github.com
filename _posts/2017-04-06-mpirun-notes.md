---
layout: post
title: "mpirun notes"
description: ""
category: mpi
tags: []
---
{% include JB/setup %}

# mpirun

We often use `mpi` to run multi-node parallel computing programs.
Currently, we use [openmpi-2.0.2](https://www.open-mpi.org/software/ompi/v2.0/) to set up our system.

# installation
We ususally install `openmpi` into the directory like `/usr/local/openmpi-x.x.x`, where `x.x.x` is the version id.

# notes
1. Do remember to add `install-dir/lib` to `LD_LIBRARY_PATH`, `install-dir/bin` to `PATH`.
2. Do remember to add certain paths to `.bashrc` and source it.
3. Adding certain paths to `.bash_profile` if you want.

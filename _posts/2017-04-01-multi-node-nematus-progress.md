---
layout: post
title: "multi node nematus progress"
description: "New Platoon-based NMT system"
category: Machine Translation
tags: []
---
{% include JB/setup %}

# Multi-node, multi-GPU training for NEMATUS

See running examples in ./test/train/

# Notice
1. Introducing new interface, which uses `.platoonrc` to manage the training nodes, and GPU cards (see ./test/train/.platoonrc).
2. Compatible with former `Single-node, multi-GPU` scenario.

# `Single-node` scenario
1. Set .platoonrc
2. Running `train.sh`, which is compatible with former version. 
3. Using `stop.sh` to kill jobs, for example, `./stop.sh single-exp/log/pids.txt`

# `Multi-node` scenario
1. Set .platoonrc
2. There is a little different in training script, which is:
    We *SHOULD NOT* set the `platoon-launcher` command in `train.sh` to background, which might cause mpi spawning error.
    Instead, we can set `train.sh` to background by `sh train.sh &`
3. Using `stop.sh` to kill jobs, for example, `./stop.sh multi-exp/log/pids.txt`

# TODO
1. Training stability and speed test
2. Fixing `MPI`-related spawning exception when setting the `platoon-launcher` to background in `train.sh`


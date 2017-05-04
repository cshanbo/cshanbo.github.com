---
layout: post
title: "platoon reminder"
description: "Need-to-know when using Platoon"
category: Theano
tags: []
---
{% include JB/setup %}

## What's Platoon
Platoon is a Multi-GPU mini-framework for Theano, that can be found in [github](https://github.com/cshanbo/platoon).

I'm one of the developers of Platoon. The current usable version is in [this branch](https://github.com/cshanbo/platoon/tree/fix/multi-node).

## Attention
Always importing `Platoon`-related components `BEFORE` importing `Theano`

## Some possible errors
```
Primary job  terminated normally, but 1 process returned
a non-zero exit code.. Per user-direction, the job has been aborted.
-------------------------------------------------------
[nmyjs_104_37:61137] [[50303,0],0] usock_peer_send_blocking: send() to socket 33 failed: Broken pipe (32)
[nmyjs_104_37:61137] [[50303,0],0] ORTE_ERROR_LOG: Unreachable in file oob_usock_connection.c at line 315
[nmyjs_104_37:61137] [[50303,0],0]-[[50303,1],1] usock_peer_accept: usock_peer_send_connect_ack failed
--------------------------------------------------------------------------
mpirun detected that one or more processes exited with non-zero status, thus causing
the job to be terminated. The first process to do so was:

  Process name: [[50303,1],0]
  Exit code:    4
--------------------------------------------------------------------------
## Multi-node Controllers terminated with return code: 4.
```

This error is strange, as it doesn't appear every time. Experimental results show that, if we start the jobs from a relatively `free` or `low-pressure` machine, the error rarely shows.

## TODO
1. Testing the current codes to ensure stability
2. More details in README and more examples.
3. Merging the `dev` branch to `master` after tests done


## Introduction
----
lrmichael is a malloc(3) implemention of the lock-free memory allocator described in [Scalable Lock-Free Dynamic Memory Allocation](https://dl.acm.org/citation.cfm?doid=996841.996848), by Maged M. Michael.

This implementation uses 2MB superblocks, and keeps block metadata per page in a seperate component instead of using boundary tags, achieving some allocator/user memory segregation.

## Usage
----
To compile, just download this repository and run 
```console
make
```

If successfully compiled, you can link lrmichael with your application at compile time with
```console
-llrmichael
```
or you can dynamically link it with your application by using LD_PRELOAD (if your application was not statically linked with another memory allocator).
```console
LD_PRELOAD=lrmichael.so ./your_application
```
## Copyright

Licence: MIT

Read file [COPYING](COPYING).


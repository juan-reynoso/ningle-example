# Getting started with Ningle

This is an Ningle application example

## Getting Started
### Clone the project
```
git clone https://github.com/juan-reynoso/ningle-example.git
```
### libev installation
```
aptitude install libev4
```


### Load the project
![alt text](https://github.com/juan-reynoso/ningle-example/blob/main/wwwroot/img/figure-1.jpg)

### Instructions
```
CL-USER> (ql:quickload :ningle-example)
To load "ningle-example":
  Load 1 ASDF system:
    ningle-example
; Loading "ningle-example"
...................................
(:NINGLE-EXAMPLE)
```
### Use the package
```
CL-USER> (in-package :ningle-example)
#<PACKAGE "NINGLE-EXAMPLE">
```
### Start the web server
```
NINGLE-EXAMPLE> (start-server :web-server :woo)
Woo server is started.
Listening on 127.0.0.1:8080.
#S(CLACK.HANDLER::HANDLER
   :SERVER :WOO
   :SWANK-PORT NIL
   :ACCEPTOR #<SB-THREAD:THREAD "clack-handler-woo" RUNNING {1001B2D963}>)
```
### Stop the web server
```
NINGLE-EXAMPLE> (stop-server)
T
```
### Start the web server with hunchentoot
```
NINGLE-EXAMPLE> (start-server :web-server :hunchentoot)
Hunchentoot server is started.
Listening on 127.0.0.1:8080.
#S(CLACK.HANDLER::HANDLER
   :SERVER :HUNCHENTOOT
   :SWANK-PORT NIL
   :ACCEPTOR #<SB-THREAD:THREAD "clack-handler-hunchentoot" RUNNING
                {100505C4D3}>)
```

### See the example
http://localhost:8080/index.html

![alt text](https://github.com/juan-reynoso/ningle-example/blob/main/wwwroot/img/figure-2.png)

## See Also
* https://edicl.github.io/hunchentoot/

* https://github.com/fukamachi/ningle

* https://fukamachi.hashnode.dev/woo-a-high-performance-common-lisp-web-server

;;;; ningle-example.asd

(asdf:defsystem #:ningle-example
  :description "Ningle application example"
  :author "Juan Reynoso jreynoso666@gmail.com"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:ningle #:yaclml #:clack #:clack-static-asset-middleware)
  :components ((:file "package")
               (:file "web-server-test")))

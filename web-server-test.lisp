;;;; ningle-example.lisp

(in-package #:ningle-example)

(defvar *app* (make-instance 'app)
  "Ningle Application.")

(defparameter *handler* nil)

(defmacro with-html (title &body body)
  "The basic structure of a web page HTML => HEAD => BODY"
  `(with-yaclml-output-to-string
     (<:html :doctype "html"
	     (<:head
	      (<:meta (@ "charset"
			 "utf-8"))
	      (<:meta :name "viewport"
		      :content "width=device-width, initial-scale=1")
	      (<:link :rel "stylesheet"
		      :type "text/css"
		      :href "/wwwroot/css/bootstrap.min.css")
	      (<:title (<:as-html ,title)))
	     (<:body
	      ,@body))))

(defun index ()
  "A basic page with an image and a video."
  (with-html "index"
    (<:div :class "container pt-5 d-flex flex-column"
	   (<:div :class "row"
		  (<:div :class "col-12 col-md-6"
			 (<:div :class "card shadow"
				(<:div :class "card-header"
				       "Image file example")
				(<:img :src "/wwwroot/img/img.png")))
		  (<:div :class "col-12 col-md-6"
			 (<:div :class "card shadow"
				(<:div :class "card-header"
				       "Video file example")
				(<:video :controls ""
					 :src "/wwwroot/video/video.mp4")))))))

;; Define the URL for the index
(setf (ningle:route *app* "/index.html")
      ;; call the index function
      (index))

(defun start-server (&key (web-server :woo))
  "Start the server. The web-server parameter could be :woo or :hunchentoot"
  (setf *handler* (clack:clackup
		   (lack:builder
		    (:static
		     ;; This is a path of URL
		     ;; to serve static files
		     :path "/wwwroot/"
		     ;; from this directory
		     ;; on the filesystem
		     :root (asdf:system-relative-pathname :ningle-example #p"wwwroot/"))
		    *app*)
		   :server web-server
		   ;; you can modify the port
		   :port 8080)))

(defun stop-server ()
  "Stop the server"
  (clack:stop *handler*))

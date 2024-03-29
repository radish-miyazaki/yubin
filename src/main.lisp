(defpackage #:yubin
  (:use #:cl)
  (:import-from #:jonathan #:parse)
  (:export #:get-place))
(in-package #:yubin)

(defun get-place (zipcode)
  (let* ((url (quri:make-uri :defaults "http://zipcloud.ibsnet.co.jp/api/search"
                             :query `(("zipcode" . ,zipcode))))
         (response (parse (dex:get url)))
         (result (first (getf response :|results|))))
    (if result
        (concatenate 'string
                     (getf result :|address1|)
                     (getf result :|address2|)
                     (getf result :|address3|))
        (error (format nil "~A: ~S (Code=~A)"
                       (getf response :|message|)
                       zipcode
                       (getf response :|status|))))))


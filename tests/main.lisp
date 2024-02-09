(defpackage #:yubin/tests/main
  (:use :cl
        :yubin
        :rove))
(in-package #:yubin/tests/main)

(deftest get-place
  (testing "should return the address for a given postal code in a number"
           (ok (equal (yubin:get-place 8800805) "宮崎県宮崎市橘通東")
               "8800805 -> 宮崎県宮崎市橘通東")
           (ok (equal (yubin:get-place 1500000) "東京都渋谷区")
               "1500000 -> 東京都渋谷区"))
  (testing "should raise an error for an unknown postal code"
           (ok (signals (yubin:get-place 0000000))))
  (testing "should raise an error for non postal code"
           (ok (signals (yubin:get-place "radish-miyazaki")))))


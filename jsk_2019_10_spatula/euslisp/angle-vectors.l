;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;define global variables;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;send *ri* :state :potentio-vector
;;(objects *r-tcp*)
;;define how many bowl-positions there should be
(setq *n-bowl-position* 4)
(setq oldtype -1)
(setq label-published nil)

;;VORSICHT der leetzte Eintrag also head-neck-p war immer 72 jetzt habe ich auf 65 geandert koennte vision aendern
;;av for second task: transfer dough into microwave bowl
;;(setq *av-transfer-1-l* #f(324.727 73.7608 17.5589 88.5586 -102.323 49.8802 -55.4643 86.229 -14.631 -6.05283 -70.5321 -113.413 -86.3516 -71.2529 275.089 3.3247 65.0))
(setq *av-transfer-1-l* #f(324.727 75.9118 17.9553 89.0816 -105.295 50.7759 -55.0442 85.2051 -13.7131 -5.06839 -68.7001 -116.702 -87.912 -73.3268 279.194 3.3247 65.0))
(setq *av-transfer-2-l* #f(324.727 78.4127 12.5465 74.5283 -119.755 48.2976 -33.0429 57.8385 -8.52889 -6.26122 -36.7605 -108.919 -83.5428 -103.244 287.37 3.5227 65.0))
(setq *av-transfer-3-l* #f(324.727 57.3726 11.5584 70.3762 -85.6418 41.5876 -43.7777 72.9619 -2.62254 -1.1235 -29.9869 -71.9554 -103.053 -108.609 247.565 3.5227 65.0))
;;(setq *av-transfer-23-l* #f(324.727 49.1392 8.10351 66.651 -66.1788 32.738 -80.1196 81.5531 -2.62254 -1.1235 -29.9869 -71.9554 -103.053 -108.609 247.565 3.5227 65.0))
;;(setq *av-transfer-4-l* #f(324.727 43.5481 -1.73256 74.1272 -54.1437 38.4265 -88.7928 66.507 -2.62254 -1.1235 -29.9869 -71.9554 -103.053 -108.609 247.565 3.5227 65.0))
;;(setq *av-transfer-4-l* #f(324.727 39.169 -2.50683 74.1303 -44.4216 38.922 -92.8235 69.9557 -2.62254 -1.1235 -29.9869 -71.9554 -103.053 -108.609 247.565 3.5227 65.0))
(setq *av-transfer-4-l* #f(324.727 37.613 -7.58067 71.8697 -40.0567 37.4852 -96.9311 66.9845 -2.62254 -1.1235 -29.9869 -71.9554 -103.053 -108.609 247.565 3.5227 65.0))
(setq *av-transfer-45-l* #f(324.674 33.6928 -12.7926 68.4008 -46.4325 59.3461 -100.578 68.9521 -2.97405 -1.01202 -30.0053 -71.1508 -103.076 -108.641 247.533 4.1287 74.2702))
(setq *av-transfer-5-l* #f(324.725 18.9602 -20.2598 71.4169 -56.4978 83.9532 -114.592 42.7006 -15.9041 0.834661 -33.0648 -75.6798 -92.4236 -105.273 242.276 3.6787 65.0))
;;left arm should stay like this the whole time
;;(setq *av-transfer-3-l* *av-transfer-3-l* #f(324.725 32.206 -7.16045 63.6233 -75.0411 75.1326 -81.1609 39.1286 -15.9041 0.834661 -33.0648 -75.6798 -92.4236 -105.273 242.276 3.6787 65.0))
;;bending bowl more so that dough drops on its own
;;(setq *av-transfer-6-l* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -15.9041 0.834661 -33.0648 -75.6798 -92.4236 -105.273 242.276 3.6787 65.0))
(setq *av-transfer-6-l* #f(324.725 17.1664 -20.2598 74.784 -55.938 83.1833 -112.065 42.1502 -15.9041 0.834661 -33.0648 -75.6798 -92.4236 -105.273 242.276 3.6787 65.0))
;;right arm scrapes the dough out of the bowl

;;av for spatula longer
(setq *av-transfer-1-r* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -28.4123 16.9925 -48.915 -84.8914 -75.3846 -70.132 228.752 3.6787 65.0))
(setq *av-transfer-2-r* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -18.4922 18.4249 -45.0658 -84.9585 -79.3029 -61.9935 232.675 3.6787 65.0))
;;(setq *av-transfer-corner-up* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -16.6155 17.0585 -47.6567 -84.2676 -79.789 -58.5942 233.763 3.6787 65.0))
(setq *av-transfer-3-r* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -16.4289 14.1929 -46.6901 -83.8275 -84.4789 -66.9546 238.359 3.6787 65.0))
(setq *av-transfer-4-r* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -15.5477 23.0645 -44.2259 -86.0191 -90.1839 -68.6696 234.73 3.6787 65.0))
;;(setq *av-scrape-down-inb* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -18.7505 25.3882 -47.5374 -86.5683 -88.3817 -66.7407 231.283 3.6787 65.0))
(setq *av-transfer-5-r* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -19.4516 17.0562 -52.7388 -85.6592 -88.4225 -69.494 237.505 3.6787 65.0))
;;(setq *av-transfer-front* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -29.1982 27.2563 -50.9862 -85.9775 -80.2227 -69.1172 221.889 3.6787 65.0))
;;(setq *av-transfer-6-r* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -25.5828 9.3502 -58.8294 -84.9185 -82.8962 -73.3403 237.406 3.6787 65.0))
;;(setq *av-transfer-6-r* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -25.8354 10.1969 -59.6276 -85.2614 -83.3073 -72.5788 236.989 3.6787 65.0))
(setq *av-transfer-6-r* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -26.0785 11.0428 -60.4189 -85.561 -83.725 -71.828 236.551 3.6787 65.0))
(setq *av-transfer-7-r* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -27.4487 8.66088 -58.8635 -84.6987 -80.9801 -73.935 235.978 3.6787 65.0))

;;av for spatula shorter
(setq *av-transfer-2-r-short* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -17.1542 18.0736 -46.5857 -84.2049 -79.7697 -59.9635 232.715 3.6787 65.0))
(setq *av-transfer-3-r-short* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -15.1236 14.1922 -48.191 -83.0236 -85.1003 -65.0439 238.31 3.6787 65.0))
(setq *av-transfer-4-r-short* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -14.4147 22.839 -46.0778 -84.9921 -90.5314 -66.3371 234.607 3.6787 65.0))
(setq *av-transfer-5-r-short* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -18.177 17.3638 -54.1617 -84.8241 -89.2111 -67.6208 237.42 3.6787 65.0))
(setq *av-transfer-6-r-short* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -24.8259 11.8988 -61.5621 -85.1406 -84.9826 -70.3153 236.646 3.6787 65.0))
(setq *av-transfer-7-r-short* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -26.2438 9.54795 -60.0348 -84.5253 -82.2693 -72.4082 236.166 3.6787 65.0))

;;(setq *av-transfer-2-r-shorter* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -17.1542 18.0736 -46.5857 -84.2049 -79.7697 -59.9635 232.715 3.6787 65.0))

;;av for spatula shorter outdated
(setq *av-transfer-2-r-2* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -17.1542 18.0736 -46.5857 -84.2049 -79.7697 -59.9635 232.715 3.6787 65.0))
(setq *av-transfer-3-r-2* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -15.1236 14.1922 -48.191 -83.0236 -85.1003 -65.0439 238.31 3.6787 65.0))
(setq *av-transfer-4-r-2* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -14.4147 22.839 -46.0778 -84.9921 -90.5314 -66.3371 234.607 3.6787 65.0))
(setq *av-transfer-5-r-2* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -18.177 17.3638 -54.1617 -84.8241 -89.2111 -67.6208 237.42 3.6787 65.0))
(setq *av-transfer-6-r-2* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -24.3623 10.2087 -60.0122 -84.606 -84.1507 -71.8101 237.526 3.6787 65.0))
(setq *av-transfer-7-r-2* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -26.2438 9.54795 -60.0348 -84.5253 -82.2693 -72.4082 236.166 3.6787 65.0))

(setq *av-transfer-2-r-middle* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -17.8015 16.9746 -45.018 -80.2835 -77.0769 -62.5586 229.133 3.6787 65.0))
(setq *av-transfer-3-r-middle* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -15.5406 12.0386 -47.0725 -76.7125 -81.2851 -67.169 232.905 3.6787 65.0))
;;(setq *av-transfer-4-r-middle* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -14.7141 20.5711 -44.2653 -79.0314 -87.136 -68.5865 229.721 3.6787 65.0))
(setq *av-transfer-4-r-middle* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -15.3651 21.5914 -46.0177 -79.2008 -86.7061 -67.0949 228.574 3.6787 65.0))
;;(setq *av-transfer-5-r-middle* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -18.1693 15.2403 -52.2396 -78.75 -85.98 -69.9646 232.378 3.6787 65.0))
(setq *av-transfer-5-r-middle* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -18.6895 16.8999 -53.7733 -79.1408 -86.2982 -68.4756 231.191 3.6787 65.0))
;;(setq *av-transfer-6-r-middle* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -23.8776 8.20188 -58.1735 -77.9787 -81.4684 -74.4102 232.407 3.6787 65.0))
;;(setq *av-transfer-6-r-middle* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -24.207 9.52254 -59.167 -78.5221 -82.0484 -73.3639 231.806 3.6787 65.0))
(setq *av-transfer-6-r-middle* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -24.5178 10.8324 -60.1565 -78.9653 -82.6301 -72.331 231.151 3.6787 65.0))
(setq *av-transfer-7-r-middle* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -25.6463 7.53952 -58.2331 -77.7287 -79.7022 -75.1222 231.069 3.6787 65.0))

(setq *av-transfer-2-r-right* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -16.3755 14.8596 -44.4219 -72.8554 -74.2483 -64.0969 223.843 3.6787 65.0))
(setq *av-transfer-3-r-right* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -14.0543 10.0898 -46.5399 -69.0627 -78.8664 -68.4306 227.384 3.6787 65.0))
(setq *av-transfer-4-r-right* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -13.5632 17.9748 -44.1639 -71.5068 -84.1646 -68.9518 224.472 3.6787 65.0))
(setq *av-transfer-5-r-right* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -16.8308 12.9281 -52.453 -71.2576 -83.0053 -70.1984 209.004 3.6787 65.0))
(setq *av-transfer-6-r-right* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -21.3155 7.30358 -57.9637 -70.3528 -80.6228 -74.9026 209.243 3.6787 65.0))
(setq *av-transfer-7-r-right* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -23.5946 6.20178 -57.6157 -70.1983 -78.5053 -76.451 225.981 3.6787 65.0))

(setq *av-clean-edge-1* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -30.0029 10.0113 -59.6523 -80.4367 -78.8258 -74.8351 228.636 3.6787 65.0))
(setq *av-clean-edge-2* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -27.1219 10.1303 -60.8156 -85.3835 -82.2072 -71.8032 235.887 3.6787 65.0))
(setq *av-clean-edge-3* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -23.4152 8.33887 -60.1222 -72.3778 -79.686 -73.2618 226.639 3.6787 65.0))
(setq *av-clean-edge-4* #f(324.725 20.0318 -20.2598 74.1229 -59.1428 82.1448 -112.093 41.4772 -25.9126 8.35045 -60.0381 -72.2042 -78.0432 -74.4924 224.429 3.6787 65.0))

;;define av to set the bowl on the table
(setq *av-bowl-table-1* #f(324.727 59.7502 10.3975 70.7246 -79.9149 35.5713 -49.8909 61.0437 -1.05556 -4.57252 -38.5641 -68.5378 -99.0857 -101.041 249.436 3.5227 65.0))
#|
(setq *av-transfer-1-r* #f(324.614 32.206 -7.16045 63.6233 -75.0411 75.1326 -81.1609 39.1286 -25.1065 16.6412 -61.037 -81.4337 -66.833 -52.1656 223.334 3.8467 65.0))
(setq *av-transfer-23-r* #f(324.614 32.206 -7.16045 63.6233 -75.0411 75.1326 -81.1609 39.1286 -24.1663 -4.36478 -64.5608 -76.2565 -79.5034 -86.9976 240.178 3.8467 65.0))
(setq *av-transfer-2-r* #f(324.614 32.206 -7.16045 63.6233 -75.0411 75.1326 -81.1609 39.1286 -19.2368 -0.878139 -69.4984 -76.3789 -79.318 -72.8306 241.614 3.8467 65.0))
(setq *av-transfer-3-r* #f(324.614 32.206 -7.16045 63.6233 -75.0411 75.1326 -81.1609 39.1286 -26.0431 -6.49699 -63.0119 -74.8315 -77.1399 -89.4042 238.47 3.8467 65.0))

(setq *av-transfer-1b-r* #f(324.614 32.206 -7.16045 63.6233 -75.0411 75.1326 -81.1609 39.1286 -22.3132 15.1798 -58.6991 -71.8084 -63.4397 -56.3024 216.773 3.8467 65.0))
(setq *av-transfer-2b-r* #f(324.614 32.206 -7.16045 63.6233 -75.0411 75.1326 -81.1609 39.1286 -16.645 -1.05296 -68.1146 -66.5337 -78.5049 -75.3376 234.32 3.8467 65.0))
(setq *av-transfer-3b-r* #f(324.614 32.206 -7.16045 63.6233 -75.0411 75.1326 -81.1609 39.1286 -19.0922 -9.9072 -68.4757 -63.1837 -80.4358 -93.6603 233.637 3.8467 65.0))
|#


(setq *av-reset-pose-high* #f(324.834 59.9994 74.0014 69.9995 -119.999 20.0009 -30.0145 180.014 -60.0002 74.0039 -69.9992 -119.999 -20.0041 -30.0008 180.001 3.0667 65.0))
(setq *av-base* #f(324.807 40.8419 14.9609 135.498 -100.854 -34.67 -39.7441 158.407 -33.4418 -10.5944 -86.243 -121.259 -73.9459 -64.4677 278.291 2.2447 65.0))

(setq *av1* #f(324.807 49.5519 26.3404 123.787 -101.985 -6.62817 -29.4461 135.656 -16.9966 -9.03369 -111.73 -116.714 -76.193 -57.7095 266.18 3.0727 65.0))
(setq *av2* #f(324.807  49.5519 26.3404 123.787 -101.985 -6.62817 -29.4461 135.656 -29.1714 -9.19364 -117.398 -118.456 -81.5623 -50.4353 263.348 3.0727 65.0))
(setq *av3* #f(324.807 51.8719 24.8194 124.823 -101.389 -6.18697 -32.6134 135.062 -29.0716 -9.25665 -86.0776 -118.804 -76.2328 -66.8658 270.291 3.0727 65.0))

(setq *av-r-approach* #f(324.807 56.1185 28.9347 130.252 -106.951 -4.19415 -27.7583 140.0 -32.5695 -12.6491 -76.4196 -115.819 -67.3766 -74.5905 266.454 3.0727 65.0))
(setq *av-newbowl* #f(324.807 56.1185 28.9347 130.252 -106.951 -4.19415 -27.7583 145.49 -44.3293 -11.7819 -87.1801 -121.541 -68.7655 -64.4132 266.2 3.3307 65.0))

;;define angle-vectors for vision
(setq *av-snapshot* #f(324.807 49.5519 26.3404 123.787 -101.985 -6.62817 -29.4461 135.656 -15.2124 -9.77758 -83.654 -81.938 -58.164 -102.254 344.738 3.0727 72))
(setq *look-front* #f(324.807 48.1046 24.0788 125.944 -102.011 -13.0963 -30.5362 126.148 -16.7019 -12.4359 -83.5748 -75.1221 -57.0671 -106.827 337.891 3.0727 72.0))
(setq *look-back* #f(324.807 51.737 30.1327 120.422 -101.764 4.18285 -28.8173 149.013 -17.8988 -13.2915 -80.4201 -84.9935 -54.0573 -104.319 347.318 3.0727 72.0))
(setq *look-right* #f(324.807 45.4864 16.3124 126.845 -108.835 -5.52084 -15.5745 129.482 -16.3723 -9.6885 -84.0297 -78.6769 -58.9823 -104.076 340.577 3.0727 72.0))
(setq *look-left* #f(324.807 51.1648 45.4815 116.822 -85.7364 -9.41469 -61.5682 142.069 -18.4818 -17.5874 -75.8746 -87.1968 -48.6971 -106.389 352.394 3.0727 72.0))

;;define av to move bowl in circle with larm, number is dependent on position
(setq *av-circulate-bowl-larm-1* #f(324.732 10.0416 17.7673 126.301 -44.4086 3.13066 -110.946 128.096 -29.0716 -9.25665 -86.0776 -118.804 -76.667 -66.8658 270.288 3.0907 68.484))
(setq *av-circulate-bowl-larm-2* #f(324.732 23.2091 16.7931 124.831 -62.4413 0.681321 -89.7113 125.453 -29.0716 -9.25665 -86.0776 -118.804 -76.667 -66.8658 270.293 3.0607 68.484))
(setq *av-circulate-bowl-larm-3* #f(324.732 35.3744 17.6995 124.381 -79.1387 -1.53601 -67.4001 126.246 -29.0716 -9.25665 -86.0776 -118.804 -76.667 -66.8658 270.288 3.0487 68.484))
(setq *av-circulate-bowl-larm-4* #f(324.732 46.8414 21.8678 123.977 -94.3927 -3.02749 -44.4108 129.716 -29.0716 -9.25665 -86.0776 -118.804 -76.667 -66.8658 270.293 3.1267 68.484))


;;toplace bowl on the counter
(setq *av-set-bowl-counter1* #f(324.727 34.7442 -13.0339 99.0236 -14.0969 15.3888 -113.433 83.9569 4.38029 -8.14859 -40.7679 -51.8719 -101.487 -96.8758 239.436 3.5227 65.0))
(setq *av-set-bowl-counter2* #f(324.727 40.0424 2.90524 88.3424 -23.3706 5.49685 -103.98 86.6042 5.33637 -8.46842 -41.1471 -50.8187 -101.74 -96.3441 239.349 3.5227 65.0))
(setq *av-set-bowl-counter3* #f(324.727 33.2527 17.6933 40.9045 -8.59437 53.1632 -114.368 95.1927 3.8465 -1.76478 -44.013 -53.6824 -102.767 -91.3174 237.286 3.5227 65.0))
(setq *av-set-bowl-counter4* #f(324.727 33.2527 17.6933 40.9045 -8.59437 53.1632 -114.368 95.1927 2.40294 9.16685 -51.2021 -59.2261 -104.751 -81.0934 236.792 3.5227 65.0))
(setq *av-set-bowl-counter5* #f(324.727 35.0342 16.7999 54.7901 -8.59437 39.9814 -114.592 95.8908 2.40294 9.16685 -51.2021 -59.2261 -104.751 -81.0934 236.792 3.5227 65.0))
(setq *av-set-bowl-counter6* #f(324.727 39.1766 8.91274 52.3859 -22.6039 34.2357 -107.963 77.9027 2.40294 9.16685 -51.2021 -59.2261 -104.751 -81.0934 236.792 3.5227 65.0))
(setq *av-set-bowl-counter7* #f(324.727 76.4331 29.4289 57.712 -95.2083 31.6371 -85.0335 53.5202 2.40294 9.16685 -51.2021 -59.2261 -104.751 -81.0934 236.792 3.5227 65.0))
;;(setq *av-set-bowl-counter8* #f(324.727 79.3669 46.4194 79.5868 -69.5597 45.6738 -97.9926 91.5771 2.40294 9.16685 -51.2021 -59.2261 -104.751 -81.0934 236.792 3.5227 65.0))
(setq *av-set-bowl-counter8* #f(324.727 79.807 37.8355 94.5952 -69.4507 33.0921 -91.1804 99.8805 -5.0157 0.611616 -51.6141 -64.5611 -95.2656 -87.367 240.636 3.5227 65.0))



;;;av for cup experiment to determine good gripper fro microwave demo
;;(setq *av1-cup* #f(324.638 59.8284 71.3211 70.8999 -118.589 20.0109 -29.5657 180.019 -87.7846 71.4101 -113.268 -101.227 -119.827 -5.72961 310.525 5.2867 -21.2682))
;;(setq *av2-cup* #f(324.638 59.8284 71.3211 70.8999 -118.589 20.0109 -29.5657 180.019 -67.1584 74.2725 -94.7792 -95.9407 -137.722 -5.72958 327.059 5.2867 -21.2682))
;;(setq *av3-cup* #f(324.638 59.8284 71.3211 70.8999 -118.589 20.0109 -29.5657 180.019 -64.1806 74.2656 -90.2889 -105.879 -159.681 -15.9176 349.68 5.2867 -21.2682))
;;(setq *r-tcp* (send (send *pr2* :rarm :end-coords) :copy-worldcoords))
;;(send *r-tcp* :translate (float-vector 0 0 10))
;;(send *r-tcp* :rotate (- 0 (/ pi 20)) :y)
;;(send *pr2* :rarm :inverse-kinematics *r-tcp*)

;;if use the otehr table
;;(setq *av1-cup* #f(324.638 59.8284 71.3211 70.8999 -118.589 20.0109 -29.5657 180.019 -67.374 74.2725 -94.4011 -94.9112 -125.513 -5.72958 314.717 5.2867 -21.2682))
;;(setq *av2-cup* #f(324.638 59.8284 71.3211 70.8999 -118.589 20.0109 -29.5657 180.019 -53.2812 74.2725 -80.9945 -91.2702 -127.848 -5.72958 316.879 5.2867 -21.2682))
;;(setq *av3-cup* #f(324.638 59.8284 71.3211 70.8999 -118.589 20.0109 -29.5657 180.019 -51.8613 74.2671 -78.2918 -98.6921 -153.087 -12.4614 342.572 5.2867 -21.2682))

(setq *av-prepare-cup1* #f(324.727 79.807 37.8355 94.5952 -69.4507 33.0921 -91.1804 99.8805 -10.5932 1.08496 -54.3785 -105.408 -93.5109 -87.6982 276.838 3.5227 65.0))
(setq *av-prepare-cup2* #f(324.727 79.807 37.8355 94.5952 -69.4507 33.0921 -91.1804 99.8805 -44.4356 5.32706 -48.272 -108.221 -73.9284 -92.9089 251.185 3.5227 65.0))
;;grasp cup new table
;;;needs fine tuning just a first start
;;(setq *av1-cup* #f(324.727 79.807 37.8355 94.5952 -69.4507 33.0921 -91.1804 99.8805 -23.5804 73.0103 -57.1365 -115.179 -186.95 -31.2052 197.045 7.7767 74.2702))
;;(setq *av2-cup* #f(324.727 79.807 37.8355 94.5952 -69.4507 33.0921 -91.1804 99.8805 -9.98343 63.1092 -51.2787 -99.5236 -200.481 -27.4612 215.686 7.7767 74.2702))
;;(setq *av1-cup* #f(324.727 79.807 37.8355 94.5952 -69.4507 33.0921 -91.1804 99.8805 -53.5807 74.2594 -99.5332 -121.529 -212.358 -33.316 219.909 7.7767 74.2702))
(setq *av1-cup* #f(324.727 79.807 37.8355 94.5952 -69.4507 33.0921 -91.1804 99.8805 -19.9817 73.7803 -59.6891 -116.087 -197.702 -33.6031 205.42 7.7767 74.2702))
;;(setq *av2-cup* #f(324.727 79.807 37.8355 94.5952 -69.4507 33.0921 -91.1804 99.8805 -8.77182 60.088 -51.6159 -96.1041 -202.461 -27.0593 219.931 7.7767 74.2702))
(setq *av2-cup* #f(324.727 79.807 37.8355 94.5952 -69.4507 33.0921 -91.1804 99.8805 -12.5975 53.1103 -61.7934 -97.4374 -199.074 -36.9623 225.455 7.7767 74.2702))
(setq *av3-cup* #f(324.727 79.807 37.8355 94.5952 -69.4507 33.0921 -91.1804 99.8805 -16.6434 47.3058 -58.2312 -106.148 -188.187 -40.7908 218.312 7.7767 74.2702))
;;(setq *av4-cup* #f(324.727 79.807 37.8355 94.5952 -69.4507 33.0921 -91.1804 99.8805 -12.6776 51.7324 -63.0985 -96.4237 -199.904 -37.0281 227.854 7.7767 74.2702))
(setq *av4-cup* #f(324.727 79.807 37.8355 94.5952 -69.4507 33.0921 -91.1804 99.8805 -12.1888 50.0155 -63.8952 -94.5142 -200.657 -36.6666 230.395 7.7767 74.2702))


;;move to microwave
(setq *av-prepare-move-microwave1* #f(324.688 75.6421 65.6482 124.174 -91.0327 52.3011 -42.7114 105.015 -22.9206 42.4974 -78.9665 -121.497 -201.041 -57.7706 236.208 7.7767 74.2702))


;;just in case safe microwave parameters here
;;nitial position for demo
;;#f(50.0193 59.9994 74.0014 70.0087 -119.999 20.0076 -30.0019 180.001 -39.4936 26.0339 -93.5104 -120.297 -203.777 -58.4382 258.91 7.7887 28.32)
;;place cup into microwave
;;#f(50.0 75.6421 65.6482 124.174 -91.0327 52.3011 -42.7114 105.015 -6.62506 -3.96955 -41.286 -121.526 -151.42 -91.9334 236.595 7.7767 74.2702)
;;av put-cup-1 #f(50.186 75.6703 65.0443 123.949 -97.1051 98.1676 -39.9086 109.807 4.8101 10.4514 -23.4935 -95.4876 -158.274 -72.0419 203.178 7.1647 74.2702)
;;av put-cup-2 #f(50.186 75.6703 65.0443 123.949 -97.1051 98.1676 -39.9086 109.807 20.6674 -13.5168 -27.0534 -14.591 -136.61 -23.4884 171.545 7.1647 74.2702)
;;av put-cup-3 #f(50.186 75.6703 65.0443 123.949 -97.1051 98.1676 -39.9086 109.807 17.61 -5.36846 -32.4696 -26.94 -143.034 -24.1605 184.046 7.1647 74.2702)

;;maybe new av put-cup-3 to pick it up easier later
;;#f(50.0187 60.0 74.0 70.0 -120.0 20.0 -30.0 180.0 15.1359 -7.46127 -43.6881 -32.3907 -137.927 -31.4548 183.473 7.7827 28.17)


;;with cheat to not turn,
;;av put-cup-3 #f(50.0187 59.9994 74.0014 69.9995 -119.999 20.0009 -29.9994 179.999 17.2599 -7.17866 -36.8263 -25.4638 -139.507 -23.7161 176.153 7.7827 28.17)

;;extra vector to remove cup from microwave
;;#f(50.0 60.0 74.0 70.0 -120.0 20.0 -30.0 180.0 21.9296 -11.6922 -30.4678 -8.68286 -124.125 -17.0287 161.116 7.7887 28.0)
;;changed with hack against spinning to
;;#f(50.0187 60.0 74.0 70.0 -120.0 20.0 -30.0 180.0 21.5466 -13.8811 -34.5959 -8.59437 -122.618 -23.8449 155.107 7.7827 28.17)

;;for save movement, bevore repositioning, move cup into save spot
;;#f(50.0 60.0 74.0 70.0 -120.0 20.0 -30.0 180.0 -39.4936 26.0339 -93.5104 -120.297 -203.777 -6.0 258.91 7.7887 28.0)
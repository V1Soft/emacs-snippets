;;; functions.el ---                                 -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Jaden Manacsa

;; Author: Jaden Manacsa <jmanacsa@jaden-lenovopc>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the MIT licence

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;;; Commentary:

;; Changes:
;; ------------
;; Add eyedrop function

;;; Code:
(require 'eyedrop)

(defun inverted-mouse-update ()
  "Function for inverting the cursor color."
  (interactive)
  (if inverted-mouse-active
      (set-cursor-color (eyedrop-foreground-at-point))))

(provide 'functions)
;;; functions.el ends here

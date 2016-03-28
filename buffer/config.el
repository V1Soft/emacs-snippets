;;; config -- Configurations for Emacs' bwf system.
;;; Commentary:
;; Changes:
;; --------------
;; Use windmove
;; Use golden ratio
;;; Code:
(load-file "packages.el")
(load-file "functions.el")

;; modes
(windmove-default-keybindings)
(golden-ratio-mode 1)

;; keybindings
(global-set-key (kbd "C-c n") 'xah-new-empty-buffer)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-c o") 'ace-window)

;; hooks & stuff
(eval-after-load "golden-ratio"
  '(progn
     (add-to-list 'golden-ratio-exclude-modes "neotree-mode")
     ))


(provide 'config)
;;; config.el ends here

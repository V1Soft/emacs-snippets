;;; config -- configurations for manipulating and editing files
;;; Commentary:
;; Changes:
;; ------------
;;
;;; Code:
(load-file "packages.el")
(load-file "functions.el")

;; keybindings
(global-set-key (kbd "C-x j") 'avy-goto-char)
(global-set-key (kbd "C-x w") 'avy-goto-word-0)
(global-set-key (kbd "C-x C-S-e") 'eval-and-replace)
(global-set-key (kbd "C-x F") 'find-file-as-root)

(provide 'config)
;;; config.el ends here

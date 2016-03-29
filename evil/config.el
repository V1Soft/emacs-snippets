;;; config -- Configuration for Emacs' Evil mode.
;;; Commentary:
;; Changes:
;; -------------
;; Cursor state colors.
;; Tilde and backslash do God-Mode related things.
;; C-s in normal mode opens Swiper.
;; Some movements.
;;
;;; Code:
(load-file "packages.el")
(load-file "functions.el")

;; keybindings
(evil-mode 1)
(setq-default evil-emacs-state-cursor '("blue" box))
(setq-default evil-normal-state-cursor '("gray" box))
(setq-default evil-visual-state-cursor '("orange" box))
(setq-default evil-insert-state-cursor '("green" bar))
(setq-default evil-replace-state-cursor '("red" bar))
(setq-default evil-operator-state-cursor '("red" hollow))
(setq-default evil-god-state-cursor '("purple" box))
(evil-define-key 'god global-map [escape] 'evil-god-state-bail)
(evil-define-key 'normal global-map "\\" 'evil-execute-in-god-state)
(evil-define-key 'normal global-map "~" 'evil-god-state)
(evil-define-key 'normal global-map (kbd "C-s") 'swiper)

(define-key evil-motion-state-map "0" 'evil-end-of-line)
(define-key evil-motion-state-map "$" 'evil-beginning-of-line)
(define-key evil-motion-state-map ";" 'evil-ex)
(define-key evil-motion-state-map ":" 'evil-repeat-find-char)

(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)


;;; neo-tree
(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

;; movements
(define-and-bind-text-object "*" "*" "*")
(define-and-bind-text-object "%" "%" "%")
(define-and-bind-text-object "$" "$" "$")
(define-and-bind-text-object ">" ">" "<")

(provide 'config)
;;; config.el ends here

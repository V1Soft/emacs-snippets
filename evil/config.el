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

;; define movement macro
(defmacro define-and-bind-text-object (key start-regex end-regex)
  "Create new evil text object based on KEY, START-REGEX, and END-REGEX."
  (let ((inner-name (make-symbol "inner-name"))
        (outer-name (make-symbol "outer-name")))
    `(progn
       (evil-define-text-object ,inner-name (count &optional beg end type)
         (evil-select-paren ,start-regex ,end-regex beg end type count nil))
       (evil-define-text-object ,outer-name (count &optional beg end type)
         (evil-select-paren ,start-regex ,end-regex beg end type count t))
       (define-key evil-inner-text-objects-map ,key (quote ,inner-name))
       (define-key evil-outer-text-objects-map ,key (quote ,outer-name)))))

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

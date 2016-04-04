;;; functions -- Functions for Emacs' bwf system.
;;; Commentary:
;; Changes:
;; ------------
;;
;;; Code:

(defun xah-new-empty-buffer ()
  "Open a new empty buffer.
URL `http://ergoemacs.org/emacs/emacs_new_empty_buffer.html'
Version 2015-06-12"
  (interactive)
  (let ((ξbuf (generate-new-buffer "untitled")))
    (switch-to-buffer ξbuf)
    (funcall (and initial-major-mode))
    (setq buffer-offer-save t)))

;; use ivy to open recent directories
(defun counsel-goto-recent-directory ()
  "Recent directories."
  (interactive)
  (let (collection)
    (unless recentf-mode (recentf-mode 1))
    (setq collection
          (append (remove-duplicates
                   (mapcar 'file-name-directory recentf-list)
                   :test (lambda (x y) (or (null y) (equal x y)))
                   :from-end t)
                  ;; fasd history
                  (if (executable-find "fasd")
                      (mapcar (lambda (v) (replace-regexp-in-string "^[.0-9]+ +" "" v))
                              (split-string (shell-command-to-string "fasd -d") "\n" t)))))
    (ivy-read "directories:" collection :action 'dired)))

;; http://endlessparentheses.com/eval-result-overlays-in-emacs-lisp.html
(defun endless/eval-overlay (value point)
  (cider--make-result-overlay (format "%S" value)
                              :where point
                              :duration 'command)
  ;; Preserve the return value.
  value)

;; http://endlessparentheses.com/ispell-and-abbrev-the-perfect-auto-correct.html
(defun endless/simple-get-word ()
  (car-safe (save-excursion (ispell-get-word nil))))

(defun endless/ispell-word-then-abbrev (p)
  "Call `ispell-word', then create an abbrev for it.
With prefix P, create local abbrev. Otherwise it will
be global.
If there's nothing wrong with the word at point, keep
looking for a typo until the beginning of buffer. You can
skip typos you don't want to fix with `SPC', and you can
abort completely with `C-g'."
  (interactive "P")
  (let (bef aft)
    (save-excursion
      (while (if (setq bef (endless/simple-get-word))
                 ;; Word was corrected or used quit.
                 (if (ispell-word nil 'quiet)
                     nil ; End the loop.
                   ;; Also end if we reach `bob'.
                   (not (bobp)))
               ;; If there's no word at point, keep looking
               ;; until `bob'.
               (not (bobp)))
        (backward-word)
        (backward-char))
      (setq aft (endless/simple-get-word)))
    (if (and aft bef (not (equal aft bef)))
        (let ((aft (downcase aft))
              (bef (downcase bef)))
          (define-abbrev
            (if p local-abbrev-table global-abbrev-table)
            bef aft)
          (message "\"%s\" now expands to \"%s\" %sally"
                   bef aft (if p "loc" "glob")))
      (user-error "No typo at or before point"))))

(provide 'functions)
;;; functions.el ends here

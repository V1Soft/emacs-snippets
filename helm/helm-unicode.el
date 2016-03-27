;;; helm-unicode -- Search for Unicode Symbols from Emacs Helm.
;;; Commentary:
;; Usage:
;; Call through M-x RET helm-unicode.
;;; Code:
(require 'helm)

(defvar Unicode-Symbols
  '(
    ("< MATH: Less Than" . "<")
    ("÷ MATH: Divide" . "÷")
    ("✕ MATH: Multiply" . "✕")
    ("+ MATH: Add" . "+")
    ("− MATH: Minus" . "−")
    ("ƒ MATH: Function Definition" . "ƒ")
    ("¿ SPANISH: Inverted Question Mark" . "¿")
    ("¡ SPANISH: Inverted Exclamation Mark" . "¡")
    ("ñ SPANISH: Small n with Tilde" . "ñ")
    ("Ñ SPANISH: Capital N with Tilde" . "Ñ")
    )
  )

(defun helm-unicode-insert-char (candidate)
  "Insert CANDIDATE into buffer."
  (insert (substring candidate -1))
  )

(defun helm-unicode ()
  "Find unicode symbols through helm."
  (interactive)
  (helm :prompt "Insert Character: "
        :buffer "*helm unicode*"
        :sources (helm-build-sync-source "Helm Unicode Source"
                   :candidates Unicode-Symbols
                   :action 'insert
                   :persistent-action 'ignore
                   :filtered-candidate-transformer 'helm-fuzzy-highlight-matches)))

(provide 'helm-unicode)
;;; helm-unicode.el ends here

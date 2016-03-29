;;; functions -- functions for manipulating and editing files
;;; Commentary:
;; Changes:
;; ------------
;; Function to find a file as root
;; Function to eval and replace s-exp
;;; Code:
(load-file "packages.el")

(defun find-file-as-root ()
  "Like `ido-find-file, but automatically edit the file with root-privileges (using tramp/sudo), if the file is not writable by user."
  (interactive)
  (let ((file (ido-read-file-name "Edit as root: ")))
    (unless (file-writable-p file)
      (setq file (concat "/sudo:root@localhost:" file)))
    (find-file file)))

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (move-end-of-line nil)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(provide 'functions)
;;; functions.el ends here

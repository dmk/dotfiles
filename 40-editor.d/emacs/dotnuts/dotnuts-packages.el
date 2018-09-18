;;; dotnuts-packages.el -- Load packages

;; Load straight.el package manager
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Install packages
(setq package-list '(;; Core packages
         ; epl ;; Package manager
;
				 ; helm ;; completion for emacs stuff
;
         ; Projects manager
				 ; projectile
         ; helm-projectile
; ))
;
; (add-to-list 'package-archives
			 ; '("melpa" . "http://melpa.milkbox.net/packages/") t)
;
; (package-initialize)
;
; (unless package-archive-contents
  ; (package-refresh-contents))

(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;; optional keyboard short-cut
(global-set-key "\C-xm" 'browse-url-at-point)

(require 'package)
;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))
;; Add the user-contributed repository
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
;; Add Melpa
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/"))

;; Use El-Get to sync repos and dependencies.

;; Add the manually upgraded Tiny-Tools package to my emacs "load on boot"
;; Directory for this should be upgraded with "git-pull" as needed.

(add-to-list 'load-path "~/.emacs.d/packages/tiny-tools/lisp/tiny")
(add-to-list 'load-path "~/.emacs.d/packages/tiny-tools/lisp/other")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (tango-dark)))
 '(inhibit-startup-screen t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 90 :width normal)))))

;; This is how to make "Scheme" associate with GNUGuile.
  ;; also set highlight parenthesis
(setq show-paren-delay 0
      show-paren-style 'parenthesis)
(show-paren-mode 1)
  ;;  Always do syntax Highlighting
(global-font-lock-mode 1)
(setq scheme-program-name "guile")

;; Bind an Insert Date/Time to "C^c d"
(global-set-key (kbd "C-c d") 'insert-date)
(defun insert-date ()
  "Inserts standard date time string."
  (interactive)
  (insert (format-time-string "%c")))

;; C-specific Indentation
;; First FOUR space indents, like Odin intended
;; and then go with the way Linus indents...the RIGHT way.
(setq c-default-style "linux"
      c-basic-offset 4)

(defun joe-toggle-selective-display ()
;;Joe's quick toggle of code-folding
  (interactive)
  (set-selective-display (if selective-display nil 1)))

(global-set-key [f1] 'joe-toggle-selective-display)

;; after removal of iswitchb, ido-mode is useful
(setq ido-enable-flex-matching t)
(ido-mode 1)

;; Meh, I had rather just call it manually rather than it breaking md ;;
;;(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Seriously, I hate them
(setq make-backup-files nil)

(setq browse-url-browser-function 'w3m-browse-url)
 (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
 ;; optional keyboard short-cut
 (global-set-key "\C-xm" 'browse-url-at-point)

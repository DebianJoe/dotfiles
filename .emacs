(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;; optional keyboard short-cut
(global-set-key "\C-xm" 'browse-url-at-point)

;; Add the manually upgraded Tiny-Tools package to my emacs "load on boot"
;; Directory for this should be upgraded with "git-pull" as needed.

(add-to-list 'load-path "~/.emacs.d/packages/tiny-tools/lisp/tiny")
(add-to-list 'load-path "~/.emacs.d/packages/tiny-tools/lisp/other")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(column-number-mode t)
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   (quote
    ("e4e97731f52a5237f37ceb2423cb327778c7d3af7dc831788473d4a76bcc9760" "d2605146c1e4a58a20f205383c6026f500cb46b170bdbfc229087d57c432439a" default)))
 '(inhibit-startup-screen t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(menu-bar-mode -1)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Bitstream Vera Sans Mono" :foundry "bitstream" :slant normal :weight normal :height 90 :width normal)))))

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

;; Emulate Plan 9's smart shell with eshell.
(require 'eshell)
(require 'em-smart)
(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands nil)
(setq eshell-smart-space-goes-to-end t)
(global-set-key [f2] 'eshell)
 
;; ido mode for buffer swapping
(setq ido-enable-flex-matching t)
(ido-mode 1)

;; Seriously, I hate them
(setq make-backup-files nil)

(setq browse-url-browser-function 'w3m-browse-url)
 (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
 ;; optional keyboard short-cut
 (global-set-key "\C-xm" 'browse-url-at-point)

(load "~/lisp_scripts/eplayer.el")
(load "~/lisp_scripts/window_swap.el")
(load "~/lisp_scripts/eshell_extension.el")
;; Slime loading environment
;; (setq inferior-lisp-program "~/ghost_lisp/ghostlisp")
(setq inferior-lisp-program "/usr/bin/sbcl")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")
(require 'slime)
(slime-setup)

;; Use Chicken for Scheme
(setq scheme-program-name "/usr/local/bin/csi")
 (setq show-paren-delay 0
      show-paren-style 'parenthesis)
 (show-paren-mode 1)
  ;;  Always do syntax Highlighting
 (global-font-lock-mode 1)

;; I hate that bell!!!! 
(setq visible-bell 1)

;; Zenburned
 (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
 (load-theme 'zenburn t)

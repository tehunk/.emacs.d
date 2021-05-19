;; --------------------------------------------------------------------
;; << AUTOMATICALLY GENERATED

;; custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("ea5822c1b2fb8bb6194a7ee61af3fe2cc7e2c7bab272cbb498a0234984e1b2d9" default))
 '(package-selected-packages
   '(which-key rainbow-delimiters command-log-mode use-package rust-mode)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; >>

;; --------------------------------------------------------------------
;; simplify UI
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(tooltip-mode -1)
(tool-bar-mode -1)
(when (display-graphic-p) (scroll-bar-mode -1))

;; extra UI
(line-number-mode 1)
(column-number-mode 1)
(when (display-graphic-p) (set-fringe-mode 5))
; (display-line-numbers-mode 1) ; for emacs 27+ only

;; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'zenburn)

;; --------------------------------------------------------------------
;; package
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                          ("org" . "https://orgmode.org/elpa/")
                          ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; color-coded parentheses
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; gives hints to possible key bindings
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.2))

;; logging commands
;; useful with global-command-log-mode
;; check M-x clm/* for the interface
;; (use-package command-log-mode)

;; --------------------------------------------------------------------
;; language specific settings

;; python
(setq python-shell-interpreter-args "-i --simple-prompt"
      python-shell-interpreter "ipython3")

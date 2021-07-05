;; --------------------------------------------------------------------
;; << AUTOMATICALLY GENERATED

;; custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("6c386d159853b0ee6695b45e64f598ed45bd67c47f671f69100817d7db64724d" "1a52e224f2e09af1084db19333eb817c23bceab5e742bf93caacbfea5de6b4f6" "4b0e826f58b39e2ce2829fab8ca999bcdc076dec35187bf4e9a4b938cb5771dc" "1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "ea5822c1b2fb8bb6194a7ee61af3fe2cc7e2c7bab272cbb498a0234984e1b2d9" default))
 '(package-selected-packages
   '(helm-projectile doom-modeline doom-themes projectile helm magit which-key rainbow-delimiters command-log-mode use-package rust-mode)))

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
(show-paren-mode 1)
(when (display-graphic-p) (set-fringe-mode 5))
(set-face-attribute 'default nil :height 140) ; font-size default 16pt
(add-hook 'prog-mode-hook 'display-line-numbers-mode) ; for emacs 27+ only


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
(require 'use-package-ensure)
(setq use-package-always-ensure t)


;; theme
(use-package doom-themes
  :config
  (load-theme 'doom-one t))


(use-package doom-modeline
  :hook (after-init . doom-modeline-mode))


(use-package all-the-icons)


;; color-coded parentheses
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; gives hints to possible key bindings
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.2))

(use-package magit)

;; helm
(use-package helm
  :config (helm-mode 1))


;; projectile
(use-package projectile
  :diminish projectile-mode
  :config
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
  (projectile-mode +1)
  :custom ((projectile-completion-system 'helm)))


(use-package helm-projectile
  :config (helm-projectile-on))

;; logging commands
;; useful with global-command-log-mode
;; check M-x clm/* for the interface
;; (use-package command-log-mode)

;; --------------------------------------------------------------------
;; language specific settings

;; python
(setq python-shell-interpreter-args "-i --simple-prompt"
      python-shell-interpreter "ipython3")

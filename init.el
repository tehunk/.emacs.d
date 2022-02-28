;; --------------------------------------------------------------------
;; << AUTOMATICALLY GENERATED

;; custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes '(default))
 '(package-selected-packages
   '(php-mode treemacs-magit treemacs-icons-dired treemacs-projectile treemacs json-mode exec-path-from-shell prettier-js js2-mode diminish ivy markdown-mode swift-mode all-the-icons doom-modeline doom-themes projectile magit which-key rainbow-delimiters command-log-mode use-package rust-mode))
 '(projectile-mode t nil (projectile)))

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

;; env
(use-package exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


;; theme
(use-package doom-themes
  :config
  (load-theme 'doom-one t))

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode))

(use-package all-the-icons)

;; diminish
(use-package diminish)

;; color-coded parentheses
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; gives hints to possible key bindings
(use-package which-key
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.2)
  (which-key-mode 1))

;; magit
(use-package magit)

;; ivy
(use-package ivy
  :config
  (setq ivy-use-virtual-buffers t)
  ;(setq ivy-count-format "(%d/%d) ")
  (ivy-mode 1))

;; projectile
(use-package projectile
  :diminish projectile-mode
  :config
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
  (projectile-mode 1))

;; treemacs
(use-package treemacs
  :defer t
  :init)

(use-package treemacs-projectile
  :after (treemacs projectile))

(use-package treemacs-icons-dired
  :after (treemacs dired)
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after (treemacs magit))

;; language modes
(use-package swift-mode
  :mode "\\.swift\\'")
(use-package rust-mode
  :mode "\\.rs\\'")
(use-package markdown-mode
  :mode "\\.md\\'")

(use-package prettier-js)
(use-package js2-mode
  :mode "\\.js\\'"
  :hook (js2-mode-hook . prettier-js-mode)
  :config
  (setq js-switch-indent-offset 4))

(use-package json-mode
  :mode "\\.json\\'")

(use-package php-mode
  :mode "\\.php\\'")

;; logging commands
;; useful with global-command-log-mode
;; check M-x clm/* for the interface
;; (use-package command-log-mode)

;; --------------------------------------------------------------------
;; language specific settings

;; python
(setq python-shell-interpreter-args "-i --simple-prompt"
      python-shell-interpreter "ipython3")

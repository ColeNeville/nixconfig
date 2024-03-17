;; (tool-bar-mode -1)
(scroll-bar-mode -1)

;; Progaming modes special configuration
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(setq visible-bell t)
(setq ring-bell-function 'ignore)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq standard-indent 2)

(require 'use-package)

(use-package modus-themes
  :ensure t
  :config
  (setq modus-themes-common-palette-overrides
	`(
	  (border-mode-line-active bg-mode-line-active)
          (border-mode-line-inactive bg-mode-line-inactive)

	  ,@modus-themes-preset-overrides-faint))
  ;; (setq modus-vivendi-palette-overrides
	;; '((bg-main nil)))
  (load-theme 'modus-vivendi t))

(use-package ledger-mode
  :ensure t
  :defer t
  :config
  (setq ledger-binary-path "ledger")
  (add-to-list 'auto-mode-alist '("\\.journal\\'" . leder-mode)))

(use-package nix-mode
  :ensure t
  :defer t
  :config
  (add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode)))

(use-package helm
  :ensure t
  :config
  (global-set-key (kbd "M-x") 'helm-M-x))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package neotree
  :ensure t
  :config
  (neotree))

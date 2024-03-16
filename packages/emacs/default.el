(load-theme 'zenburn t)
(setq standard-indent 2)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)

(require 'ledger-mode)
(add-to-list 'auto-mode-alist '("\\.journal\\'" . ledger-mode))
(setq ledger-binary-path "ledger")

(require 'nix-mode)
(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))

(require 'helm)
(global-set-key (kbd "M-x") 'helm-M-x)

(require 'which-key)
(which-key-mode)

(require 'treemacs)
(treemacs)

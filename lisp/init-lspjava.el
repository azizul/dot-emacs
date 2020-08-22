;;; init-lspjava.el -- My evil mode configuration.
;;; Commentary:
;;; Code:
(use-package lsp-mode :hook ((lsp-mode . lsp-enable-which-key-integration))
  :config (setq lsp-completion-enable-additional-text-edit nil))
(use-package lsp-ui)
(use-package lsp-java :config (add-hook 'java-mode-hook 'lsp))
; perhaps need to move DAP on it's own
(use-package dap-mode :after lsp-mode :config (dap-auto-configure-mode))
(use-package dap-java :ensure nil)
(use-package lsp-treemacs)
(provide 'init-lspjava)
;;; init-lspjava.el ends here

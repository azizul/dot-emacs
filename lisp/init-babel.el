;;; init-babel.el --- Set up Babel
;;; Commentary:
;;Loading diagramming extension and literate programming supports


;;; Code:
(setq-default org-src-fontify-natively t)
;; Include the latex-exporter
(require 'ox-latex)
;; Add minted to the default packages to include when exporting
(add-to-list 'org-latex-packages-alist '("" "minted"))
;; Tell the latex export to use the minted package for source
;; Code coloration
(setq org-latex-listings 'minted)
;; execute external programs.
;; This is obviously and can be dangerous to activate!

;; I use pdflatex instead of xelatex because that seems to work
;; much better with utf-8 files
(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directoyr %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directoyr %o %f"))

;; list of languages that may be evaluated in org documents
(use-package ob-typescript :ensure t)
(setq my/org-babel-evaluated-languages '(emacs-lisp shell java js typescript))
;; diagramming graphiz
(add-to-list 'org-src-lang-modes (quote ("dot" . graphviz-dot)))
(add-to-list 'my/org-babel-evaluated-languages 'dot)
;; diagramming Ditaa
(add-to-list 'my/org-babel-evaluated-languages 'ditaa)
;; diagramming PlantUml
(add-to-list 'my/org-babel-evaluated-languages 'plantuml)

(org-babel-do-load-languages
 'org-babel-load-languages
 (mapcar (lambda (lang)
                (cons lang t))
         my/org-babel-evaluated-languages))


(provide 'init-babel)
;;; init-babel.el ends here

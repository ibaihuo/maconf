(elpy-enable)
(elpy-use-ipython)

(add-hook 'python-mode-hook #'smartparens-mode)

(setq py-indent-offset 4)		;自定义缩进为4

(defvar myPackages
  '(better-defaults
    elpy
    flycheck ;; add the flycheck package
    material-theme
    py-autopep8
    ))

;; for flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))


;; for pep8
;; (require 'py-autopep8)			
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

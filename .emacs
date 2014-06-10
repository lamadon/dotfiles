(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 ;;'(ecb-layout-window-sizes (quote (("left9" (0.15319148936170213 . 0.9818181818181818)))))
 ;;'(ecb-options-version "2.32")
 '(inhibit-startup-screen t)
 '(show-paren-mode t)
 '(speedbar-use-imenu-flag nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; Prevent extraneous tabs
(setq-default indent-tabs-mode nil)

;;
(add-to-list 'load-path "~/.elisp")

;; Disable ~ backups
(setq make-backup-files nil)

;; ido
(require 'ido)
(ido-mode 'both) ;; for buffers and files

;; auto-complete
(require 'auto-complete)
(global-auto-complete-mode t)

;; auto-install
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")

;; python-mode
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

;; ipython
(require 'ipython)

;; anything
(add-to-list 'load-path "/home/lamadon/localCompiled/anything-config")
(require 'anything-config)

(require 'anything)
(when (require 'anything-show-completion nil t)
  (use-anything-show-completion 'anything-ipython-complete
				'(length initial-pattern)))
;; comint
(require 'comint)
(define-key comint-mode-map (kbd "M-") 'comint-next-input)
(define-key comint-mode-map (kbd "M-") 'comint-previous-input)
(define-key comint-mode-map [down] 'comint-next-matching-input-from-input)
(define-key comint-mode-map [up] 'comint-previous-matching-input-from-input)

;; pylookup
(setq pylookup-dir "/home/lamadon/localCompiled/pylookup")
(add-to-list 'load-path pylookup-dir)
(setq pylookup-program "/home/lamadon/localCompiled/pylookup/pylookup.py")
(setq pylookup-db-file "/home/lamadon/localCompiled/pylookup/pylookup.db")
(autoload 'pylookup-lookup "pylookup")
(autoload 'pylookup-update "pylookup")
(global-set-key "\C-ch" 'pylookup-lookup)

;; python-pep8 pylint
(add-to-list 'load-path "~/.emacs.d/auto-install")
(require 'python-pep8)
(require 'python-pylint)

;; autopair
(autoload 'autopair-global-mode "autopair" nil t)
(autopair-global-mode)
(add-hook 'lisp-mode-hook
          #'(lambda () (setq autopair-dont-activate t)))

(add-hook 'python-mode-hook
          #'(lambda ()
              (push '(?' . ?')
                    (getf autopair-extra-pairs :code))
              (setq autopair-handle-action-fns
                    (list #'autopair-default-handle-action
                          #'autopair-python-triple-quote-action))))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; clipboard
(setq x-select-enable-clipboard t)

;;speedbar
;; (require 'speedbar)
;; (speedbar-add-supported-extension ".py")

;;speedbar embbedded frame
;; (require 'sr-speedbar)
;; (sr-speedbar-toggle)

;; ecb
;;(require 'ecb)
;;(setq ecb-tip-of-the-day nil)
;;(require 'ecb-autoloads)
;;(ecb-activate)
;;(setq ecb-layout-name "left9")
;;(setq ecb-restore-window-sizes)

;; keyboard shortcuts
(global-set-key "\M-g" 'goto-line)

;; flymake
(require 'flymake)

(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
               'flymake-create-temp-inplace))
       (local-file (file-relative-name
            temp-file
            (file-name-directory buffer-file-name))))
      (list "pycheckers"  (list local-file))))
   (add-to-list 'flymake-allowed-file-name-masks
             '("\\.py\\'" flymake-pyflakes-init)))
;; lua-mode
(require 'lua-mode)

;; js-mode
(autoload 'js-mode "js" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode ))

;; get rid of Wrong type argument: characterp, return
;; http://lukeshu.ath.cx/1/wordpress/2011/08/fixing-wrong-type-argument-characterp-return-in-emacs/
(add-hook 'term-mode-hook
  #'(lambda () (setq autopair-dont-activate t)))

;; semantic
(require 'semantic-ia)

;; whitespace mode
(require 'whitespace)
(global-whitespace-mode 1)
(setq whitespace-line-column 120)

;; keep buffers in sync with disk
(global-auto-revert-mode 1)

;; idutils
(autoload 'gid "idutils" nil t)

;; melpa, package manager
(require 'package)
(when (< emacs-major-version 24)
    (add-to-list
        'package-archives
        '("gnu" . "http://elpa.gnu.org/packages/")))
;; Any add to list for package-archives (to add marmalade or melpa) goes here
(add-to-list 'package-archives
    '("melpa" .
      "http://melpa.milkbox.net/packages/"))
(package-initialize)
;;(add-to-list 'package-archives
;;    '("marmalade" .
;;      "http://marmalade-repo.org/packages/"))

;;magit
(require 'magit)
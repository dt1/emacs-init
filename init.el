;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-lein-command "/usr/local/bin/lein")
 '(custom-enabled-themes (quote (manoj-dark)))
 '(package-selected-packages
   (quote
    (company-rtags rtags nodejs-repl markdown-mode vue-mode multiple-cursors flycheck paredit cider clojure-mode avy yasnippet))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; add melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

;; make MacOS sane
(setq mac-option-modifier 'control)
(setq mac-command-modifier 'meta)

;; no blinking cursor
(blink-cursor-mode 0)

;; set scratch to nothing
(setq initial-scratch-message "")
(setq inhibit-startup-message t)

;; no flashing
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

;; no scroll bar
(scroll-bar-mode 0)

;; no top bars
(tool-bar-mode 0)
(menu-bar-mode 0)

;; line number
(setq line-number-mode t)
(global-linum-mode t)

;; column number
(setq column-number-mode t)

;; prevent mixing tabs and spaces
(setq-default indent-tabs-mode nil)

;; ido mode
(require 'ido)
(ido-mode t)

;; wind move (converts C-x to shift-arrows)
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; avy mode (download from melpa)
(global-set-key (kbd "C-x a") 'avy-goto-char-2)

;; highlight matching parens
(require 'paren)
(setq show-paren-style 'parenthesis)
(show-paren-mode t)

;; yasnippet mode
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)


;; multiple cursors mode
(require 'multiple-cursors)
(global-set-key (kbd "M-n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-M-n") 'mc/mark-all-like-this)


;; full screen
(add-hook 'window-setup-hook 'toggle-frame-maximized t)

;; delete whitespace on save:
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; language specific
;; clojure
;; paredit mode (download from melpa / marmalade)
(add-hook 'clojure-mode-hook #'paredit-mode)

;; python
;; load python3 interpretor by default
(setq python-shell-interpreter "/usr/local/bin/python3")

;; add html-mode to .tpl files
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . html-mode))

;; add html-mode to .ejs files
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . html-mode))

;; ;; javascript
;; ;; electric-pair-mode
;; (add-hook 'javascript-mode-hook #'electric-pair-mode)
;; (electric-pair-skip-whites

;; fix javascript in vue-mode
(add-hook 'vue-mode-hook (lambda () (setq syntax-ppss-table nil)))

;; node-js repl
(require 'nodejs-repl)


(add-hook 'js-mode-hook
          (lambda ()
            (define-key js-mode-map (kbd "C-c C-c") 'nodejs-repl-send-last-expression)
            (define-key js-mode-map (kbd "C-x C-e") 'nodejs-repl-send-buffer)))

;; fix cider:

;; c++
(require 'rtags)
(setq rtags-autostart-diagnostics t)
(rtags-diagnostics)

(defun company-rtags-setup ()
  "Configure company-backends for company-rtags."
  (delete 'company-semantic company-backends)
  (setq rtags-completions-enabled t)
  (push '(company-rtags :with company-yasnippet) company-backends))

(add-hook 'c++-mode-hook 'rtags-start-process-unless-running)
(add-hook 'c++-mode-hook 'company-rtags-setup)

;; fix python MacOS

(define-key python-mode-map [remap backward-sentence] nil)
(define-key python-mode-map [remap forward-sentence] nil)

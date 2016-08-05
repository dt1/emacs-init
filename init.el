;; add melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

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

;; ido mode
(require 'ido)
(ido-mode t)

;; wind move (converts C-x to shift-arrows)
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; avy mode (download from melpa)
(global-set-key (kbd "C-x a") 'avy-goto-char-2)

;; paredit mode (download from melpa / marmalade)
(add-hook 'clojure-mode-hook #'paredit-mode)

;; highlight matching parens
(require 'paren)
(setq show-paren-style 'parenthesis)
(show-paren-mode t)

;; yasnippet mode
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;; add manaj dark theme
(load-theme 'manoj-dark)

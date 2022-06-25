(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Load a custom theme
(load-theme 'wombat t)

;; Disable the menu bar
(menu-bar-mode -1)

;; Disable the tool bar
(tool-bar-mode -1)

;; Disable the scroll bars
(scroll-bar-mode -1)

;; Disable splash screen
(setq inhibit-startup-screen t)

;;; Completion framework
(unless (package-installed-p 'vertico)
  (package-install 'vertico))

;; Enable completion by narrowing
(vertico-mode t)

;; Enable line numbering in `prog-mode'
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; Automatically pair parentheses
(electric-pair-mode t)

;;; LSP Support
(unless (package-installed-p 'eglot)
  (package-install 'eglot))
  
;;; Treemacs navigate folders plugin
(unless (package-installed-p 'treemacs)
  (package-install 'treemacs))

;;; Evil mode (Vim emulation mode
(unless (package-installed-p 'evil)
  (package-install 'evil))
  
;;; RJSX Mode for editing React files (JSX Format w/ JS)
(unless (package-installed-p 'rjsx-mode)
  (package-install 'rjsx-mode))
  
;;; EMMS mode, media player for Emacs
(unless (package-installed-p 'emms)
  (package-install 'emms))

;;; Solarized theme
(unless (package-installed-p 'solarized-theme)
  (package-install 'solarized-theme))

;;; JS Prettier plugin
(unless (package-installed-p 'prettier-js)
  (package-install 'prettier-js))
  
;;; Plugin for dragging blocks around
(unless (package-installed-p 'drag-stuff)
  (package-install 'drag-stuff))

;; Enable LSP support by default in programming buffers
(add-hook 'prog-mode-hook #'eglot-ensure)

;;; Inline static analysis

;; Enabled inline static analysis
(add-hook 'prog-mode-hook #'flymake-mode)

;;; Pop-up auto-completion
(unless (package-installed-p 'company)
  (package-install 'company))

;; Enable Company by default in programming buffers
(add-hook 'prog-mode-hook #'company-mode)

;;; Git client
(unless (package-installed-p 'magit)
  (package-install 'magit))

;; Bind the `magit-status' command to a convenient key.
(global-set-key (kbd "C-c g") #'magit-status)

;;; Indication of local VCS changes
(unless (package-installed-p 'diff-hl)
  (package-install 'diff-hl))

;; Enable `diff-hl' support by default in programming buffers
(add-hook 'prog-mode-hook #'diff-hl-mode)

;;; Outline-based notes management and organizer

;;; Jump to arbitrary positions
(unless (package-installed-p 'avy)
  (package-install 'avy))
(global-set-key (kbd "C-c z") #'avy-goto-word-1)

;; Miscellaneous options
(setq-default major-mode
              (lambda () ; guess major mode from file name
                (unless buffer-file-name
                  (let ((buffer-file-name (buffer-name)))
                    (set-auto-mode)))))
(setq confirm-kill-emacs #'yes-or-no-p)
(setq window-resize-pixelwise t)
(setq frame-resize-pixelwise t)
(save-place-mode t)
(savehist-mode t)
(recentf-mode t)
(defalias 'yes-or-no #'y-or-n-p)

;; Store automatic customisation options elsewhere
(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

(custom-set-variables '(d2lOrange     "#F39019")
                      '(d2lOrange75   "#F5AB51")
                      '(d2lOrange50   "#FAC789")
                      '(d2lOrange25   "#FCE3C5")
                      '(d2lGrey       "#6C6F70")
                      '(d2lGreyMedium "#B6B1A9")
                      '(d2lGreyLight  "#E0DED8"))

;;; text face colors
(custom-set-faces
 '(highlight ((((class color)) (:foreground "#653000" :background "#9C9C9C"))))
 '(font-lock-comment-face ((((class color)) (:foreground "#55FF55"))))
 '(font-lock-comment-delimiter-face ((((class color)) (:foreground "#00DD00"))))
 '(font-lock-string-face ((((class color)) (:foreground "#FDF020"))))
 '(font-lock-keyword-face ((((class color)) (:foreground "grey"))))
 '(font-lock-type-face ((((class color)) (:foreground "grey"))))
 '(font-lock-variable-name-face ((((class color)) (:foreground "brown"))))
 '(font-lock-function-name-face ((((class color)) (:foreground "white"))))
 '(show-paren-match-face ((((class color))(:foreground "white"))))
 '(secondary-selection ((((class color))(:foreground "black"))))
 '(trailing-whitespace ((((class color)) (:background "grey"))))
 '(show-paren-mismatch-face ((((class color))(:foreground "red" :bold)))))

 '(font-lock-constant-face ((((class color)) (:foreground "Aqua Marine"))))
 '(modline ((((class color)) (:background "cyan"))))
 '(region ((((class color)) (:background "#505050"))))
 '(secondary-selection ((((class color)) (:foreground "black"))))


(setq default-frame-alist '((foreground-color . "#F79800")
			   (background-color . "#363636")
			   (mouse-color . "#555555")
			   (cursor-color . "white")
			   (background-mode . dark)
			   (menu-bar-lines . 1)
			   (tool-bar-lines . 0)
			   (width . 80)
			   (height . 43)))
(setq initial-frame-alist default-frame-alist)
(global-font-lock-mode 1)
(set-cursor-color "medium turquoise")
(setq cursor-type 'box)


;;;Aquamacs
(when (boundp 'aquamacs-version)
 (custom-set-variables
  '(aquamacs-customization-version-id 99.0 t)
  '(one-buffer-one-frame-mode nil nil (aquamacs-frame-setup))
  '(transient-mark-mode t))
 (create-fontset-from-fontset-spec
"-apple-monaco-medium-r-normal--9-*-*-*-*-*-fontset-monaco,
ascii:-apple-monaco-medium-r-normal--9-90-75-75-m-90-mac-roman,
latin-iso8859-1:-apple-monaco-medium-r-normal--9-90-75-75-m-90-mac-roman")
(define-key osx-key-mode-map (kbd "C-;") 'goto-line))

;;; Break lines in Tex
(add-hook 'tex-mode-hook '(lambda ()
                              ;; Break at column 79
                              (set-fill-column 79)
                              ;; Automatically wrap lines
                              (auto-fill-mode)
                              ;; Do on the fly spell checking
                              ;(flyspell-mode)
                              ))
(add-hook 'tex-mode-hook 'turn-on-auto-fill)

;;; File Manipulation
(setq require-final-newline t) ; require newline at end of file
(setq-default indent-tabs-mode nil) ; tabs become spaces
(setq next-line-add-newlines nil) ; donet let me add newlines at the EOF

;;; Backup Files in one spot
(setq backup-directory-alist nil)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/elisp/eback"))
	    backup-directory-alist))

;;; Keybindings
(global-set-key "\C-[;" 'goto-line)
;;; Osx keymap moved earlier
(global-set-key "\C-x\C-k" 'kill-buffer) ; I'm sloppy sometimes
≈

;;; Bind file types
(setq auto-mode-alist
      (cons '("\\.pde$" . java-mode) auto-mode-alist))


;;; Scrolling
(setq scroll-step 1)     ; Scroll by 1 line damnit!
(setq scroll-conservatively 1) ; i really mean it!
(setq scroll-up-aggressively .00000001)  ; why does it have to be so hard to scroll by one?
(setq scroll-down-aggressively .00000001) ;grrr


;;; whitespace
(setq-default show-trailing-whitespace t)
(setq-default default-indicate-empty-lines t)
(setq-default indent-tabs-mode nil)
;(set-variable default-indicate-empty-lines t)

;;;
;;; Common Tabbing Code
;;;
(setq c-basic-offset 2) ;;; Two space tabbing! campact it!

(setq dabbrev-case-replace nil)
(setq dabbrev-case-fold-search nil)
(defun c-tab-indent-or-complete ()
  (interactive)
  (if (and
       (equal (current-column)
              (tab-test))
       (not (is-char-before-whitespace))
       (is-char-after-whitespace))
      (dabbrev-completion)))

(defun tab-test ()
  (interactive)
  (c-indent-command)
  (current-column))

(defun is-char-before-whitespace ()
  (interactive)
  (if (or
       (equal "¡Àt" (char-to-string (char-before)))
       (equal " "  (char-to-string (char-before)))
       (equal "¡Àn" (char-to-string (char-before)))
       (equal "¡Àl" (char-to-string (char-before))))
      't
    nil))

(defun is-char-after-whitespace ()
  (interactive)
  (if (or
       (equal "¡Àt" (char-to-string (char-after)))
       (equal " "  (char-to-string (char-after)))
       (equal "¡Àn" (char-to-string (char-after)))
       (equal "¡Àl" (char-to-string (char-after))))
      't
    nil))


;;; Ctrl Tab for Tab
(global-set-key [C-tab] (lambda () (interactive) (insert-char 9 1)))

(global-set-key (kbd "C-;") 'goto-line)
(global-set-key (kbd "M-{") 'backward-paragraph)
(global-set-key (kbd "M-}") 'forward-paragraph)
(put 'downcase-region 'disabled nil)

;; ;; 成对出现的符号自动完成：'' "" () [] {}
;; (setq skeleton-pair t)
;; ;; (setq skeleton-pair-on-word t)
;; (global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
;; ;; (global-set-key (kbd "<") 'skeleton-pair-insert-maybe)    ;写程序中的小于符号太多，这个不适合设置
;; (global-set-key (kbd "'") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "\"") 'skeleton-pair-insert-maybe) ;需要对"进行转义

(require 'smartparens-config)

(global-linum-mode t)
;; 设置显示格式
(setq linum-format "  %d ")

;; 大小写转换功能
;; 使用C-x-l (lower)可能使当前选中区域的单词变成小写
(put 'upcase-region 'disabled nil)

;; 开启被禁用的功能，使用C-x-u (upper)可以把当前选中的区域变成大写
(put 'downcase-region 'disabled nil)

;; 显示与之匹配的符号(,[,{
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;;增大使用查找函数和变量的寻找范围
(setq apropos-do-all t)

;; 设置当光标处于最后一行时，再按C-n时将新建一行
;; (setq next-line-add-newlines t)


;; 整行移动
;; ALT-up  会把光标所在的整行文字上移一行
;; ALT-down会把光标所在的整行文字下移一行
(global-set-key [(meta p)] 'move-line-up)
(global-set-key [(meta n)] 'move-line-down)
(defun move-line (&optional n)
  "Move current line N (1) lines up/down leaving point in place."
  (interactive "p")
  (when (null n)
	(setq n 1))
  (let ((col (current-column)))
	(beginning-of-line)
	(next-line 1)
	(transpose-lines n);
	(previous-line 1)
	(move-to-column col)))

(defun move-line-up (n)
  "Moves current line N (1) lines up leaving point in place."
  (interactive "p")
  (move-line (if (null n) -1 (- n)))
  (previous-line 1)						;光标需要回到上一行(临时修复)
  )

(defun move-line-down (n)
  "Moves current line N (1) lines down leaving point in place."
  (interactive "p")
  (move-line (if (null n) 1 n)))

;; 功能是：按M-w键就可以复制光标所在的这一行
(global-set-key (kbd "M-w") 'huangq-save-line-dwim)
(defun huangq-save-one-line (&optional arg)
  "save one line. If ARG, save one line from first non-white."
  (interactive "P")
  (save-excursion
    (if arg
        (progn
          (back-to-indentation)
          (kill-ring-save (point) (line-end-position)))
      (kill-ring-save (line-beginning-position) (line-end-position)))))
(defun huangq-kill-ring-save (&optional n)
  "If region is active, copy region. Otherwise, copy line."
  (interactive "p")
  (if (and mark-active transient-mark-mode)
      (kill-ring-save (region-beginning) (region-end))
    (if (> n 0)
        (kill-ring-save (line-beginning-position) (line-end-position n))
      (kill-ring-save (line-beginning-position n) (line-end-position)))))
(defun huangq-save-line-dwim (&optional arg)
  "If region is active, copy region.
If ARG is nil, copy line from first non-white.
If ARG is numeric, copy ARG lines.
If ARG is non-numeric, copy line from beginning of the current line."
  (interactive "P")
  (if (and mark-active transient-mark-mode)
      ;; mark-active, save region
      (kill-ring-save (region-beginning) (region-end))
    (if arg
        (if (numberp arg)
            ;; numeric arg, save ARG lines
            (huangq-kill-ring-save arg)
          ;; other ARG, save current line
          (huangq-save-one-line))
      ;; no ARG, save current line from first non-white
      (huangq-save-one-line t))))

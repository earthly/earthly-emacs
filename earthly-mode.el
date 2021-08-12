;;; earthly-mode.el --- Major mode for editing Earthly Earthfile. -*- lexical-binding: t -*-

(defconst earthly-keywords
  '("FROM"
    "RUN"
    "COPY"
    "ARG"
    "SAVE ARTIFACT"
    "SAVE IMAGE"
    "BUILD"
    "VERSION"
    "GIT CLONE"
    "CMD"
    "LABEL"
    "EXPOSE"
    "ENV"
    "ENTRYPOINT"
    "VOLUME"
    "USER"
    "WORKDIR"
    "HEALTHCHECK NONE"
    "HEALTHCHECK CMD"
    "FROM DOCKERFILE"
    "WITH DOCKER"
    "END"
    "IF"
    "FOR"
    "LOCALLY"
    "COMMAND"
    "DO"
    "IMPORT"))

(defun earthly-build-font-lock-keywords ()
  (list
    `(,(rx line-start (*? space) (eval `(or ,@earthly-keywords)) (*? space))
      .
      font-lock-keyword-face)
    `(,(rx
	(sequence "$" (? "{")
		  (+ (in (?A . ?Z) (?a . ?z) (?0 . ?9) ?- ?_))
		  (? "}")))
      .
      font-lock-variable-name-face)))

(defvar earthly-syntax-table
  (let ((syntax-table (make-syntax-table)))
    (modify-syntax-entry ?\# "<" syntax-table)
    (modify-syntax-entry ?\n ">" syntax-table)
    (modify-syntax-entry ?\" "\"" syntax-table)
    (modify-syntax-entry ?\' "\"" syntax-table)
    syntax-table)
  "Syntax table for `earthly-mode'.")

(define-derived-mode earthly-mode prog-mode "Earthly"
  "A major mode for editing Earthly Earthfile."
  :syntax-table earthly-syntax-table
  (setq-local comment-start "#")
  (setq-local comment-end "")
  (setq-local font-lock-defaults '(earthly-build-font-lock-keywords)))

(add-to-list 'auto-mode-alist '("Earthfile\\'" . earthly-mode))

(provide 'earthly-mode)

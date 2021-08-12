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
    "WITH DOCKERFILE"
    "IF"
    ;; For loop
    "FOR"
    "IN"
    ;; END For loop
    "LOCALLY"
    "COMMAND"
    "DO"
    "IMPORT"
    ))

(defun earthly-build-font-lock-keywords ()
  (list
    `(,(rx (*? "\\s") (eval `(or ,@earthly-keywords)) (*? "\\s"))
      .
      font-lock-keyword-face)))

(defvar earthly-syntax-table
  (let ((syntax-table (make-syntax-table)))
    (modify-syntax-entry ?\# "<" syntax-table)
    (modify-syntax-entry ?\n ">" syntax-table)
    (modify-syntax-entry ?\" "\"" syntax-table)
    (modify-syntax-entry ?\' "\"" syntax-table)
    syntax-table)
  "Syntax table for `earthly-mode'.")

(define-derived-mode earthly-mode prog-mode "Earthly"
  "A major mode for Earthly Earthfile."
  :syntax-table earthly-syntax-table
  (setq-local comment-start "#")
  (setq-local comment-end "")
  (setq-local font-lock-defaults '(earthly-build-font-lock-keywords)))

(add-to-list 'auto-mode-alist '("Earthfile'" . earthly-mode))

(provide 'earthly-mode)

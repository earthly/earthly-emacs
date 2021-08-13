# earthly-mode

Major mode for editing Earthly Earthfile (https://docs.earthly.dev/docs/earthfile)

## Current features

* Syntax highlighting support.
* Toggle comment.

## Installation Notes

### use-package

If you're using `use-package`, you can do:

```elisp
(use-package
  :ensure t)
```

### Manual

Add this major mode to `load-path` using `add-to-list`:

```elisp
(add-to-list 'load-path "path/to/major/mode")
```

## Highlighting .earth file

Currently, this major mode will highlight only `Earthfile` file. If you want
to highligh `.earth` file extension (in https://github.com/earthly/earthly for example),
put this configuration to your `init.el` or `.emacs` file:

```elisp
(add-to-list 'auto-mode-alist '("\\.earth\\'" . earthly-mode))
```

Or if you use `use-package`, just add:

```elisp
(use-package earthly-mode
  :ensure t
  :mode (("\\.earth\\'" . earthly-mode)
         ("\\Earthfile\\'" . earthly-mode)))
```

## Screenshot

![Earthfile syntax](Screenshot.png)

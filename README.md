# earthly-mode

[![MELPA](https://melpa.org/packages/earthfile-mode-badge.svg)](https://melpa.org/#/earthfile-mode)

Major mode for editing Earthly Earthfile (https://docs.earthly.dev/docs/earthfile) developed
by [@wingyplus](https://github.com/wingyplus), [@TheCoreMan](https://github.com/TheCoreMan) and [@duck1123](https://github.com/duck1123)

## Current features

* Syntax highlighting support.
* Toggle comment.

## Installation Notes

### use-package

If you're using `use-package`, you can do:

```elisp
(use-package earthfile-mode
  :ensure t)
```

### Doom emacs
If you're using Doom emacs, you can add the following to `~/.doom.d/packages.el`:

``` elisp
(package! earthfile-mode)
```

Followed by the following shell command:

``` shell
~/.emacs.d/bin/doom sync
```

### Manually via MELPA

Just run this command in Emacs:

```
M-x package-install RET earthfile-mode RET
```

### Manual via local installation

Add `earthfile-mode` to `load-path` using `add-to-list`:

```elisp
(add-to-list 'load-path "path/to/earthfile-mode")
(require 'earthfile-mode)
```

## Screenshot

![Earthfile syntax](Screenshot.png)

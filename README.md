# dotfiles Configuration

Modeled after Thoughtbot's [dotfiles](https://github.com/thoughtbot/dotfiles),
this repository is my personal home directory configuration.

## Notice
This is a work in its infancy (pre-Alpha). It makes incorrect assumptions about
how rcm works (see KNOWN BUGS below). It probably also has other screw-ups.

## Install

Clone onto your laptop:

```
    git clone git://github.com/SeanSith/dotfiles.git
```

Install [rcm](https://github.com/thoughtbot/rcm):

```
    brew tap thoughtbot/formulae
    brew install rcm
```

Install the dotfiles:

```
    env RCRC=$HOME/.dotfiles/rcrc rcup
```

This command will create symlinks for config files in your home directory.
Setting the `RCRC` environment variable tells `rcup` to use standard
configuration options:

* Exclude the `README.md` and `LICENSE` files, which are part of
  the `dotfiles` repository but do not need to be symlinked in.
* Give precedence to personal overrides which by default are placed in
  `~/.dotfiles-local`

You can safely run `rcup` multiple times to update:

    rcup

## Known Bugs
- Initial installation broken
  - The default .rcrc file would not move out of the way for the system-specific
    one. Therefore we removed it from the repository. It needs to go back.
  - For now, source the system-specific .rcrc file to make it sort of work.
- rcm does not currently support tag- or system-specific hooks.
  - Currently these post-up hooks "work" because we let rcm put them in a ~/.hooks
    directory and we force-run them from the default post-up hook.
  - https://github.com/thoughtbot/rcm/issues/48 slated for rcm 1.3.0
- Need to find a way to get jets3t installed automatically.

## Thanks

Thanks go to [Thoughtbot](http://thoughtbot.com) for the inspiration and examples
in their own [dotfiles](https://github.com/thoughtbot/dotfiles) repository.

## License

dotfiles is copyright © 2015 Sean Smith. It is free software, and may be
redistributed under the terms specified in the [`LICENSE`] file.

[`LICENSE`]: /LICENSE

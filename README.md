My config files for linux command line applications.
Managed with [`dotbot`][dotbot].

### Basic `dotbot` usage

Move your dotfiles to the `dotfiles` directory, then edit `install.yaml.conf` to specify where each file should be symlinked to.
Finally, execute the install script: `./install`.

### Submodules

As explained in the [blog post][blog], you can pull in other repos as submodules to automate your dependency management.
For example, `dotbot` manages itself as a submodule here.
To update them to their latest published version, run `git submodule update --remote`.
(Note: this command could be added to the install script if desired, but I prefer to leave it as a manual update to avoid unexpected changes.)

[dotbot]: https://github.com/anishathalye/dotbot
[blog]: http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/

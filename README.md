# ~aitor has been here

## dotfiles

Your dotfiles are how you personalize your system. These are mine (based on @holman that is based in @ryanb). 


## install

- `git clone git://github.com/aitor/dotfiles ~/.dotfiles`
- `cd ~/.dotfiles`
- `rake install`

The install rake task will symlink the appropriate files in `.dotfiles` to your home directory. 
Everything is configured and tweaked within `~/.dotfiles`, though.

The main file you'll want to change right off the bat is `bash/bashrc.symlink`, which sets up a few paths 
that'll be different on your particular machine.

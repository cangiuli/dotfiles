#!/usr/bin/perl

use POSIX 'strftime';

my @files = qw(
  emacs
  ghci
  git
  gitconfig
  ssh
  vim
  vimrc
  xbindkeysrc
  zshrc);

my $command = shift;
my $dir = shift;
my $pushdir = 'dotfiles-' . (strftime "%y%m%d-%H%M", localtime);

sub sysprint {
  my $cmd = shift;
  print "$cmd\n";
  `$cmd`;
}

if ($command eq 'push') {
  $pushdir = $dir if $dir;
  sysprint "mkdir $pushdir";
  foreach my $file (@files) {
    sysprint "cp -r ~/.$file $pushdir";
    sysprint "cp -r $file ~/.$file";
  }
} elsif ($command eq 'pull') {
  foreach my $file (@files) {
    sysprint "cp -r ~/.$file $file";
  }
} else {
  print <<END
Usage: $0 <command>
Sync this dotfile repository with the contents of ~.

Commands:
  push [DIR]    copy dotfiles from repository into ~, backing up current
                  versions to DIR (defaulting to ./$pushdir)
  pull          copy dotfiles from ~ into repository
END
}

#!/usr/bin/perl

use POSIX 'strftime';

my @files = qw(
  emacs
  ghci
  gitconfig
  gitignore
  vimrc
  xbindkeysrc
  zshrc);
my @dirs = qw(
  ssh
  vim);

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
  foreach (@files) {
    sysprint "cp ~/.$_ $pushdir";
    sysprint "cp $_ ~/.$_";
  }
  foreach (@dirs) {
    sysprint "cp -r ~/.$_ $pushdir";
    sysprint "cp -r $_/* ~/.$_";
  }
} elsif ($command eq 'pull') {
  foreach (@files) {
    sysprint "cp ~/.$_ $_";
  }
  foreach (@dirs) {
    sysprint "rm -r $_";
    sysprint "cp -r ~/.$_ $_";
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

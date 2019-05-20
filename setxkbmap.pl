#!/usr/bin/env perl
use 5.26.1;
use utf8;
# use the environment instead os setting explicitly `binmode STDOUT|STDIN => ':encoding(UTF-8)'`;
use open IO => ':locale';
use warnings;
use IPC::Cmd qw[can_run run];
use Data::Dumper;
my $PROGRAM = 'setxkbmap';

say $PROGRAM;
say 'Ꙋникодѧ';
# 1. check if we can run setxkbmap
# 2. Query the current settings to have them as default
query_defaults();
# 3. Display choises for the user to take.
# 4. Set the chosen keyboard layout and switches
#say for sort keys %INC;
say 1;
exit 0;

sub query_defaults {
    my %OUT;
    @OUT{qw(ok err full_buf stdout_buff stderr_buff)} =  run(command => [$PROGRAM, '-query']);
    if($OUT{ok}){
        parse_defaults($OUT{stdout_buff});
        say join $/, @{$OUT{stderr_buff}} if $OUT{stderr_buff}->[0];
    }
    else {
        say $OUT{err} && exit;
    }
    #say Dumper \%OUT;
}

sub parse_defaults {
    my $defaults = shift;
}

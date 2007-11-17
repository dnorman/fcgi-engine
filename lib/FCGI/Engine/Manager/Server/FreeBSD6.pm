package FCGI::Engine::Manager::Server::FreeBSD6;
use Moose;

our $VERSION   = '0.01';
our $AUTHORITY = 'cpan:STEVAN';

extends 'FCGI::Engine::Manager::Server';

override 'construct_command_line' => sub {
    my @command_line = super();
    pop @command_line;
    return (
        "/usr/sbin/daemon",
        "sh", "-c",
        (join " " => @command_line)
    );
};

1;

__END__

=pod

=head1 NAME

FCGI::Engine::Manager::Server::FreeBSD6

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 BUGS

All complex software has bugs lurking in it, and this module is no
exception. If you find a bug please either email me, or add the bug
to cpan-RT.

=head1 AUTHOR

Stevan Little E<lt>stevan@iinteractive.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2006, 2007 by Infinity Interactive, Inc.

L<http://www.iinteractive.com>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut





package FCGI::Engine::Types;
use Moose::Util::TypeConstraints;

use Declare::Constraints::Simple '-All';
use MooseX::Getopt::OptionTypeMap;
use MooseX::Types::Path::Class;

## FCGI::Engine

subtype 'FCGI::Engine::ListenerPort'
    => as 'Int'
    => where { $_ >= 1 && $_ <= 65535 };

subtype 'FCGI::Engine::Listener' 
    => as 'Path::Class::File | FCGI::Engine::ListenerPort';

MooseX::Getopt::OptionTypeMap->add_option_type_to_map(
    'FCGI::Engine::Listener' => '=s',
);

## FCGI::Engine::Manager

subtype 'FCGI::Engine::Manager::Server::Config'
    => as 'HashRef'
    => And(
         IsHashRef,
         HasAllKeys(qw[scriptname pidfile socket]),
         OnHashKeys(
             additional_args => IsArrayRef
         )
    );

subtype 'FCGI::Engine::Manager::Config' 
    => as 'ArrayRef[FCGI::Engine::Manager::Server::Config]';

## FCGI::Engine::ProcManager

enum 'FCGI::Engine::ProcManager::Role' => qw[manager server];

1;

__END__

=pod

=head1 NAME

FCGI::Engine::Types - Type constraints for FCGI::Engine

=head1 DESCRIPTION

This is all the type constraints needed by the FCGI::Engine modules, 
no user serviceable parts inside (unless you are subclassing stuff).

=head1 BUGS

All complex software has bugs lurking in it, and this module is no
exception. If you find a bug please either email me, or add the bug
to cpan-RT.

=head1 AUTHOR

Stevan Little E<lt>stevan@iinteractive.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2007-2008 by Infinity Interactive, Inc.

L<http://www.iinteractive.com>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
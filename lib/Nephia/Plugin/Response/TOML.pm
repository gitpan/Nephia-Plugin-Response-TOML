package Nephia::Plugin::Response::TOML;

use 5.008005;
use strict;
use warnings FATAL => 'all';

our $VERSION = "0.01";

use TOML ();
use Exporter 'import';
our @EXPORT = qw/ toml_res /;

sub toml_res ($) {
    my $res = shift;
    my $body = TOML::to_toml($res);
    return [ 200,
        [ 'Content-type' => 'text/toml' ],
        [ $body ]
    ];
}

1;
__END__

=encoding utf-8

=head1 NAME

Nephia::Plugin::Response::TOML - A plugin for Nephia that give TOML responding feature

=head1 SYNOPSIS

    package MyApp;
    use Nephia;
    use Nephia::Plugin::Response::TOML;

    path '/' => sub {
        return toml_res(+{ foo => 'abc', bar => 123});
    };

=head1 EXPORT

=head2 toml_res( HASHREF )

Return PSGI-response that contains TOML formatted contents.

=head1 LICENSE

Copyright (C) papix.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

papix E<lt>mail@papix.netE<gt>

=cut


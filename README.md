# NAME

Nephia::Plugin::Response::TOML - A plugin for Nephia that give TOML responding feature

# SYNOPSIS

    package MyApp;
    use Nephia;
    use Nephia::Plugin::Response::TOML;

    path '/' => sub {
        return toml_res(+{ foo => 'abc', bar => 123});
    };

# EXPORT

## toml\_res( HASHREF )

Return PSGI-response that contains TOML formatted contents.

# LICENSE

Copyright (C) papix.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

papix <mail@papix.net>

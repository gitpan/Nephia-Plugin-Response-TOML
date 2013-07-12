use strict;
use Test::More;
use Plack::Test;
use HTTP::Request::Common;

{
    package Nephia::TestApp::TOML;
    use Nephia plugins => ['Response::TOML'];
    path '/' => sub {
        toml_res +{
            papix => {
                age  => 23,
                name => 'Takayuki Fukumoto',
            },
            moznion => {
                age => 22,
                name => 'Mozu Nion',
            }
        },
    };
};

subtest 'normal' => sub {
    my $app = Nephia::TestApp::TOML->app;
    test_psgi $app, sub {
        my $cb = shift;
        my $res = $cb->(GET '/');
        my $content = do {local $/; <DATA>};
        chomp $content;
        is $res->header('Content-Type'), 'text/x-toml; charset=UTF-8', 'content-type';
        is $res->content, $content, 'content';
    };

};

done_testing;
__DATA__
[moznion]
age = 22
name = "Mozu Nion"
[papix]
age = 23
name = "Takayuki Fukumoto"


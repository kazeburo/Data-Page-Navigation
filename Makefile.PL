use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Data::Page::Navigation',
    AUTHOR              => 'Masahiro Nagano <kazeburo@gmail.com>',
    VERSION_FROM        => 'lib/Data/Page/Navigation.pm',
    ABSTRACT_FROM       => 'lib/Data/Page/Navigation.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
      'Data::Page' => 2.0,
      'Test::More' => 0,
    },
    META_MERGE => {
        'meta-spec' => { version => 2 },
        resources => {
            repository => {
                type => 'git',
                url  => 'https://github.com/kazeburo/Data-Page-Navigation.git',
                web  => 'https://github.com/kazeburo/Data-Page-Navigation',
            },
        },
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Data-Page-Navigation-*' },
    test => {TESTS => 't/*.t'}
);




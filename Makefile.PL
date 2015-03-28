use inc::Module::Install;
use Module::Install::AuthorTests;
use Module::Install::Repository;
name 'Data-Page-Navigation';
all_from 'lib/Data/Page/Navigation.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
requires 'Data::Page', 2.0;
auto_set_repository;
auto_include;
WriteAll;

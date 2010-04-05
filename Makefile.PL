use inc::Module::Install;
name 'Data-Page-Navigation';
all_from 'lib/Data/Page/Navigation.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;

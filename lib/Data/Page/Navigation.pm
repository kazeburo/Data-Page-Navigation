package Data::Page::Navigation;
use strict;
use warnings;
use Data::Page;

use 5.006;

our $VERSION = '0.06';

package 
  Data::Page;

__PACKAGE__->mk_accessors(qw/pages_per_navigation/);

sub pages_in_navigation {
    my $self = shift;

    my $last_page = $self->last_page;
    my $pages_per_navigation = shift || $self->pages_per_navigation || 10;
    return wantarray ? ($self->first_page..$last_page) : [($self->first_page..$last_page)]
        if $pages_per_navigation >= $last_page;

    my $prev = $self->current_page - 1;
    my $next = $self->current_page + 1;
    my @ret = ($self->current_page);
    my $i=0;
    while(@ret < $pages_per_navigation){
        if($i%2){
            unshift(@ret,$prev) if $self->first_page <= $prev;
            --$prev;
        }else{
            push(@ret,$next) if $last_page >= $next;
            $next++;
        }
        $i++;
    }
    return wantarray ? @ret : \@ret;
}

sub first_navigation_page {
    my $self = shift;
    my @pages = $self->pages_in_navigation;
    shift @pages;
}

sub last_navigation_page {
    my $self = shift;
    my @pages = $self->pages_in_navigation;
    pop @pages;
}


1;
__END__

=head1 NAME

Data::Page::Navigation - modifies Data::Page to generate page navigation links

=head1 SYNOPSIS

    use Data::Page::Navigation;
    my $total_entries = 180;
    my $entries_per_page = 10;
    my $pages_per_navigation = 10;
    my $current_page = 1;

    my $pager = Data::Page->new(
        $total_entries,
        $entries_per_page,
        $current_page
    );
    $pager->pages_per_navigation($pages_per_navigation);
    @list = $pager->pages_in_navigation($pages_per_navigation);
    #@list = qw/1 2 3 4 5 6 7 8 9 10/;

    $pager->current_page(9);
    @list = $pager->pages_in_navigation($pages_per_navigation);
    #@list = qw/5 6 7 8 9 10 11 12 13 14/;

=head1 DESCRIPTION

Using this module instead of, or in addition to L<Data::Page>, adds a few methods to Data::Page.

The page navigation bar usually consists of several links that point
to the pages "around" the current page. For example, if you have 18
pages and currently displayed page is 7th, you will usually want to
display something like:

    1 .. 5 6 _7_ 8 9 .. 18

The maths to calculate the page numbers contains a lot of corner cases
and is prone to implementation errors. Fortunately, most of it is
encapsulated in Data::Page.

This module allows you to generate the list of specified length
consisting of page numbers around the current page so that the current
page is as close to the center of it as possible.

=head1 METHODS

=head2 pages_per_navigation

This method sets or gets the total count of page numbers displayed in
the navigation. Default is 10.

=head2 pages_in_navigation([pages_per_navigation])

This method returns the array (or array-ref in scalar context) of
L</pages_per_navigation> elements. Each element is a page number close
to the current page number.

=head2 first_navigation_page

Returns the first page in the list returned by pages_in_navigation().

=head2 last_navigation_page

Returns the last page in the list returned by pages_in_navigation().

=head1 SEE ALSO

L<Data::Page>

=head1 AUTHOR

Masahiro Nagano E<lt>kazeburo {at} gmail.comE<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

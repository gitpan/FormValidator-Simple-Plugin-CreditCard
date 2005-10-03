use strict;
use Test::More tests => 2;

use FormValidator::Simple qw/CreditCard/;
use CGI;

my $q = CGI->new;
$q->param( number => '5276 4400 6542 1319' );

my $result = FormValidator::Simple->check( $q => [
    number => [ 'CREDIT_CARD' ],
] );

ok(!$result->invalid('number'));

my $result2 = FormValidator::Simple->check( $q => [  
    number => [ ['CREDIT_CARD', 'VISA', 'MASTER'] ],
] );

ok(!$result2->invalid('number'));

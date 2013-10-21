#!/usr/bin/perl
#use strict;
#use warnings;
use lib qw(/location/of/MAILER);

use timperlmail;;

open(IN,"body_of_email.txt");
@text=<IN>;

open(LIST1,"list_of_recipients.txt");
@list1=<LIST1>;
$num=@list1;

for($i=0; $i<$num; $i++){

chomp($list1[$i]);
timperlmail::send_mail($list1[$i], 'Subject of Email Goes Here', "@text");
sleep 3;


}

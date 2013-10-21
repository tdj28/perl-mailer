package timperlmail;
use Net::SMTP::SSL;
use Authen::SASL;
sub send_mail {
my $to = $_[0];
my $subject = $_[1];
my $body = $_[2];
 
my $from = 'sending_email@wherever.com';
my $password = 'Put actual password here';
 
my $smtp;
 
if (not $smtp = Net::SMTP::SSL->new('smtp.server.address',
                            Port => 465,
                            Debug => 1)) {
   die "Could not connect to server\n";
}
 
$smtp->auth($from, $password)
   || die "Authentication failed!\n";
 
$smtp->mail($from . "\n");
my @recepients = split(/,/, $to);
foreach my $recp (@recepients) {
    $smtp->to($recp . "\n");
}

open(IN1,"coas.jpeg");
@in1=<IN1>;
$attachFile="coas.jpeg";

$smtp->data();
$smtp->datasend("Content-Type: text/html; charset=UTF-8\n");
$smtp->datasend("From: " . $from . "\n");
$smtp->datasend("To: " . $to . "\n");
$smtp->datasend("Subject: " . $subject . "\n");
$smtp->datasend("\n");
$smtp->datasend($body . "\n");
$smtp->datasend("Content-Type: image/jpeg; name=coas.jpeg\n");
$smtp->datasend("Content-Disposition: attachment; filename=coas.jpeg\n");
$smtp->datasend("n");
$smtp->datasend("@in1"."\n");
$smtp->dataend();
$smtp->quit;
}
1;

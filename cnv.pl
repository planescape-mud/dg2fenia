#!/usr/bin/perl

use DGParser;

my $comment = "";
my $nr = 0;
my $name = "";
my $type = 0;
my $flags = "";
my $argNum = 0;
my $argStr = "";
my $body = "";

while (<>) {
    last if /^\$$/;
    next if s/^(\*.*)$/$comment.=$1/e;

    s/^#(\d+)$/$nr=$1/e;
    
    $name = &fread_string;
    $_ = <>;
    s/^(\d+)\s+([^ ]+)\s+(\d+)$/$type=$1, $flags=$2, $argNum=$3/e;
    $argStr = &fread_string;
    $body = &fread_string;
    
    print "script #$nr ($name)\n";
    print "type=$type, flags=$flags, args [$argNum] [$argStr]\n";
#    print "[$body]\n";
    DGParser::parse_body(\$body);
    print "------------------------------------------------------\n";

    $comment = "";
}

sub fread_string {
    local $/;
    $/ = "~\n";
    $_ = <>;
    chomp;
    s/~~/~/g;
    $_;
}

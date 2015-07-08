#!/usr/bin/perl
use strict;
use warnings;



for ("a" .. "z") {

  my $first = $_;
  my $second;
  
  for ("a" .. "z") {
  
  $second = $_;
  
  my $file = $first.$second;
  
  open OUT, ">$file.txt" or die "Couldn't open file: $!\n";
  print OUT uc($file),"\n";
  
  }

}

my $dir = ".";
opendir my $dh, $dir or die "Couldn't open $dir: $!\n";

while (my $file_name = readdir $dh)
{

  if ($file_name =~ /q/){
  
  open FILE, "$file_name" or die "Couldn't open file: $!\n";
  
  while(<FILE>) {
  
  chomp $_;
  print $_,"\n";
  
  }
  
  unlink $file_name;  
  
  }
}

my $count = 0;
opendir $dh, $dir or die "Couldn't open $dir: $!\n";
while (my $file_name = readdir $dh) 
{

  if ($file_name =~ /\A(?:[a-z]|[A-Z])(?:[a-z]|[A-Z])\./) {

    $count++;
    
  }

}

print $count,"\n";

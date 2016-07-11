#!/usr/bin/perl
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.

use strict;
use warnings;

# file name shouldn't contain whitespace characters

if (-e "/home/alex/latin_converted.txt") {
	die "ERROR: This operation will write to '>/home/alex/latin_converted.txt'.\nMake sure this doesn't contain important data before you continue.\n\n";
}

my $datei = $ARGV[0];
#chomp($datei);

open(EINGABE, $datei) or die "Input file $datei could not be opened.\n";
my $text;
my $i=0; # for line numbering

# USER: change AUSGABE's file to the file you like, e. g. ">/home/myuser/latinstuff.txt"
open(AUSGABE, ">/home/alex/latin_converted.txt") or die "output file could not be opened.\n";

while (my $line = <EINGABE>) {
	$text .= $line;
	$i++;
	# remove spaces
	$line =~ s/\ {2,}/\t/g;
	$line =~ s/^\ //g;
	$line =~ s/\ $//g;
	# change " que" to "que"
	$line =~ s/\ que\ /que\ /g;
	$line =~ s/\ que\n/que\n/g;
	$line =~ s/\ que\t/que\t/g;
	$line =~ s/\ que\,/que\,/g;
	$line =~ s/\ que\./que\./g;
	$line =~ s/\ que\;/que\;/g;
	$line =~ s/\ que\:/que\:/g;

	# change " v/ue" to "ve"
	$line =~ s/\ [uv]e\ /ve\ /g;
	$line =~ s/\ [uv]e\n/ve\n/g;
	$line =~ s/\ [uv]e\,/ve\,/g;
	$line =~ s/\ [uv]e\./ve\./g;
	$line =~ s/\ [uv]e\;/ve\;/g;
	$line =~ s/\ [uv]e\:/ve\:/g;

	# remove empty lines
	$line =~ s/^\n$//g;
	$line =~ s/^\s+$//g;

	#~ print STDOUT "$i $line";
	print AUSGABE "$line";
}

close(EINGABE);
close(AUSGABE);

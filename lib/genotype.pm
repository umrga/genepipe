package Genotype;

use strict;


use Genotype::Individual;

our $VERSION = '0.01';

#######################################################################################
#--------------------------------------------------------------------------------------
# public methods
#--------------------------------------------------------------------------------------
#######################################################################################


#-------------------------------------------------------------------------------
# new
#-------------------------------------------------------------------------------
# the constructor only creates the object in memory. No parameters are needed
#
# _ind : hash of the genotyped individuals
# _snpNameArray : array storing only the name of the SNP
# _snpNameHash : this hash table give the correspondance between the name of the snp and indice

sub new {
	my $class = shift;
	$class = ref($class) || $class;
	
	my %Options = @_;
	my $self = {};

	$self->{_ind} = {};
	$self->{_snpNameArray} = [];
	$self->{_snpNameHash} = {};
	
	$self->{_nbSNP} = 0;
	$self->{_nbInd} = 0;
	bless $self,$class;
	return $self;
}


#-------------------------------------------------------------------------------
# readDataFromFile
#-------------------------------------------------------------------------------

# read genotype from file.
# There's a two step reading procedure :
#	- the 1st, get the number of snp and fill the SNP array and hash
#	- the 2nd, read the genotype and fill the hash _ind
#
# During the 1st step, the genotype string in the IND object are initialised with 0,
# depending on the number of SNP from  the 1st read

sub readDataFromFile {
	my ($self,$file) = @_;
	open (GENO, "$file") or die "cannot open $file\n";
	
	print "reading genotype file to complete SNP list\n";
	my %ListSNP = ();
	my %ListIND = ();
	
	while (my $line = <GENO>) {
		$line =~ s/\s+$//;
		next if ($line =~ /^#/);
		
		# Here, we assume that field sep is ","
		# TO BE generalized in future development
		my @T = split (',', $line);
		my @ID = split ('_', $T[0]);
		
		# note : here we deal with the LABOGENA id nomenclature, which is WGXXXXX-DNA_wellID_genoID
		# so, we extract only the genoID at the second index position, splitting with '_'
		# This part should be recoded more 'universal' (and add a bunch of script to clean data at the beginning
		# including deleting the huge HEADER found in this file)
		my $id_geno = $ID[2];
		my $id_snp = $T[1];
		my $a1 = $T[2];
		my $a2 = $T[3];
		
		$ListIND{$id_geno} = defined;
		$ListSNP{$id_snp} = defined;
	}
	
	# record number of SNP and Individual
	my $nbSNP = keys %ListSNP;
	my $nbIND = keys %ListIND;
	$self->{_nbSNP} = $nbSNP;
	$self->{_nbInd} = $nbSNP;
	
	# insert SNP id inside object ARRAY
	foreach my $snp (keys %ListSNP) {
		push ( @{$self->{_snpNameArray}} , $snp);
	}
	
	# Generate correspondance table between SNP array indice and SNP name
	for (my $i=0; $i<=$#{$self->{_snpNameArray}}; $i++) {
		$self->{_snpNameHash}->{$self->{_snpNameArray}->[$i]} = $i;
	}
	#$self->{_ind}->{$id_geno} = defined;
	close (GENO);
	
	
	
	#$self->{_tracks}->{$indice} = $track;
	return 1;
}


sub get_nbSNP {
	my ($self) = @_;
	return $self->{_nbSNP};
}

sub get_nnIndd {
	my ($self) = @_;
	return $self->{_nbInd};
}




__END__

=head1 NAME

Genotype::ManageSNP - manage large SNP genotypes

=head1 SYNOPSIS

TODO

=head1 DESCRIPTION 

TODO

=head1 METHODS 

This section describes the class and object methods for the Genotype::ManageSNP module. 

=head2 ManageSNP object 

TODO


=head2 Track object 

TODO

=head1 AUTHOR 

Frédéric Lecerf L<http://chicken.genouest.org>

=head1 COPYRIGHT 

Copyright (C) 2010, Frédéric Lecerf.

=head1 LICENSE 

This module is free software; you can redistribute it or modify it under the same terms as Perl itself.
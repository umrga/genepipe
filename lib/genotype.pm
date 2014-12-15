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
	return 1;
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
package Genotype::Individual;

use strict;



our $VERSION = '0.01';

#-------------------------------------------------------------------------------
# public methods
#-------------------------------------------------------------------------------

sub new {
	my $class = shift;
	$class = ref($class) || $class;
	
	my %Options = @_;
	my $self = {};


	$self->{_father} = undef;
	$self->{_mother} = undef;
	$self->{_sex} = undef;
	$self->{_genotype} = undef;
	bless $self,$class;
	return $self;
}









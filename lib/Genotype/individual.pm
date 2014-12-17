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
	$self->{_corresp}=undef;
	bless $self,$class;
	return $self;
}


sub readDataFromFile {
my ($self,$file1,$file2) = @_;
open (PED, "$file1") or die "cannot open $file1\n";
print "reading pedigree file to complete individual caracteristic\n";
while (my $line = <PED>) {
	     $line =~ s/\s+$//;
	     next if ($line =~ /^#/);
	     my @T = split (';', $line);
	     my $ani  = $T[0];
	     my $pere = $T[1];
	     my $mere = $T[2];
		 $self->{_father}=$pere;
		 $self->{_mather}=$mere;
		 $self->{_genotype}=$ani;
}
close (PED);
open (CORRESP, "$file2") or die "cannot open $file2\n";
print "reading CORRESP file to complete individual caracteristic";
while (my $line = <CORRESP>) {
	     $line =~ s/\s+$//;
	     next if ($line =~ /^#/);
	     my @T = split (';', $line);
	     my $id_ped  = $T[0];
	     my $id_geno = $T[1];
	     my $sex = $T[2];
		 $self->{_sex}=$sex;
		 $self->{_corresp}=$id_geno;
		 
}
close (CORRESP);

return 1;
}

sub get_individual_sex {
my ($self) = @_;
return $self->{_sex};
}
sub get_individual_father {
my ($self) = @_;
return $self->{_father};
}
sub get_individual_mather {
my ($self) = @_;
return $self->{_mather};
}
sub get_individual_genotype{
my ($self) = @_;
return $self->{_genotype};
}
sub get_individual_corresp{
my ($self) = @_;
return $self->{_corresp};
}







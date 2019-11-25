################################
# Program to take in a genome
# Then spit out its reverse complement
# Author: Austin Campbell 2019-11
################################

# Name of file with dna base pairs
$filename = 'data.dat';

# Opens the file read only
open(FILE, '<', $filename) or die $!;

# Index for storing into array
$index = 0 ;

# While reading from file
# Save dna to one array
# and numbers to another
while(<FILE>) {
  #********GETS THE DNA LETTERS********
  # Temp saves the dna base pairs
  # in reverse order
  $temp = reverse($_);
  # Removes \n from line
  $temp =~ s/\R//g;
  # Replaces with their reverse
  $temp =~ tr/atgc/tacg/;
  # Stores them into the dna array
  @dna[$index] = $temp;
  # Removes numbers
  @dna[$index] =~ s/\d//g;

  #********GETS THE LINE NUMBERS********
  # temp saves the line
  $temp = $_;
  # Removes the characters
  $temp =~ s/\D//g;
  # Saves them to the num array
  @num[$index] = $temp;

  # Increases index
  $index++;
}

# Reverses the array
@dna = reverse(@dna);

# Loops through each array and
# combines the numbers with the
# dna reverse compliments
# and prints to screen
for(my $i = 0; $i < $index; $i++) {
  @revCom[$i] = @num[$i]." ".@dna[$i];
  print "@revCom[$i]\n";
}

# Closes the file
close(FILE);

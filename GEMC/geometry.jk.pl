use strict;
use warnings;

our %configuration;


###########################################################################################
###########################################################################################
#
# all dimensions are in mm
#

#################################################################################################
sub make_main_volume
    {
     my %detector = init_det();
        #$detector{"name"}        = "bdx_real_main_volume";
        #$detector{"mother"}      = "root";
        #$detector{"description"} = "World";
        #$detector{"color"}       = "666666";
        #$detector{"color"}       = "f00000";
        #$detector{"style"}       = 0;
        #$detector{"visible"}     = 1;
        #$detector{"type"}        = "Box";
        #$detector{"pos"}         = "0*cm 0*cm 0*cm";
        #$detector{"rotation"}    = "0*deg 0*deg 0*deg";
            #my $wallthk=0.01; # now it's 15cm or 470cm
            
        #my $par1 = 600.+$wallthk;
        #my $par2 = 400.+$wallthk;
        #my $par3 = 600.+$wallthk;
        #$detector{"dimensions"}  = "$par1*cm $par2*cm $par3*cm";
        #$detector{"material"}    = "G4_Galactic";
        #$detector{"material"}    = "G4_CONCRETE";
        # $detector{"material"}    = "G4_AIR";
        #print_det(\%configuration, \%detector);
 

        #my $p1= $par1-$wallthk  ;
        #my $p2 =$par2-$wallthk ;
        #my $p3 =$par3-$wallthk ;
        $detector{"name"}        = "bdx_main_volume";
#        $detector{"mother"}      = "bdx_real_main_volume";
#        $detector{"description"} = "concrete walls";
        $detector{"mother"}      = "root";
        $detector{"description"} = "World";
        $detector{"color"}       = "f00000";
        $detector{"style"}       = 0;
        $detector{"visible"}     = 1;
        $detector{"type"}        = "Box";
        $detector{"pos"}         = "0*cm 0*cm 0*cm";
        $detector{"rotation"}    = "0*deg 0*deg 0*deg";
        $detector{"dimensions"}  = "600*cm 600*cm 600*cm";
        $detector{"material"}    = "G4_Galactic";
        print_det(\%configuration, \%detector);
}


##########################################
# DETECTOR
##########################################

sub make_DETECTOR
{
    my %detector = init_det();
    #if ($configuration{"variation"} eq "CT")
    #{$detector{"mother"}      = "bdx_main_volume";}
    #else
    #{$detector{"mother"}      = "Det_house_inner";}
    
    $detector{"name"}        = "Aluminum tube";
    $detector{"description"} = "Aluminum tube located at the center";
    $detector{"mother"}      = "Vacuum tube";
    $detector{"color"}       = "efbbfa";
    $detector{"style"}       = 1;
    $detector{"visible"}     = 1;
    $detector{"type"}        = "Tube";
    $detector{"pos"}         = "0*cm 0*cm 0*cm";
    $detector{"rotation"}    = "0*deg 0*deg 0*deg";
    $detector{"dimensions"}  = "0*cm 50*cm 200*cm 0*deg 360*deg";
    $detector{"material"}    = "G4_Al";
    $detector{"sensitivity"} = "no";
    $detector{"hit_type"}    = "no";
  #  $detector{"identifiers"} = "sector manual 0 veto manual 1100 channel manual 1";
     print_det(\%configuration, \%detector);

    $detector{"name"}        = "Vacuum tube";
    $detector{"description"} = "Vacuum tube along the aluminum tube";
    $detector{"mother"}      = "bdx_main_volume";
    $detector{"color"}       = "ff8000";
    $detector{"style"}       = 0;
    $detector{"visible"}     = 1;
    $detector{"type"}        = "Tube";
    $detector{"pos"}         = "0*cm 0*cm 0*cm";
    $detector{"rotation"}    = "0*deg 0*deg 0*deg";
    $detector{"dimensions"}  = "0*cm 60*cm 205*cm 0*deg 360*deg";
    $detector{"material"}    = "G4_Galactic";
    $detector{"sensitivity"} = "flux";
    $detector{"hit_type"}    = "flux";
    $detector{"identifiers"} = "sector manual 0 veto manual 1100 channel manual 1";
     print_det(\%configuration, \%detector);
}


################################


sub make_bdx_CT
{
    make_main_volume();
    make_DETECTOR;
}








1;


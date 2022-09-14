use strict;
use warnings;

our %configuration;


###########################################################################################
############################################################################################
##
# all dimensions are in mm
#
#
#
my $degrad = 0.01745329252;
my $cic    = 2.54;


#################################################################################################
sub make_main_volume
    {
         my %detector = init_det();
         $detector{"name"}        = "bdx_real_main_volume";
         $detector{"mother"}      = "root";
         $detector{"description"} = "World";  
         $detector{"color"}       = "666666";
         $detector{"color"}       = "f00000";
         $detector{"style"}       = 0;
         $detector{"visible"}     = 1;
         $detector{"type"}        = "Box";
                            my $X = 0.;
                            my $Y = 0.;
                            my $Z = 0.;
         $detector{"pos"}         = "$X*cm $Y*cm $Z*cm";
         $detector{"rotation"}    = "0*deg 0*deg 0*deg";
                       my $wallthk=0.01; # now it's 15cm or 470cm
                       my $par1 = 600.+$wallthk;
                       my $par2 = 600.+$wallthk;
                       my $par3 = 600.+$wallthk;
         $detector{"dimensions"}  = "$par1*cm $par2*cm $par3*cm";
         $detector{"material"}    = "G4_CONCRETE";
       # $detector{"material"}    = "G4_AIR";
          print_det(\%configuration, \%detector);


            my $p1= $par1-$wallthk  ;
            my $p2 =$par2-$wallthk ;
            my $p3 =$par3-$wallthk ;
                                                                                                                                                                                                                     $detector{"name"}        = "bdx_main_volume";               
   $detector{"mother"}      = "bdx_real_main_volume";
                                                                                                                                                                                                                     $detector{"description"} = "concrete walls";
                                                                                                                                                                                                                     $detector{"color"}       = "f00000";
                                                                                                                                                                                                                     $detector{"style"}       = 0;
                                                                                                                                                                                                                     $detector{"visible"}     = 1;
                                                                                                                                                                                                                     $detector{"type"}        = "Box";
                                                                                                                                                                                                                     $detector{"pos"}         = "$X*cm $Y*cm $Z*cm";
                                                                                                                                                                                                                     $detector{"rotation"}    = "0*deg 0*deg 0*deg";
                                                                                                                                                                                                                     $detector{"dimensions"}  = "$p1*cm $p2*cm $p3*cm";
                                                                                                                                                                                                                     $detector{"material"}    = "G4_Galactic";
                                                                                                                                                                                                                                       print_det(\%configuration, \%detector);                                                                                                                                                                                                                                                                           }

                                                                                                                                                                                                                   ##########################################
                                                                                                                                                                                                                   # EEE ASTRO
                                                                                                                                                                                                                   ##########################################
                                                                                                                                                                                                                   # EEE ASTRO
                                                                                                                                                                                                                   # starting from 0,0,0 define the different shifts
                                                                                                                                                                                                                            my $shX=0.;
                                                                                                                                                                                                                            my $shY=0.;
                                                                                                                                                                                                                            my $shZ=0.;

                                                                                                                                                                                                                            my $shifty=25./2.; # vertical plane semi-distance
                                                                                                                                                                                                                            my $shiftLong=1.; # distance between long bars
                                                                                                                                                                                                                            my $shiftShort=42.5/2; # distance between long bars
                                                                                                                                                                                                                           sub make_EEE_ASTRO
                                                                                                                                                                                                                                                                                                             {
                                                                                                                                                                                                                                                                                                                 my %detector = init_det();
                                                                                                                                                                                                                                                                                                                 if ($configuration{"variation"} eq "CT")
                                                                                                                                                                                                                                                                                                                    {$detector{"mother"}      = "bdx_main_volume";}
                                                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                                                  {$detector{"mother"}      = "Det_house_inner";}

                                                                                                                                                                                                                                                                                                                   $detector{"name"}        = "Detector1";
                                                                                                                                                                                                                                                                                                                   $detector{"description"} = "vacuum-Detector";
                                                                                                                                                                                                                                                                                                                   $detector{"color"}       = "ff80002";
                                                                                                                                                                                                                                                                                                                   $detector{"style"}       = 1;
                                                                                                                                                                                                                                                                                                                   $detector{"visible"}     = 1;
                                                                                                                                                                                                                                                                                                                   $detector{"type"}        = "Tube";
                                                                                                                                                                                                                                                                                                                   $detector{"pos"}         = "0*cm 0*cm 0*cm";
                                                                                                                                                                                                                                                                                                                   $detector{"rotation"}    = "0*deg 90*deg 0*deg";
                                                                                                                                                                                                                                                                                                                   $detector{"dimensions"}  = "0*cm 60*cm 205*cm 0.*deg 360.*deg";
                                                                                                                                                                                                                                                                                                                   $detector{"material"}    = "G4_Galactic";
                                                                                                                                                                                                                                                                                                                   $detector{"sensitivity"} = "flux";
                                                                                                                                                                                                                                                                                                                   $detector{"hit_type"}    = "flux";
                                                                                                                                                                                                                                                                                                                   $detector{"identifiers"} = "sector manual 0 veto manual 1100 channel manual 1";
                                                                                                                                                                                                                                                                                                     print_det(\%configuration, \%detector);
                                                                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                                                                          sub make_EEE_MRPC
                                                                                                                                                                                                                                                                                                                                                                                             {
                                                                                                                                                                                                                                                                                                           my %detector = init_det();

                                                                                                                                                                                                                                                                                                             $detector{"name"}        = "BeamDump";
                                                                                                                                                                                                                                                                                                              $detector{"mother"}      = "Detector1";
                                                                                                                                                                                                                                                                                                              $detector{"description"} = "Al-BeamDump";
                                                                                                                                                                                                                                                                                                              $detector{"color"}       = "f00000";
                                                                                                                                                                                                                                                                                                              $detector{"style"}       = 1;
                                                                                                                                                                                                                                                                                                              $detector{"visible"}     = 1;
                                                                                                                                                                                                                                                                                                              $detector{"type"}        = "Tube";
                                                                                                                                                                                                                                                                                                              $detector{"pos"}         = "0*cm 0*cm 0*cm";
                                                                                                                                                                                                                                                                                                              $detector{"rotation"}    = "0*deg 0*deg 0*deg";
                                                                                                                                                                                                                                                                                                              $detector{"dimensions"}  = "0*cm 50*cm 200*cm 0.*deg 360.*deg";
                                                                                                                                                                                                                                                                                                              $detector{"material"}    = "G4_Al";
                                                                                                                                                                                                                                                                                                             # $detector{"sensitivity"} = "no";
                                                                                                                                                                                                                                                                                                             # $detector{"hit_type"}    = "no";
                                                                                                                                                                                                                                                                                                             # $detector{"identifiers"} = "no";
                                                                                                                                                                                                                                                                                                  print_det(\%configuration, \%detector);


                                                                                                                                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          # END EEE chambers
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ################################


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          sub make_bdx_CT
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              make_main_volume();
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  make_EEE_ASTRO;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      #make_EEE_MRPC_flux;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          make_EEE_MRPC;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             # make_Al_cylinder;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             }








                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             1;



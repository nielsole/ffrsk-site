#!/usr/bin/perl
    use Net::DNS;
    my $res   = Net::DNS::Resolver->new;
    my $gw01 = $res->search("fgw01.freifunk-rhein-sieg.net", "A");
    my $gw02 = $res->search("fgw02.freifunk-rhein-sieg.net", "A");
    my $gw03 = $res->search("fgw03.freifunk-rhein-sieg.net", "A");
    my $gw04 = $res->search("fgw04.freifunk-rhein-sieg.net", "A");
    my $rsk1 = $res->search("fgw01.freifunk-siegburg.de", "A");
    my $rsk2 = $res->search("fgw02.freifunk-siegburg.de", "A");
    my $rsk3 = $res->search("fgw03.freifunk-siegburg.de", "A");
    my $rsk4 = $res->search("fgw04.freifunk-siegburg.de", "A");

   # process gw01 check and report
    if ($gw01) {
        foreach my $rr ($gw01->answer) {
            if ($rr->can("address")) {
                $checkgw01= $rr->can("address");
                print $rr->address, "\n";

                foreach my $tt ($rsk1->answer) {
                  if ($tt->can("address")) {
                     $checkrsk01=$tt->can("address");
                      print $tt->address, "\n";
                      if ($checkgw01 == $checkrsk01){
                        print "entries match\n";
                      }
                  }
                }
            }
        }
    } else {
        warn "query failed: ", $res->errorstring, "\n";
    }
   # process gw02 check and report
    if ($gw02) {
     foreach my $rr ($gw02->answer) {
            if ($rr->can("address")) {
                $checkgw02= $rr->can("address");
                print $rr->address, "\n";

                foreach my $tt ($rsk2->answer) {
                  if ($tt->can("address")) {
                     $checkrsk02=$tt->can("address");
                      print $tt->address, "\n";
                      if ($checkgw02 == $checkrsk02){
                        print "entries match\n";
                      }
                  }
                }
            }
        }


    } else {
        warn "query failed: ", $res->errorstring, "\n";
    }
    # process gw03 check and report
    if ($gw03) {
     foreach my $rr ($gw03->answer) {
            if ($rr->can("address")) {
                $checkgw03= $rr->can("address");
                print $rr->address, "\n";

                foreach my $tt ($rsk3->answer) {
                  if ($tt->can("address")) {
                     $checkrsk03=$tt->can("address");
                      print $tt->address, "\n";
                      if ($checkgw03 == $checkrsk03){
                        print "entries match\n";
                      }
                  }
                }
            }
        }

    } else {
        warn "query failed: ", $res->errorstring, "\n";
    }
    # process gw04 check and report
    if ($gw04) {
        foreach my $rr ($gw04->answer) {
            if ($rr->can("address")) {
                $checkgw04= $rr->can("address");
                print $rr->address, "\n";

                foreach my $tt ($rsk4->answer) {
                  if ($tt->can("address")) {
                     $checkrsk04=$tt->can("address");
                      print $tt->address, "\n";
                      if ($checkgw04 == $checkrsk04){
                        print "entries match\n";
                      }
                  }
                }
            }
        }


    } else {
        warn "query failed: ", $res->errorstring, "\n";
    }

    for my $lib (@special_libs) {
        
        if ($opts->{"no_$lib"} || $opts->{"no_bundled_$lib"} || $opts->{no_bundled_libs}) {
            print "Not using bundled $lib\n";
            next;
        }
        
        $opts->{$lib} = 1;
        
        # TODO : OpenSSL fails on configure if not pre-installed, and likely others too
    }

    $opts->{make} = $make;
    $lib_prefix_base = File::Spec->catfile ($prefix, 'lib');

    build_all_c_libs ($opts);
    
    # Build other resty options

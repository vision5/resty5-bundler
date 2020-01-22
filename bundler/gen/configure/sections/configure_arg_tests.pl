    # These options were added in Resty5 and are not valid in Openresty

    } elsif ($opt =~ $without_lua_resty_libs_regex) {
        $resty_opts{"no_lua_resty_$1"} = 1;

    } elsif ($opt =~ /--without-lua_resty_(.*)/) {
        die "$opt : lib not included";

    } elsif ($opt =~ $with_modules_dependencies_regex) {
        
        my $mod = $1;
        for my $dep (@{$modules_dependencies{$mod}}) {
            $resty_opts{$dep} = 1;
        }
        push @ngx_opts, $opt;

    } elsif ($opt =~ $with_c_libs_regex) {
        
        my $lib = $1;
        $resty_opts{$lib} = 1;

    } elsif ($opt =~ $with_c_libs_path_regex) {
        
        my ($lib, $path) = ($1, $2);
        $resty_opts{$lib} = 1;
        $resty_opts{"${lib}_prefix"} = File::Spec->rel2abs($path);
=pod
        my ($lib, $path) = ($1, $2);
        if (grep {$_ eq $lib} @special_libs) {
            push @ngx_opts, $opt;
        } else {
            $resty_opts{$lib} = 1;
            $resty_opts{"${lib}_prefix"} = File::Spec->rel2abs($path);
        }
=cut
    } elsif ($opt =~ $with_c_libs_prefix_regex) {
        
        my ($lib, $path) = ($1, $2);
        $resty_opts{$lib} = 1;
        $resty_opts{"${lib}_prefix"} = File::Spec->rel2abs($path);
        
    } elsif ($opt =~ $with_c_libs_version_regex) {

        my ($lib, $version) = ($1, $2);
        $resty_opts{$lib} = 1;
        $resty_opts{"${lib}_version"} = $version;
        
    } elsif ($opt =~ $with_c_libs_install_regex) {
        
        my $lib = $1;
        $resty_opts{$lib} = 1;
        $resty_opts{"install_${lib}"} = 1;
        
    } elsif ($opt =~  $with_c_libs_opt_regex) {

        my ($lib, $opt) = ($1, $2);
        $resty_opts{"${lib}_opts"} = $resty_opts{"${lib}_opts"} . "$opt ";
        
    } elsif ($opt =~  $with_c_libs_conf_opt_regex) {

        my ($lib, $opt) = ($1, $2);
        $resty_opts{"${lib}_conf_opts"} = $resty_opts{"${lib}_conf_opts"} . "$opt ";
        
    } elsif ($opt =~  $with_c_libs_ld_opt_regex) {

        my ($lib, $opt) = ($1, $2);
        $resty_opts{"${lib}_ld_opts"} = $resty_opts{"${lib}_ld_opts"} . "$opt ";  

    } elsif ($opt =~ $without_bundled_libs_regex) {
        
        my $lib = $1;
        $resty_opts{"no_bundled_${lib}"} = 1;

    } elsif ($opt eq '--without-bundled-libs') {
        warn "Not using any bundled libs\n";
        $resty_opts{no_bundled_libs} = 1;

    } elsif ($opt =~ $without_c_libs_regex) {
        
        my $lib = $1;
        $resty_opts{"no_${lib}"} = 1;

        if ($lib eq 'pcre') {
            push @ngx_opts, $opt;
        }

    } elsif ($opt =~ $libs_help_regex) {
        
        my $lib = $1;
        my $lib_src = auto_complete "bundle/$1";
        
        my $conf = $libs_configure_scripts{$lib};
        if (defined $conf) {
            if ($conf eq '') {
                die "No configure script for $lib\n";
            }
        } else {
            $conf = 'configure';
        }
        
        if ($libs_autoreconf{$lib} && ! -f "$lib_src/$conf") {
            shell "cd $lib_src && autoreconf -f -i";
        }
        shell "$lib_src/$conf --help";
        exit;

my $lib_prefix_base;

sub build_all_c_libs {
    
    my $opts = shift;
    
    for my $lib (@c_libs) {
    
        if (! $opts->{$lib}) {
            next;
        }
    
        my $lib_opts = build_c_lib_opts ($opts, $lib) or die ("Could not install the $lib lib");
        
        if ($lib_opts == 1) {
            next;
        }
        
        #push @ngx_ld_opts, "-l$lib";
        #push @ngx_rpaths, File::Spec->catfile($lua_prefix, "lib");
    }
    
}

sub build_c_libs_env_var_parts {

    my $lib = shift;
    my $type = shift;
    my $vars = shift;
    my $lib_uc = uc $lib;

    if (! defined $type) {
        $type = 3;
    }
    
    if (! defined $vars) {
        my %var_a;
        $vars = \%var_a;
    }

    # Add for the lib itself

    if ($type == 3 || $type == 1) {
        
        my $soname = $libs_sonames{$lib};
        if (! defined $soname) {
            $soname = $lib;
        }
        
        push (@{$vars->{sonames}},  "-l$soname");
        push (@{$vars->{rpaths}},   $ENV{"${lib_uc}_RPATH"});
        push (@{$vars->{dirs}},     $ENV{"${lib_uc}_LIB_DIRS"});
    }
    
    # Add for all the dependencies

    if ($type == 3 || $type == 2) {
        
        my $deps_ref = $libs_dependencies{$lib};
        
        if (defined $deps_ref) {
        
            for my $dep (@{$deps_ref}) {
                build_c_libs_env_var_parts ($dep, 3, $vars);
            }
        }
    }
    
    # Make unique
    
    my @sonames = uniq @{$vars->{sonames}};
    my @rpaths = uniq @{$vars->{rpaths}};
    my @dirs = uniq @{$vars->{dirs}};
    
    $vars->{sonames} = \@sonames;
    $vars->{rpaths} = \@rpaths;
    $vars->{dirs} = \@dirs;
    
    return  $vars;
}

sub get_libs_env_var {
    
    my $vars = build_c_libs_env_var_parts (shift);
    
    return  join (' ', @{$vars->{sonames}})
            . ' '
            . join (' ', @{$vars->{dirs}}) 
            . ' -Wl,-rpath,'
            . join (':', @{$vars->{rpaths}})
}

sub add_lib_dir {
    
    my ($lib, $dir) = @_;
    my $lib_uc = uc $lib;

    if (defined $libs_lib_dir_prefix{$lib}) {
        $dir = File::Spec->catfile ($dir, $libs_lib_dir_prefix{$lib});
    }

    env_add_path    LT_SYS_LIBRARY_PATH     => $dir;
    env_add_path    LD_LIBRARY_PATH         => $dir;
    env_add_path    LIBRARY_PATH            => $dir;
    env_add_flag    LDFLAGS_ALL             => "-L${dir}";
    
    env_add_path    "${lib_uc}_RPATH"       => $dir;
    env_add_flag    "${lib_uc}_LIB_DIRS"    => "-L${dir}";
    
    my $libs = get_libs_env_var ($lib);    # must come after two above

    env             "${lib_uc}_LIBS"        => $libs;
    env             "LIB${lib_uc}_LIBS"     => $libs;
   
    push            @ngx_ld_opts            ,  "-L${dir}";
    
    @ngx_ld_opts = uniq @ngx_ld_opts;
}

sub add_inc_dir {
    
    my ($lib, $dir) = @_;
    my $lib_uc = uc $lib;
    
    if (defined $libs_inc_dir_prefix{$lib}) {
        $dir = File::Spec->catfile ($dir, $libs_inc_dir_prefix{$lib});
    }
    
    env_add_path    C_INCLUDE_PATH          => $dir;
    env_add_path    CPATH                   => $dir;
    env_add_flag    CFLAGS_ALL              => "-I${dir}";
    
    env_add_flag    "${lib_uc}_CFLAGS"      => "-I${dir}";
    env_add_flag    "LIB${lib_uc}_CFLAGS"   => "-I${dir}";
    
    push            @ngx_cc_opts            ,  "-I${dir}";
    
    @ngx_cc_opts = uniq @ngx_cc_opts;
}

sub add_lib {

    my $lib = shift;
    my $version = shift;
    my $lib_prefix = "$lib_prefix_base/$lib";
    my $lib_uc = uc $lib;
    my $dir;
    
    if (substr ($version, 0, 1) eq '/') {
        $dir = $version;
        print "Using ${lib} with prefix ${dir}\n";
    } else {
        $dir = "${lib}-$version";
        print "Using ${lib} version ${version}\n";
    }
    
    push @make_install_cmds,
        "cd \$(DESTDIR)$lib_prefix_base && ln -sfT $dir $lib";
        
    add_inc_dir ($lib, File::Spec->catfile ($lib_prefix, 'include'));
    add_lib_dir ($lib, File::Spec->catfile ($lib_prefix, 'lib'));
    
    env_add_path    RPATH               => $lib_prefix;     # TODO : generate the rpath when init, and use for all libs
    env             "${lib_uc}_DIR"     , $lib_prefix;
    
    my $soname = $libs_sonames{$lib};
    if (! defined $soname) {
        $soname = $lib;
    }
    
    push @ngx_rpaths, File::Spec->catfile ($lib_prefix, 'lib');
    push @ngx_ld_opts, "-l${soname}";
    
    @ngx_rpaths = uniq @ngx_rpaths;
    @ngx_ld_opts = uniq @ngx_ld_opts;
}

# TODO : ssl / pcre / zlib linked
# TODO : dependencies
# TODO : auto-rebuild
# TODO : opts
# TODO : remove -ld-opt
# TODO : relative paths for linker
# TODO : create links e.g. gd -> gd-2.2.5, and the linker then checks in the symlinked folder
# TODO : allow for configs to define exactly which version to link to (so change the symlink to dir before starting up)
# TODO : change 'openresty' bin to 'helix5'
# TODO : change the lib of server variable to 'helix5'

sub get_lib_extra_opts {
    
    ## TODO : This needs to be checked and re-written to get it working
    
    my $extra_opts = ' TARGET_STRIP=@: CCDEBUG=-g';
=pod
    {
        my $comp = ($cc || 'cc');
        my $ver = `$comp --version`;
        if (defined $ver && $ver =~ /\(GCC\) (\d+\.\d+)/) {
            my $v = $1;
            if ($v < 4.5) {
                $luajit_xcflags .= " -std=gnu99";
            }
        }
    }


    if (!$user_luajit_xcflags
        || $user_luajit_xcflags !~ /-msse4\.2\b/)
    {
        # check -msse4.2
        my ($out, $cfile) = tempfile("resty-config-XXXXXX",
                                     SUFFIX => '.c', TMPDIR => 1,
                                     UNLINK => 1);

        print $out "
int main(void) {
#ifndef __SSE4_2__
#   error SSE 4.2 not found
#endif
return 0;
}
";
        close $out;

        my $ofile = tmpnam();
        my $comp = ($cc || 'cc');
        my $found;

        if (system("$comp -o $ofile -msse4.2 -c $cfile") == 0
            && -s $ofile)
        {
            unlink $ofile;

            if (system("$comp -o $ofile -march=native -c $cfile") == 0
                && -s $ofile)
            {
                print "INFO: found -msse4.2 in $comp.\n";
                $found = 1;
                $luajit_xcflags .= " -msse4.2";
            }
        }

        if (-f $ofile) {
            unlink $ofile;
        }

        if (!$found) {
            print "WARNING: -msse4.2 not supported in $comp.\n";
        }
    }

    if ($opts->{debug}) {
        $luajit_xcflags .= " -DLUA_USE_APICHECK -DLUA_USE_ASSERT";

        if ($user_luajit_xcflags) {
            $luajit_xcflags .= $user_luajit_xcflags;
        }
        $luajit_xcflags =~ s/^ +//;

        $extra_opts .= qq{ Q= XCFLAGS='$luajit_xcflags'};

    } else {
        if ($user_luajit_xcflags) {
            $luajit_xcflags .= $user_luajit_xcflags;
        }

        if ($luajit_xcflags) {
            $luajit_xcflags =~ s/^ +//;
            $extra_opts .= qq{ XCFLAGS='$luajit_xcflags'};
        }
    }

    #if ($platform =~ /bsd/i) {
    #$extra_opts .= ' CFLAGS=-I..';
    #}

    if ($on_solaris) {
        $extra_opts .= " INSTALL_X='$root_dir/build/install -m 0755' " .
                "INSTALL_F='$root_dir/build/install -m 0644'";
    }

    if (defined $cc) {
        $extra_opts .= " CC='$cc'";

    } else {
        $extra_opts .= " CC=cc";
    }

    if ($platform eq 'macosx') {
        my $v = $ENV{MACOSX_DEPLOYMENT_TARGET};
        if (!defined $v || $v !~ /^\d+\.\d+$/) {
            $v = `sw_vers -productVersion`;
            if (defined $v && $v =~ /^\s*(\d+\.\d+)/) {
                $ENV{MACOSX_DEPLOYMENT_TARGET} = $1;
                #warn "MACOSX_DEPLOYMENT_TARGET = $1";
            }
        }
    }
=cut
    return  $extra_opts;
}

sub get_cflags {

    my $opts = shift;
    my $lib = shift;

    if (! defined $ENV{CFLAGS_ALL}) {
        $ENV{CFLAGS_ALL} = '';
    }

    my $cflags = "-fPIC -Wall -Winline -O2 -g $ENV{CFLAGS_ALL}";

    # TODO : generate this much better
    
    if (defined $libs_cflags{$lib}) {
        $cflags .= ' ' . $libs_cflags{$lib};
    }
    
    if (defined $opts->{"${lib}_cflags"}) {
        $cflags .= ' ' . $opts->{"${lib}_cflags"};
    }
    
    eval "\$cflags = \"$cflags\"";
    
    return  $cflags;   
}

sub get_ldflags {
    
    my $opts = shift;
    my $lib = shift;
    
    if (! defined $ENV{LDFLAGS_ALL}) {
        $ENV{LDFLAGS_ALL} = '';
    }
    
    my $ldflags = "$ENV{LDFLAGS_ALL}";
    
    if (defined $ENV{RPATH}) {
        $ldflags = "-Wl,--rpath,$ENV{RPATH}";
    }
    
    if (defined $libs_ldflags{$lib}) {
        $ldflags .= ' ' . $libs_ldflags{$lib};
    }
    
    if (defined $opts->{"${lib}_ldflags"}) {
        $ldflags .= ' ' . $opts->{"${lib}_ldflags"};
    }
    
    eval "\$ldflags = \"$ldflags\"";
    
    return   $ldflags;
}

sub build_c_lib_opts {
    
    my $opts = shift;
    my $lib = shift;
    my $child = shift;
    my $make = $opts->{make};
    my $lib_uc = uc $lib;

    print "Configuring $lib\n";

    if ($opts->{"no_${lib}"}) {
        print "Disabling ${lib}\n";
        return  0;
    }
    
    if ($libs_compiled{$lib}) {
        print "$lib already compiled\n";
        return  1;
    }
    
    my $deps_ref = $libs_dependencies{$lib};
    
    if (defined $deps_ref) {
    
        for my $dep (@{$deps_ref}) {
            print "Configuring dependency of $lib\n";
            my $rc = build_c_lib_opts ($opts, $dep);
            # TODO : something with the rc
        }
    }
    
    if ($opts->{"${lib}_prefix"}) {
        add_lib $lib, $opts->{"${lib}_prefix"};
        return  1;
    }

    if ($opts->{"${lib}_version"}) {
        add_lib $lib, $opts->{"${lib}_version"};
        return  1;
    }

    if ($opts->{"no_bundled_${lib}"} || $opts->{no_bundled_libs}) {
        print "Not using bundled ${lib}\n";
        return  0;
    }

    my $lib_src = auto_complete $lib;
    $lib_src =~ /$lib-(.*)/;
    my $lib_version = $1;
    my $lib_prefix = "$lib_prefix_base/$lib_src";
    
    if (-d $lib_prefix && ! $opts->{"install_$lib"}) {
        add_lib $lib, $lib_version;
        return  1;
    }

    cd $lib_src;    
    
    # Delete old temp install dir
    
    my $lib_prefix_tmp = File::Spec->catfile (getcwd(), 'out');
    shell "rm -fr '$lib_prefix_tmp'";
    
    # Get cflags and ldflags
    
    my $cflags = get_cflags ($opts, $lib);
    my $ldflags = get_ldflags ($opts, $lib);

    env CFLAGS => $cflags;
    env LDFLAGS => $ldflags;
    
    # Autoconf
    
    if ($libs_autoconf{$lib}) {
        shell "autoreconf --install", $dry_run;
    }
    
    # Configure
    
    my $conf = defined  $libs_configure_scripts{$lib} ? 
                        $libs_configure_scripts{$lib} : 'configure';
    if (! $conf eq '') {
        my $conf_opts = defined $libs_configure_flags{$lib} ?
                                $libs_configure_flags{$lib} : '';
        
        if (defined $opts->{"${lib}_conf_opts"}) {
            $conf_opts .= ' ' . $opts->{"${lib}_conf_opts"};
        }
        
        eval "\$conf_opts = \"$conf_opts\"";
        
        shell "./${conf} --prefix='$lib_prefix_tmp' $conf_opts", $dry_run;
    }
    
    # Make
    
    my $make_type = $libs_make_type{$lib};
    if (defined $make_type) {
        $make_type = " $make_type";
    } else {
        $make_type = '';
    }
    
    my $make_opts = "PREFIX='$lib_prefix_tmp'";
    $make_opts .= ($libs_no_make_flags{$lib} || $libs_no_make_cflags{$lib}) ? 
                                        '' : " CFLAGS='$cflags'";
    $make_opts .= ($libs_no_make_flags{$lib} || $libs_no_make_ldflags{$lib}) ? 
                                        '' : " LDFLAGS='$ldflags'";
    #my $make_opts .= get_extra_opts ();

    if (defined $cores) {
        shell "${make}${make_type} -j${cores}${make_opts}", $dry_run;
    } else {
        shell "${make}${make_type} ${make_opts}", $dry_run;
    }

    # Make install (temp)
    
    my $install_opts = "PREFIX=$lib_prefix_tmp " .
                       "INSTALL=$root_dir/build/install";
    
    shell "${make} install ${install_opts}", $dry_run;
    
    # Make install (calls install script)
        
    push @make_install_cmds, "$root_dir/build/install-lib $lib_prefix_tmp $lib_prefix \$(DESTDIR)";

    # Add variables

    add_inc_dir ($lib, File::Spec->catfile ($lib_prefix_tmp, 'include'));
    add_lib     ($lib, $lib_version);
    add_lib_dir ($lib, File::Spec->catfile ($lib_prefix_tmp, 'lib'));
    
    env "${lib_uc}_DIR", $lib_prefix_tmp;
    
    $libs_compiled{$lib} = 1;
    
    print "Finished configuring $lib\n";
    
    cd '..';
}

sub usage_opt ($$) {
    
    my $opt_max_len = length "  --without-stream_upstream_least_conn_module  ";
    
    #warn "opt max len: $opt_max_len";
    
    my $opt = '  --';

    $opt .= shift;
    my $n= $opt_max_len - length $opt;

    if ($n > 0) {
        $opt .= " " x $n;

    } else {
        $opt .= "\n" . (" " x $opt_max_len);
    }

    $opt .= shift;
    
    return  $opt . "\n";
}

sub usage_format {
    my ($in, $no_newline) = @_;
    my $out = '';
    my @blocks = split ("\n\n", $in);
    my $last = @blocks;
    my $i = 0;
    
    for my $block (@blocks) {
        
        $i++;
        my @opts;
        my $reorder = 0;
        
        # Strip out original options
        
        for my $line (split (/\n  --?/, "\n" . $block)) {
        
            my @split_line = split (/\s+/, $line);

            if (scalar @split_line == 0) {
                next;
            }
            
            my $opt = shift @split_line;
            my $msg = join ' ', @split_line;
        
            push @opts, [$opt, $msg];
        
            if ($opt =~ /_module$/) {
                $reorder = 1;
            }
        }
        
        # Re-order modules if they are lists of modules
        
        if ($reorder) {
            @opts = sort {$a->[0] cmp $b->[0]} @opts;
        }
        
        # Add all the options to the output
        
        for my $opt (@opts) {
            $out .= usage_opt ($opt->[0], $opt->[1]);
        }
        
        $out .= "\n" if !$no_newline || $i != $last;        
    }
    
    return $out;
}

sub usage_bundled_external_libs {
    
    my $msg = "Bundled external libs\n\n";
    
    for my $lib (@c_libs) {
        
        $msg .= usage_opt (
            "with-${lib}", 
            "enable ${lib} (see docs to see when enabled by default)"
        );

        #if (! grep {$_ eq $lib} @special_libs) {
            
            $msg .= usage_opt (
                "with-${lib}=DIR", 
                "same as --with-${lib}-prefix"
            );
        #}
        
        $msg .= usage_opt (
            "with-${lib}-prefix=DIR", 
            "use ${lib} lib in DIR/lib"
        );
        
        $msg .= usage_opt (
            "with-${lib}-version=VERSION", 
            "use ${lib} version VERSION"
        );
        
        $msg .= usage_opt (
            "with-${lib}-install", 
            "installs ${lib} even if it already exists"
        );
        
        $msg .= usage_opt (
            "with-${lib}-opt=OPTS", 
            "set additional compiler options for ${lib}"
        );

        $msg .= usage_opt (
            "with-${lib}-conf-opt=OPTS", 
            "set additional configure options for ${lib}"
        );
        
        $msg .= usage_opt (
            "with-${lib}-ld-opt=OPTS", 
            "set additional linker options for ${lib}"
        );
        
        if ($lib eq 'pcre') {
            
            $msg .= usage_format '
  --with-pcre-jit                    build PCRE with JIT compilation support
            ', 1;
            
        } elsif ($lib eq 'zlib') {
            
            $msg .= usage_format '
  --with-zlib-asm=CPU                use zlib assembler sources optimized
                                     for the specified CPU, valid values:
                                     pentium, pentiumpro
            ', 1;
        }
        
        $msg .= usage_opt (
            "without-bundled-${lib}", 
            "do not use the bundled ${lib}"
        );
        
        $msg .= usage_opt (
            "without-${lib}", 
            "disable ${lib}"
        );
        
        $msg .= usage_opt (
            "help-${lib}", 
            "display help for ${lib}"
        );
        
        $msg .= "\n";
    }
    
    return "$msg";
}

sub usage_lua_libraries {
    
    my $msg = "Lua libraries\n\n";
    
    $msg .= usage_format (<<'_EOC_');

  --without-lua_cjson                disable the lua-cjson library
  --without-lua_rds_parser           disable the lua-rds-parser library
  --without-lua_redis_parser         disable the lua-redis-parser library
  --without-lua_tablepool            disable the lua-tablepool library (and by consequence, the
                                     lua-resty-shell library)
_EOC_

    for my $lib (@lua_resty_libs) {
        (my $lib2 = $lib) =~ s/_/-/g;
        
        $msg .= usage_opt (
            "without-lua_resty_${lib}", 
            "disable the lua-resty-${lib2} library"
        );
    }
    
    return "$msg\n";
}

sub usage_lua_options {
    
    my $msg = "Lua options\n\n";
    
    $msg .= usage_format (<<'_EOC_');

  --with-luajit                      enable and build the bundled LuaJIT 2.1 (the default)
  --with-luajit=DIR                  use the external LuaJIT 2.1 installation specified by DIR
  --with-luajit-xcflags=FLAGS        Specify extra C compiler flags for LuaJIT 2.1
  --with-luajit-ldflags=FLAGS        Specify extra C linker flags for LuaJIT 2.1
  --without-luajit-lua52             Turns off the LuaJIT extensions from Lua 5.2 that may break
                                     backward compatibility.
  --without-luajit-gc64              Turns off the LuaJIT GC64 mode (which is enabled by default
                                     on x86_64)
_EOC_

    return $msg;
}

sub usage_modules {
    my ($title, $with, $without, $type) = @_;
    my $pfx = '';
    $pfx = "${type}_" if $type;

    my $msg = "$title\n\n";

    if ($type) {
        
        if ($type eq 'http') {
            
            $msg .= usage_format '
  --without-http                     disable HTTP server
  --without-http-cache               disable HTTP cache
            ';
            
        } elsif ($type eq 'mail') {
            
            $msg .= usage_format '
  --with-mail                        enable POP3/IMAP4/SMTP proxy module
  --with-mail=dynamic                enable dynamic POP3/IMAP4/SMTP proxy module
            ';
            
        } elsif ($type eq 'stream') {
            
            $msg .= usage_format '
  --with-stream                      enable TCP/UDP proxy module
  --with-stream=dynamic              enable dynamic TCP/UDP proxy module
  --without-stream                   disable TCP/UDP proxy module
            ';
        }
    }
    
    for my $mod (@{$with}) {
        $msg .= usage_opt (
            "with-${pfx}${mod}_module", 
            "enable ngx_${pfx}${mod}_module"
        );
    }

    $msg .= "\n";

    for my $mod (@{$without}) {
        $msg .= usage_opt (
            "without-${pfx}${mod}_module", 
            "disable ngx_${pfx}${mod}_module"
        );
    }
    
    return "$msg\n";
}

sub usage_other_external_libs {
    
    my $msg .= "Other external libs\n\n";
    
    $msg .= usage_format (<<'_EOC_');

  --with-libatomic                   force libatomic_ops library usage
  --with-libatomic=DIR               set path to libatomic_ops library sources
  --with-libdrizzle=DIR              specify the libdrizzle 1.0 (or drizzle) installation prefix
  --with-libpq=DIR                   specify the libpq (or postgresql) installation prefix
  --with-pg_config=PATH              specify the path of the pg_config utility

_EOC_

    return $msg;
}

sub usage_top {
    
    my $msg = usage_format (<<"_EOC_");
    
  --help                             this message

  --prefix=PATH                      set the installation prefix (default to $prefix)

  --with-debug                       enable debug logging
  --with-dtrace-probes               enable dtrace USDT probes
  --with-dtrace=PATH                 set dtrace utility pathlib

  --with-no-pool-patch               enable the no-pool patch for debugging memory issues

  -jN                                pass -jN option to make while building the bundled
                                     Lua 5.1 interpreter or LuaJIT 2.1
_EOC_

    return $msg;
}

sub usage_bottom {
    
    my $msg = "Other Nginx options\n\n";

    $msg .= usage_format (<<'_EOC_');

  --sbin-path=PATH                   set nginx binary pathlib
  --modules-path=PATH                set modules path
  --conf-path=PATH                   set nginx.conf pathlib
  --error-log-path=PATH              set error log pathlib
  --pid-path=PATH                    set nginx.pid pathlib
  --lock-path=PATH                   set nginx.lock pathlib
  --tapset-prefix=PATH               set systemtap tapset directory prefix
  --stap-nginx-path=PATH             set stap-nginx pathlib

  --user=USER                        set non-privileged user for
                                     worker processes
  --group=GROUP                      set non-privileged group for
                                     worker processes

  --build=NAME                       set build lib
  --builddir=DIR                     set the build directory

  --with-threads                     enable thread pool support

  --with-file-aio                    enable file AIO support
  --with-ipv6                        enable IPv6 support

  --with-perl=PATH                   set perl binary pathlib
  --with-perl_modules_path=PATH      set Perl modules path

  --http-log-path=PATH               set http access log pathlib
  --http-client-body-temp-path=PATH  set path to store
                                     http client request body temporary files
  --http-proxy-temp-path=PATH        set path to store
                                     http proxy temporary files
  --http-fastcgi-temp-path=PATH      set path to store
                                     http fastcgi temporary files
  --http-uwsgi-temp-path=PATH        set path to store
                                     http uwsgi temporary files
  --http-scgi-temp-path=PATH         set path to store
                                     http scgi temporary files

  --add-module=PATH                  enable external module
  --add-dynamic-module=PATH          enable dynamic external module

  --with-compat                      dynamic modules compatibility

  --with-cc=PATH                     set C compiler pathlib
  --with-cpp=PATH                    set C preprocessor pathlib
  --with-cc-opt=OPTIONS              set additional C compiler options
  --with-ld-opt=OPTIONS              set additional linker options
  --with-cpu-opt=CPU                 build for the specified CPU, valid values:
                                     pentium, pentiumpro, pentium3, pentium4,
                                     athlon, opteron, sparc32, sparc64, ppc64

  --dry-run                          dry running the configure, for testing only
  --platform=PLATFORM                forcibly specify a platform lib, for testing only
_EOC_

    return $msg;
}

sub usage ($) {
        
    my $retval = shift;

    my $msg = usage_top;
    
    $msg .= usage_modules "HTTP modules", \@with_http_modules, \@without_http_modules, 'http';
    $msg .= usage_modules "Mail modules", \@with_mail_modules, \@without_mail_modules, 'mail';
    $msg .= usage_modules "Stream modules", \@with_stream_modules, \@without_stream_modules, 'stream';
    $msg .= usage_modules "Other modules", \@with_modules, \@without_modules;

    $msg .= usage_lua_options;
    $msg .= usage_lua_libraries;
    $msg .= usage_bundled_external_libs;
    $msg .= usage_other_external_libs;
    $msg .= usage_bottom;

    if ($retval == 0) {
        print $msg;
        exit 0;
    }

    warn $msg;
    exit $retval;
}

my $without_lua_resty_libs_regex;
{
    my $s = '^--without-lua_resty_('
        . join('|',
            @lua_resty_libs
          )
        . ')$';

    $without_lua_resty_libs_regex = qr/$s/;
}

my $with_modules_dependencies_regex;
{
    my $s = '^--with-('
        . join('|',
            keys
            %modules_dependencies
          )
        . ')_module$';

    #warn "with regex: $s";

    $with_modules_dependencies_regex = qr/$s/;
}

my $with_c_libs_regex;
{
    my $s = '^--with-('
        . join('|',
            @c_libs
          )
        . ')$';

    $with_c_libs_regex = qr/$s/;
}

my $with_c_libs_path_regex;
{
    my $s = '^--with-('
        . join('|',
            @c_libs
          )
        . ')=(.*)$';

    $with_c_libs_path_regex = qr/$s/;
}

my $with_c_libs_prefix_regex;
{
    my $s = '^--with-('
        . join('|',
            @c_libs
          )
        . ')-prefix=(.*)$';

    $with_c_libs_prefix_regex = qr/$s/;
}

my $with_c_libs_version_regex;
{
    my $s = '^--with-('
        . join('|',
            @c_libs
          )
        . ')-version=([0-9].*)$';

    $with_c_libs_version_regex = qr/$s/;
}

my $with_c_libs_install_regex;
{
    my $s = '^--with-('
        . join('|',
            @c_libs
          )
        . ')-install$';

    $with_c_libs_install_regex = qr/$s/;
}

my $with_c_libs_opt_regex;
{
    my $s = '^--with-('
        . join('|',
            @c_libs
          )
        . ')-opt=(.*)$';

    $with_c_libs_opt_regex = qr/$s/;
}

my $with_c_libs_conf_opt_regex;
{
    my $s = '^--with-('
        . join('|',
            @c_libs
          )
        . ')-conf-opt=(.*)$';

    $with_c_libs_conf_opt_regex = qr/$s/;
}

my $with_c_libs_ld_opt_regex;
{
    my $s = '^--with-('
        . join('|',
            @c_libs
          )
        . ')-ld-opt=(.*)$';

    $with_c_libs_ld_opt_regex = qr/$s/;
}

my $without_bundled_libs_regex;
{
    my $s = '^--without-bundled-('
        . join('|',
            @c_libs
          )
        . ')$';

    $without_bundled_libs_regex = qr/$s/;
}

my $without_c_libs_regex;
{
    my $s = '^--without-('
        . join('|',
            @c_libs
          )
        . ')$';

    $without_c_libs_regex = qr/$s/;
}

my $libs_help_regex;
{
    my $s = '^--help-('
        . join('|',
            @c_libs
          )
        . ')$';

    $libs_help_regex = qr/$s/;
}

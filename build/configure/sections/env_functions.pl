my %ENV_L;

sub env_push {
    my ($join_str, $name, $val) = @_;
    
    if (!defined $name) {
        die "env not defined";
    }
    if (!defined $val) {
        die "env $name takes undef value";
    }
    
    my @list;
    if (defined $ENV_L{$name}) {
        @list = @{$ENV_L{$name}};
    }
      
    push @list, $val;
    @list = uniq @list;
    $ENV_L{$name} = \@list;
    
    env $name, join ($join_str, @list);
}

sub env_add_flag ($$) {
    my ($name, $val) = @_;
    return  env_push (' ', $name, $val)
}
    
sub env_add_path ($$) {
    my ($name, $val) = @_;
    return  env_push (':', $name, $val)
}

my @with_http_modules = (
    'addition',
    'auth_request',
    'dav',
    'degradation',
    'drizzle',
    'flv',
    'geoip',
    'gunzip',
    'gzip_static',
    'iconv',
    'image_filter',
    'mp4',
    'perl',
    'postgres',
    'random_index',
    'realip',
    'secure_link',
    'slice',
    'stub_status',
    'sub',
    'v2',
    'xslt',
);

my @without_http_modules = (
    'access',
    'array_var',
    'auth_basic',
    'autoindex',
    'browser',
    'charset',
    'coolkit',
    'echo',
    'empty_gif',
    'encrypted_session',
    'fastcgi',
    'form_input',
    'geo',
    'gzip',
    'headers_more',
    'limit_conn',
    'limit_req',
    'lua',
    'lua_upstream',
    'map',
    'memc',
    'memcached',
    'proxy',
    'rds_csv',
    'rds_json',
    'redis',
    'redis2',
    'referer',
    'rewrite',
    'scgi',
    'set_misc',
    'split_clients',
    'srcache',
    'ssi',
    'ssl',
    'upstream_hash',
    'upstream_ip_hash',
    'upstream_keepalive',
    'upstream_least_conn',
    'upstream_zone',
    'userid',
    'uwsgi',
    'xss',
);

my @with_mail_modules = (
    'ssl',
);

my @without_mail_modules = (
    'imap',
    'pop3',
    'smtp',
);

my @with_stream_modules = (
    'geoip',
    'realip',
    'ssl',
    'ssl_preread',
);

my @without_stream_modules = (
    'access',
    'geo',
    'limit_conn',
    'lua',
    'map',
    'return',
    'split_clients',
    'ssl',
    'upstream_hash',
    'upstream_least_conn',
    'upstream_zone',
);

my @with_modules = (
    'cpp_test',
    'google_perftools',
    'perl',
    'poll',
    'select',
);

my @without_modules = (
    'ngx_devel_kit',
    'poll',
    'select',
);


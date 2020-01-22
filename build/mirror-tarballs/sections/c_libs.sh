#################################

[[ -d "bzip2-1.0.6" ]] && echo "bzip2-1.0.6 already exists" && exit 1
$root/util/get-tarball "https://sourceforge.net/projects/bzip2/files/bzip2-1.0.6.tar.gz/download" -O bzip2-1.0.6.tar.gz || exit 1
tar -xzf bzip2-1.0.6.tar.gz || exit 1
#mv bzip2-1.0.6 bzip2-1.0.6

#################################

[[ -d "openssl-1.1.0l" ]] && echo "openssl-1.1.0l already exists" && exit 1
$root/util/get-tarball "https://www.openssl.org/source/openssl-1.1.0l.tar.gz" -O openssl-1.1.0l.tar.gz || exit 1
tar -xzf openssl-1.1.0l.tar.gz || exit 1
#mv openssl-1.1.0l openssl-1.1.0l

#################################

[[ -d "pcre-8.43" ]] && echo "pcre-8.43 already exists" && exit 1
$root/util/get-tarball "https://ftp.pcre.org/pub/pcre/pcre-8.43.tar.gz" -O pcre-8.43.tar.gz || exit 1
tar -xzf pcre-8.43.tar.gz || exit 1
#mv pcre-8.43 pcre-8.43

#################################

[[ -d "zlib-1.2.11" ]] && echo "zlib-1.2.11 already exists" && exit 1
$root/util/get-tarball "https://github.com/madler/zlib/archive/v1.2.11.tar.gz" -O zlib-1.2.11.tar.gz || exit 1
tar -xzf zlib-1.2.11.tar.gz || exit 1
#mv zlib-1.2.11 zlib-1.2.11


#################################
    
ver=master
[[ -d lua-resty-auth-$ver ]] && echo "lua-resty-auth-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/duhoobo/lua-resty-auth/archive/$ver.tar.gz" -O lua-resty-auth-$ver.tar.gz || exit 1
tar -xzf lua-resty-auth-$ver.tar.gz || exit 1
cd lua-resty-auth-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=0.13.1
[[ -d lua-resty-auto-ssl-$ver ]] && echo "lua-resty-auto-ssl-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/GUI/lua-resty-auto-ssl/archive/v$ver.tar.gz" -O lua-resty-auto-ssl-$ver.tar.gz || exit 1
tar -xzf lua-resty-auto-ssl-$ver.tar.gz || exit 1
cd lua-resty-auto-ssl-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=master
[[ -d lua-resty-bzlib-$ver ]] && echo "lua-resty-bzlib-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/xiaooloong/lua-resty-bzlib/archive/$ver.tar.gz" -O lua-resty-bzlib-$ver.tar.gz || exit 1
tar -xzf lua-resty-bzlib-$ver.tar.gz || exit 1
cd lua-resty-bzlib-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=master
[[ -d lua-resty-ceph-$ver ]] && echo "lua-resty-ceph-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/linsir/lua-resty-ceph/archive/$ver.tar.gz" -O lua-resty-ceph-$ver.tar.gz || exit 1
tar -xzf lua-resty-ceph-$ver.tar.gz || exit 1
cd lua-resty-ceph-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=master
[[ -d lua-resty-checkups-$ver ]] && echo "lua-resty-checkups-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/firesnow/lua-resty-checkups/archive/$ver.tar.gz" -O lua-resty-checkups-$ver.tar.gz || exit 1
tar -xzf lua-resty-checkups-$ver.tar.gz || exit 1
cd lua-resty-checkups-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=0.3.2
[[ -d lua-resty-consul-$ver ]] && echo "lua-resty-consul-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/hamishforbes/lua-resty-consul/archive/v$ver.tar.gz" -O lua-resty-consul-$ver.tar.gz || exit 1
tar -xzf lua-resty-consul-$ver.tar.gz || exit 1
cd lua-resty-consul-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=master
[[ -d lua-resty-cookie-$ver ]] && echo "lua-resty-cookie-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/cloudflare/lua-resty-cookie/archive/$ver.tar.gz" -O lua-resty-cookie-$ver.tar.gz || exit 1
tar -xzf lua-resty-cookie-$ver.tar.gz || exit 1
cd lua-resty-cookie-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=master
[[ -d lua-resty-datetime-$ver ]] && echo "lua-resty-datetime-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/xiangnanscu/lua-resty-datetime/archive/$ver.tar.gz" -O lua-resty-datetime-$ver.tar.gz || exit 1
tar -xzf lua-resty-datetime-$ver.tar.gz || exit 1
cd lua-resty-datetime-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=master
[[ -d lua-resty-dhcp-$ver ]] && echo "lua-resty-dhcp-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/bjne/lua-resty-dhcp/archive/$ver.tar.gz" -O lua-resty-dhcp-$ver.tar.gz || exit 1
tar -xzf lua-resty-dhcp-$ver.tar.gz || exit 1
cd lua-resty-dhcp-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=master
[[ -d lua-resty-elasticsearch-$ver ]] && echo "lua-resty-elasticsearch-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/tomas/lua-resty-elasticsearch/archive/$ver.tar.gz" -O lua-resty-elasticsearch-$ver.tar.gz || exit 1
tar -xzf lua-resty-elasticsearch-$ver.tar.gz || exit 1
cd lua-resty-elasticsearch-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=master
[[ -d lua-resty-exec-$ver ]] && echo "lua-resty-exec-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/jprjr/lua-resty-exec/archive/$ver.tar.gz" -O lua-resty-exec-$ver.tar.gz || exit 1
tar -xzf lua-resty-exec-$ver.tar.gz || exit 1
cd lua-resty-exec-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=1.1
[[ -d lua-resty-ftpclient-$ver ]] && echo "lua-resty-ftpclient-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/hongliang5316/lua-resty-ftpclient/archive/v$ver.tar.gz" -O lua-resty-ftpclient-$ver.tar.gz || exit 1
tar -xzf lua-resty-ftpclient-$ver.tar.gz || exit 1
cd lua-resty-ftpclient-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=0.14
[[ -d lua-resty-http-$ver ]] && echo "lua-resty-http-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/ledgetech/lua-resty-http/archive/v$ver.tar.gz" -O lua-resty-http-$ver.tar.gz || exit 1
tar -xzf lua-resty-http-$ver.tar.gz || exit 1
cd lua-resty-http-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=master
[[ -d lua-resty-iconv-$ver ]] && echo "lua-resty-iconv-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/xiaooloong/lua-resty-iconv/archive/$ver.tar.gz" -O lua-resty-iconv-$ver.tar.gz || exit 1
tar -xzf lua-resty-iconv-$ver.tar.gz || exit 1
cd lua-resty-iconv-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=0.3.0
[[ -d lua-resty-iputils-$ver ]] && echo "lua-resty-iputils-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/hamishforbes/lua-resty-iputils/archive/v$ver.tar.gz" -O lua-resty-iputils-$ver.tar.gz || exit 1
tar -xzf lua-resty-iputils-$ver.tar.gz || exit 1
cd lua-resty-iputils-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=master
[[ -d lua-resty-jit-uuid-$ver ]] && echo "lua-resty-jit-uuid-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/thibaultcha/lua-resty-jit-uuid/archive/$ver.tar.gz" -O lua-resty-jit-uuid-$ver.tar.gz || exit 1
tar -xzf lua-resty-jit-uuid-$ver.tar.gz || exit 1
cd lua-resty-jit-uuid-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=0.1.11
[[ -d lua-resty-jwt-$ver ]] && echo "lua-resty-jwt-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/SkyLothar/lua-resty-jwt/archive/v$ver.tar.gz" -O lua-resty-jwt-$ver.tar.gz || exit 1
tar -xzf lua-resty-jwt-$ver.tar.gz || exit 1
cd lua-resty-jwt-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=0.2
[[ -d lua-resty-locations-$ver ]] && echo "lua-resty-locations-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/hamishforbes/lua-resty-locations/archive/v$ver.tar.gz" -O lua-resty-locations-$ver.tar.gz || exit 1
tar -xzf lua-resty-locations-$ver.tar.gz || exit 1
cd lua-resty-locations-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=1.3.0
[[ -d lua-resty-maxminddb-$ver ]] && echo "lua-resty-maxminddb-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/anjia0532/lua-resty-maxminddb/archive/v$ver.tar.gz" -O lua-resty-maxminddb-$ver.tar.gz || exit 1
tar -xzf lua-resty-maxminddb-$ver.tar.gz || exit 1
cd lua-resty-maxminddb-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=master
[[ -d lua-resty-mime-sniff-$ver ]] && echo "lua-resty-mime-sniff-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/spacewander/lua-resty-mime-sniff/archive/$ver.tar.gz" -O lua-resty-mime-sniff-$ver.tar.gz || exit 1
tar -xzf lua-resty-mime-sniff-$ver.tar.gz || exit 1
cd lua-resty-mime-sniff-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=master
[[ -d lua-resty-mvc-$ver ]] && echo "lua-resty-mvc-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/xiangnanscu/lua-resty-mvc/archive/$ver.tar.gz" -O lua-resty-mvc-$ver.tar.gz || exit 1
tar -xzf lua-resty-mvc-$ver.tar.gz || exit 1
cd lua-resty-mvc-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=1.1
[[ -d lua-resty-nettle-$ver ]] && echo "lua-resty-nettle-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/bungle/lua-resty-nettle/archive/v$ver.tar.gz" -O lua-resty-nettle-$ver.tar.gz || exit 1
tar -xzf lua-resty-nettle-$ver.tar.gz || exit 1
cd lua-resty-nettle-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=1.7.2
[[ -d lua-resty-openidc-$ver ]] && echo "lua-resty-openidc-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/zmartzone/lua-resty-openidc/archive/v$ver.tar.gz" -O lua-resty-openidc-$ver.tar.gz || exit 1
tar -xzf lua-resty-openidc-$ver.tar.gz || exit 1
cd lua-resty-openidc-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=master
[[ -d lua-resty-post-$ver ]] && echo "lua-resty-post-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/antonheryanto/lua-resty-post/archive/$ver.tar.gz" -O lua-resty-post-$ver.tar.gz || exit 1
tar -xzf lua-resty-post-$ver.tar.gz || exit 1
cd lua-resty-post-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=1.6
[[ -d lua-resty-prettycjson-$ver ]] && echo "lua-resty-prettycjson-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/bungle/lua-resty-prettycjson/archive/v$ver.tar.gz" -O lua-resty-prettycjson-$ver.tar.gz || exit 1
tar -xzf lua-resty-prettycjson-$ver.tar.gz || exit 1
cd lua-resty-prettycjson-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=master
[[ -d lua-resty-redis-connector-$ver ]] && echo "lua-resty-redis-connector-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/pintsized/lua-resty-redis-connector/archive/$ver.tar.gz" -O lua-resty-redis-connector-$ver.tar.gz || exit 1
tar -xzf lua-resty-redis-connector-$ver.tar.gz || exit 1
cd lua-resty-redis-connector-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=0.0.5
[[ -d lua-resty-redis-util-$ver ]] && echo "lua-resty-redis-util-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/anjia0532/lua-resty-redis-util/archive/v$ver.tar.gz" -O lua-resty-redis-util-$ver.tar.gz || exit 1
tar -xzf lua-resty-redis-util-$ver.tar.gz || exit 1
cd lua-resty-redis-util-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=master
[[ -d lua-resty-s3uploader-$ver ]] && echo "lua-resty-s3uploader-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/lilien1010/lua-resty-s3uploader/archive/$ver.tar.gz" -O lua-resty-s3uploader-$ver.tar.gz || exit 1
tar -xzf lua-resty-s3uploader-$ver.tar.gz || exit 1
cd lua-resty-s3uploader-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=2.25
[[ -d lua-resty-session-$ver ]] && echo "lua-resty-session-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/bungle/lua-resty-session/archive/v$ver.tar.gz" -O lua-resty-session-$ver.tar.gz || exit 1
tar -xzf lua-resty-session-$ver.tar.gz || exit 1
cd lua-resty-session-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=master
[[ -d lua-resty-sniproxy-$ver ]] && echo "lua-resty-sniproxy-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/fffonion/lua-resty-sniproxy/archive/$ver.tar.gz" -O lua-resty-sniproxy-$ver.tar.gz || exit 1
tar -xzf lua-resty-sniproxy-$ver.tar.gz || exit 1
cd lua-resty-sniproxy-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=master
[[ -d lua-resty-socks5-server-$ver ]] && echo "lua-resty-socks5-server-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/detailyang/lua-resty-socks5-server/archive/$ver.tar.gz" -O lua-resty-socks5-server-$ver.tar.gz || exit 1
tar -xzf lua-resty-socks5-server-$ver.tar.gz || exit 1
cd lua-resty-socks5-server-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=master
[[ -d lua-resty-sync-$ver ]] && echo "lua-resty-sync-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/upyun/lua-resty-sync/archive/$ver.tar.gz" -O lua-resty-sync-$ver.tar.gz || exit 1
tar -xzf lua-resty-sync-$ver.tar.gz || exit 1
cd lua-resty-sync-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=master
[[ -d lua-resty-tftp-$ver ]] && echo "lua-resty-tftp-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/bjne/lua-resty-tftp/archive/$ver.tar.gz" -O lua-resty-tftp-$ver.tar.gz || exit 1
tar -xzf lua-resty-tftp-$ver.tar.gz || exit 1
cd lua-resty-tftp-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=0.02
[[ -d lua-resty-tlc-$ver ]] && echo "lua-resty-tlc-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/hamishforbes/lua-resty-tlc/archive/v$ver.tar.gz" -O lua-resty-tlc-$ver.tar.gz || exit 1
tar -xzf lua-resty-tlc-$ver.tar.gz || exit 1
cd lua-resty-tlc-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=2.7
[[ -d lua-resty-validation-$ver ]] && echo "lua-resty-validation-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/bungle/lua-resty-validation/archive/v$ver.tar.gz" -O lua-resty-validation-$ver.tar.gz || exit 1
tar -xzf lua-resty-validation-$ver.tar.gz || exit 1
cd lua-resty-validation-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..

#################################
    
ver=master
[[ -d lua-resty-waf-$ver ]] && echo "lua-resty-waf-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/p0pr0ck5/lua-resty-waf/archive/$ver.tar.gz" -O lua-resty-waf-$ver.tar.gz || exit 1
tar -xzf lua-resty-waf-$ver.tar.gz || exit 1
cd lua-resty-waf-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat /git/vision5/resty5-bundler/bundler/gen/mirror-tarballs/sections_gen/lua-resty-makefile | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..


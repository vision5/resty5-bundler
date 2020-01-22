#################################
    
ver=%VER%
[[ -d %REPO%-$ver ]] && echo "%REPO%-$ver already exists" && exit 1
$root/util/get-tarball "https://github.com/%USER%/%REPO%/archive/%VER_PREFIX%$ver.tar.gz" -O %REPO%-$ver.tar.gz || exit 1
tar -xzf %REPO%-$ver.tar.gz || exit 1
cd %REPO%-$ver || exit 1
FILES=''
for f in $(find -type f | grep /resty/ | grep \.lua); do
    src=${f:2}
    dest=${f##*/resty/}
    FILES="${FILES}"'	$(INSTALL) '$src' $(DESTDIR)$(LUA_LIB_DIR)/resty/'"$dest\\
"
done
cat %MAKEFILE% | sed -r "s|%FILES%|$FILES|" > Makefile
rm -fr .gitignore
cd ..


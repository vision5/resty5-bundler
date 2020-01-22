#################################

[[ -d "%DEST_DIR%" ]] && echo "%DEST_DIR% already exists" && exit 1
$root/util/get-tarball "%SRC_URL%" -O %DEST_FILE% || exit 1
tar -x%DECOMPRESS%f %DEST_FILE% || exit 1
%MVDIR_COMMENT%mv %SRC_DIR% %DEST_DIR%


=pod
CC          C compiler command
CFLAGS      C compiler flags
LDFLAGS     linker flags, e.g. -L<lib dir> if you have libraries in a
            nonstandard directory <lib dir>
LIBS        libraries to pass to the linker, e.g. -l<library>
CPPFLAGS    (Objective) C/C++ preprocessor flags, e.g. -I<include dir> if
            you have headers in a nonstandard directory <include dir>
CPP         C preprocessor
=cut

my %modules_dependencies = (
    http_image_filter => ['gd'],
);

my %libs_dependencies = (
    fontconfig  => ['iconv', 'expat', 'freetype', 'uuid', 'xml2'],  # 'intl'
    freetype  => ['bzip2', 'harfbuzz', 'png', 'zlib'],
    gd => ['fontconfig', 'freetype', 'imagemagick', 'imagequant', 'jpeg', 'png', 'webp', 'tiff', 'zlib'],
    #harfbuzz => ['glib']   # circular - with freetype / fontconfig
    imagemagick => ['fontconfig', 'freetype', 'jpeg', 'png', 'webp', 'tiff', 'xml2', 'bzip2', 'zlib'], 
    pcre => ['bzip2', 'zlib'],
    png => ['zlib'],
    sdl => [], # lots of libraries for video / audio
    tiff => ['jpeg', 'zlib', 'xz'], # 'lzma', 'jbigkit' xz? (=lcma2)
    webp => ['jpeg', 'png', 'tiff'],  # 'wic' 'gl', 'sdl'
    xml => ['iconv', 'xz', 'zlib'],
    xz => ['iconv'],
);

my %libs_dependencies_optional = (
    imagemagick => ['ddjvuapi', 'dps', 'flashpix', 'fftw3', 'flif', 'gvc', 'heic', 'jbig', 'lcms2', 
                    'lqr', 'lzma', 'openexr', 'openjp2', 'pango', 'raqm', 'raw_r', 'wmf', 'x11'],
);    

my %libs_autoreconf = (
    glib => 1,
    pcre => 1,
    xml2 => 1,
);

my %libs_configure_scripts = (
    bzip2 => '',
    openssl => 'config',
);

my %libs_configure_flags = (
    fontconfig => '--with-expat=\'$ENV{EXPAT_DIR}\'', #'--enable-libxml2'
    jpeg => '--enable-maxmem=20',
    webp => '',     # --disable-threading
    xml2 => '--without-python',
);

my %libs_make_type = (
    imagequant => 'shared',
);

my %libs_cflags = (

);

my %libs_ldflags = (
    webp => '-pthread', 
);

my %libs_set_variables_in_configure = (
    freetype => 1,
);

my %libs_no_make_flags = (
    fontconfig => 1,
    freetype => 1,      # FREETYPE_LIBS = -L/opt/gtkdfb-avr32/lib -Wl,--rpath -Wl,/opt/gtkdfb-avr32/lib -lfreetype -lz
    openssl => 1,
);

my %libs_no_make_cflags = (
);

my %libs_no_make_ldflags = (
);

my %libs_inc_dir_prefix = (
    freetype => 'freetype2',
    harfbuzz => 'harfbuzz',
    xml2 => 'libxml2',
);

my %libs_lib_dir_prefix = (
);

my @special_libs = (
    'openssl',
    'pcre',
    'zlib',
);

my %libs_sonames = (
    bzip2 => 'bz2',
    imagemagick => 'MagickCore-7.Q16HDRI',
    openssl => 'ssl',
    xz => 'lzma',
    zlib => 'z',
);

my %libs_compiled;

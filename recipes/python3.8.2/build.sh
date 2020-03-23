# Download Python 3.8.2 source code and extract
curl -O https://www.python.org/ftp/python/3.8.2/Python-3.8.2.tgz
tar -xvzf Python-3.8.2.tgz
cd Python-3.8.2

# The NDK location
export NDK=/Users/jventura/Library/Android/sdk/ndk/21.0.6113669

# The toolchain, depending on your build machine...
export TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/darwin-x86_64

# The target, depending on your Android device...
export TARGET=armv7a-linux-androideabi

# Set this to your minSdkVersion.
export API=21

# Configure the compilers
export CC=$TOOLCHAIN/bin/$TARGET$API-clang
export CXX=$TOOLCHAIN/bin/$TARGET$API-clang++

# Configure the other tools
export BASE=arm-linux-androideabi
export AR=$TOOLCHAIN/bin/$BASE-ar
export AS=$TOOLCHAIN/bin/$BASE-as
export LD=$TOOLCHAIN/bin/$BASE-ld
export RANLIB=$TOOLCHAIN/bin/$BASE-ranlib
export STRIP=$TOOLCHAIN/bin/$BASE-strip
export READELF=$TOOLCHAIN/bin/$BASE-readelf

# Configure arguments
export PREFIX=$(PWD)/out
export CONFIG_ARGS="
    --host=$TARGET
    --build=i686-pc-linux-gnu
    --enable-shared
    --disable-ipv6
    --prefix=$PREFIX
    --exec-prefix=$PREFIX
    ac_cv_file__dev_ptmx=yes
    ac_cv_file__dev_ptc=no
    ac_cv_little_endian_double=yes
"

# Run configure
./configure LDFLAGS="-Wl,--allow-shlib-undefined -llog" CFLAGS="-DANDROID -fomit-frame-pointer -fPIC -Wno-format" $CONFIG_ARGS

# Make
make clean
make -j4

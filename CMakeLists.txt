# ======================================================================
#  nugen main build file
#
#  cd .../path/to/build/directory
#  source .../path/to/nugen/ups/setup_for_development
#  cmake [-DCMAKE_INSTALL_PREFIX=/install/path]
#        -DCMAKE_BUILD_TYPE=$CETPKG_TYPE
#        $CETPKG_SOURCE
#
#  make
#  make test
#  make install
#  make package (builds distribution tarfile)
# ======================================================================
cmake_minimum_required(VERSION 3.19 FATAL_ERROR)


find_package(cetmodules 2.29.06 REQUIRED)
project(nugen VERSION 1.14.05 LANGUAGES CXX)

include(CetCMakeEnv)
cet_cmake_env()

# Find our own CMake modules, and tell everyone else where to find them.
cet_cmake_module_directories(Modules)

cet_set_compiler_flags(DIAGS CAUTIOUS WERROR
                       NO_UNDEFINED
                       EXTRA_FLAGS -pedantic 
                                   $<$<COMPILE_LANGUAGE:CXX>:-Wno-unused-local-typedefs
                                         -Wno-variadic-macros>)
cet_report_compiler_flags(REPORT_THRESHOLD VERBOSE)

find_package(art REQUIRED)
find_package(art_root_io REQUIRED)
find_package(canvas_root_io REQUIRED)
find_package(nusimdata REQUIRED)
find_package(cetlib REQUIRED)
find_package(cetlib_except REQUIRED)
find_package(CLHEP REQUIRED)
find_package(ROOT COMPONENTS Core Physics Geom GeomPainter MathMore EG TreePlayer FFTW EGPythia6 Gui Tree REQUIRED)
find_package(dk2nudata REQUIRED)
find_package(dk2nugenie REQUIRED)
find_package(PostgreSQL REQUIRED)
find_package(ifdhc REQUIRED)
find_package(ifdh_art REQUIRED)
find_package(log4cpp REQUIRED)
find_package(GSL REQUIRED)
find_package(BLAS REQUIRED)
find_package(LHAPDF REQUIRED)
find_package(LibXml2 REQUIRED)
find_package(Pythia6 REQUIRED)
find_package(GENIE REQUIRED)

# include search path
include_directories ( $ENV{GENIE_INC}/GENIE ) ### MIGRATE-ACTION-RECOMMENDED: use target_link_directories() with target semantics

# this is the order that GENIE "recommends"
# genie-config --libs
#   -lGFwMsg -lGFwReg -lGFwAlg -lGFwInt -lGFwGHEP -lGFwNum -lGFwUtl -lGFwParDat
#   -lGFwEG -lGFwNtp -lGPhXSIg -lGPhPDF -lGPhNuclSt -lGPhCmn -lGPhDcy -lGPhHadTransp
#   -lGPhHadnz -lGPhDeEx -lGPhAMNGXS -lGPhAMNGEG -lGPhChmXS -lGPhCohXS -lGPhCohEG
#   -lGPhDISXS -lGPhDISEG -lGPhDfrcXS -lGPhDfrcEG -lGPhGlwResXS -lGPhGlwResEG
#   -lGPhIBDXS -lGPhIBDEG -lGPhMNucXS -lGPhMNucEG -lGPhMEL -lGPhNuElXS -lGPhNuElEG
#   -lGPhQELXS -lGPhQELEG -lGPhResXS -lGPhResEG -lGPhStrXS
#   -lGPhStrEG -lGPhNDcy -lGTlGeo -lGTlFlx -lGTlRew

# macros
include(ArtMake)
include(BuildPlugins)

# source
add_subdirectory (nugen)
add_subdirectory (tools)

# ups - table and config files

# packaging utility

cet_cmake_config()

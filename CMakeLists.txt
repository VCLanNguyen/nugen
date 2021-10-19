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

cet_set_compiler_flags(DIAGS CAUTIOUS WERROR
                       NO_UNDEFINED
                       EXTRA_FLAGS -pedantic
                       EXTRA_CXX_FLAGS -Wno-unused-local-typedefs -Wno-variadic-macros)
cet_report_compiler_flags(REPORT_THRESHOLD VERBOSE)

# these are minimum required versions, not the actual product versions
find_ups_product( art ) ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
find_ups_product(art_root_io) ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
find_ups_product(canvas_root_io) ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
find_ups_product( genie ) ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
find_ups_product( dk2nugenie ) ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
find_ups_product( clhep ) ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
find_ups_product( lhapdf ) ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
find_ups_product( dk2nudata ) ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
find_ups_product( libwda ) ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
find_ups_product( postgresql ) ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
find_ups_product( nusimdata ) ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
find_ups_product( cetlib ) ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
find_ups_product( cetlib_except ) ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
find_ups_product( ifdhc ) ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
find_ups_product( ifdh_art ) ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
find_ups_product( log4cpp ) ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
find_ups_root()

message(STATUS "ROOTSYS is ${ROOTSYS}")

## find_library directives
# other dependencies
cet_find_library( PYTHIA6 NAMES Pythia6 PATHS ENV PYLIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
cet_find_library( LHAPDF NAMES LHAPDF PATHS ENV LHAPDF_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
cet_find_library( LOG4CPP NAMES log4cpp PATHS ENV LOG4CPP_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
cet_find_library( XML2 NAMES xml2 PATHS ENV LIBXML2_FQ_DIR PATH_SUFFIXES lib NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking

# these are the POST-R-3 library names

  cet_find_library( GFWMSG       NAMES GFwMsg       PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GFWREG       NAMES GFwReg       PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GFWALG       NAMES GFwAlg       PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GFWINT       NAMES GFwInt       PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GFWGHEP      NAMES GFwGHEP      PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GFWNUM       NAMES GFwNum       PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GFWUTL       NAMES GFwUtl       PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GFWPARDAT    NAMES GFwParDat    PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GFWEG        NAMES GFwEG        PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GFWNTP       NAMES GFwNtp       PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHXSIG      NAMES GPhXSIg      PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHPDF       NAMES GPhPDF       PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHNUCLST    NAMES GPhNuclSt    PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHCMN       NAMES GPhCmn       PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHDCY       NAMES GPhDcy       PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHHADTRANSP NAMES GPhHadTransp PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHHADNZ     NAMES GPhHadnz     PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHDEEX      NAMES GPhDeEx      PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHAMNGXS    NAMES GPhAMNGXS    PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHAMNGEG    NAMES GPhAMNGEG    PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHCHMXS     NAMES GPhChmXS     PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHCOHXS     NAMES GPhCohXS     PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHCOHEG     NAMES GPhCohEG     PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHDISXS     NAMES GPhDISXS     PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHDISEG     NAMES GPhDISEG     PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHDFRCXS    NAMES GPhDfrcXS    PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHDFRCEG    NAMES GPhDfrcEG    PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHGLWRESXS  NAMES GPhGlwResXS  PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHGLWRESEG  NAMES GPhGlwResEG  PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHIBDXS     NAMES GPhIBDXS     PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHIBDEG     NAMES GPhIBDEG     PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHMNUCXS    NAMES GPhMNucXS    PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHMNUCEG    NAMES GPhMNucEG    PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHMEL       NAMES GPhMEL       PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHNUELXS    NAMES GPhNuElXS    PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHNUELEG    NAMES GPhNuElEG    PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHQELXS     NAMES GPhQELXS     PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHQELEG     NAMES GPhQELEG     PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHRESXS     NAMES GPhResXS     PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHRESEG     NAMES GPhResEG     PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHSTRXS     NAMES GPhStrXS     PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHSTREG     NAMES GPhStrEG     PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GPHNDCY      NAMES GPhNDcy      PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GTLGEO       NAMES GTlGeo       PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GTLFLX       NAMES GTlFlx       PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking

#parse_ups_version( ${GENIE_VERSION} )
#MESSAGE("--NUGEN-- GENIE_VERSION=${GENIE_VERSION} parse to ${VMAJ} ${VMIN}")

# don't rely on UPS naming
execute_process(COMMAND genie-config --version OUTPUT_VARIABLE GCV)
# result has an annoying \n
string(STRIP "${GCV}" GENIE_CONFIG_VERSION)
# assume form MAJOR.MINOR.TINY
string(FIND ${GENIE_CONFIG_VERSION} "." GCVFIRST)
string(FIND ${GENIE_CONFIG_VERSION} "." GCVLAST REVERSE)
# don't want to include "." for start
math(EXPR GCVMINORS ${GCVFIRST}+1)
math(EXPR GCVMINORL ${GCVLAST}-${GCVFIRST}-1)

string(SUBSTRING "${GENIE_CONFIG_VERSION}" 0 ${GCVFIRST} VMAJ)
string(SUBSTRING "${GENIE_CONFIG_VERSION}" ${GCVMINORS} ${GCVMINORL} VMIN)
#MESSAGE("--NUGEN-- GCV=${GCV} GENIE_CONFIG_VERSION=${GENIE_CONFIG_VERSION} parse to VMAJ ${VMAJ} VMIN ${VMIN} from ${GCVFIRST} ${GCVLAST} start ${GCVMINORS} len ${GCVMINORL}")

  # if GENIE's Reweight gets spun into separate product
  # then the following must change for GENIE_LIB to ? GENIERW_LIB
  cet_find_library( GRWFWK       NAMES GRwFwk       PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GRWIO        NAMES GRwIO        PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_library( GRWCLC       NAMES GRwClc       PATHS ENV GENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking

  # GENIE pre-R-3 used GSL via ROOT's Math libs, now makes direct call not available via that route
  find_ups_product(gsl) ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
  cet_find_package(BLAS)
  if (BLAS_FOUND)
    set(BLAS ${BLAS_LIBRARIES})
  else()
    set(BLAS GSL::gslcblas)
  endif()

# this is the order that GENIE "recommends"
# genie-config --libs
#   -lGFwMsg -lGFwReg -lGFwAlg -lGFwInt -lGFwGHEP -lGFwNum -lGFwUtl -lGFwParDat
#   -lGFwEG -lGFwNtp -lGPhXSIg -lGPhPDF -lGPhNuclSt -lGPhCmn -lGPhDcy -lGPhHadTransp
#   -lGPhHadnz -lGPhDeEx -lGPhAMNGXS -lGPhAMNGEG -lGPhChmXS -lGPhCohXS -lGPhCohEG
#   -lGPhDISXS -lGPhDISEG -lGPhDfrcXS -lGPhDfrcEG -lGPhGlwResXS -lGPhGlwResEG
#   -lGPhIBDXS -lGPhIBDEG -lGPhMNucXS -lGPhMNucEG -lGPhMEL -lGPhNuElXS -lGPhNuElEG
#   -lGPhQELXS -lGPhQELEG -lGPhResXS -lGPhResEG -lGPhStrXS
#   -lGPhStrEG -lGPhNDcy -lGTlGeo -lGTlFlx -lGTlRew

  set (GENIE_LIB_LIST GFWMSG
                      GFWREG
                      GFWALG
                      GFWINT
                      GFWGHEP
                      GFWNUM
                      GSL  # FWNUM relies on GSL
                      GFWUTL
                      GFWPARDAT
                      GFWEG
                      GFWNTP
                      GPHXSIG
                      GPHPDF
                      GPHNUCLST
                      GPHCMN
                      GPHDCY
                      GPHHADTRANSP
                      GPHHADNZ
                      GPHDEEX
                      GPHAMNGXS
                      GPHAMNGEG
                      GPHCHMXS
                      GPHCOHXS
                      GPHCOHEG
                      GPHDISXS
                      GPHDISEG
                      GPHDFRCXS
                      GPHDFRCEG
                      GPHGLWRESXS
                      GPHGLWRESEG
                      GPHIBDXS
                      GPHIBDEG
                      GPHMNUCXS
                      GPHMNUCEG
                      GPHMEL
                      GPHNUELXS
                      GPHNUELEG
                      GPHQELXS
                      GPHQELEG
                      GPHRESXS
                      GPHRESEG
                      GPHSTRXS
                      GPHSTREG
                      GPHNDCY
                      GTLGEO
                      GTLFLX
                      GRWFWK
                      GRWIO
                      GRWCLC
                      BLAS
                      ROOT_EGPYTHIA6
                      ${ROOT_EVE_LIB_LIST}
                      )


# dk2nu
cet_find_library( DK2NU_TREE  NAMES dk2nuTree  PATHS ENV DK2NUDATA_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
cet_find_library( DK2NU_GENIE NAMES dk2nuGenie PATHS ENV DK2NUGENIE_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking

# ifdhc
cet_find_library( IFDH NAMES ifdh PATHS ENV IFDHC_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
include_directories( $ENV{IFDHC_FQ_DIR}/inc ) ### MIGRATE-ACTION-RECOMMENDED: use target_link_directories() with target semantics

# ifdhc_art  # as a service
cet_find_library( IFDH_SERVICE NAMES IFDH_service PATHS ENV IFDH_ART_LIB NO_DEFAULT_PATH ) ### MIGRATE-ACTION-RECOMMENDED: use of ENV ... may be UPS-dependent ### MIGRATE-ACTION-RECOMMENDED: use cet_find_package() with target semantics for linking
include_directories( $ENV{IFDH_ART_FQ_DIR}/inc ) ### MIGRATE-ACTION-RECOMMENDED: use target_link_directories() with target semantics

# macros
include(ArtMake)
include(BuildPlugins)

# include search path
include_directories ( $ENV{GENIE_INC}/GENIE ) ### MIGRATE-ACTION-RECOMMENDED: use target_link_directories() with target semantics
include_directories ( $ENV{LIBXML2_INC} ) ### MIGRATE-ACTION-RECOMMENDED: use target_link_directories() with target semantics

# source
add_subdirectory (nugen)
add_subdirectory (tools)

# ups - table and config files

# packaging utility

cet_cmake_config()

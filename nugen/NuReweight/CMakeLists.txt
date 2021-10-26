
art_make_library(
  LIBRARIES PRIVATE
    log4cpp::log4cpp
    XML2
    PYTHIA6
    LHAPDF::LHAPDF
    ${GENIE_LIB_LIST}
    GSL::gsl  # FWNUM relies on GSL
    BLAS::BLAS
    ROOT::EGPythia6
    ${ROOT_EVE_LIB_LIST}
    ROOT::Core
)

install_headers()
install_fhicl()
install_source()

add_subdirectory(art)


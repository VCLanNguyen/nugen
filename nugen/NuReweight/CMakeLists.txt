
art_make_library(
  LIBRARIES PRIVATE
    nusimdata::SimulationBase
    log4cpp::log4cpp
    LibXml2::LibXml2
    Pythia6::Pythia6
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


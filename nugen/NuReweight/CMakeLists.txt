
art_make_library(
  LIBRARIES PRIVATE
    LOG4CPP
    XML2
    PYTHIA6
    LHAPDF
    ${GENIE_LIB_LIST}
                        ROOT::EGPythia6
                        ${ROOT_EVE_LIB_LIST}
    ROOT::Core
)

install_headers()
install_fhicl()
install_source()

add_subdirectory(art)


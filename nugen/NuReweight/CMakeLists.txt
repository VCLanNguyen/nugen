art_make( ### MIGRATE-ACTION-RECOMMENDED: use art_make_library(), art_dictionary(), simple_plugin() with explicit source lists
  LIB_LIBRARIES
    LOG4CPP
    XML2
    PYTHIA6
    LHAPDF
    ${GENIE_LIB_LIST}
    ${ROOT_BASIC_LIB_LIST}
)

install_headers()
install_fhicl()
install_source()

add_subdirectory(art)


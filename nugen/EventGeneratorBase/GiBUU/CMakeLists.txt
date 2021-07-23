
art_make( LIB_LIBRARIES nugen_EventGeneratorBase_GENIE
                        nusimdata_SimulationBase
                        art::Utilities
                        canvas::canvas
                        messagefacility::MF_MessageLogger
                        ${MF_UTILITIES}
                        fhiclcpp::fhiclcpp
                        cetlib::cetlib
                        XML2
                        LOG4CPP
                        PYTHIA6
                        LHAPDF
                        ${GENIE_LIB_LIST}
                        IFDH
                        ${ROOT_GEOM}
                        ${ROOT_GEOMPAINTER}
                        ${ROOT_BASIC_LIB_LIST} )

install_headers()
install_fhicl()
install_source()

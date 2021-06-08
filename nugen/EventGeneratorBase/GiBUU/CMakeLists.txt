
art_make( LIB_LIBRARIES nugen_EventGeneratorBase_GENIE
                        nusimdata_SimulationBase
                        art_Utilities
                        canvas
                        messagefacility::MF_MessageLogger
                        messagefacility::headers
                        fhiclcpp::fhiclcpp fhiclcpp::types
                        ${CETLIB}
                        ${XML2}
                        ${LOG4CPP}
                        ${PYTHIA6}
                        ${LHAPDF}
                        ${GENIE_LIB_LIST}
                        ${IFDH}
                        ${ROOT_GEOM}
                        ${ROOT_GEOMPAINTER}
                        ${ROOT_BASIC_LIB_LIST} )

install_headers()
install_fhicl()
install_source()

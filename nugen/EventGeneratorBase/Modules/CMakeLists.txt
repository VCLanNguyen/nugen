
art_make( MODULE_LIBRARIES nusimdata_SimulationBase
                        nugen_EventGeneratorBase_GENIE
                        art_Framework_Services_Optional_RandomNumberGenerator_service
                        art_Framework_Services_Registry
                        ${MF_MESSAGELOGGER}
                        ${MF_UTILITIES}
                        ${FHICLCPP}
                        ${CETLIB}
                        LOG4CPP
                        XML2
                        PYTHIA6
                        LHAPDF
                        ${GENIE_LIB_LIST}
                        ${CLHEP}
                        DK2NU_TREE
                        ${ROOT_BASIC_LIB_LIST}
                        ${ROOT_MATHMORE}
                        ${ROOT_EG}
                        ${ROOT_TREEPLAYER}
                        ${ROOT_FFTW}
                        ${ROOT_REFLEX}
                        ROOT::EGPythia6
                        ${ROOT_GUI}
                        )

install_headers()
install_fhicl()
install_source( README )

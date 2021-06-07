
art_make( LIB_LIBRARIES nugen_EventGeneratorBase_GENIE
                        nusimdata_SimulationBase
                        art_Utilities
                        canvas
                        ${MF_MESSAGELOGGER}
                        ${MF_UTILITIES}
                        ${FHICLCPP}
                        ${CETLIB}
                        ${XML2}
                        ${LOG4CPP}
                        ${PYTHIA6}
                        ${LHAPDF}
                        ${GENIE_LIB_LIST}
                        ${IFDH}
                        ROOT::Geom
                        ROOT::GeomPainter
                        ${ROOT_LIBRARIES} )

install_headers()
install_fhicl()

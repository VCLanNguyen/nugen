
art_make( LIB_LIBRARIES nugen_EventGeneratorBase_GENIE ### MIGRATE-ACTION-RECOMMENDED: use art_make_library(), art_dictionary(), simple_plugin() with explicit source lists
                        nusimdata::SimulationBase
                        art::Utilities
                        canvas::canvas
                        messagefacility::MF_MessageLogger
                        fhiclcpp::fhiclcpp
                        cetlib::cetlib
                        XML2
                        LOG4CPP
                        PYTHIA6
                        LHAPDF
                        ${GENIE_LIB_LIST}
                        IFDH
                        ROOT::Geom
                        ROOT::GeomPainter
                        ROOT::Core )

install_headers()
install_fhicl()
install_source()

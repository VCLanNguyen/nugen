
art_make( MODULE_LIBRARIES nusimdata::SimulationBase ### MIGRATE-ACTION-RECOMMENDED: use art_make_library(), art_dictionary(), simple_plugin() with explicit source lists
                        nugen_EventGeneratorBase_GENIE
                        art::Framework_Services_Optional_RandomNumberGenerator_service
                        art::Framework_Services_Registry
                        messagefacility::MF_MessageLogger
                        fhiclcpp::fhiclcpp
                        cetlib::cetlib
                        LOG4CPP
                        XML2
                        PYTHIA6
                        LHAPDF
                        ${GENIE_LIB_LIST}
                        CLHEP::CLHEP
                        dk2nu::Tree
                        ROOT::Core
                        ROOT::MathMore
                        ROOT::EG
                        ROOT::TreePlayer
                        ROOT::FFTW
                        ROOT::EGPythia6
                        ROOT::Gui
                        )

install_headers()
install_fhicl()
install_source( README )


art_make( EXCLUDE EventGeneratorTest_module.cc ### MIGRATE-ACTION-RECOMMENDED: use art_make_library(), art_dictionary(), simple_plugin() with explicit source lists
          MODULE_LIBRARIES nusimdata::SimulationBase
                           nugen_EventGeneratorBase_GENIE
                        art::Framework_Services_Optional_RandomNumberGenerator_service
                        art::Framework_Services_Registry
# for MixGenieEvents_module
#                        art::Framework_Principal
#                        art_root_io_TFileService_service
#                        art::Framework_IO_ProductMix
#                        art_root_io
#                        art_root_io_tfile_support ROOT::Core
# end-of-list for MixGenieEvents_module
                        messagefacility::MF_MessageLogger
                        
                        fhiclcpp::fhiclcpp
                        cetlib::cetlib
                        LOG4CPP
                        XML2
                        PYTHIA6
                        LHAPDF
                        ${GENIE_LIB_LIST}
                        CLHEP
                        DK2NU_TREE
                        ${ROOT_BASIC_LIB_LIST}
                        ROOT::EG
                        ROOT::TreePlayer
                        ROOT::FFTW
                        ${ROOT_REFLEX}
                        ROOT::EGPythia6
                        ROOT::Gui
                        )

install_headers()
install_fhicl()
install_source( EXTRAS README )

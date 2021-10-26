
set( NURW_LIBS art::Framework_Services_Registry
               art_root_io::tfile_support ROOT::Core
               art_root_io::TFileService_service
               art::Framework_Core
               art::Persistency_Common
               art::Framework_IO_Sources
               art_root_io::art_root_io
               art_root_io::RootInput_source
               art::Framework_Principal
               art::Persistency_Provenance
               art::Utilities
               canvas::canvas
               messagefacility::MF_MessageLogger
               fhiclcpp::fhiclcpp
               cetlib::cetlib
               cetlib_except::cetlib_except
               nugen_EventGeneratorBase_GENIE
               log4cpp::log4cpp
               XML2
               PYTHIA6
               LHAPDF
               ${GENIE_LIB_LIST}
               GSL::gsl  # FWNUM relies on GSL
               BLAS::BLAS
               ROOT::EGPythia6
               ${ROOT_EVE_LIB_LIST}
               ROOT::Core
               ROOT::EG
               ROOT::TreePlayer
               ROOT::FFTW
               ROOT::EGPythia6
               ROOT::Gui
           )

art_make_library( SOURCE NuReweight.cxx
                  LIBRARIES PRIVATE nusimdata::SimulationBase
                            nugen_NuReweight
                            ${NURW_LIBS} )

cet_build_plugin( ReweightAna art::module
                  LIBRARIES PRIVATE nugen_NuReweight_art
                            nugen_NuReweight
                            nusimdata::SimulationBase
                            ${NURW_LIBS} )

install_headers()
install_fhicl()
install_source()


set( NURW_LIBS art::Framework_Services_Registry
               art_root_io::tfile_support ${ROOT_CORE}
               art_root_io::TFileService_service
               art::Framwork_Core
               art_Persistency_Common
               art::Framework_IO_Sources
               art_root_io::art_root_io
               art_root_io::RootInput_source
               art::Framework_Principal
               art_Persistency_Provenance
               art_Utilities
               canvas
               messagefacility::MF_MessageLogger
               messagefacility::headers
               fhiclcpp::fhiclcpp fhiclcpp::types
               cetlib
               cetlib_except
               nugen_EventGeneratorBase_GENIE
               ${LOG4CPP}
               ${XML2}
               ${PYTHIA6}
               ${LHAPDF}
               ${GENIE_LIB_LIST}
               ${ROOT_BASIC_LIB_LIST}
               ${ROOT_EG}
               ${ROOT_TREEPLAYER}
               ${ROOT_FFTW}
               ${ROOT_REFLEX}
               ${ROOT_EGPYTHIA6}
               ${ROOT_GUI}
           )

art_make_library( SOURCE NuReweight.cxx
                  LIBRARIES nusimdata_SimulationBase
                            nugen_NuReweight
                            ${NURW_LIBS} )

simple_plugin( ReweightAna module nugen_NuReweight_art
                                  nugen_NuReweight
                                  nusimdata_SimulationBase
                                 ${NURW_LIBS} )

install_headers()
install_fhicl()
install_source()

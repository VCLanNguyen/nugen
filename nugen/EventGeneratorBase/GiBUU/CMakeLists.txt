
art_make_library(LIBRARIES PRIVATE nugen_EventGeneratorBase_GENIE
                        nusimdata::SimulationBase
                        art::Utilities
                        canvas::canvas
                        messagefacility::MF_MessageLogger
                        fhiclcpp::fhiclcpp
                        cetlib::cetlib
                        LibXml2::LibXml2
                        log4cpp::log4cpp
                        Pythia6::Pythia6
                        LHAPDF::LHAPDF
                        ${GENIE_LIB_LIST}
                        GSL::gsl  # FWNUM relies on GSL
                        BLAS::BLAS
                        ROOT::EGPythia6
                        ${ROOT_EVE_LIB_LIST}
                        ifdh::ifdh
                        ROOT::Geom
                        ROOT::GeomPainter
                        ROOT::Core )

install_headers()
install_fhicl()
install_source()

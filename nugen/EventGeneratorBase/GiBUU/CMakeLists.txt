
art_make_library(LIBRARIES PRIVATE nugen_EventGeneratorBase_GENIE
                        nusimdata::SimulationBase
                        art::Utilities
                        canvas::canvas
                        messagefacility::MF_MessageLogger
                        fhiclcpp::fhiclcpp
                        cetlib::cetlib
                        XML2
                        log4cpp::log4cpp
                        PYTHIA6
                        LHAPDF
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

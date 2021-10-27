
art_make_library( LIBRARIES PRIVATE nusimdata::SimulationBase
                        art::Framework_Principal
                        art::Persistency_Provenance
                        art::Utilities
                        art::Framework_Services_Registry
                        ifdh_art::IFDH_service
                        canvas::canvas
                        messagefacility::MF_MessageLogger
                        fhiclcpp::fhiclcpp
                        cetlib::cetlib
                        cetlib_except::cetlib_except
                        LibXml2::LibXml2
                        log4cpp::log4cpp
                        PYTHIA6
                        LHAPDF::LHAPDF
                        ${GENIE_LIB_LIST}
                        GSL::gsl  # FWNUM relies on GSL
                        BLAS::BLAS
                        ROOT::EGPythia6
                        ${ROOT_EVE_LIB_LIST}
                        dk2nu::Tree
                        dk2nu::Genie
                        CLHEP::CLHEP
                        ifdh::ifdh
                        ROOT::Geom
                        ROOT::GeomPainter
                        ROOT::MathMore
                        ROOT::Core )


install_headers()
install_fhicl()
install_source()

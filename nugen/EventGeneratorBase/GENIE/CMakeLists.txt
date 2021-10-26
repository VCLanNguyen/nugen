
art_make_library( LIBRARIES nusimdata::SimulationBase
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
                        XML2
                        LOG4CPP
                        PYTHIA6
                        LHAPDF
                        ${GENIE_LIB_LIST}
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

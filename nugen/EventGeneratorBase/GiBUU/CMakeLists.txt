
art_make_library(LIBARIES nugen_EventGeneratorBase_GENIE
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
                        ifdh::ifdh
                        ROOT::Geom
                        ROOT::GeomPainter
                        ROOT::Core )

install_headers()
install_fhicl()
install_source()

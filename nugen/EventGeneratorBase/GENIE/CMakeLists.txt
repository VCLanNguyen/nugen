set( IFDH_AS_SERVICE_LIB_LIST
           art::Framework_Services_Registry
           ${Boost_SYSTEM_LIBRARY}
           IFDH_SERVICE )

art_make( LIB_LIBRARIES nusimdata_SimulationBase
                        art::Framework_Principal
                        art::Persistency_Provenance
                        art::Utilities
                        ${IFDH_AS_SERVICE_LIB_LIST}
                        canvas::canvas
                        messagefacility::MF_MessageLogger
                        ${MF_UTILITIES}
                        fhiclcpp::fhiclcpp
                        cetlib::cetlib
                        cetlib_except::cetlib_except
                        XML2
                        LOG4CPP
                        PYTHIA6
                        LHAPDF
                        ${GENIE_LIB_LIST}
                        DK2NU_TREE
                        DK2NU_GENIE
                        ${CLHEP}
                        IFDH
                        ${ROOT_GEOM}
                        ${ROOT_GEOMPAINTER}
                        ${ROOT_MATHMORE}
                        ${ROOT_BASIC_LIB_LIST} )


install_headers()
install_fhicl()
install_source()

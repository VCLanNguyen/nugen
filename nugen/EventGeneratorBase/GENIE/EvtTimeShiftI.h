////////////////////////////////////////////////////////////////////////
/// \file  EvtTimeShiftI.h
/// \class evgb::EvtTimeShiftI
/// \brief interface for event time distribution
///
///        Specific implementations of this class when are used to
///        generate appropriate times relative to the t0 of a 'record'
///        (spill/snarl/trigger...).
///
///        Concrete instances of this interface must be configurable
///        from a string.
///
/// \author  Robert Hatcher <rhatcher \at fnal.gov>
///          Fermi National Accelerator Laboratory
///
/// \created 2015-06-22
/// \version $Id: EvtTimeShiftI.h,v 1.1 2015/06/30 18:01:24 rhatcher Exp $
////////////////////////////////////////////////////////////////////////

#ifndef SIMB_EVTTIMEDISTI_H
#define SIMB_EVTTIMEDISTI_H

#include <string>
#include <vector>
#include "TRandom.h"  // ROOT's random # base class

// nusimdata includes
#include "nusimdata/SimulationBase/MCFlux.h"

namespace evgb {

  class EvtTimeShiftI {

  public:

    EvtTimeShiftI(const std::string& config);
    virtual ~EvtTimeShiftI();

    //
    // define the EvtTimeShiftI interface:
    //

    /// each schema must take a string that configures it
    /// it is up to the individual model to parse said string
    /// and extract parameters
    virtual void      Config(const std::string& config ) = 0;

    /// return time (in nanoseconds) for an interaction/event
    /// within a record/spill/snarl
    ///
    /// version taking array might be used for relative batch fractions
    /// that vary on a record-by-record basis
    virtual double    TimeOffset() = 0;
    virtual double    TimeOffset(std::vector<double> v) = 0;
    virtual double    TimeOffset(simb::MCFlux &flux) = 0;

    /// provide a means of printing the configuration
    virtual void     PrintConfig(bool verbose=true) = 0;


    ///
    /// Allow users some control over random # sequences
    /// An "owned" object is expected to be deleted by the EvtTimeShift obj
    ///
    TRandom*         GetRandomGenerator()      const { return fRndmGen; }
    bool             IsRandomGeneratorOwned()  const { return fIsOwned; }
    bool             IsRandomGeneratorSeeded() const { return fIsSeeded; }

    void             SetRandomGenerator(TRandom* gen, bool isOwned);

  protected:

    std::vector<std::string>   GetConfigTokens(const std::string& config);

    TRandom*         fRndmGen;
    bool             fIsOwned;
    bool             fIsSeeded;

  };

} // namespace evgb

#endif //SIMB_EVTTIMEDISTI_H

import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean

structure StateOfChargePackage where
  socEstimate : Prop
  coulombCounting : Prop
  kalmanFilter : Prop
  ocvBasedEstimation : Prop
  socErrorBound : Prop

structure StateOfChargeEvidence (S : StateOfChargePackage) where
  socEstimateClosed : S.socEstimate
  coulombCountingClosed : S.coulombCounting
  kalmanFilterClosed : S.kalmanFilter
  ocvBasedEstimationClosed : S.ocvBasedEstimation
  socErrorBoundClosed : S.socErrorBound

def StateOfChargeClosed (S : StateOfChargePackage) : Prop :=
  S.socEstimate ∧ S.coulombCounting ∧ S.kalmanFilter ∧ S.ocvBasedEstimation ∧ S.socErrorBound

theorem state_of_charge_closed_from_evidence (S : StateOfChargePackage) (E : StateOfChargeEvidence S) :
    StateOfChargeClosed S := by
  exact And.intro E.socEstimateClosed
    (And.intro E.coulombCountingClosed
      (And.intro E.kalmanFilterClosed
        (And.intro E.ocvBasedEstimationClosed E.socErrorBoundClosed)))

end ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean
end HautevilleHouse
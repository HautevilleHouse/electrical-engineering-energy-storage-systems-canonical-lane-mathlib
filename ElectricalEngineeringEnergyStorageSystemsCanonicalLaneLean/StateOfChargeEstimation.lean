import HautevilleHouse.ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean.BatteryModel

namespace HautevilleHouse
namespace ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean

structure StateOfChargeEstimationPackage {B : BatteryModelPackage} where
  kalmanFilter : Type u
  coulombCounting : Type v
  machineLearningModel : Type w
  estimationErrorBound : Prop
  convergenceRate : Prop

structure StateOfChargeEstimationEvidence {B : BatteryModelPackage} (S : StateOfChargeEstimationPackage B) where
  estimationErrorBoundClosed : S.estimationErrorBound
  convergenceRateClosed : S.convergenceRate

def StateOfChargeEstimationClosed {B : BatteryModelPackage} (S : StateOfChargeEstimationPackage B) : Prop :=
  S.estimationErrorBound ∧ S.convergenceRate

theorem soc_estimation_closed_from_evidence {B : BatteryModelPackage} (S : StateOfChargeEstimationPackage B) (E : StateOfChargeEstimationEvidence S) : StateOfChargeEstimationClosed S :=
  And.intro E.estimationErrorBoundClosed E.convergenceRateClosed

end ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean
end HautevilleHouse
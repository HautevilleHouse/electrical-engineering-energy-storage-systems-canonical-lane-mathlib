import canonicalLaneMathlib.AdmissibleClass

/-!
# Battery Equivalent Circuit Model Package
-/

namespace HautevilleHouse
namespace ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean

structure EquivalentCircuitModel where
  internalResistance : ℝ
  openCircuitVoltage : ℝ → ℝ  -- function of SoC
  rcPairs : Nat  -- number of RC pairs
  capacitance : ℝ
  inductance : ℝ

def modelValidity (m : EquivalentCircuitModel) : Prop :=
  m.internalResistance > 0 ∧ m.capacitance > 0 ∧ m.rcPairs ≥ 0

structure ModelValidation where
  model : EquivalentCircuitModel
  validity : modelValidity model

def ModelClosed (m : EquivalentCircuitModel) : Prop :=
  modelValidity m ∧ True

theorem model_closed_from_evidence (m : EquivalentCircuitModel) (v : modelValidity m) :
    ModelClosed m := by
  exact And.intro v trivial

end ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean
end HautevilleHouse
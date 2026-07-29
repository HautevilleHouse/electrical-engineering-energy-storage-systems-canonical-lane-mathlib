import ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean

def ConstrainedEnergyStorageClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_energy_storage_endgame (A : AdmissibleClass) :
    ConstrainedEnergyStorageClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean
end HautevilleHouse
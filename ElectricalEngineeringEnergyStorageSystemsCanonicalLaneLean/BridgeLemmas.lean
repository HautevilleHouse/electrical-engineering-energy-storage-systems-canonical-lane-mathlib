import ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.validOperation ∧ A.object.initialSoC

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean
end HautevilleHouse
import ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean.BatteryChemistry

namespace HautevilleHouse
namespace ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean

structure EnergyStorageAdmittedObject where
  batterySystem : BatteryChemistryPackage
  validOperation : Prop
  initialSoC : Prop
  conclusion : validOperation ∧ initialSoC

structure AdmissibleClass where
  object : EnergyStorageAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.validOperation ∧ A.object.initialSoC) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean

structure BatteryModelPackage where
  nominalVoltage : Prop
  capacityAh : Prop
  internalResistance : Prop
  socOcvCurve : Prop
  thermalCoefficients : Prop

structure BatteryModelEvidence (B : BatteryModelPackage) where
  nominalVoltageClosed : B.nominalVoltage
  capacityAhClosed : B.capacityAh
  internalResistanceClosed : B.internalResistance
  socOcvCurveClosed : B.socOcvCurve
  thermalCoefficientsClosed : B.thermalCoefficients

def BatteryModelClosed (B : BatteryModelPackage) : Prop :=
  B.nominalVoltage ∧ B.capacityAh ∧ B.internalResistance ∧ B.socOcvCurve ∧ B.thermalCoefficients

theorem battery_model_closed_from_evidence (B : BatteryModelPackage) (E : BatteryModelEvidence B) :
    BatteryModelClosed B := by
  exact And.intro E.nominalVoltageClosed
    (And.intro E.capacityAhClosed
      (And.intro E.internalResistanceClosed
        (And.intro E.socOcvCurveClosed E.thermalCoefficientsClosed)))

end ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean
end HautevilleHouse
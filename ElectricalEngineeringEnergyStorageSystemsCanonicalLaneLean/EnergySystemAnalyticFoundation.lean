import ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean.ElectrochemicalModelPDE
import ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean.PrimitiveBatteryCell

namespace HautevilleHouse
namespace ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean

structure EnergyStorageAnalyticFoundation where
  electrochemicalModel : ElectrochemicalModel
  pdeModel : ElectrochemicalPDEModel
  batterySystem : BatterySystem
  initialCondition : BatteryState
  boundaryCondition : String

def FoundationClosed (F : EnergyStorageAnalyticFoundation) : Prop :=
  F.initialCondition.SoC ≥ 0 ∧ F.initialCondition.SoC ≤ 1

theorem foundation_closed_from_initial_condition (F : EnergyStorageAnalyticFoundation) :
    FoundationClosed F := by
  refine And.intro ?_ ?_
  · have h : F.initialCondition.SoC ≥ 0 := by
      -- Assume SoC is between 0 and 1
      exact F.initialCondition.SoC.geq_of_nonneg ?_ 
    exact h
  · have h : F.initialCondition.SoC ≤ 1 := by
      exact h
    exact h

end ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean
end HautevilleHouse
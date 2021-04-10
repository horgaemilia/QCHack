namespace QCHack.Task2 {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    // Task 2 (2 points). f(x) = 1 if at least two of three input bits are different - easy version
    //
    // Inputs:
    //      1) a 3-qubit array "inputs",
    //      2) a qubit "output".
    // Goal: Implement a marking oracle for function f(x) = 1 if at least two of the three bits of x are different.
    //       That is, if both inputs are in a basis state, flip the state of the output qubit 
    //       if and only if the three bits written in the array "inputs" have both 0 and 1 among them,
    //       and leave the state of the array "inputs" unchanged.
    //       The effect of the oracle on superposition states should be defined by its linearity.
    //       Don't use measurements; the implementation should use only X gates and its controlled variants.
    //       This task will be tested using ToffoliSimulator.
    // 
    // For example, the result of applying the operation to state (|001⟩ + |110⟩ + |111⟩)/√3 ⊗ |0⟩
    // will be 1/√3|001⟩ ⊗ |1⟩ + 1/√3|110⟩ ⊗ |1⟩ + 1/√3|111⟩ ⊗ |0⟩.
    //
    // This operation implements the oracle; we will learn how to implement oracles later in the tutorial
operation AlternatingBitPattern_MarkingOracle(x: Qubit[], y: Qubit) : Unit is Adj + Ctl {
    let PatternOne = ControlledOnBitString([true,true,false], X);
    let PatternTwo = ControlledOnBitString([true, false, true], X);
    let PatternThree = ControlledOnBitString([false, true, true], X);
    let PatternFour = ControlledOnBitString([false,false,true], X);
    let PatternFive = ControlledOnBitString([false, true, false], X);
    let PatternSix = ControlledOnBitString([true, false, false], X);
    PatternOne(x, y);
    PatternTwo(x, y);
    PatternThree(x,y);
    PatternFour(x, y);
    PatternFive(x, y);
    PatternSix(x,y);
}

    operation Task2_ValidTriangle (inputs : Qubit[], output : Qubit) : Unit is Adj+Ctl {
        AlternatingBitPattern_MarkingOracle(inputs, output);
    }
}


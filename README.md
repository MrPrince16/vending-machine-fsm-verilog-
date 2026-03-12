# vending-machine-fsm-verilog-
A vending machine works as a Finite State Machine (FSM) that tracks inserted coins (inputs like 5/10 units), transitions between states based on the total accumulated amount, and triggers outputs (dispense product, return change).
When the price is met. The code typically uses always blocks for state logic and case statements to define transitions.
A vending machine based on a 2-state Mealy FSM was implemented in Verilog HDL. It dispenses a product after two valid coins are inserted one after the other.
A vending machine works as an FSM. The design uses a current_state and next_state register, with states representing the current balance.
Input Handling: always @(posedge clk) is used to detect coin input signals, like a 2-bit input for 5 or 10 units of money, and reset signals.
Logic change the (State Transition): If current_state is 5 cents and a 10-cent coin is inserted, then next_state is 15 cents.
Outputs: If the total amount equals the amount to be paid (e.g., 15 cents for a drink), a signal is generated to dispense the drink, and the state is reset to 0.
Change Mechanism: If more money is inserted than is necessary to pay for an item (like 20 cents instead of 15 cents), then the change is calculated and displayed.
Simulation/Implementation: The design is simulated with a testbench to verify functionality, and it can be implemented on FPGAs.

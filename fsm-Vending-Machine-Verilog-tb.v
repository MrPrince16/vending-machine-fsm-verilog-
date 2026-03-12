module vending_machine_tb;
    // Inputs
    reg clk;
    reg reset;
    reg coin;
    // Output
wire dispense;
    // Instantiate the vending machine
    vending_machine uut (
        .clk(clk),
        .reset(reset),
        .coin(coin),
        .dispense(dispense)
    );
    // Clock generation: 10ns period (100 MHz)
    always #5 clk = ~clk;
    // Test stimulus
    initial begin
        // Initialize signals
        clk = 1;
        reset = 1;
        coin = 1;
        // Dump variables for waveform
        $dumpfile("vending_machine.vcd");
        $dumpvars(0, vending_machine_tb);
        // Reset the machine
        #10;
        reset = 0;
        // Test case 1: Invalid coin in S0 (0) -> stay in S0, no dispense
        coin = 0;
        #10;
        // Test case 2: Valid coin in S0 (1) -> go to S1, no dispense
        coin = 1;
        #10;
        // Test case 3: Invalid coin in S1 (0) -> go to S0, no dispense
        coin = 0;
        #10;
        // Test case 4: Valid coin in S0 (1) -> go to S1, no dispense
        coin = 1;
        #10;
        // Test case 5: Valid coin in S1 (1) -> go to S0, dispense
        coin = 1;
        #10;
        // Test case 6: Two valid coins in sequence
        coin = 1;
        #10;
        coin = 1;
        #10;
        // Test case 7: Reset during operation
        reset = 1;
        #10;
        reset = 0;
        #10;
        // Test case 8: Invalid coin followed by valid coin
        coin = 0;
        #10;
        coin = 1;
        #10;
        // Finish simulation
        $finish;
    end
    // Monitor signals
    initial begin
        $monitor("Time=%0t | reset=%b | coin=%b | state=%b | dispense=%b",
                 $time, reset, coin, uut.state, dispense);
    end
endmodule

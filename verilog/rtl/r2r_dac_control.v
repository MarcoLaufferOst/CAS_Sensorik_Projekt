module r2r_dac_control(
    input wire clk,              // Clock input
    input wire reset,            // Reset input
    input wire comp,             // Comparator signal input
    output reg [7:0] data_out    // 8-bit converted output
);

    reg [7:0] out_data;          // Intermediate data register
    reg [2:0] bit_index;         // Current bit index (MSB to LSB)
    reg state;                   // State machine state: 0 = Set bit, 1 = Evaluate comparator

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            out_data <= 8'b0;     // Reset the intermediate data
            bit_index <= 3'd7;   // Start with the MSB
            state <= 0;          // Start with setting the MSB
        end else begin
            case (state)
                0: begin
                    // State 0: Set the current bit
                    out_data[bit_index] <= 1'b1;
                    state <= 1;  // Move to evaluation state
                end
                1: begin
                    // State 1: Evaluate comparator
                    if (comp == 1'b1) begin
                        // Keep the current bit if comparator is high
                        if (bit_index > 0) begin
                            bit_index <= bit_index - 1;
                            out_data[bit_index - 1] <= 1'b1;
                            state <= 1;  // Go back to setting the next bit
                        end
                    end else begin
                        // Clear the current bit if comparator is low
                        out_data[bit_index] <= 1'b0;
                        if (bit_index > 0) begin
                            bit_index <= bit_index - 1;
                            out_data[bit_index - 1] <= 1'b1;
                            state <= 1;  // Check next bit
                        end
                    end
                end
            endcase
        end
    end

    // Combinational process to assign inverted out_data to data_out
    always @(*) begin
        data_out = ~out_data;
    end

endmodule

module ALU (
    input clk,                // Clock signal
    input [3:0] A,            // 4-bit input A
    input [3:0] B,            // 4-bit input B
    input [1:0] control,      // 2-bit control signal to select operation
    output reg [3:0] result,  // 4-bit result of operation
    output reg carry_out,     // Carry out for addition
    output reg zero           // Zero flag
);
    reg [3:0] shift_reg;      // Register for SISO left shift

    always @(posedge clk) begin
        case (control)
            2'b00: begin // ADDITION
                {carry_out, result} = A + B;
                zero = (result == 4'b0000); // Zero flag
            end

            2'b01: begin // SUBTRACTION
                {carry_out, result} = A - B;
                zero = (result == 4'b0000); // Zero flag
            end

            2'b10: begin // SISO LEFT SHIFT
                if (shift_reg == 4'b0000) 
                    shift_reg = A; // Initialize the shift register with input A
                else
                    shift_reg = {shift_reg[2:0], 1'b0}; // Shift left, shift in 0

                result = shift_reg;        // Update result with shifted value
                carry_out = shift_reg[3]; // MSB shifted out
                zero = (result == 4'b0000); // Zero flag
            end

            2'b11: begin // RING COUNTER
                result = {A[2:0], A[3]}; // Rotate bits to form a ring counter
                carry_out = 0;           // No carry in ring counter
                zero = (result == 4'b0000); // Zero flag
            end
            default: begin
                result = 4'b0000;
                carry_out = 0;
                zero = 1;
            end
        endcase
    end
endmodule

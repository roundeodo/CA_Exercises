// Configurable register for variable width with enable

module reg_arstn_en_extended#(
parameter integer DATA_W     = 20,
parameter integer PRESET_VAL = 0
   )(
      input                  clk,
      input                  arst_n,
      input                  en,
      input                  flush,
      input  [ DATA_W-1:0]   din,
      output [ DATA_W-1:0]   dout
);

reg [DATA_W-1:0] r,nxt;

always@(posedge clk, negedge arst_n)begin
   if(arst_n==0)begin
      r <= PRESET_VAL;
   end else begin
      r <= nxt;
   end
end

always@(*) begin
    if(flush) begin
        nxt = PRESET_VAL;
    end

    else if(en == 1'b1)begin
        nxt = din;
    end

    else begin//stall
        nxt = r;
   end
end

assign dout = r;

endmodule

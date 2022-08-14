//HM65256BLSP hardware discrption 
// Mohamed Elamin 
// 2009 
//DE0 board



module RAM(input[14:0] Address , inout[7:0] Data , input OE , input WE , input CE);

reg[7:0] ram[14:0];
reg[14:0] address_latch ;

always @(negedge CE )
begin
address_latch = Address ; 
end

always @(posedge WE ) // read input on positve adge accoruding to Datasheet
begin
if(!CE)// 
begin
ram[address_latch] = Data ;
end

end

assign Data = (!CE & !OE & WE)? ram[Address] : 8'bZZZZZZZZ ;
//assign ram[adsress_latch] = (!CE and !WE)?  Data  : 8'bZZZZZZZZ ;


endmodule
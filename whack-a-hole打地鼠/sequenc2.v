module sequenc2
	(input clk,
	 input clr,
     output [1:0] seq
	 );//������λ�Ĵ�������ë��.m����
reg	[8:0]	lfsr;
assign	seq=lfsr[8:7];
always@(posedge clk,negedge clr)
	begin
	if(!clr)
		lfsr<=0;
	else
		begin
		lfsr[8:1]<=lfsr[7:0];
		lfsr[0]<=lfsr[8]~^lfsr[4];
		end
	end

endmodule
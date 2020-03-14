module tremble(input clk,
			input [1:0] button,
			input clr,
			output [1:0] button_d
			//output	led_t
			);
reg	[1:0]	bd0;
reg	[1:0]	bd1;
//assign	led_t=button_d[1];
assign	button_d[0]=bd0[0]&bd0[1];
assign	button_d[1]=bd1[0]&bd1[1];

always@(posedge	clk,negedge clr)//��λ�Ĵ�������ʱ100ms�ԱȽ��
	begin
	if(!clr)
		bd0[0]<=0;
	else
		begin
		bd0[0]<=button[0];
		bd0[1]<=bd0[0];
		end
	end
always@(posedge	clk,negedge clr)//��λ�Ĵ�������ʱ100ms�ԱȽ��
	begin
	if(!clr)
		bd1[0]<=0;
	else
		begin
		bd1[0]<=button[1];
		bd1[1]<=bd1[0];
		end
	end
endmodule
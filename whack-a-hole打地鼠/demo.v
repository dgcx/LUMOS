module demo
	(input clk,
	 input clr,
	 input [1:0] button,
     output [6:0] disp1_s,
     output [6:0] disp1_g,
	 output [6:0] disp2_s,
     output [6:0] disp2_g,
	 output [6:0] disp3_s,
     output [6:0] disp3_g,
	 output	[1:0] led,
	 output	led_t);

wire carry;
wire clk1s;
wire	[1:0] test_seq;
reg temp;
wire clk100ms;
reg	clk2s;
wire	clk200ms;
wire	[1:0]	button_d;

//assign	led_t=button[0];//����ѹ������

always@(posedge clk1s,negedge clr)//4s counting
     begin
        if(!clr)
			clk2s<=1'b0;
        else
            clk2s<=~clk2s; 	
     end

assign	led[0]=test_seq[0];
assign	led[1]=test_seq[1];
assign	led_t=button_d[1];
tremble	ic5(.clk(clk100ms),.button(button),.clr(clr),.button_d(button_d));//ȥ��ģ�飬����10ms��clk,ԭbutton�źţ����ȥ��button�ź�
//sequenc	ic4(.clk1s(clk1s),.clr(clr),.seq(test_seq));//������в���ģ�飬����clk,�����λ��seq����
sequenc2 ic3(.clk(clk1s),.clr(clr),.seq(test_seq));//����ë��������в���ģ�飬����clk,�����λ��seq���С�û��ë�̡�����
timer_60s ic1(.clk(clk),.clr(clr),.p(disp1_s),.q(disp1_g),.carry(carry),.clk1s(clk1s),.clk100ms(clk100ms),.clk200ms(clk200ms));
//ʱ�ӣ�����clk,clr,��������1����λʮλ����1s�ź�
mainf ic2(.seq(test_seq),.stop(carry),.clr(clr),.button(button_d),
		 .disp_s0(disp2_s),.disp_g0(disp2_g),.disp_s1(disp3_s),.disp_g1(disp3_g));

endmodule
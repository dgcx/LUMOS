module sequenc
	(input clk1s,
	 input clr,
     output reg [1:0] seq);
//wire	temp;
//reg	led;
reg	[19:0] num;
//assign	temp=num[0]&num[19];//������ë�̣�����û�ҳ�����
//assign	led_t=led;
always@(posedge clk1s,negedge clr)
//����һ���̶����д���������У��ٰ�α�����������ģ��ʵ����.����ֱ�ӿ��ƶ�������������ÿһ��仯һ�Ρ�
begin	
	if(!clr)
		begin
		num<=20'b10011000100010011001;//10011000100010011001
		
		end
	else
		begin
		num<={num[0],num[19:1]};//ѭ���������У��������λ����ʾ�ź�
		seq[0]<=num[19];
		seq[1]<=seq[0];
		end
end
//always@(posedge temp,negedge clr)
//begin	
//	if(!clr)
//		led<=0;
//	else
//		led<=~led;
//end
	
endmodule
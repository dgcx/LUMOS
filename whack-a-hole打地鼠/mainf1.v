module mainf(input clk1s,
			input [1:0] seq,
			input stop,
			input clr,
			input [1:0] button,
			output reg [6:0] disp_s,
			output reg [6:0] disp_g);//���ڲ����м���

wire result_1;//����߼���·1���������¼�Ƿ����
wire result_2;//����߼���·2���������ʱ�䵽60s�Ľ�λ�źſ���
reg [3:0] s,g;

assign result_1=(seq[0]^~button[0])&&(seq[1]^~button[1]);//�������°�����ָʾ���зֱ��Ӧʱ��result_1��Ϊ1.
//assign led_t=result_2;
assign result_2=(!stop)&&result_1;//������ʱû��ֹͣ���һ���ʱ���ǵ�һ�֡�

always@(posedge result_2,negedge clr)//Mode-60��¼�÷֡�result2��һ�������أ���һ�֡����60�֡�
     begin
        if(!clr)
          begin
           s<=4'h0;
           g<=4'h0;
          end 
        else
           if (g==4'h9)
            begin
              g<=4'h0; 
              if (s==4'h5)
                 begin
					s<=4'h0;
				 end
              else
                 s<=s+1'b1; 
            end
           else
             g<=g+1'b1; 
     end

always@(s)//display decoder
 begin
   case(s)
   	4'h0:disp_s<=7'b1000000;
   	4'h1:disp_s<=7'b1111001;
	4'h2:disp_s<=7'b0100100;
	4'h3:disp_s<=7'b0110000;
	4'h4:disp_s<=7'b0011001;
	4'h5:disp_s<=7'b0010010;
	4'h6:disp_s<=7'b0000010;
	4'h7:disp_s<=7'b1111000;
	4'h8:disp_s<=7'b0000000;
	4'h9:disp_s<=7'b0010000;
    default:disp_s<=7'b1111111;
    endcase
 end
always@(g)
 begin
   case(g)
   	4'h0:disp_g<=7'b1000000;
   	4'h1:disp_g<=7'b1111001;
	4'h2:disp_g<=7'b0100100;
	4'h3:disp_g<=7'b0110000;
	4'h4:disp_g<=7'b0011001;
	4'h5:disp_g<=7'b0010010;
	4'h6:disp_g<=7'b0000010;
	4'h7:disp_g<=7'b1111000;
	4'h8:disp_g<=7'b0000000;
	4'h9:disp_g<=7'b0010000;
    default:disp_g<=7'b1111111;
    endcase 
 end
endmodule
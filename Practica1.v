module Practica1(
		input[3:0] opCode,
		input[3:0]iA,
		input[3:0]iB,
		output[3:0]oresult,
		output[4:0] ostatus

		

);

reg[4:0] result;
reg[4:0]status;
assign oresult = result;
assign ostatus = status;

always@(*)

	begin
		case(opCode)
		4'b1100://Suma
		result= (iA+iB);
		4'b1101://Resta
		result= (iA-iB);
		4'b1110://And
		result= (iA&iB);
		4'b1111://or
		result= (iA|iB);
		4'b0000://not
		result= ~iA;
		4'b0001://xor
		result= (iA^iB);
		4'b0010://1s complement	
		result= ~iA;
		4'b0011://2s complement	
		result= (~iA)+4'b0001;
		4'b0100://arithmetic shift. left	
		result= iA<<<1;
		4'b0101://arithmetic shift. right	
		result= iA>>>1;
		4'b0110://Logical shift left
		result= iA<<1;	
		4'b0111://Logical shift  right
		result= iA>>1;	
		4'b1000://Rotation  left
		result= {iA[2:0],iA[3]};
		4'b1001://Rotation  right
		result= {iA[0],iA[3:1]};
		
		endcase

// Carry Flag 0
if((result > 4'b1111)&&(result <= 6'b11111))
		status[0] = 1;
	else
		status[0] = 0;
//End carry Flag

// Zero Flag 1	
	if (result==0)
		status[1] = 1;
	else
		status[1] = 0;	
//End Zero Flag



//Flag overflow 2
	if ((result >= 4'b1000) ||(result >= -4'd9))
		status[2] = 1;
	else
		status[2] = 0;
//End Overflow Flag



//sign Flag 3
status[3] = result[3];
//end sign flag



// Parity Flag 4
	if ((result[0] ^ result[1] ^ result[2] ^ result[3])==1)
		status[4] = 1;
	else if (status[1] == 1)
		status[4] = 0;
	else	
		status[4] = 0;
//end Parity Flag

		
	end
endmodule



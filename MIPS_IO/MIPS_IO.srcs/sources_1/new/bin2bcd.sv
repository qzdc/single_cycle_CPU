`timescale 1ns / 1ps

module bin2bcd(
    input logic[11:0] b,
    output logic [11:0]p
    );
    
    logic [25:0]z;
    integer i;
    
    always_comb
    begin
        for(i=0;i<26;i=i+1)
            z[i]=0;
         z[14:3]=b;
         repeat(9)
         begin
            if(z[15:12]>=5) z[15:12]=z[15:12]+3;
            if(z[19:16]>=5) z[19:16]=z[19:16]+3;
            if(z[23:20]>=5) z[23:20]=z[23:20]+3;
            z[25:1]=z[24:0];
         end
         p=z[23:12];
    end
endmodule

`timescale 1ns / 1ps

module test_tb( );
    
  reg jtag_tck_0_tb;
  reg jtag_tdi_0_tb;
  wire jtag_tdo_0_tb;
  reg jtag_tms_0_tb;
  reg reset_tb_n;
  reg uart2_pl_rxd_tb;
  reg uart2_pl_txd_tb;
  
  reg CLK_tb;
  reg [15:0] num;
  
  wire jtag_tck_0_w;
  wire jtag_tdi_0_w;
  wire jtag_tdo_0_w;
  wire jtag_tms_0_w;
  wire reset_w;
  wire reset_n_w;
  wire uart2_pl_rxd_w;
  wire uart2_pl_txd_w;
  wire user_si570_sysclk_clk_n_w;
  wire user_si570_sysclk_clk_p_w;
  
  assign jtag_tck_0_w = jtag_tck_0_tb;
  assign jtag_tdi_0_w = jtag_tdi_0_tb;
  assign jtag_tdo_0_tb = jtag_tdo_0_w;
  assign jtag_tms_0_w = jtag_tms_0_tb;
  assign reset_w = !reset_tb_n;
  assign reset_n_w = reset_tb_n;
    
  assign uart2_pl_rxd_w = uart2_pl_rxd_tb;
  assign uart2_pl_txd_w = uart2_pl_txd_tb;
  assign user_si570_sysclk_clk_n_w = CLK_tb;
  assign user_si570_sysclk_clk_p_w = !CLK_tb;
  
  initial begin
    
    CLK_tb = 0;
    forever
    #1 CLK_tb = ~CLK_tb; 
  
  end
  
  initial begin
    
    #100;
  
  	jtag_tck_0_tb = 1'b0;
	jtag_tdi_0_tb = 1'b0;
	jtag_tms_0_tb = 1'b0;

	reset_tb_n = 1'b1;
	uart2_pl_rxd_tb = 1'b0;
	uart2_pl_txd_tb = 1'b0;
    #100;
    
    reset_tb_n = 1'b0;
    	#20;
 		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
    reset_tb_n = 1'b1;
    
    #200
    SoC_wrapper_i.SoC_i.EGRET_cfg_0.inst.u_EGRET_CFG_axi.slv_reg0[0] = 1; 
  
    #2000
    SoC_wrapper_i.SoC_i.EGRET_cfg_0.inst.u_EGRET_CFG_axi.slv_reg0[0] = 1; 
  
  end
  
  initial begin
  
    num = 'h00;
    #35000;
  
    #160;
    num = 'h01;
	DMI_ADDR_0x10_dmcontrol_write_and_read ( );  
	
	#1000;
	num = 'h02;
	DMI_ADDR_0x11_dmstatus_read ( );
	receive_read_value ( );
	
	#1000;
	num = 'h03;
	DMI_ADDR_0x1D_nextdm_read ( );
	receive_read_value ( );	
	
	#1000;
	num = 'h04;
	//	task DMI_ADDR_0x10_dmcontrol_write_XX_and_read( input bit31_haltreq, input bit30_resumereq, bit29_hartrest, input bit26_hasel, input[9:0] bit25to16_hartsello, input[9:0] bit15to6_hartselhi, input bit0_dmactive );
	DMI_ADDR_0x10_dmcontrol_write_XX_and_read (1'b0, 1'b0, 1'b0, 1'b1, 10'b00_0000_0000, 10'b00_0000_0000, 1'b1);
	
	#1000;
	num = 'h05;
    //	task DMI_ADDR_0x10_dmcontrol_write_XX_and_read( input bit31_haltreq, input bit30_resumereq, bit29_hartrest, input bit26_hasel, input[9:0] bit25to16_hartsello, input[9:0] bit15to6_hartselhi, input bit0_dmactive );
	DMI_ADDR_0x10_dmcontrol_write_XX_and_read (1'b0, 1'b0, 1'b0, 1'b0, 10'b11_1111_1111, 10'b11_1111_1111, 1'b1);
	
	#1000;
	num = 'h06;
	//	task DMI_ADDR_0x10_dmcontrol_write_XX_and_read( input bit31_haltreq, input bit30_resumereq, bit29_hartrest, input bit26_hasel, input[9:0] bit25to16_hartsello, input[9:0] bit15to6_hartselhi, input bit0_dmactive );
	DMI_ADDR_0x10_dmcontrol_write_XX_and_read (1'b0, 1'b0, 1'b0, 1'b0, 10'b00_0000_0000, 10'b00_0000_0000, 1'b1);
	
	#1000;
	num = 'h07;
	DMI_ADDR_0x11_dmstatus_read ( );
	receive_read_value ( );		
	
	#1000;
	num = 'h08;
	//	task DMI_ADDR_0x10_dmcontrol_write_XX_and_read( input bit31_haltreq, input bit30_resumereq, bit29_hartrest, input bit26_hasel, input[9:0] bit25to16_hartsello, input[9:0] bit15to6_hartselhi, input bit0_dmactive );
	DMI_ADDR_0x10_dmcontrol_write_XX_and_read (1'b0, 1'b0, 1'b0, 1'b0, 10'b00_0000_0001, 10'b00_0000_0000, 1'b1);
	
	#1000;
	num = 'h09;
	DMI_ADDR_0x11_dmstatus_read ( );
	receive_read_value ( );	
	
	#1000;
	num = 'h0a;
	//	task DMI_ADDR_0x10_dmcontrol_write_XX_and_read( input bit31_haltreq, input bit30_resumereq, bit29_hartrest, input bit26_hasel, input[9:0] bit25to16_hartsello, input[9:0] bit15to6_hartselhi, input bit0_dmactive );
	DMI_ADDR_0x10_dmcontrol_write_XX_and_read (1'b0, 1'b0, 1'b0, 1'b0, 10'b00_0000_0000, 10'b00_0000_0000, 1'b1);
	
	#1000;
	num = 'h0b;
	DMI_ADDR_0x11_dmstatus_read ( );
	receive_read_value ( );
	
    #1000;
	num = 'h0c;
	DMI_ADDR_0x16_abstractcs_read ( );
	receive_read_value ( );
	
    #1000;
	num = 'h0d;
	DMI_ADDR_0x12_hartinfo_read ( );
	receive_read_value ( );
	
	// halt request
	#1000;
	num = 'h0e;
	//	task DMI_ADDR_0x10_dmcontrol_write_XX_and_read( input bit31_haltreq, input bit30_resumereq, bit29_hartrest, input bit26_hasel, input[9:0] bit25to16_hartsello, input[9:0] bit15to6_hartselhi, input bit0_dmactive );
	DMI_ADDR_0x10_dmcontrol_write_XX_and_read (1'b1, 1'b0, 1'b0, 1'b0, 10'b00_0000_0000, 10'b00_0000_0000, 1'b1);
	
	#1000;
	num = 'h0f;
	DMI_ADDR_0x11_dmstatus_read ( );
	receive_read_value ( );
	
	// resume request
	#1000;
	num = 'h10;
	//	task DMI_ADDR_0x10_dmcontrol_write_XX_and_read( input bit31_haltreq, input bit30_resumereq, bit29_hartrest, input bit26_hasel, input[9:0] bit25to16_hartsello, input[9:0] bit15to6_hartselhi, input bit0_dmactive );
	DMI_ADDR_0x10_dmcontrol_write_XX_and_read (1'b0, 1'b1, 1'b0, 1'b0, 10'b00_0000_0000, 10'b00_0000_0000, 1'b1);
	
	#1000;
	num = 'h11;
	DMI_ADDR_0x11_dmstatus_read ( );
	receive_read_value ( );	
	
	// halt request
	#1000;
	num = 'h12;
	//	task DMI_ADDR_0x10_dmcontrol_write_XX_and_read( input bit31_haltreq, input bit30_resumereq, bit29_hartrest, input bit26_hasel, input[9:0] bit25to16_hartsello, input[9:0] bit15to6_hartselhi, input bit0_dmactive );
	DMI_ADDR_0x10_dmcontrol_write_XX_and_read (1'b1, 1'b0, 1'b0, 1'b0, 10'b00_0000_0000, 10'b00_0000_0000, 1'b1);
	
	#1000;
	num = 'h13;
	DMI_ADDR_0x11_dmstatus_read ( );
	receive_read_value ( );

    // CSR : zero
	#1000;
	num = 'h14;
	DMI_ADDR_0x17_command_Register_read ( 'b0, 16'h1000 );
	
	#1000;
	num = 'h15;
	DMI_ADDR_0x16_abstractcs_read ( );
	receive_read_value ( );	
	
    // CSR : tselect
	#1000;
	num = 'h16;
	DMI_ADDR_0x17_command_Register_read ( 'b0, 16'h7a0 );
	
	#1000;
	num = 'h17;
	DMI_ADDR_0x16_abstractcs_read ( );
	receive_read_value ( );	
	
	// GPR : read mstatus
	#1000;
	num = 'h171;
	DMI_ADDR_0x17_command_Register_read ( 'b0, 16'h300 );
	
	#1000;
	num = 'h172;
	DMI_ADDR_0x04_data0_read ( );
	receive_read_value ( );	
	
	#1000;
	num = 'h18;
	DMI_ADDR_0x04_data0_write ( 32'h0 );
	
    // GPR : read tselect
	#1000;
	num = 'h19;
	DMI_ADDR_0x17_command_Register_read ( 'b0, 16'h7a0 );
	
	#1000;
	num = 'h191;
	DMI_ADDR_0x16_abstractcs_read ( );
	receive_read_value ( );		
	
	// GPR : read tinfo
	#1000;
	num = 'h1a;
	DMI_ADDR_0x17_command_Register_read ( 'b0, 16'h7a4 );
	
	#1000;
	num = 'h1b;
	DMI_ADDR_0x16_abstractcs_read ( );
	receive_read_value ( );	
	
    #1000;
	num = 'h1b1;
	DMI_ADDR_0x04_data0_read ( );
	receive_read_value ( );	
	
	#1000;
	num = 'h1c;
	DMI_ADDR_0x18_abstractauto_read ( );
	receive_read_value ( );		
	
	// halt request
	#1000;
	num = 'h1d1;
	//	task DMI_ADDR_0x10_dmcontrol_write_XX_and_read( input bit31_haltreq, input bit30_resumereq, bit29_hartrest, input bit26_hasel, input[9:0] bit25to16_hartsello, input[9:0] bit15to6_hartselhi, input bit0_dmactive );
	DMI_ADDR_0x10_dmcontrol_write_XX_and_read (1'b1, 1'b0, 1'b0, 1'b0, 10'b00_0000_0000, 10'b00_0000_0000, 1'b1);	
	
	#1000;
	num = 'h1d2;
	DMI_ADDR_0x11_dmstatus_read ( );
	receive_read_value ( );		
	
	// core reset 
	#1000;
	num = 'h1d3;
	//	task DMI_ADDR_0x10_dmcontrol_write_XX_and_read( input bit31_haltreq, input bit30_resumereq, bit29_hartrest, input bit26_hasel, input[9:0] bit25to16_hartsello, input[9:0] bit15to6_hartselhi, input bit0_dmactive );
	DMI_ADDR_0x10_dmcontrol_write_XX_and_read (1'b0, 1'b0, 1'b1, 1'b0, 10'b00_0000_0000, 10'b00_0000_0000, 1'b1);
		
	#1000;
	num = 'h1d4;
	DMI_ADDR_0x11_dmstatus_read ( );
	receive_read_value ( );		
		
	// core clear reset 
	#1000;
	num = 'h1d5;
	//	task DMI_ADDR_0x10_dmcontrol_write_XX_and_read( input bit31_haltreq, input bit30_resumereq, bit29_hartrest, input bit26_hasel, input[9:0] bit25to16_hartsello, input[9:0] bit15to6_hartselhi, input bit0_dmactive );
	DMI_ADDR_0x10_dmcontrol_write_XX_and_read (1'b0, 1'b0, 1'b0, 1'b0, 10'b00_0000_0000, 10'b00_0000_0000, 1'b1);
		
	#1000;
	num = 'h1d6;
	DMI_ADDR_0x11_dmstatus_read ( );
	receive_read_value ( );				
		
	// halt request
	#1000;
	num = 'h1d7;
	//	task DMI_ADDR_0x10_dmcontrol_write_XX_and_read( input bit31_haltreq, input bit30_resumereq, bit29_hartrest, input bit26_hasel, input[9:0] bit25to16_hartsello, input[9:0] bit15to6_hartselhi, input bit0_dmactive );
	DMI_ADDR_0x10_dmcontrol_write_XX_and_read (1'b1, 1'b0, 1'b0, 1'b0, 10'b00_0000_0000, 10'b00_0000_0000, 1'b1);	
	
	#1000;
	num = 'h1d8;
	DMI_ADDR_0x11_dmstatus_read ( );
	receive_read_value ( );		
	
// x[8] <- x[9]    0x00942023
	#1000;
	num = 'h1e;	
//	task general_write( input [15:0] DATB, input [15:0] DATA, input[6:0] ADDR );
    general_write( 16'b0000_0000_1001_0100, 16'b0010_0000_0010_0011, 7'h20);
    
// x[8] <-  x[8] + 4     0x00440413
 	#1000;
	num = 'h1e1;	
//	task general_write( input [15:0] DATB, input [15:0] DATA, input[6:0] ADDR );
    general_write( 16'b0000_0000_0100_0100, 16'b0000_0100_0001_0011, 7'h21);   
 
    // EBREAK
  	#1000;
	num = 'h1e2;	
//	task general_write( input [15:0] DATB, input [15:0] DATA, input[6:0] ADDR );
    general_write( 16'b0000_0000_0001_0000, 16'b0000_0000_0111_0011, 7'h22);   
    
    //data0
	#1000;
	num = 'h1f;
	DMI_ADDR_0x04_data0_write ( 32'h3000_0000 );	
		
	// write x[8]
	#1000;
	num = 'h1f1;
//task DMI_ADDR_0x17_command_Register_write ( input bit18_postexec, input [15:0] bit15to0_regno );
	DMI_ADDR_0x17_command_Register_write ( 'b0, 16'h1008 );
		
    //data0
	#1000;
	num = 'h20;
	DMI_ADDR_0x04_data0_write ( 32'h0000_0123 );		

	// write x[9]
	#1000;
	num = 'h201;
//task DMI_ADDR_0x17_command_Register_write ( input bit18_postexec, input [15:0] bit15to0_regno );
	DMI_ADDR_0x17_command_Register_write ( 'b1, 16'h1009 );
		
    supply_clock();		

	#1000;
	num = 'h202;
	DMI_ADDR_0x18_abstractauto_write ( );
	receive_read_value ( );	    
    	
	#1000;
	num = 'h210;
	DMI_ADDR_0x04_data0_write ( 32'h222 );    	
   
    supply_clock();	
    
	#1000;
	num = 'h211;
	DMI_ADDR_0x04_data0_write ( 32'h333 );    	
    
    supply_clock();	
    
	#1000;
	num = 'h212;
	DMI_ADDR_0x04_data0_write ( 32'h444 );       
 
     supply_clock();	
      
	#1000;
	num = 'h213;
	DMI_ADDR_0x04_data0_write ( 32'h555 );  
	
    supply_clock();	
    	
	#1000;
	num = 'h214;
	DMI_ADDR_0x04_data0_write ( 32'h666 );   
	
    supply_clock();	
        
	#1000;
	num = 'h215;
	DMI_ADDR_0x18_abstractauto_clear ( );
	receive_read_value ( );	         
        
        
/////////////////////////////////////////////////////////////////
    
    //data0
	#1000;
	num = 'h216;
	DMI_ADDR_0x04_data0_write ( 32'h0000_0088 );	    
    
	// write x[9]
	#1000;
	num = 'h217;
//task DMI_ADDR_0x17_command_Register_write ( input bit18_postexec, input [15:0] bit15to0_regno );
	DMI_ADDR_0x17_command_Register_write ( 'b0, 16'h1009 );    
    
// x[8] -> x[9]    0x0004_2483
	#1000;
	num = 'h22;	
//	task general_write( input [15:0] DATB, input [15:0] DATA, input[6:0] ADDR );
    general_write( 16'b0000_0000_0000_0100, 16'b0010_0100_1000_0011, 7'h20);
    
// x[8] <-  x[8] + 4     0x00440413
 	#1000;
	num = 'h221;	
//	task general_write( input [15:0] DATB, input [15:0] DATA, input[6:0] ADDR );
    general_write( 16'b0000_0000_0100_0100, 16'b0000_0100_0001_0011, 7'h21);   
 
    // EBREAK
  	#1000;
	num = 'h222;	
//	task general_write( input [15:0] DATB, input [15:0] DATA, input[6:0] ADDR );
    general_write( 16'b0000_0000_0001_0000, 16'b0000_0000_0111_0011, 7'h22);   
    
    //data0
	#1000;
	num = 'h23;
	DMI_ADDR_0x04_data0_write ( 32'h3000_0000 );	
		
	// write x[8]
	#1000;
	num = 'h231;
//task DMI_ADDR_0x17_command_Register_write ( input bit18_postexec, input [15:0] bit15to0_regno );
	DMI_ADDR_0x17_command_Register_write ( 'b1, 16'h1008 );
		
	// read x[9]
	#1000;
	num = 'h232;
	DMI_ADDR_0x17_command_Register_read ( 'b1, 16'h1009 );		
		
	#1000;
	num = 'h241;
	DMI_ADDR_0x18_abstractauto_write ( );
	receive_read_value ( );	 		
		
    supply_clock();			 
    
	#1000;
	num = 'h242;
	DMI_ADDR_0x04_data0_read ( );
	receive_read_value ( );	
    
    supply_clock();			 
    
	#1000;
	num = 'h243;
	DMI_ADDR_0x04_data0_read ( );
	receive_read_value ( );	
	
	#1000;
	num = 'h244;
	DMI_ADDR_0x04_data0_read ( );
	receive_read_value ( );	
    
    supply_clock();		
	
	#1000;
	num = 'h245;
	DMI_ADDR_0x04_data0_read ( );
	receive_read_value ( );	
    
    supply_clock();		
	     
	#1000;
	num = 'h246;
	DMI_ADDR_0x04_data0_read ( );
	receive_read_value ( );	
    
    supply_clock();		

	#1000;
	num = 'h247;
	DMI_ADDR_0x04_data0_read ( );
	receive_read_value ( );	
    
    supply_clock();		 
    
 	#1000;
	num = 'h250;
	DMI_ADDR_0x18_abstractauto_clear ( );
	receive_read_value ( );	       
end

task DMI_ADDR_0x18_abstractauto_clear();
begin
    general_write( 16'b0000_0000_0000_0000, 16'b0000_0000_0000_0000, 7'h18);   
end
endtask

task DMI_ADDR_0x18_abstractauto_write();
begin
    general_write( 16'b0000_0000_0000_0000, 16'b0000_0000_0000_0001, 7'h18);   
end
endtask

task general_write( input [15:0] DATB, input [15:0] DATA, input[6:0] ADDR );
begin
	DMI_enter_then_idle ( );  
	#200;
	from_idle_to_shiftDR ( );
	#200;
	
	// 0b10
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tdi_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#60;
		jtag_tck_0_tb = 1'b0;
		#20;
	// 0x1
	
	    // 1 
		jtag_tdi_0_tb = DATA[0];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[1];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[2];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[3];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = DATA[4];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[5];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[6];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[7];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
	    // 2
		jtag_tdi_0_tb = DATA[8];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[9];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[10];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[11];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = DATA[12];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[13];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[14];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[15];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;			
		
	    // 3
		jtag_tdi_0_tb = DATB[0];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATB[1];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATB[2];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATB[3];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = DATB[4];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATB[5];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATB[6];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATB[7];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
	    // 4
		jtag_tdi_0_tb = DATB[8];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATB[9];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATB[10];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATB[11];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = DATB[12];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATB[13];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATB[14];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATB[15];
		#20;
		jtag_tck_0_tb = 1'b1;
		#60;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		// addr 0x10
		jtag_tdi_0_tb = ADDR[0];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = ADDR[1];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = ADDR[2];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = ADDR[3];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = ADDR[4];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = ADDR[5];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = ADDR[6];
		jtag_tms_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		#200;
		
		from_exit1_to_idle ( );
end
endtask 

task supply_clock();
begin
	stay_in_idle_for_8_clock ( );
	stay_in_idle_for_8_clock ( );
	stay_in_idle_for_8_clock ( );
	stay_in_idle_for_8_clock ( );
	stay_in_idle_for_8_clock ( );
	stay_in_idle_for_8_clock ( );
	stay_in_idle_for_8_clock ( );
	stay_in_idle_for_8_clock ( );
end
endtask 

task DMI_ADDR_0x04_data0_read( );
begin
	stay_in_idle_for_8_clock ( );
    DMI_ADDR_XX_read_from_idle ( 7'h04 );
end
endtask

task DMI_ADDR_0x04_data0_write( input [31:0] DATA );
begin
	stay_in_idle_for_8_clock ( );
    DMI_ADDR_XX_write_from_idle ( 7'h04, DATA );
end
endtask


task DMI_ADDR_XX_write_from_idle ( input [6:0] ADDR, input [31:0] DATA );
begin
	from_idle_to_shiftDR ( );
	#200;
	
	// 0b10 write 
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tdi_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#60;
		jtag_tck_0_tb = 1'b0;
		#20;
		
	// DATA 0x0
	
	    // 1 
		jtag_tdi_0_tb = DATA[0];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[1];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[2];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[3];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = DATA[4];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[5];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[6];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[7];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
	    // 2
		jtag_tdi_0_tb = DATA[8];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[9];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[10];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[11];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = DATA[12];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[13];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[14];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[15];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;			
		
	    // 3
		jtag_tdi_0_tb = DATA[16];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[17];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[18];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[19];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = DATA[20];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[21];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[22];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[23];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
	    // 4
		jtag_tdi_0_tb = DATA[24];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[25];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[26];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[27];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = DATA[28];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[29];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[30];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = DATA[31];
		#20;
		jtag_tck_0_tb = 1'b1;
		#60;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		// addr XX
		jtag_tdi_0_tb = ADDR[0];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = ADDR[1];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = ADDR[2];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = ADDR[3];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = ADDR[4];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = ADDR[5];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = ADDR[6];
		jtag_tms_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		#200;
		
		from_exit1_to_idle ( );	
end
endtask

task DMI_ADDR_0x16_abstractcs_read;
begin
	stay_in_idle_for_8_clock ( );
    DMI_ADDR_XX_read_from_idle ( 7'h16 );
end
endtask

task DMI_ADDR_0x18_abstractauto_read;
begin
	stay_in_idle_for_8_clock ( );
    DMI_ADDR_XX_read_from_idle ( 7'h18 );
end
endtask

task DMI_ADDR_XX_read_from_idle ( input [6:0] ADDR );
begin
	from_idle_to_shiftDR ( );
	#200;
	
	// 0b01 read 
		jtag_tdi_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#60;
		jtag_tck_0_tb = 1'b0;
		#20;
		
	// DATA 0x0
	
	    // 1 
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
	    // 2
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;			
		
	    // 3
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
	    // 4
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#60;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		// addr XX
		jtag_tdi_0_tb = ADDR[0];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = ADDR[1];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = ADDR[2];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = ADDR[3];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = ADDR[4];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = ADDR[5];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = ADDR[6];
		jtag_tms_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		#200;
		
		from_exit1_to_idle ( );	
end
endtask

task DMI_ADDR_0x17_command_Register_write ( input bit18_postexec, input [15:0] bit15to0_regno );
begin
	stay_in_idle_for_8_clock ( );
    DMI_ADDR_0x17_command_write_from_idle (3'b010, bit18_postexec, 1'b1, bit15to0_regno);
end
endtask

task DMI_ADDR_0x17_command_write_from_idle (input[2:0] bit22to20_aarsize, input bit18_postexec, input bit17_transfer, input [15:0] bit15to0_regno);
begin
    DMI_ADDR_0x17_command_RorW_from_idle (bit22to20_aarsize, bit18_postexec, bit17_transfer, 1'b1, bit15to0_regno);
end
endtask

task DMI_ADDR_0x17_command_Register_read ( input bit18_postexec, input [15:0] bit15to0_regno );
begin
	stay_in_idle_for_8_clock ( );
    DMI_ADDR_0x17_command_read_from_idle (3'b010, bit18_postexec, 1'b1, bit15to0_regno);
end
endtask

task DMI_ADDR_0x17_command_read_from_idle (input[2:0] bit22to20_aarsize, input bit18_postexec, input bit17_transfer, input [15:0] bit15to0_regno);
begin
    DMI_ADDR_0x17_command_RorW_from_idle (bit22to20_aarsize, bit18_postexec, bit17_transfer, 1'b0, bit15to0_regno);
end
endtask

task DMI_ADDR_0x17_command_RorW_from_idle (input[2:0] bit22to20_aarsize, input bit18_postexec, input bit17_transfer, input bit16_write, input [15:0] bit15to0_regno);
begin
	from_idle_to_shiftDR ( );
	#200;
	
	// 0b10 write 
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tdi_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#60;
		jtag_tck_0_tb = 1'b0;
		#20;
		
	// DATA 0x0
	
	    // 1 
		jtag_tdi_0_tb = bit15to0_regno[0];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit15to0_regno[1];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit15to0_regno[2];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit15to0_regno[3];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = bit15to0_regno[4];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit15to0_regno[5];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit15to0_regno[6];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit15to0_regno[7];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
	    // 2
		jtag_tdi_0_tb = bit15to0_regno[8];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit15to0_regno[9];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit15to0_regno[10];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit15to0_regno[11];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = bit15to0_regno[12];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit15to0_regno[13];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit15to0_regno[14];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit15to0_regno[15];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;			
		
	    // 3
		jtag_tdi_0_tb = bit16_write;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit17_transfer;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit18_postexec;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = bit22to20_aarsize[0];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit22to20_aarsize[1];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit22to20_aarsize[2];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
	    // 4
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#60;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		// addr 0x17
		jtag_tdi_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		jtag_tms_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		#200;
		
		from_exit1_to_idle ( );	
end
endtask


task DMI_ADDR_0x12_hartinfo_read;
begin
	stay_in_idle_for_8_clock ( );
    DMI_ADDR_0x12_hartinfo_DATA_0x0_OP_0b01_read_from_idle ( );
end
endtask

task DMI_ADDR_0x12_hartinfo_DATA_0x0_OP_0b01_read_from_idle;
begin
	from_idle_to_shiftDR ( );
	#200;
	
	// 0b01 read 
		jtag_tdi_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#60;
		jtag_tck_0_tb = 1'b0;
		#20;
		
	// DATA 0x0
	
	    // 1 
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
	    // 2
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;			
		
	    // 3
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
	    // 4
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#60;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		// addr 0x12 , 0b0100_100
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		jtag_tms_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		#200;
		
		from_exit1_to_idle ( );	
end
endtask

task DMI_ADDR_0x1D_nextdm_read;
begin
	stay_in_idle_for_8_clock ( );
    DMI_ADDR_0x1D_nextdm_DATA_0x0_OP_0b01_read_from_idle ( );
end
endtask

task DMI_ADDR_0x1D_nextdm_DATA_0x0_OP_0b01_read_from_idle;
begin
	from_idle_to_shiftDR ( );
	#200;
	
	// 0b01 read 
		jtag_tdi_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#60;
		jtag_tck_0_tb = 1'b0;
		#20;
		
	// DATA 0x0
	
	    // 1 
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
	    // 2
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;			
		
	    // 3
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
	    // 4
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#60;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		// addr 0x1D
		jtag_tdi_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		jtag_tms_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		#200;
		
		from_exit1_to_idle ( );	
end
endtask

task DMI_ADDR_0x11_dmstatus_read;
begin
	stay_in_idle_for_8_clock ( );
    DMI_ADDR_0x11_dmstatus_DATA_0x0_OP_0b01_read_from_idle ( );
end
endtask

task DMI_ADDR_0x11_dmstatus_DATA_0x0_OP_0b01_read_from_idle;
begin
	from_idle_to_shiftDR ( );
	#200;
	
	// 0b01 read 
		jtag_tdi_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#60;
		jtag_tck_0_tb = 1'b0;
		#20;
		
	// DATA 0x0
	
	    // 1 
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
	    // 2
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;			
		
	    // 3
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
	    // 4
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#60;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		// addr 0x11
		jtag_tdi_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		jtag_tms_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		#200;
		
		from_exit1_to_idle ( );	
end
endtask

task DMI_ADDR_0x10_dmcontrol_write_XX_and_read( input bit31_haltreq, input bit30_resumereq, input bit29_hartrest, input bit26_hasel, input[9:0] bit25to16_hartsello, input[9:0] bit15to6_hartselhi, input bit0_dmactive );
begin
	DMI_ADDR_0x10_dmcontrol_DATA_XX_OP_0b10_write (bit31_haltreq, bit30_resumereq, bit29_hartrest, bit26_hasel, bit25to16_hartsello, bit15to6_hartselhi, bit0_dmactive);  
	DMI_ADDR_0x10_dmcontrol_DATA_0x0_OP_0b01_read_from_idle ( );
	receive_read_value ( );
end
endtask

task DMI_ADDR_0x10_dmcontrol_write_and_read;
begin
	DMI_ADDR_0x10_dmcontrol_DATA_0x1_OP_0b10_write ( );  
	DMI_ADDR_0x10_dmcontrol_DATA_0x0_OP_0b01_read_from_idle ( );
	receive_read_value ( );
end
endtask

task receive_read_value;
begin

	stay_in_idle_for_8_clock ( );

	from_idle_to_shiftDR ( );
	#200;
	
	// 0b00 receive 
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#60;
		jtag_tck_0_tb = 1'b0;
		#20;
		
	// DATA 0x0
	
	    // 1 
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
	    // 2
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;			
		
	    // 3
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
	    // 4
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#60;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		// addr 0x00
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		jtag_tms_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		#200;
		
		from_exit1_to_idle ( );	
end
endtask

task DMI_ADDR_0x10_dmcontrol_DATA_0x0_OP_0b01_read_from_idle;
begin

	stay_in_idle_for_8_clock ( );

	from_idle_to_shiftDR ( );
	#200;
	
	// 0b01 read 
		jtag_tdi_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#60;
		jtag_tck_0_tb = 1'b0;
		#20;
		
	// DATA 0x0
	
	    // 1 
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
	    // 2
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;			
		
	    // 3
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
	    // 4
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#60;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		// addr 0x10
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		jtag_tms_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		#200;
		
		from_exit1_to_idle ( );	
end
endtask

task DMI_ADDR_0x10_dmcontrol_DATA_XX_OP_0b10_write( input bit31_haltreq,  input bit30_resumereq, input bit29_hartrest, input bit26_hasel, input[9:0] bit25to16_hartsello, input[9:0] bit15to6_hartselhi, input bit0_dmactive );
begin

	DMI_enter_then_idle ( );  
	#200;
	from_idle_to_shiftDR ( );
	#200;
	
	// 0b10
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tdi_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#60;
		jtag_tck_0_tb = 1'b0;
		#20;
	// xx

	    // 1 
		jtag_tdi_0_tb = bit0_dmactive;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit15to6_hartselhi[0];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit15to6_hartselhi[1];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
	    // 2
		jtag_tdi_0_tb = bit15to6_hartselhi[2];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit15to6_hartselhi[3];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit15to6_hartselhi[4];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit15to6_hartselhi[5];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = bit15to6_hartselhi[6];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit15to6_hartselhi[7];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit15to6_hartselhi[8];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit15to6_hartselhi[9];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;			
		
	    // 3
		jtag_tdi_0_tb = bit25to16_hartsello[0];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit25to16_hartsello[1];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit25to16_hartsello[2];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit25to16_hartsello[3];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = bit25to16_hartsello[4];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit25to16_hartsello[5];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit25to16_hartsello[6];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit25to16_hartsello[7];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
	    // 4
		jtag_tdi_0_tb = bit25to16_hartsello[8];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit25to16_hartsello[9];
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit26_hasel;	
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit29_hartrest;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit30_resumereq;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = bit31_haltreq;
		#20;
		jtag_tck_0_tb = 1'b1;
		#60;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		// addr 0x10
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		jtag_tms_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		#200;
		
		from_exit1_to_idle ( );
end
endtask

task DMI_ADDR_0x10_dmcontrol_DATA_0x1_OP_0b10_write;
begin

	DMI_enter_then_idle ( );  
	#200;
	from_idle_to_shiftDR ( );
	#200;
	
	// 0b10
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tdi_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#60;
		jtag_tck_0_tb = 1'b0;
		#20;
	// 0x1
	
	    // 1 
		jtag_tdi_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
	    // 2
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;			
		
	    // 3
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
	    // 4
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#60;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		// addr 0x10
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		//*****************//
		jtag_tdi_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		////////////////////
		jtag_tdi_0_tb = 1'b0;
		jtag_tms_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		#200;
		
		from_exit1_to_idle ( );
end
endtask

task DMI_enter_then_idle;
begin

 	    // 111111 -> reset  
        jtag_reset();

	    // 0 -> idle 
		jtag_tms_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	

        // 1100 -> shift IR
		jtag_tms_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
	
		jtag_tms_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		jtag_tms_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		jtag_tms_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		// 10001 0x11 -> shift_IR x 10 , tdi = 0      ->  Exit1_DR
		jtag_tdi_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;

		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tdi_0_tb = 1'b1;
		jtag_tms_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		#200;
		
		from_exit1_to_idle ( );
end 
endtask

task from_exit1_to_idle;
begin
        // 10 -> idle
		jtag_tms_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
			
		jtag_tms_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
end
endtask

task stay_in_idle_for_8_clock;
begin
       
		jtag_tms_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
			
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
			
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
			
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
			
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
end
endtask

task DTM_read;
    begin
    
 	    // 111111 -> reset  
        jtag_reset();
    
    
	    // 0 -> idle 
		jtag_tms_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	

        // 1100 -> shift IR
		jtag_tms_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
	
		jtag_tms_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		jtag_tms_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		jtag_tms_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
			
		// 00001 0x10 -> shift_IR x 10 , tdi = 0      ->  Exit1_DR
		
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;

		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tdi_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tdi_0_tb = 1'b1;
		jtag_tms_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	

        // 10 100 -> shift DR
		
		jtag_tms_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tms_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tms_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tms_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tms_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
	
		// 0000000000 -> shift_DR x 32 , tdi = 0
		
		jtag_tdi_0_tb = 1'b0;
		#20;

        cycle_32();			
        
        delay_last();
        
        cycle_32();		
        					
    end
endtask

task from_idle_to_shiftDR;
begin
        // 100 -> shift DR
		jtag_tms_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	

		jtag_tms_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		jtag_tms_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
end
endtask

task shift_DR;
   begin
   
 	    // 111111 -> reset  
        jtag_reset();
   
	    // 0 -> idle 
		jtag_tms_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
        // 100 -> shift DR
		jtag_tms_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	

		jtag_tms_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		jtag_tms_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		// 0000000000 -> shift_DR x 10 , tdi = 0
		
		jtag_tdi_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		// 0000000000 -> shift_DR x 10 , tdi = 1 
		
		jtag_tdi_0_tb = 1'b1;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		// 0000000000 -> shift_DR x 10 , tdi = 0
		
		jtag_tdi_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;		
		
		// 0000000000 -> shift_DR x 10 , tdi = 1
		
		jtag_tdi_0_tb = 1'b1;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
	end
	endtask   
   

  
task shift_IR;   
	begin
	
 	    // 111111 -> reset  
        jtag_reset();
	
	    // 0 -> idle 
		jtag_tms_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	

        // 1100 -> shift IR
		jtag_tms_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
	
		jtag_tms_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		jtag_tms_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		jtag_tms_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
			
		// 0000000000 -> shift_IR x 10 , tdi = 0
		
		jtag_tdi_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		// 0000000000 -> shift_IR x 10 , tdi = 1 
		
		jtag_tdi_0_tb = 1'b1;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		// 0000000000 -> shift_IR x 10 , tdi = 0
		
		jtag_tdi_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;	
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
//		wait (jtag_tms_0 == 0);
//		#20000;

	end
	endtask
  
  task cycle_32;
  begin
  
  cycle_eight();
  cycle_eight();
  cycle_eight();
  cycle_eight();
   
  end
  endtask
  
  task cycle_eight;
  begin 
  
  cycle_one();
  cycle_one();
  cycle_one();
  cycle_one();
  
  cycle_one();
  cycle_one();
  cycle_one();
  cycle_one();
  
  end
  endtask
  
  task cycle_one;
  begin
  
  		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
  
  end
  endtask
  
  task cycle_last;
  begin
  
    	jtag_tck_0_tb = 1'b1;
		#80;
		jtag_tck_0_tb = 1'b0;
		#20;
  
  end
  endtask
  
  task delay_last;
  begin
		#80;
  end
  endtask
  
  task jtag_reset();
  begin 
  		jtag_tms_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
		#20;
		jtag_tck_0_tb = 1'b1;
		#20;
		jtag_tck_0_tb = 1'b0;
end
endtask
  
  
  SoC_wrapper SoC_wrapper_i
       (.jtag_tck_0(jtag_tck_0_w),
        .jtag_tdi_0(jtag_tdi_0_w),
        .jtag_tdo_0(jtag_tdo_0_w),
        .jtag_tms_0(jtag_tms_0_w),
        .reset(reset_w),
        .jtag_rst_n_0(reset_n_w),
        .uart2_pl_rxd(uart2_pl_rxd_w),
        .uart2_pl_txd(uart2_pl_txd_w),
        .user_si570_sysclk_clk_n(user_si570_sysclk_clk_n_w),
        .user_si570_sysclk_clk_p(user_si570_sysclk_clk_p_w));    
    
    
endmodule

---------------------------------------------------
-- Original Lab Source Provided by Below
-- Source Modified for Lab by Group 7
---------------------------------------------------
---------------------------------------------------
-- School: University of Massachusetts Dartmouth
-- Department: Computer and Electrical Engineering
-- Engineer: Mark Rosa - Group 7
-- 
-- Create Date:    SPRING 2015
-- Module Name:    MAST
-- Project Name:   MASTER ALU CONTROL
-- Target Devices: Spartan-3E
-- Tool versions:  Xilinx ISE 14.7
-- Description: MASTER CONTROL TO ALLOW USER TO INTERFACE WITH ALU
---------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.all;

entity MAST is
    Port ( 
	 
			LED : out STD_LOGIC_VECTOR (3 downto 0);
			BTN : in STD_LOGIC_VECTOR (3 downto 0);
			
			SEG : out STD_LOGIC_VECTOR (7 downto 0);
			DP  : out STD_LOGIC;
			AN  : out STD_LOGIC_VECTOR (3 downto 0);
			SW  : in	STD_LOGIC_VECTOR (7 downto 0);
		  		  
			CLK  : in  STD_LOGIC;
         LDST_OUT : out STD_LOGIC_VECTOR (7 downto 0)
			  );
end MAST;

architecture Structural of MAST is

		signal BTNBUS : STD_LOGIC_VECTOR (3 downto 0) := "0000";
		signal PUSH : STD_LOGIC_VECTOR(3 downto 0);
		
		signal ALU_OUT : STD_LOGIC_VECTOR(7 downto 0);
		signal CCR  : STD_LOGIC_VECTOR(3 downto 0);
		
      signal SIG_1 : STD_LOGIC_VECTOR (7 downto 0);
      signal SIG_2 : STD_LOGIC_VECTOR (7 downto 0);
		signal OPBUS : STD_LOGIC_VECTOR (3 downto 0);
	 	
begin

    ALU: entity work.ALU
    port map( 
			CLK => CLK,
			RA => SIG_1,
         RB => SIG_2,
         OPCODE => OPBUS,
         CCR => CCR,
         ALU_OUT => ALU_OUT,
			LDST_OUT => LDST_OUT
		);
				  
    DRV_7Seg: entity work.SSegDriver
    port map( 
				  CLK     => CLK,
              RST     => BTNBUS(3),
              EN      => '1',
              SEG_0   => ALU_OUT(3 downto 0),
              SEG_1   => OPBUS,
              SEG_2   => SW(7 downto 4),
              SEG_3   => SW(3 downto 0),
              DP_CTRL => "1111",
              SEG_OUT => SEG (6 downto 0),
              DP_OUT  => DP,
              AN_OUT  => AN
				  );

	IN_Sel: entity work.sel_1to2
		port map(
			 RST => BTNBUS(3),
			  CLK => CLK,
           IN_1 => SW,
           OUT_1 => SIG_1,
			  OUT_2 => SIG_2
			);
				
	BTN_Control : entity work.buttoncontrol
    Port map( 
			  CLK  => CLK,
           SW  => '1',
           BTN  => BTN,
           PUSH => PUSH
			  );
			  
	DRV_BTN : entity work.btn_drv
    Port map( 
			CLK => CLK,
			PUSH => PUSH,
			OUT3 => BTNBUS,
			OP => OPBUS,
			LED => LED
			  );

end Structural;


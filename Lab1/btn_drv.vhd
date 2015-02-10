---------------------------------------------------
-- Original Lab Source Provided by Below
-- Source Modified for Lab by Group 7
---------------------------------------------------
---------------------------------------------------
-- School: University of Massachusetts Dartmouth
-- Department: Computer and Electrical Engineering
-- Engineer: Mark Rosa
-- 
-- Create Date:    SPRING 2014
-- Module Name:    BTN_DRV
-- Project Name:   ALU_MOD
-- Target Devices: Spartan-3E
-- Tool versions:  Xilinx ISE 14.7
-- Description:    Button to ALU opcode translator/driver
---------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity btn_drv is
    Port ( 
			CLK : in STD_LOGIC;
			PUSH : in STD_LOGIC_VECTOR;
			OUT3 : out STD_LOGIC_VECTOR;
			OP : out STD_LOGIC_VECTOR;
			LED : out STD_LOGIC_VECTOR
			  );
end btn_drv;

architecture Behavioral of btn_drv is

begin
process (CLK)
begin
			
	if (CLK='1' and PUSH(0)='1') then	
    OP <= "1111";
	 OUT3 <= "0001";
	 LED <= "0001";
	 end if;
	 
	if (CLK='1' and PUSH(1)='1') then	
    OP <= "0000";
	 OUT3 <= "0010";
	 LED <= "0010";
	 end if;
	 
	 if (CLK='1' and PUSH(2)='1') then
	 OP <= "0001";
	 OUT3 <= "0100";
	 LED <= "0100";
	 end if;
	 
	 if (CLK='1' and PUSH(3)='1') then
	 OUT3 <= "1000";
	 LED <= "1000";
	 end if;	 
	 
end process;

end Behavioral;


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
			NCLEAR : in STD_LOGIC_VECTOR := "1111";
			RST : in STD_LOGIC;
			CLK : in STD_LOGIC;
			BTN1  : in  STD_LOGIC;
			BTN2 : in STD_LOGIC;
			OUT_1 : out  STD_LOGIC_VECTOR (3 downto 0);
			
			LEOUT : out STD_LOGIC
			  );
end btn_drv;

architecture Behavioral of btn_drv is

begin
process (CLK)
begin
	
	if (CLK='1' and RST='1') then
		 OUT_1 <= NCLEAR;
	--	 LEOUT <= '1';
			end if;
	if (CLK='1' and RST='0' and BTN1='1') then	
    OUT_1 <= "0000";
	 		 LEOUT <= '1';

	 end if;
	 
	 if (CLK='1' and RST='0' and BTN2='1') then
	 OUT_1 <= "0001";
	 		 LEOUT <= '1';

	 end if;
	 
end process;

end Behavioral;


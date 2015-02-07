---------------------------------------------------
-- Original Lab Source Provided by Below
-- Source Modified for Lab by Group 7
---------------------------------------------------
---------------------------------------------------
-- School: University of Massachusetts Dartmouth
-- Department: Computer and Electrical Engineering
-- Engineer: Daniel Noyes
-- 
-- Create Date:    SPRING 2014
-- Module Name:    MUX_2to1
-- Project Name:   CLOCK COUNTER
-- Target Devices: Spartan-3E
-- Tool versions:  Xilinx ISE 14.7
-- Description:    2 Select MUX
---------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sel_1to2 is
    Port ( 
				SEL  : in  STD_LOGIC;
           IN_1 : in  STD_LOGIC_VECTOR (7 downto 0);
           OUT_1 : out  STD_LOGIC_VECTOR (7 downto 0);
           OUT_2 : out STD_LOGIC_VECTOR (7 downto 0)
			  );
end sel_1to2;

architecture Behavioral of sel_1to2 is
begin

    OUT_1 <= IN_1 when SEL='0';
	 OUT_2 <= IN_1 when SEL='1';

end Behavioral;


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
use IEEE.NUMERIC_STD.ALL;

entity sel_1to2 is
    Port ( 
				RST : in STD_LOGIC;
				CLK : in STD_LOGIC;
           IN_1 : in  STD_LOGIC_VECTOR (7 downto 0);
           OUT_2 : out  STD_LOGIC_VECTOR (7 downto 0);
           OUT_1 : out STD_LOGIC_VECTOR (7 downto 0)
			  );
end sel_1to2;

architecture Behavioral of sel_1to2 is
	signal TEMP : STD_LOGIC_VECTOR (7 downto 0) := "00000000";

begin

process (CLK, RST)
begin
	if (CLK='1' and CLK'event and RST='0') then
		OUT_1 <= (IN_1(7 downto 0) AND "00001111");
		OUT_2 <= to_stdlogicvector(to_bitvector(IN_1) srl 4);
	end if;
end process;

end Behavioral;


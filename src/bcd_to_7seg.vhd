----------------------------------------------------------------------------------
-- Company: Strathclyde
-- Engineer: Ross Cathcart
-- Function: This entity converts an input BCD value to an array of logic 
--			 corresponding with the illuminated segments of the 7-segment display
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcd_to_7seg is
    Port ( bcd : in STD_LOGIC_VECTOR (3 downto 0);
           seven_seg : out STD_LOGIC_VECTOR (6 downto 0));
end bcd_to_7seg;

architecture Behavioral of bcd_to_7seg is
 
begin
 --process to convert executes whenever a new BCD digit is recieved
process(bcd)
begin
--case statement illuminates correct segments based on bcd value (active-low)
case bcd is
    when "0000" =>
        seven_seg <= "0000001"; --0
    when "0001" =>
        seven_seg <= "1001111"; --1
    when "0010" =>
        seven_seg <= "0010010"; --2
    when "0011" =>
        seven_seg <= "0000110"; --3
    when "0100" =>
        seven_seg <= "1001100"; --4
    when "0101" =>
        seven_seg <= "0100100"; --5
    when "0110" =>
        seven_seg <= "0100000"; --6
    when "0111" =>
        seven_seg <= "0001111"; --7
    when "1000" =>
        seven_seg <= "0000000"; --8
    when "1001" =>
        seven_seg <= "0000100"; --9
    when others =>
        seven_seg <= "1111111"; --exception (invalid bcd)
end case;
 
end process;
 
end Behavioral;


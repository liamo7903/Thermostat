----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2023 09:50:48
-- Design Name: 
-- Module Name: slow_clocks_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity slow_clocks_tb is
--  Port ( );
end slow_clocks_tb;

architecture Behavioral of slow_clocks_tb is

--declare a slow_clocks component
component slow_clocks is
     Port ( clk : in STD_LOGIC;
           clk_20s : out STD_LOGIC;
           clk_12s : out STD_LOGIC);
end component;

--declare test signals
signal clk, clk_20s, clk_12s :  STD_LOGIC;

begin
--instantiate the DUT
DUT : slow_clocks port map(clk=>clk, clk_20s=>clk_20s, clk_12s=>clk_12s);

--create test process
stimuli : process
begin
    while now < 100 sec loop 
        clk <= '1'; wait for 5 ns;
        clk <='0'; wait for 5 ns;
    wait;
    end loop;
end process;

end Behavioral;

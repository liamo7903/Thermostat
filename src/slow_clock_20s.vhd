----------------------------------------------------------------------------------
-- Company: Strathclyde
-- Engineer: Ross Cathcart
-- Function: divides the input clock of 100Mhz into 2 slower clocks of period
-- 			 12 seconds and 20 seconds respectively
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity slow_clocks is
    Port ( clk : in STD_LOGIC;
           --clk_enable : in STD_LOGIC;
           clk_20s : out STD_LOGIC;
           clk_12s : out STD_LOGIC);
end slow_clocks;

architecture Behavioral of slow_clocks is
--clock divider constant

constant default_clk : integer := 100000000; -- default Basys 3 clock rate of 100 MHz --use this clock for synthesis
--constant default_clk : integer := 10; -- use this for simulation
constant max_count_12s : integer := default_clk * 6; -- 12s clock period 50% duty cycle
constant max_count_20s : integer := default_clk * 10; -- 20s clock period 50% duty cycle

--signals to allow output ports to be read
signal clk_20_out : std_logic := '0';
signal clk_12_out : std_logic := '0';
    
begin

--process to increment the internal counters
counting : process(clk)
--variables (Count up to these values then invert the output clock)
variable counter_12s : unsigned(29 downto 0) := (others => '0');  -- log_2(count_20s) = 29.9 = 30
variable counter_20s : unsigned(29 downto 0) := (others => '0');  

begin
    --increment both the counter
    if (rising_edge(clk)) then
      --  if (clk_enable = '1') then 
            counter_12s := counter_12s + 1;
            counter_20s := counter_20s + 1;
            
            --check count and invert output clocks if they equal max_count-1
            if (counter_12s = max_count_12s - 1) then
                clk_12_out <= not clk_12_out;
                counter_12s := to_unsigned(0,30);  
            end if;
            
            if (counter_20s = max_count_20s - 1) then
                clk_20_out <= not clk_20_out;
                counter_20s := to_unsigned(0,30);  
            end if;  
        end if;         
   -- end if;
 
end process;

--whenever the internal 'out' signals change, assign these to the actual entity outputs (Concurrent)
clk_20s <= clk_20_out;
clk_12s <= clk_12_out;


end Behavioral;

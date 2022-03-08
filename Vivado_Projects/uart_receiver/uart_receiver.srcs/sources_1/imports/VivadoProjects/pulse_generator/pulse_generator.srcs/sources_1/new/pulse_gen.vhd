----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.12.2021 09:48:13
-- Design Name: 
-- Module Name: pulse_gen - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pulse_gen is
    Port ( clk: in std_logic; 
           enable: in std_logic;
           pulse_out: out std_logic);
end pulse_gen;

architecture Behavioral of pulse_gen is

begin

pulse: process(clk) is
    variable cnt : INTEGER RANGE 0 to 1023 :=0;

begin

if rising_edge(clk) then
    if enable = '1' then 
        if cnt = 867 then
            pulse_out <= '1';
            cnt := 0;
        else
            pulse_out <= '0';
             cnt := cnt + 1;
        end if;
     end if;
 end if;        
 end process pulse;       

end Behavioral;

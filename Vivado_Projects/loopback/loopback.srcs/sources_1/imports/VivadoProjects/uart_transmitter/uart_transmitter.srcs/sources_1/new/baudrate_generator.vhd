----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.12.2021 23:03:17
-- Design Name: 
-- Module Name: baudrate_generator - Behavioral
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

entity baudrate_generator is
  Port (clk: in std_logic;
        baudrate_out: out std_logic);
end baudrate_generator;

architecture Behavioral of baudrate_generator is

begin 

baud: process(clk) is
    variable cnt : INTEGER RANGE 0 to 1023 :=0;

begin

if rising_edge(clk) then 
    if cnt = 867 then
        baudrate_out <= '1';
        cnt := 0;
    else
        baudrate_out <= '0';
        cnt := cnt + 1;
    end if;
end if;     
end process baud;   

end Behavioral;

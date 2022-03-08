----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.12.2021 11:29:53
-- Design Name: 
-- Module Name: delay_line - Behavioral
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

entity delay_line is
  Port (clk: in std_logic;
        pulse_out: in std_logic;
        baudrate_out: out std_logic);
end delay_line;

architecture Behavioral of delay_line is
    
begin

baud_out: process(clk) is
    variable cnt : INTEGER RANGE 0 to 511 :=0;

begin

if rising_edge(clk) then
    if pulse_out = '1' then
        cnt := 1;
    end if;
    if cnt /= 0  then
        if cnt = 433 then
            baudrate_out <= '1';
            cnt := 0;
        else 
           baudrate_out <= '0';
            cnt := cnt +1; 
                
        end if;
    else 
        baudrate_out <= '0';
    end if;
end if; 
end process baud_out;
end Behavioral;

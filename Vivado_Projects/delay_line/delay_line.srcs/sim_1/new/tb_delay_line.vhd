----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.12.2021 11:49:48
-- Design Name: 
-- Module Name: tb_delay_line - Behavioral
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

entity tb_delay_line is
--  Port ( );
end tb_delay_line;

architecture Behavioral of tb_delay_line is

component delay_line is 
    Port (clk: in std_logic;
        pulse_out: in std_logic;
        baudrate_out: out std_logic);
end component delay_line;

signal clk, pulse_out, baudrate_out: std_logic;

begin

uut: delay_line port map( clk=> clk, pulse_out => pulse_out, baudrate_out => baudrate_out);

p_clock: process
    begin 
    clk <= '0'; wait for 5ns;
    clk <= '1'; wait for 5ns;
    end process;

p_pulse: process
    begin
    pulse_out <= '0'; wait for 8670 ns;
    pulse_out <= '1'; wait for 10 ns;
    end process;

end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.12.2021 10:24:59
-- Design Name: 
-- Module Name: tb_pulse_gen - Behavioral
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

entity tb_pulse_gen is
--  Port ( );
end tb_pulse_gen;

architecture Behavioral of tb_pulse_gen is

component pulse_gen is 
    Port ( clk: in std_logic; 
           enable: in std_logic;
           pulse_out: out std_logic);
end component pulse_gen;

signal clk, enable, pulse_out: std_logic;

begin

uut: pulse_gen port map( clk => clk, enable => enable, pulse_out => pulse_out);
    
p_clock: process
    begin 
    clk <= '0'; wait for 5ns;
    clk <= '1'; wait for 5ns;
    end process;

p_enable: process
    begin 
    enable <= '0'; wait for 100ns; enable <= '1'; wait;
    end process;
    
end Behavioral;

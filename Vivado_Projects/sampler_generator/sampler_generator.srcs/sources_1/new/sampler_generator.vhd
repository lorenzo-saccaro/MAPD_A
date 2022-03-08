----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.12.2021 17:51:51
-- Design Name: 
-- Module Name: sampler_generator - Behavioral
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

entity sampler_generator is
 Port (clk: in std_logic;
       uart_rx: in std_logic;
       baudrate_out: out std_logic);
end sampler_generator;

architecture Behavioral of sampler_generator is

component delay_line is 
    Port (clk: in std_logic;
        pulse_out: in std_logic;
        baudrate_out: out std_logic);
end component delay_line;

component sampler_state_machine is 
    Port (clk: in std_logic;
        uart_rx: in std_logic;
        pulse_out: in std_logic;
        enable: out std_logic);
end component sampler_state_machine;

component pulse_gen is 
    Port ( clk: in std_logic; 
           enable: in std_logic;
           pulse_out: out std_logic);
end component pulse_gen;

signal enable, pulse_out : std_logic;

begin

pulse_gen_0: pulse_gen port map(clk => clk, enable => enable, pulse_out => pulse_out);
sampler_state_machine_0: sampler_state_machine port map(clk => clk, uart_rx => uart_rx, enable => enable, pulse_out => pulse_out);
delay_line_0: delay_line port map(clk => clk, pulse_out => pulse_out, baudrate_out => baudrate_out);


end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.12.2021 09:04:50
-- Design Name: 
-- Module Name: uart_receiver - Behavioral
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

entity uart_receiver is
  Port (clk: in std_logic;
        uart_rx: in std_logic;
        valid: out std_logic;
        data: out std_logic_vector(7 downto 0));
end uart_receiver;

architecture Behavioral of uart_receiver is

component sampler_generator is
    Port (clk: in std_logic;
       uart_rx: in std_logic;
       baudrate_out: out std_logic);
end component;

component main_state_machine is 
    Port (clk: in std_logic;
        uart_rx: in std_logic;
        baudrate: in std_logic;
        data: out std_logic_vector(7 downto 0);
        valid: out std_logic);
end component;

signal baudrate: std_logic;

begin

sampler_gen: sampler_generator port map (clk => clk, uart_rx => uart_rx, baudrate_out => baudrate);

main_state: main_state_machine port map (clk=> clk, uart_rx => uart_rx, baudrate => baudrate, data => data, valid => valid);

end Behavioral;

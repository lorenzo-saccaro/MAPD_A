----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.12.2021 23:03:17
-- Design Name: 
-- Module Name: uart_trasmitter - Behavioral
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

entity uart_transmitter is
    Port(clk: in std_logic;
         valid: in std_logic;
         data: in std_logic_vector(7 downto 0);
         busy: out std_logic;
         uart_tx: out std_logic);
end uart_transmitter;

architecture Behavioral of uart_transmitter is

component baudrate_generator is 
Port (clk: in std_logic;
        baudrate_out: out std_logic);
end component;

component tx_state_machine is
  Port (clk: in std_logic;
        valid: in std_logic;
        baudrate_out: in std_logic;
        data: in std_logic_vector(7 downto 0);
        busy: out std_logic;
        uart_tx: out std_logic);
end component;

signal baudrate_out: std_logic;

begin        

baud_gen: baudrate_generator port map (clk => clk, baudrate_out => baudrate_out);

state_machine: tx_state_machine port map (clk => clk, valid => valid, baudrate_out => baudrate_out, data => data, busy => busy, uart_tx => uart_tx);

end Behavioral;

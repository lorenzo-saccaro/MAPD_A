----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.12.2021 19:38:11
-- Design Name: 
-- Module Name: loopback - Behavioral
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

entity loopback is
  Port (clk: in std_logic;
        uart_rx: in std_logic;
        uart_tx: out std_logic);
end loopback;

architecture Behavioral of loopback is

component uart_transmitter is 
    Port(clk: in std_logic;
         valid: in std_logic;
         data: in std_logic_vector(7 downto 0);
         busy: out std_logic;
         uart_tx: out std_logic);
end component;

component uart_receiver is
    Port (clk: in std_logic;
        uart_rx: in std_logic;
        valid: out std_logic;
        data: out std_logic_vector(7 downto 0));
end component;


signal valid, busy: std_logic;
signal data: std_logic_vector(7 downto 0);

begin

transmitter: uart_transmitter port map(clk => clk, valid => valid, data => data, busy => busy, uart_tx => uart_tx);
receiver: uart_receiver port map (clk => clk, valid => valid, data => data, uart_rx => uart_rx);

end Behavioral;

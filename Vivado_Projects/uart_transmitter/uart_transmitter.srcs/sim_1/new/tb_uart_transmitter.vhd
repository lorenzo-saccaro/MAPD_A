----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.12.2021 19:12:09
-- Design Name: 
-- Module Name: tb_uart_transmitter - Behavioral
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

entity tb_uart_transmitter is
--  Port ( );
end tb_uart_transmitter;

architecture Behavioral of tb_uart_transmitter is

component uart_transmitter is 
    Port(clk: in std_logic;
         valid: in std_logic;
         data: in std_logic_vector(7 downto 0);
         busy: out std_logic;
         uart_tx: out std_logic);
end component;

signal clk, valid, busy, uart_tx: std_logic;
signal data: std_logic_vector(7 downto 0);

begin

uut: uart_transmitter port map (clk => clk, valid => valid, data => data, busy => busy, uart_tx => uart_tx);

p_clock: process
    begin 
    clk <= '0'; wait for 5ns;
    clk <= '1'; wait for 5ns;
    end process;
    
p_valid: process
    begin
    valid <= '0'; wait for 200ns;
    valid <= '1'; wait for 10ns;
    valid <= '0'; wait for 100us;
    valid <= '0'; wait for 190ns;
end process;

p_data: process
    begin
    data <= "00000000"; wait for 200ns;
    data <= "01100001"; wait for 200ns;
    data <= "00000000"; wait for 100us;
end process;
    
end Behavioral;

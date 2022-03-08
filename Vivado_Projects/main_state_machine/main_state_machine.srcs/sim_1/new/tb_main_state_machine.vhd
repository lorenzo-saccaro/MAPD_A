----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.12.2021 00:00:50
-- Design Name: 
-- Module Name: tb_main_state_machine - Behavioral
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

entity tb_main_state_machine is
--  Port ( );
end tb_main_state_machine;

architecture Behavioral of tb_main_state_machine is

component main_state_machine is 
  Port (clk: in std_logic;
        uart_rx: in std_logic;
        baudrate: in std_logic;
        data: out std_logic_vector(0 to 7);
        valid: out std_logic);
end component main_state_machine;

signal clk, uart_rx, baudrate, valid: std_logic;
signal data: std_logic_vector(0 to 7);

begin

uut: main_state_machine port map(clk => clk, uart_rx => uart_rx, baudrate => baudrate, data => data, valid => valid);

p_clock: process
    begin 
    clk <= '0'; wait for 5ns;
    clk <= '1'; wait for 5ns;
    end process;

p_uart_rx: process
    begin
    uart_rx <= '1'; wait for 100ns;
    uart_rx <= '0'; wait for 8680ns;
    uart_rx <= '1'; wait for 8680ns;
    uart_rx <= '0'; wait for 8680ns;
    uart_rx <= '0'; wait for 8680ns;
    uart_rx <= '0'; wait for 8680ns;
    uart_rx <= '0'; wait for 8680ns;
    uart_rx <= '1'; wait for 8680ns;
    uart_rx <= '1'; wait for 8680ns;
    uart_rx <= '0'; wait for 8680ns;
    uart_rx <= '1'; wait for 8680ns;
    
    uart_rx <= '1'; wait for 20us;
     
    uart_rx <= '0'; wait for 8680ns;
    uart_rx <= '1'; wait for 8680ns;
    uart_rx <= '0'; wait for 8680ns;
    uart_rx <= '0'; wait for 8680ns;
    uart_rx <= '0'; wait for 8680ns;
    uart_rx <= '0'; wait for 8680ns;
    uart_rx <= '1'; wait for 8680ns;
    uart_rx <= '1'; wait for 8680ns;
    uart_rx <= '0'; wait for 8680ns;
    uart_rx <= '1'; wait for 8680ns;
    
    end process;
 
 p_baudrate: process
    begin
    baudrate <= '0'; wait for 13120ns;
    baudrate <= '1'; wait for 10ns;
    baudrate <= '0'; wait for 8680ns;
    baudrate <= '1'; wait for 10ns;
    baudrate <= '0'; wait for 8680ns;
    baudrate <= '1'; wait for 10ns;
    baudrate <= '0'; wait for 8680ns;
    baudrate <= '1'; wait for 10ns;
    baudrate <= '0'; wait for 8680ns;
    baudrate <= '1'; wait for 10ns;
    baudrate <= '0'; wait for 8680ns;
    baudrate <= '1'; wait for 10ns;
    baudrate <= '0'; wait for 8680ns;
    baudrate <= '1'; wait for 10ns;
    baudrate <= '0'; wait for 8680ns;
    baudrate <= '1'; wait for 10ns;
    baudrate <= '0'; wait for 8680ns;
    baudrate <= '1'; wait for 10ns;
    baudrate <= '0'; wait for 8680ns;
    end process;

end Behavioral;

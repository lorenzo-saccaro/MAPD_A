----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.12.2021 09:19:14
-- Design Name: 
-- Module Name: tb_uart_receiver - Behavioral
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

entity tb_uart_receiver is
--  Port ( );
end tb_uart_receiver;

architecture Behavioral of tb_uart_receiver is

component uart_receiver is 
  Port (clk: in std_logic;
        uart_rx: in std_logic;
        valid: out std_logic;
        data: out std_logic_vector(0 to 7));
end component; 

signal clk, uart_rx, valid: std_logic;
signal data: std_logic_vector(0 to 7);
begin

uut: uart_receiver port map  (clk => clk, uart_rx => uart_rx, valid => valid, data => data);

p_clock: process
    begin 
    clk <= '0'; wait for 5ns;
    clk <= '1'; wait for 5ns;
    end process;

p_uart_rx: process
    begin
    uart_rx <= '1'; wait for 500ns; 
    
    uart_rx <= '0'; wait for 8680ns; -- start bit
    uart_rx <= '1'; wait for 8680ns;
    uart_rx <= '0'; wait for 8680ns;
    uart_rx <= '0'; wait for 8680ns;
    uart_rx <= '0'; wait for 8680ns;
    uart_rx <= '0'; wait for 8680ns;
    uart_rx <= '1'; wait for 8680ns;
    uart_rx <= '1'; wait for 8680ns;
    uart_rx <= '0'; wait for 8680ns;
    uart_rx <= '1'; wait for 8680ns; --stop bit
       
    uart_rx <= '1'; wait for 20us;
    
    uart_rx <= '0'; wait for 8680ns; -- start bit
    uart_rx <= '1'; wait for 8680ns;
    uart_rx <= '1'; wait for 8680ns;
    uart_rx <= '0'; wait for 8680ns;
    uart_rx <= '1'; wait for 8680ns;
    uart_rx <= '0'; wait for 8680ns;
    uart_rx <= '1'; wait for 8680ns;
    uart_rx <= '1'; wait for 8680ns;
    uart_rx <= '0'; wait for 8680ns;
    uart_rx <= '1'; wait for 8680ns; --stop bit

    uart_rx <= '1'; wait;
    end process;

end Behavioral;

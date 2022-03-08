----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.12.2021 21:07:12
-- Design Name: 
-- Module Name: tb_sampler_generator - Behavioral
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

entity tb_sampler_generator is
--  Port ( );
end tb_sampler_generator;

architecture Behavioral of tb_sampler_generator is

component sampler_generator is
    Port(clk: in std_logic;
       uart_rx: in std_logic;
       baudrate_out: out std_logic);
end component sampler_generator;

signal clk, uart_rx, baudrate_out: std_logic;

begin

uut: sampler_generator port map(clk => clk, uart_rx => uart_rx, baudrate_out => baudrate_out);

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
    uart_rx <= '1'; wait for 8680ns;
    
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
    uart_rx <= '1'; wait for 8680ns;
    end process;

end Behavioral;
